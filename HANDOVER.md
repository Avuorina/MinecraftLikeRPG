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
    - `HPRegen` タイマー（2000で+1回復）
- **MPシステム完了** (2026-02-11):
    - **MPバー表示**: Vanilla経験値バーを活用
    - **MP自然回復**: `MPRegen` タイマー方式（HPと同様）
- **攻撃力計算**:
    - `data/player/function/status/atk/update.mcfunction` にて、メインハンド装備の武器攻撃力を含めた最終ダメージを計算し `ATK` スコアに格納。
    - `BankItem[0]` NBT から ATK, STR, SPD 等を読み取り。

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
- `Gold`: ドロップゴールド基礎値
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

### 4. アイテムシステム (Item Generator) ← **完成 (2026-02-11)**

#### 4.1. 自動生成ツール
- **ツール**: `datapacks/MOBgenerator/generate_items.py`
- **データソース**: Google Spreadsheet (CSV)
  - 同じスプレッドシート、別シート「Item」
- **機能**:
  - `BankItem` NBT データ生成
  - `WeaponType` 対応（spear, sword, axe）
  - 自動Lore生成（ステータス＋アイコン表示）

#### 4.2. Lore自動生成
- **Speed**: 青色 (`\uE00B` アイコン + 数値)
- **Bonus Stats**: アイコン + 数値
  - `\uE005` (ATK), `\uE006` (DEF), `\uE007` (STR), `\uE008` (INT)
  - `\uE009` (AGI), `\uE00A` (LUCK), `\uE00B` (Speed)

#### 4.3. 武器リーチシステム
- **実装**: `data/player/function/attack/update_reach.mcfunction`
- **リーチ値** (1スコア = 0.25ブロック):
  - 素手: 8 (2.0ブロック)
  - 剣: 12 (3.0ブロック)
  - 斧: 10 (2.5ブロック)
  - 槍: 30 (7.5ブロック)

### 5. MPバー表示システム ← **完成 (2026-02-11)**

#### 5.1. 参考元
このシステムは以下のプロジェクトを参考に実装:
- **TUSB (The Unusual SkyBlock)**: https://github.com/TUSB/TheUnusualSkyBlock
- **RPG-Datapack (HamaSSH)**: https://github.com/HamaSSH/RPG-Datapack

#### 5.2. 実装概要
Vanilla Experience Barを活用し、以下を実現:
- **経験値レベル**: 現在のMP値を表示
- **経験値バー**: `MP / MaxMP` の割合を視覚的に表示

#### 5.3. 技術的特徴
**動的XP容量計算**:
- レベル（MP値）に応じた必要経験値をVanilla公式で計算
- `calc_xp.mcfunction` で実装:
  - Lv 0-15: `2 × Lv + 7`
  - Lv 16-30: `5 × Lv - 38`
  - Lv 31+: `9 × Lv - 158`

**効率的な更新**:
- `MPRatio` (MP × 1002 / MaxMP) を計算
- 前回の `PreviousMPRatio` と比較
- 変化がある場合のみバー更新を実行

#### 5.4. ファイル構成
```
player/function/status/mp/
├── regen/
│   ├── tick.mcfunction       # MP自然回復 + 割合計算
│   └── .mcfunction            # 回復実行
├── bar/
│   ├── set.mcfunction         # メインロジック
│   ├── set_level.mcfunction   # Macro: xp set levels
│   └── set_point.mcfunction   # Macro: xp set points
└── calc_xp.mcfunction         # XP容量計算
```

#### 5.5. 処理フロー
1. `player:tick` → `mp/regen/tick`
2. `MPRegenTimer` 加算、2000以上で MP+1
3. `MPRatio` 計算
4. 変化検出時に `mp/bar/set` 実行
5. Level設定 → XP容量計算 → Points算出 → 適用

### 6. ドキュメント整備 ← **2026-02-11更新**

以下のドキュメントを最新化:
- **README.md**: ライセンス変更（WTFPL）、クレジット追加、新機能反映
- **STATS.md**: MPバー、自然回復、武器リーチの仕様記載
- **Flow.md**: アイテムステータス適用とMPバーのフロー図追加
- **mobTASK.md**: 完了タスクに装備システム、MPバー追加
- **spyglass.json**: シンプルな設定（`gameVersion` のみ）

## 実行方法

### MOB生成
```powershell
cd e:\Minecraft\mod\Instances\RPG\saves\RPG開発\datapacks\MOBgenerator
python generate_mobs.py
```

### アイテム生成
```powershell
cd e:\Minecraft\mod\Instances\RPG\saves\RPG開発\datapacks\MOBgenerator
python generate_items.py
```

## 最近の変更履歴

### 2026-02-11: MPバー＆ドキュメント整備

#### ✅ MPバー表示システム実装
1. **TUSB/HamaSSH参考の実装**:
   - 当初、Level 129の固定容量を使用する方式を検討
   - しかし「レベル=MP」表示との互換性問題により断念

2. **動的XP容量計算への移行**:
   - 現在のレベル（MP値）における必要経験値を動的計算
   - `calc_xp.mcfunction` を実装
   - Vanilla公式に準拠した正確なバー表示を実現

3. **定数追加**:
   - `$1002 Const` を `box.mcfunction` に追加
   - MPRatio計算で使用（Level 129の容量に対応）

4. **効率化**:
   - MP変化時のみバー更新
   - `PreviousMPRatio` による変化検出

