# AI引継ぎ資料 (HANDOVER)

このファイルは、開発環境を別のPCに移行する際、次のAIアシスタントに現状を伝えるための資料です。

## プロジェクト概要
**Minecraft RPG Datapack** (1.21.11)
Minecraftのバニラ要素を活かしたRPGデータパック。

---

## 現在の実装状況

### 1. ステータスシステム (`data/status/`, `core:declare`)
- 全てのステータスはスコアボードで管理。
- **実装済み**: `HP`, `MaxHP`, `HPRatio`, `MP`, `MaxMP`, `STR`, `DEF`, `AGI`, `INT`, `SPD`, `EXP`, `GOLD`, `DropGold`
- **定数管理**: `core:declare` の `box.mcfunction` にて `$100 Const` のように `$` プレフィックス付きの定数として定義。
- **スコアボード一覧**:
  - **HP系**: `HP`, `MaxHP`, `HPRatio`, `HPRegen`, `HPRegenTimer`
  - **MP系**: `MP`, `MaxMP`, `MPRegen`, `MPRegenTimer`
  - **ステータス**: `LV`, `STR`, `DEF`, `AGI`, `INT`, `SPD`
  - **経済**: `EXP`, `GOLD`, `DropGold`
  - **戦闘**: `Reach`, `MobID`, `PortalCooldown`

---

### 2. プレイヤーシステム (`data/player/`)

#### 2.1. HPシステム
- **バケット方式の自動回復**: `HPRegenTimer` が2000に達すると HP+1
- **ハート表示**: `HPRatio` 専用スコアで効率的に計算
  ```mcfunction
  HPRatio = HP × 10000 / MaxHP × 20 / 10000
  ```
- **即死防止**: HP > 0 なのに HPRatio = 0 になる場合は 1 に補正
- **instant_health エフェクト**: 実際のハート数を反映

#### 2.2. MPシステム
- **MPバー表示**: Vanilla経験値バーを活用
  - Level = 現在のMP値
  - XPバー = MP / MaxMP の割合
- **MP自然回復**: `MPRegen` タイマー方式（HPと同様）
- **動的XP容量計算**: 
  - Lv 0-15: `2 × Lv + 7`
  - Lv 16-30: `5 × Lv - 38`
  - Lv 31+: `9 × Lv - 158`
- **効率化**: `MPRatio` による変化検出（変化時のみ更新）

#### 2.3. 攻撃システム
- **二重検知**:
  - **近距離** (10ブロック以内): Interactionエンティティによる物理判定
  - **遠距離** (100ブロック以内): advancementによるイベント検知
- **フィルター階層**: `filter/8` → `7` → ... → `0` で段階的にMobID特定
- **ダメージ計算**:
  ```mcfunction
  BaseDmg = アイテムのATK
  Dmg = BaseDmg × STR / 100
  ```
- **武器リーチ**:
  - 素手: 8 (2.0ブロック)
  - 剣: 12 (3.0ブロック)
  - 斧: 10 (2.5ブロック)
  - 槍: 30 (7.5ブロック)

---

### 3. MOB召喚システム (最新版: 2026-02-17)

#### 3.1. 概要
**データの定義**（register）と**召喚**（summon）が完全分離されたシステムです。
マクロを活用した動的ファイル呼び出しにより、ID指定でMOBを召喚できます。

#### 3.2. Storage構造
**統一Storage**: `bank:mob` （旧 `rpg_mob:` は廃止）

**データ構造**:
- **Base**: Entity, Tags, CustomName
- **Costume**: Mainhand, Offhand, Head, Chest, Legs, Feet
- **Status**: Level, HPMax, ATK, DEF, SPD, GOLD
- **Type**: ENEMY / FRIENDLY
- **AI**: MovementSpeed, FollowRange, KBResistance

#### 3.3. フォルダ構造（平坦化）
```
data/bank/function/mob/
├── 001.goblin/
│   ├── register.mcfunction    # データ定義
│   └── summon/.mcfunction      # 実際の召喚コマンド
├── 002.skeleton_warrior/
│   ├── register.mcfunction
│   └── summon/.mcfunction
├── alias/
│   ├── 001/
│   │   ├── register.mcfunction  # → 001.goblin/register
│   │   └── summon.mcfunction    # → 001.goblin/summon/
│   └── 002/
│       ├── register.mcfunction
│       └── summon.mcfunction
```

