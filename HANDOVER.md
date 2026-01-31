# AI引継ぎ資料 (HANDOVER)

このファイルは、開発環境を別のPCに移行する際、次のAIアシスタントに現状を伝えるための資料です。

## プロジェクト概要
**Minecraft RPG Datapack** (1.21.11)
Minecraftのバニラ要素を活かしたRPGデータパック。

## 現在の実装状況

### 1. ステータスシステム (`data/status/`)
- 全てのステータスはスコアボードで管理。
- **実装済み**: `HP` (Maxあり), `MP` (Maxあり), `STR`, `DEF`, `AGI`, `INT`, `SPD`, `LUCK`
- **定数管理**: `box.mcfunction` にて `Const` Objectiveを使用し、`$100` のように `$` プレフィックス付きの定数として定義。計算式内でマクロ定数として利用。

### 2. プレイヤーシステム (`data/player/`)
- **HPシステム完了 (2026-01-31)**:
  - **計算ロジック**: `data/player/function/status/hp/update.mcfunction`
    - スコアボードの `hp` / `max_hp` から、見た目上のハート（Health属性）を計算。
    - マクロを使用して `attribute` に即時反映。
  - **自動回復**: `data/player/function/status/hp/regen.mcfunction`
    - バケット方式（タイマー蓄積型）を採用。`hpRegen` ステータスが高いほど高速に自然回復する。
  - **安全性**: 計算誤差による即死を防ぐため、HPスコアが1以上なら最低でもハート半個（Health 1）を保証。
- レベルアップ、ステータス成長、アクションバーHUD実装済み。

### 3. MOB生成システム (MOB Generator) ← **完成！(2026-01-30)**

#### 3.1. 自動生成ツール
- **ツール**: `datapacks/MOBgenerator/generate_mobs.py`
- **GitHub**: https://github.com/Avuorina/MOBgenerator
- **データソース**: Google Spreadsheet (CSV)
  - スプレッドシートID: `1Muf5Hy6Zq1i8Rty1M26-5u13lalUBsuC-pVXNFXMoYM`
  - 「リンクを知っている全員が閲覧可能」に設定する必要がある

#### 3.2. スプレッドシートの列構造
- `NameJP`: 日本語名（必須）
- `NameUS`: 英語名（ファイル名に使用、キャメルケース → スネークケース変換）
- `ID`: エンティティタイプ（zombie, skeleton など）
- `ベース`: CustomName の JSON
- `見た目`: equipment の JSON (mainhand, head など)
- `エリア`: global（カテゴリ）
- `グループ`: ground（カテゴリ）
- `AI`: blow/shoot/boss（カテゴリ）
- `サブフォルダ`: （現在未使用）
- `スポーンタグ`: 追加タグ（MOB名など）
- `推定lev`, `HP`, `str`, `def`, `agi`, `luck`: ステータス

#### 3.3. 生成されるファイル
1. **Bank設定** (`data/bank/function/mob/{area}/{group}/{ai}/{mob_id}.mcfunction`)
   - ストレージベース (`rpg_mob:`) で管理
   - `ベース`: `{id:"minecraft:zombie", Tags:[...]}`
   - `見た目`: `{CustomName:[...], equipment:{...}}`
   - ステータス: レベル、最大HP、物理攻撃力、物理防御力、素早さ、運
   - Spawn Egg コマンド（コメント形式）

2. **Spawn Map** (`data/mob/function/spawn_map/{mob_id}.mcfunction`)
   - 対応する bank ファイルを呼び出し
   - Storage から MOB を召喚
   - ステータスを適用

#### 3.4. Spawn システムの構造
```
mob:tick (毎tick実行)
  └─> mob:trigger_spawn (アーマースタンドを検知)
       └─> mob:spawn_generic (汎用的な召喚関数)
            └─> mob:spawn_map/{mob_id} (個別の spawn マップ)
                 ├─> bank:mob/{area}/{group}/{ai}/{mob_id} (設定ロード)
                 ├─> mob:setup/summon_from_storage (召喚)
                 │    └─> mob:setup/summon_from_storage_macro (マクロで summon)
                 │         └─> mob:setup/apply_nbt (タグと見た目を適用)
                 └─> mob:setup/apply_from_storage (ステータス適用)
```

