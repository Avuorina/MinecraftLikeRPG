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

### 4. ユーザーTODO
- MOBにHPバーを表示する
## 最近の変更履歴 (2026-02-08)

### ✅ Initスキルシステムの刷新
- **Tag Control**: `init` スキルは `Init` タグで制御するように変更。
- **Conditional Execution**: 
    - Tick実行ファイル（末端の `.mcfunction`）で `Init` タグを検知。
    - `tag=Init` がある場合のみ `init.mcfunction` を呼び出し、直後にタグを削除。
    - これにより `return` を使わずに済み、後続のターン制処理などが記述可能になった。
- **Safety Fix**: `mob:setup/apply_nbt` で `Init` タグを削除していた処理をコメントアウト（Tick側で処理するため必須）。

### ✅ Spawn Systemの修正 (Initタグ欠落問題)
- **原因**: スポーンエッグ経由の召喚で `register` 関数が呼ばれておらず、`Init` タグが付与されていなかった。
- **対策**: `mob:spawn/.mcfunction` を修正し、`debug:summon/{ID}` を呼び出すように変更。
    - `debug:summon` は正しく `register` (データ登録) + `spawn` を行う構造になっているため、これを再利用。

### ✅ 手動ディスパッチャーへの統合
- ユーザーが作成した階層構造 (`bank:mob/.mcfunction` -> `global` -> `ground` ...) にシステムを統合。
- `mob:tick` から `execute as @e[tag=AssetMOB] run function bank:mob/` を呼び出すように変更。
- 全ての `AssetMOB` が毎Tickディスパッチャーを経由してスキルチェックを行う。

### ✅ Skill Execution Cleanup
- `skill:execute` (`data/skill/function/execute.mcfunction`) の末尾に `data remove storage rpg_skill: data` を追加。
- スキル実行後、ストレージに残ったデータをクリーンアップして誤動作を防止。

## ターン制スキル実装草案 (Turn-based / Interval Skills)

### 概要
- `init` による1回切りの実行だけでなく、一定間隔（ターン/秒数）ごとのスキル発動を実装する。
- 全ての `AssetMOB` は `mob:tick` -> ディスパッチャー経由で、毎Tick末端の `.mcfunction` を通過している。これを利用する。

### 実装イメージ (末端 .mcfunction)
現在、`generate_mobs.py` が生成する `001.goblin/.mcfunction` は以下のようになっています：

```mcfunction
# Init Check
execute if entity @s[tag=Init] run function .../init
execute if entity @s[tag=Init] run tag @s remove Init

# ▼ ここにターン制ロジックを追記可能 ▼

# 例: 100Tickごとに "SpecialAttack" を発動
# 1. タイマー加算
scoreboard players add @s Timer 1

# 2. 判定 & 実行
execute if score @s Timer matches 100.. run function .../special_attack
execute if score @s Timer matches 100.. run scoreboard players set @s Timer 0
```

### 今後の手順
1. **Generator更新**:
    - Spreadsheetに `Interval` や `TurnSkill` の定義列を追加（要検討）。
    - `generate_mobs.py` を更新し、`init` 以外のトリガー（例: `interval_100`）があった場合、上記のようなタイマーロジックを `.mcfunction` に自動追記するようにする。
2. **手動実装**:
    - 特殊なボスなど、複雑な条件が必要な場合は生成後の `.mcfunction` に直接記述する。

### 注意点
- **負荷**: 全てのMOBが毎Tickスコアボード計算を行うことになるため、MOB数が大量に増えた場合の負荷に注意。
- **タグ制御**: 頻繁な実行を避けるため、距離判定 (`distance=..16`) や視線判定などを `execute` 条件に加えることを推奨。
