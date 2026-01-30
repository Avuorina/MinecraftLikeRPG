# AI引継ぎ資料 (HANDOVER)

このファイルは、開発環境を別のPCに移行する際、次のAIアシスタントに現状を伝えるための資料です。

## プロジェクト概要
**Minecraft RPG Datapack** (1.21.x)
Minecraftのバニラ要素を活かしたRPGデータパック。

## 現在の実装状況

### 1. ステータスシステム (`data/status/`)
- 全てのステータスはスコアボードで管理。
- **実装済み**: `HP` (Maxあり), `MP` (Maxあり), `STR`, `DEF`, `AGI`, `INT`, `SPD`, `LUCK`
- HP表示はハート10個固定の仮想HPシステムを採用。

### 2. プレイヤーシステム (`data/player/`)
- レベルアップ、ステータス成長、アクションバーHUD実装済み。

### 3. MOB生成システム (Mob Generator) ← **New!**
- **ツール**: `datapacks/mob-generator/generate_mobs.py`
- **データソース**: Google Spreadsheet (CSV)
- **機能**:
    - Spreadsheetからデータを取得し、以下のファイルを自動生成する。
    - **Bank設定** (`data/bank/function/mob/...`): ステータスや見た目を定義。**Storageベース (`rpg_mob:`)** で管理。
    - **Spawn関数** (`data/mob/function/spawn/...`): MOBを召喚し、Bank設定を読み込み、共通セットアップ (`mob:setup/apply_from_storage`) を適用。
    - **Spawn Egg**: 各Bankファイルの冒頭に、そのMOBのスポーンエッグを入手する `/give` コマンドを生成。

- **スポーンエッグの仕組み**:
    - `data/mob/function/tick.mcfunction` で特定のアーマースタンドを常時監視。
    - アーマースタンドの頭装備 (`equipment` NBT) にMOB ID (`rpg_mob:`) を格納。
    - 検知時、マクロ (`mob:trigger_spawn`) を使用して対応するMOBを召喚し入れ替える。

### 4. 名前空間構成
- `rpg`: メインループ
- `player`: プレイヤー関連
- `status`: ステータス計算
- `mob`: MOB召喚・セットアップ・AI
- `bank`: MOB設定データ (Storage用)

## 次に取り組むべきタスク
1. **AI設定の実装**
   - TUSBのように、移動速度、感知範囲、フォロワー設定などをStorageから読み込んで適用する仕組み。
   - Generatorの対応。

2. **属性耐性の実装**
   - 物理、魔法、炎、爆発などのダメージ倍率設定。

3. **ドロップアイテム（LootTable）**
   - ボス用などのカスタムドロップ品設定。

4. **職業・スキルシステム**
   - プレイヤー側の拡張。

## 重要な注意点
- **MOB設定の変更**: 原則として Google Spreadsheet を編集し、`generate_mobs.py` を実行して反映させること。mcfunctionを直接編集しても上書きされる。
- **1.21.x仕様**: マクロや `spawn_egg` の `entity_data` (equipment) の仕様に追従している。

---
**合言葉**: "MinecraftならではのRPG"