#### 3.5. タグ構造（TUSB形式）
- **基本タグ**: `MOB`, `mob.{id}`, `mob.new`
- **カテゴリタグ**: `Global`, `Ground`, `Blow`/`Shoot`（大文字）
- **ボスタグ**: `mob.boss` (ボスの場合)
- **追加タグ**: スプレッドシートから（例: `Goblin`, `DarkKnight`）

#### 3.6. 実行方法
```powershell
cd C:\Users\nhs50030\AppData\Roaming\.minecraft\saves\RPG開発用\datapacks\MOBgenerator
python generate_mobs.py
```

### 4. 名前空間構成
- `rpg`: メインループ
- `player`: プレイヤー関連
- `status`: ステータス計算
- `mob`: MOB召喚・セットアップ・AI
- `bank`: MOB設定データ (Storage用)

## 最近の変更履歴 (2026-01-30)

### ✅ 完了した作業
1. **MOB Generator の完成**
   - CSV 列マッピングの修正（ID=エンティティタイプ、ベース=CustomName、見た目=equipment）
   - キャメルケース対応（`SkeletonWarrior` → `skeleton_warrior.mcfunction`）
   - `minecraft:` プレフィックスの自動追加
   - タグ生成の修正（TUSB形式に対応）

2. **Spawn システムの実装**
   - `mob:spawn_generic` の作成（汎用的な召喚関数）
   - `mob:spawn_map/{mob_id}` の導入
   - Storage ベースの召喚システム（マクロ使用）
   - NBT 適用システム（`mob:setup/apply_nbt`）

3. **GitHub リポジトリの作成**
   - https://github.com/Avuorina/MOBgenerator
   - README.md, .gitignore, LICENSE, example_mobs.csv を含む

4. **タスク管理**
   - `mobTASK.md` の作成（今後の開発タスクを整理）

### 🐛 修正した問題
- Spawn Egg が動作しない問題 → マクロとStorageの実装で解決
- CSV 列のマッピングが間違っていた → 正しい構造に修正
- タグ構造が TUSB と異なっていた → 大文字のカテゴリタグに修正

3. **AI設定システムの実装 (Phase 2)**
   - `data/ai/function/apply_attributes.mcfunction` の実装
     - 移動速度、索敵範囲、ノックバック耐性をStorageから適用
   - `generate_mobs.py` の更新
     - スプレッドシートの「移動速度」「索敵範囲」「ノックバック耐性」列に対応
     - キー名を `ai_speed` などアンダースコア区切りに変更

4. **進行度による動的レベル補正 (Phase 2)**
   - `Progress` (進行度) スコアの導入
   - レベル計算: `最終LV = 基本LV(Storage) + Global Progress`
   - ステータス自動補正:
     - `補正倍率(%) = 100 + (上昇LV × 5)`
     - Lv1につきステータスが5%ずつ上昇する仕組みを実装


## 次に取り組むべきタスク

### 優先度：高
### 優先度：高
1. **MOB AI システムの実装**
   - **完了**: パラメーター適用システム (`ai:apply_attributes`)
   - **残課題**: AI トリガーシステム（tick, attack, hurt, death）の実装

2. **属性耐性の実装 (Phase 3)**

2. **属性耐性の実装**
   - 物理、魔法、炎、爆発などのダメージ倍率設定
   - スプレッドシートに列を追加

3. **ドロップアイテム（LootTable）**
   - ボス用などのカスタムドロップ品設定
   - 経験値ドロップの調整

### 優先度：中
4. **職業・スキルシステム**
   - プレイヤー側の拡張

5. **クエストシステム**
   - 討伐、収集、探索クエスト

6. **ダンジョンシステム**

## 重要な注意点
- **MOB設定の変更**: 原則として Google Spreadsheet を編集し、`generate_mobs.py` を実行して反映させること。mcfunctionを直接編集しても上書きされる。
- **1.21.11仕様**: マクロや `spawn_egg` の `entity_data` (equipment) の仕様に追従している。
- **スプレッドシートの公開設定**: CSV エクスポートを有効にするため、「リンクを知っている全員が閲覧可能」に設定すること。

## 参考資料
- **TUSB**: https://github.com/TUSB/TheUnusualSkyBlock (bank システム、AI システム)
- **TSB**: https://github.com/ProjectTSB/TheSkyBlessing/wiki/create-mob (MOB作成ワークフロー)

---
**合言葉**: "MinecraftならではのRPG"
**最終更新**: 2026-01-31