**重要**: `global/ground/blow/` のような深い階層は廃止され、フラットな構造になりました。

#### 3.4. 召喚フロー
```
1. /function debug:summon/001.goblin
   ↓
2. storage api: Argument.ID = "001"
   ↓
3. api:mob/summon (検証)
   ↓
4. api:mob/core/summon
   ├─ storage bank:mob ID = "001"
   ├─ bank_manager:mob/summon/register with storage bank:mob
   │   └─ $function bank:mob/alias/$(ID)/register
   │       └─ function bank:mob/001.goblin/register
   │           └─ storage bank:mob にデータ書き込み
   ├─ bank_manager:mob/trigger/summon/
   │   └─ bank_manager:mob/trigger/summon/macro with storage bank:mob
   │       └─ $function bank:mob/alias/$(ID)/summon
   │           └─ function bank:mob/001.goblin/summon/
   │               └─ summon zombie ~ ~ ~ {Tags:[Init]}
   └─ bank_manager:mob/summon/init (as @e[tag=Init])
       ├─ tag=Init 削除
       ├─ MobID スコア付与
       ├─ tag=BankMob 付与
       ├─ bank_manager:mob/summon/apply_status/set
       │   ├─ レベル補正計算（Factor）
       │   ├─ 各ステータスに補正適用
       │   └─ CustomName設定（[Lv.XX] Name）
       └─ チーム割り当て（ENEMY等）
```

#### 3.5. 重要なポイント
1. **マクロ変数は大文字**: `$(ID)` （小文字の `$(id)` ではない）
2. **Storage名**: `bank:mob` （`bank_mob:` や `rpg_mob:` ではない）
3. **フィールド名**: `Status.HPMax` （`Status.MaxHP` ではない）
4. **Alias構造**: 数字ID（001）から実際のMOBファイル（001.goblin）への橋渡し

#### 3.6. 自動生成ツール
**ツール**: `datapacks/MOBgenerator/generate_mobs.py`
**データソース**: Google Spreadsheet (CSV)
- ID: `1Muf5Hy6Zq1i8Rty1M26-5u13lalUBsuC-pVXNFXMoYM`

**生成されるファイル**:
1. `bank/mob/001.goblin/register.mcfunction` - データ定義
2. `bank/mob/001.goblin/summon/.mcfunction` - summonコマンド
3. `bank/mob/alias/001/register.mcfunction` - Alias（register）
4. `bank/mob/alias/001/summon.mcfunction` - Alias（summon）
5. `debug/summon/001.goblin.mcfunction` - デバッグ召喚

---

### 4. MOB被ダメージ/死亡システム (2026-02-17実装)

#### 4.1. 被ダメージ処理 (`bank_manager:mob/hurt/hit`)
1. **ノックバック**:
   - AEC召喚（0,0,0 → 攻撃者の向き ^,^,^0.4）
   - Position取得してY軸を0.32に固定
   - XZPower倍率適用（デフォルト100）
   - Motionに適用

2. **ダメージ演出**:
   - Undead: `instant_health`
   - その他: `instant_damage`

3. **HP減算**:
   ```mcfunction
   scoreboard players operation @s HP -= &DmgDealt _
   ```

4. **死亡判定**:
   ```mcfunction
   execute if score @s HP matches ..0 run function bank_manager:mob/death/
   ```

#### 4.2. 死亡処理 (`bank_manager:mob/death/`)
1. **EXP計算** (`death/adj_exp`):
   - 自身のレベルを加算
   - プレイヤーとのレベル差で補正:
     - +5~: EXP × 150%
     - 0~+4: EXP × 100%
     - -5~-1: EXP × 50%
     - ~-6: EXP × 10%

2. **GOLD計算** (`death/adj_gold`):
   ```mcfunction
   DropGold × 5 × random(80~120%) / 10
   ```

3. **報酬表示**:
   - `text_display` で頭上に表示
   - `tag=PC`, `PortalCooldown` で自動削除

4. **MOB削除**:
   ```mcfunction
   attribute @s max_health base set 1
   kill @s
   ```

---

### 5. アイテムシステム (Item Generator)