#### ✅ MP自然回復システム
- `MPRegen`, `MPRegenTimer` スコアボード追加
- `player:setup` で `MPRegen = 1` 初期化
- `mp/regen/tick` と `mp/regen/.mcfunction` 実装
- HP回復と同様のタイマー方式（2000で+1）

#### ✅ ドキュメント更新
1. **README.md**:
   - ライセンス: MIT → WTFPL
   - クレジット: TUSB, HamaSSH, TheSkyBlessing 追加
   - 新機能（MPバー、カスタムアイテム）反映

2. **STATS.md**:
   - MPバー表示の仕組み説明
   - HP/MP自然回復の詳細
   - 武器リーチ一覧表

3. **Flow.md**:
   - アイテムステータス適用のMermaid図
   - MPバー表示システムのMermaid図

4. **mobTASK.md**:
   - 完了タスクに装備システム（基礎）追加
   - MPバー、MP自然回復を完了に移動

5. **spyglass.json**:
   - 無効なプロパティを削除
   - 最小構成（`gameVersion: "1.21.11"`）

### 2026-02-08: Initスキルシステムの刷新

#### ✅ Initスキルシステムの刷新
- **Tag Control**: `init` スキルは `Init` タグで制御するように変更。
- **Conditional Execution**: 
    - Tick実行ファイル（末端の `.mcfunction`）で `Init` タグを検知。
    - `tag=Init` がある場合のみ `init.mcfunction` を呼び出し、直後にタグを削除。
    - これにより `return` を使わずに済み、後続のターン制処理などが記述可能になった。
- **Safety Fix**: `mob:setup/apply_nbt` で `Init` タグを削除していた処理をコメントアウト（Tick側で処理するため必須）。

#### ✅ Spawn Systemの修正 (Initタグ欠落問題)
- **原因**: スポーンエッグ経由の召喚で `register` 関数が呼ばれておらず、`Init` タグが付与されていなかった。
- **対策**: `mob:spawn/.mcfunction` を修正し、`debug:summon/{ID}` を呼び出すように変更。
    - `debug:summon` は正しく `register` (データ登録) + `spawn` を行う構造になっているため、これを再利用。

#### ✅ 手動ディスパッチャーへの統合
- ユーザーが作成した階層構造 (`bank:mob/.mcfunction` -> `global` -> `ground` ...) にシステムを統合。
- `mob:tick` から `execute as @e[tag=AssetMOB] run function bank:mob/` を呼び出すように変更。
- 全ての `AssetMOB` が毎Tickディスパッチャーを経由してスキルチェックを行う。

#### ✅ Skill Execution Cleanup
- `skill:execute` (`data/skill/function/execute.mcfunction`) の末尾に `data remove storage rpg_skill: data` を追加。
- スキル実行後、ストレージに残ったデータをクリーンアップして誤動作を防止。

### 2026-02-04: スポーンシステムのリファクタリング

#### ✅ スポーンシステムのリファクタリング
1. **Separation of Concerns**:
   - `register` (データ登録) と `summon` (召喚) を完全に分離。
2. **不要ファイルの削除**:
   - `mob:setup/summon_from_storage.mcfunction` および `..._macro.mcfunction` を削除（現在は使用されていないため）。

#### ✅ ユーザーによる修正・改善 (Combat & Visuals)
1. **Interactionの調整**:
   - `summon.mcfunction`: 召喚位置を `~ ~-0.2 ~` に調整し、プレイヤーの目線と判定を適合させた。
2. **戦闘エフェクトの追加**:
   - `attacked.mcfunction`: 攻撃ヒット時に `crit` パーティクルと `entity.player.attack.nodamage` 音を追加。
   - `mob:on_hurt/hit`: デバッグメッセージ (`say`) を `tellraw` に変更し、ダメージログを見やすくした (`ShowDmgLog` タグが必要)。
3. **バグ修正**:
   - `regen_mp.mcfunction`: スコア名の誤字 (`int` → `INT`) を修正。

## 次に取り組むべきタスク

### 1. MOB HPバーを表示する ← **次のタスク**
- ボスバーまたはtext_displayを使用したHP表示
- MOBごとに `HP / MaxHP` を視覚化

### 2. MOB AI システムの実装
- AI 設定の Storage 対応
- 基本 AI パターン（blow, shoot, boss, fly）
- AI トリガーシステム（tick, attack, hurt, death）

### 3. 装備システムの拡張
- エンチャント効果の実装
- 防具によるステータス変化

### 4. スキルシステム
- アクティブスキル（MP消費）
- パッシブスキル
- スキルツリー

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

## 重要な参考資料

### コーディング規約
- **定数**: `$数値 Const` 形式（例: `$100 Const`, `$1002 Const`）
- **一時スコア**: `$変数名 _` 形式（例: `$XPLevel _`, `$TargetPoints _`）
- **スコアボード命名**: 
  - Objective: `snake_case` 推奨
  - ScoreHolder: `$.*` パターン（一時変数）
- **NBT命名**: `PascalCase` 推奨

### 参考プロジェクト
- **TUSB**: https://github.com/TUSB/TheUnusualSkyBlock
- **RPG-Datapack (HamaSSH)**: https://github.com/HamaSSH/RPG-Datapack
- **TheSkyBlessing**: https://github.com/ProjectTSB/TheSkyBlessing

### ライセンス
**WTFPL** (DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE)
