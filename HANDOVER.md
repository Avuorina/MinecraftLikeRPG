# AI引継ぎ資料 (HANDOVER)

このファイルは、開発環境を別のPCに移行する際、次のAIアシスタントに現状を伝えるための資料です。

## プロジェクト概要
**Minecraft RPG Datapack** (1.21.11)
Minecraftのバニラ要素を活かしたRPGデータパック。

## 現在の実装状況

### 1. ステータスシステム (`data/status/`)
- 全てのステータスはスコアボードで管理。
- **実装済み**: `HP` (Maxあり), `MP` (Maxあり), `STR`, `DEF`, `AGI`, `INT`, `SPD`, `DroppedGold`
- **定数管理**: `box.mcfunction` にて `$100 Const` のように `$` プレフィックス付きの定数として定義。
- **計算式の刷新 (2026-02-03)**:
    - **STR**: CSVの数値をそのまま攻撃力（Attribute）として適用。
    - **AGI**: `AGI / 100` を移動速度（Attribute）として適用。
    - **Gold**: `Luck` を **DroppedGold (ドロップゴールド)** に置換。討伐時に `DroppedGold` スコア分のゴールドを付与。

### 2. プレイヤーシステム (`data/player/`)
- **HPシステム完了**:
    - バケット方式の自動回復、ハート計算、即死防止を実装済み。
- **攻撃力計算**:
    - `data/player/function/status/atk/macro.mcfunction` にて、武器攻撃力を含めた最終ダメージを計算し `ATK` スコアに格納。

### 3. MOB生成システム (MOB Generator) ← **完成＆リファクタリング済 (2026-02-03)**

#### 3.1. 自動生成ツール
- **ツール**: `datapacks/MOBgenerator/generate_mobs.py`
- **データソース**: Google Spreadsheet (CSV)
  - ID: `1Muf5Hy6Zq1i8Rty1M26-5u13lalUBsuC-pVXNFXMoYM`
- **変更点**:
  - `Luck` 列を廃止し、`Gold` 列の読み込みに対応。
  - 出力される `register.mcfunction` から `summon` / `init` コマンドを撤廃（定義のみに変更）。

#### 3.2. スプレッドシートの列構造
- `NameJP`, `NameUS`, `ID` (エンティティタイプ)
- `ベース` (CustomName JSON), `見た目` (equipment JSON)
- `エリア`, `グループ`, `AI` (カテゴリタグ)
- `スポーンタグ`: 任意の追加タグ
- `推定lev`, `HP`, `str`, `def`, `agi`: ステータス
- `Gold`: ドロップゴールド基礎値 (New!)
- `AI Speed`, `Follow Range`: AI補正倍率

#### 3.3. 生成されるファイル
1. **Bank設定 (データ定義)** (`data/bank/function/mob/.../register.mcfunction`)
   - Storage `rpg_mob:` にデータを保存するのみ。
   - **召喚は行わない**。

2. **召喚実行** (`data/mob/function/spawn/from_storage.mcfunction`)
   - Storage情報を使って `summon` し、`init` (初期化) を呼び出す。

#### 3.4. Spawn システムの構造
```
mob:tick (毎tick) -> mob:trigger_spawn -> mob:spawn_generic
  └─> mob:spawn_map/{mob_id}
       ├─> bank:mob/.../register (データ定義)
       └─> mob:spawn/from_storage (召喚＆初期化)
            └─> mob:setup/init (初期化・1回のみ)
                 └─> status:apply_mob (ステータス適用)
```

### 4. 実行方法
```powershell
cd C:\Users\nhs50030\AppData\Roaming\.minecraft\saves\RPG開発用\datapacks\MOBgenerator
python generate_mobs.py
```

## 最近の変更履歴 (2026-02-04)

### ✅ スポーンシステムのリファクタリング
1. **Separation of Concerns**:
   - `register` (データ登録) と `summon` (召喚) を完全に分離。
2. **不要ファイルの削除**:
   - `mob:setup/summon_from_storage.mcfunction` および `..._macro.mcfunction` を削除（現在は使用されていないため）。

### ✅ ユーザーによる修正・改善 (Combat & Visuals)
1. **Interactionの調整**:
   - `summon.mcfunction`: 召喚位置を `~ ~-0.2 ~` に調整し、プレイヤーの目線と判定を適合させた。
2. **戦闘エフェクトの追加**:
   - `attacked.mcfunction`: 攻撃ヒット時に `crit` パーティクルと `entity.player.attack.nodamage` 音を追加。
   - `mob:on_hurt/hit`: デバッグメッセージ (`say`) を `tellraw` に変更し、ダメージログを見やすくした (`ShowDmgLog` タグが必要)。
3. **バグ修正**:
   - `regen_mp.mcfunction`: スコア名の誤字 (`int` → `INT`) を修正。

## 次に取り組むべきタスク

### 1. 武器ごとのリーチ調整 (Variable Reach)
**現状の問題**:
- レイキャスト (`lib:left_click/target`) の距離が `..5` (5ブロック) に固定されている。
- 素手や剣はこれで良いが、**槍などの長い武器**を作った時に判定が届かない。
- 一律で `..10` に伸ばすと、剣や素手まで遠くを殴れてしまうため却下された。

**提案する解決策 (Scoreboard Recursion)**:
- `Reach` というスコアを用意し、武器ごとに値を設定する（例: 素手=20, 槍=30）。
- `target` 関数では `distance` ではなく、このスコアを減算しながら再帰を行う。
- これにより、**武器種ごとに個別のリーチを設定可能**にする。

### 2. MPバーのUI変更
- バニラの経験値バー (Exp Bar) を MP バーとして再利用する。
- **実装方針**: レベルごとの必要経験値を計算し、`MP / MaxMP` の割合で XP ポイントを付与することで、どのレベルでもバーが正しく機能するようにする。

### 3. アイテム・ドロップ実装
- スプレッドシート連動のアイテムDB作成。
- `DroppedGold` のドロップ処理実装。