#### 5.1. 自動生成ツール
**ツール**: `datapacks/MOBgenerator/generate_items.py`
**データソース**: Google Spreadsheet（同じスプレッドシート、別シート「Item」）

#### 5.2. 機能
- `BankItem` NBT データ生成
- `WeaponType` 対応（spear, sword, axe）
- 自動Lore生成（ステータス＋アイコン表示）

#### 5.3. Lore自動生成
- **Speed**: 青色 (`\uE00B` アイコン + 数値)
- **Bonus Stats**: アイコン + 数値
  - `\uE005` (ATK), `\uE006` (DEF), `\uE007` (STR), `\uE008` (INT)
  - `\uE009` (AGI), `\uE00A` (LUCK), `\uE00B` (Speed)

---

### 6. タイマー統一システム (2026-02-17実装)

#### 6.1. PortalCooldown + PCタグ
- **全てのタイマー**: `PortalCooldown` スコアに統一
- **自動削除**: `tag=PC` を付与したエンティティを一括管理
- **処理**: `core:tick` で毎tick-1、0以下でkill

#### 6.2. 対象エンティティ
- `check.Lclick` (Interaction)
- `Loot` (text_display)
- その他プレイヤー関連の一時エンティティ

---

### 7. ドキュメント整備

#### 7.1. 更新済みドキュメント
- ✅ **Flow.md** (2026-02-17更新): 全システムのMermaid図、最新実装反映
- ✅ **README.md**: ライセンス変更（WTFPL）、クレジット追加
- ✅ **STATS.md**: MPバー、武器リーチの仕様記載
- ✅ **mobTASK.md**: 完了タスク更新
- ✅ **spyglass.json**: シンプルな設定

#### 7.2. Artifactドキュメント
- `complete_system_flow.md`: 完全なシステムフローガイド
- `task.md`: 実装タスクリスト

---

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

### デバッグ召喚
```
/function debug:summon/001.goblin
/function debug:summon/002.skeleton_warrior
/function debug:summon/003.dark_knight
```

### デバッグ
```
/scoreboard objectives setdisplay sidebar HP
/tag @s add ShowDmgLog
/data get storage bank:mob
```

---

## 最近の変更履歴

### 2026-02-19: レベルアップシステム確認
- **自動レベルアップ**: EXPによるレベル上昇、nextEXP計算（バニラ準拠）
- **ステータス割り振り**: GUI (`tellraw`) によるポイント割り振りシステム (HP, MP, STR, DEF, AGI, INT, SPD, LUCK)
- **報酬**: HP/MP全回復、StatusPoint+3

### 2026-02-19: MOB HPバー実装
- **ネームスペース**: `mob_manager`
- **機能**: `text_display` を使用したHP/MaxHPの視覚化
- **更新タイミング**: 被ダメージ時 (`bank_manager:mob/hurt/hit`)

### 2026-02-17: MOB召喚システム完全刷新 + 戦闘システム実装

#### ✅ MOB召喚システムの完全刷新
1. **フォルダ構造の平坦化**:
   - `bank/mob/global/ground/blow/001.goblin/` → `bank/mob/001.goblin/`
   - 深い階層を廃止し、シンプルなフラット構造に

2. **Storage統一**:
   - `rpg_mob:` → `bank:mob` に完全統一
   - `Instant` / `Delay` 構造を廃止

3. **Alias構造の確立**:
   - `bank/mob/alias/001/` で数字IDから実際のファイルへの橋渡し
   - `register.mcfunction` と `summon.mcfunction` の2ファイル構成

4. **マクロ変数の修正**:
   - `$(id)` → `$(ID)` に統一（大文字）
   - `with storage bank_mob:` → `with storage bank:mob` に修正

5. **フィールド名の統一**:
   - `Status.MaxHP` → `Status.HPMax` に変更

#### ✅ プレイヤー攻撃システムの実装
1. **二重検知システム**:
   - Interaction方式（近距離10ブロック）
   - advancement方式（遠距離100ブロック）

2. **フィルター階層**:
   - `filter/8` → `7` → ... → `0` でMobID特定
   - advancement条件とMobIDタグの組み合わせ

