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

## 最近の変更履歴 (2026-02-03)

### ✅ スポーンシステムのリファクタリング
1. **Separation of Concerns**:
   - `register` (データ登録) と `summon` (召喚) を完全に分離。
   - これにより、`by_id` コマンドは「登録 → 汎用召喚関数呼び出し」というシンプルな構成になった。
2. **Init Only Logic**:
   - 以前は `status:apply` で毎tick実行されていた `apply_mob` ループを停止。
   - `init` タグを持つ新規モブに対して**1回のみ**ステータス適用が行われるようになり、負荷が激減した。

### ✅ ステータスシステムの刷新
1. **Gold System**:
   - 死にステータスだった `Luck` を削除。
   - `DroppedGold` を追加し、レベル差によるドロップ額補正 (`Factor`) を実装。
2. **STR / AGI Simplified**:
   - 分かりにくい倍率計算を廃止。
   - `STR 10` = 攻撃力10, `AGI 23` = 速度0.23 (標準) と直感的な数値に対応。

## 次に取り組むべきタスク
1. **アイテムデータベースの実装**:
   - スプレッドシート側のアイテム表と連動させる。
2. **ドロップの実装**:
   - 現在 `DroppedGold` スコアは設定されているが、死亡時に実際にアイテム/スコアとして付与する処理 (`mob:on_death` 等) が必要。
3. **MPバーの表示変更 (UI)**:
   - バニラの経験値バー (Exp Bar) を MP (Magic Point) バーとして再利用する。