3. **ターゲット検知**:
   - Interactionエンティティ召喚
   - リーチ分だけ前進して当たり判定
   - `tag=Hit` 付与

#### ✅ MOB被ダメージ/死亡システムの実装
1. **ノックバック計算**:
   - AEC召喚による方向ベクトル取得
   - Y軸固定 (0.32)
   - XZPower倍率適用

2. **EXP/GOLD計算**:
   - レベル差による補正（150%/100%/50%/10%）
   - ランダム補正（80~120%）

3. **報酬表示**:
   - text_displayで頭上表示
   - 自動削除（PortalCooldown）

#### ✅ タイマー統一
1. **PortalCooldown + PCタグ**:
   - 全てのタイマーを統一
   - 自動削除機構

2. **HP表示改善**:
   - `HPRatio` 専用スコア追加
   - 一時スコア `_` の使用を削減

#### ✅ タグ名の統一
- `ENEMY` → `Enemy` に変更
- advancement参照を全て修正
- フィルター再帰ロジック修正

#### ✅ デバッグメッセージの削除
- 全ての主要ファイルからデバッグメッセージを削除
- クリーンなコードベースに

---

### 2026-02-16: MOBスポーン機能復旧 & レベル表示改善

#### ✅ レベル表示システムの刷新
1. **JSON Text Component の活用**:
   - `CustomName` に直接 `{"score":...}` や `{"nbt":...}` を埋め込む方式
   - Loot Tableやディメンション依存を廃止

2. **ステータス計算の改善**:
   - `Factor` (レベル差補正) を導入
   - Factor = 100 + (LevelDiff × 5)
   - 各ステータスに補正適用

#### ✅ データ登録フォーマットの簡素化
- **Storage Target**: `bank:mob` に統一
- **Flat Structure**: `Base`, `Costume`, `Status` などをフラットに配置
- **Direct Item Set**: 装備データを直接セット

---

### 2026-02-11: MPバー＆ドキュメント整備

#### ✅ MPバー表示システム実装
1. **TUSB/HamaSSH参考の実装**:
   - 動的XP容量計算への移行
   - Vanilla公式に準拠した正確なバー表示

2. **効率化**:
   - MP変化時のみバー更新
   - `PreviousMPRatio` による変化検出

---

### 2026-02-08: Initスキルシステムの刷新

#### ✅ Initスキルシステムの刷新
- **Tag Control**: `Init` タグで制御
- **Conditional Execution**: `tag=Init` 検知時のみ実行

---

## 次に取り組むべきタスク



### 3. MOB AI システムの実装
- AI 設定の Storage 対応
- 基本 AI パターン（blow, shoot, boss, fly）
- AI トリガーシステム（tick, attack, hurt, death）

### 4. 装備システムの拡張
- エンチャント効果の実装
- 防具によるステータス変化

### 5. スキルシステム
- アクティブスキル（MP消費）
- パッシブスキル
- スキルツリー

---

## 重要な技術情報

### コーディング規約
- **定数**: `$数値 Const` 形式（例: `$100 Const`, `$1002 Const`）
- **一時スコア**: `$変数名 _` または `&変数名 _` 形式
- **スコアボード命名**: snake_case 推奨
- **NBT命名**: PascalCase 推奨
- **マクロ変数**: 大文字推奨（`$(ID)` 等）

### Storage命名
- `bank:mob` - MOBデータ
- `api:` - API引数
- `player:` - プレイヤーデータ
- `global` - グローバル設定

### 重要なタグ
- `Init` - 召喚直後のMOB（初期化待ち）
- `BankMob` - bank:mob由来のMOB
- `Enemy` - 敵MOB
- `Attacker` - 攻撃者
- `Victim` - 被害者
- `Hit` - 攻撃が当たったMOB
- `PC` - プレイヤー関連エンティティ（自動削除対象）

---

## 参考プロジェクト
- **TUSB**: https://github.com/TUSB/TheUnusualSkyBlock
- **RPG-Datapack (HamaSSH)**: https://github.com/HamaSSH/RPG-Datapack
- **TheSkyBlessing**: https://github.com/ProjectTSB/TheSkyBlessing

---

## ライセンス
**WTFPL** (DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE)

---

**最終更新**: 2026-02-17  
**システムバージョン**: v2.0 (bank:mob統一版)
