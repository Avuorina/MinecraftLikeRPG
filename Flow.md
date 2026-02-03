# System Flow Documentation

このドキュメントでは、データパック内の主要なシステムの処理フローをまとめています。

## ⚔️ 戦闘システム (Custom Left-Click & Knockback)

### 概要
InteractionエンティティとAdvancementを組み合わせた「左クリック検知」と、ベクトル演算による「カスタムノックバック」のフローです。

### フロー図
```mermaid
graph TD
    Player["プレイヤー"] -->|左クリック| Interaction("Interactionエンティティ")
    Interaction -->|検知| Adv["進捗: check_Lclick"]
    Adv -->|報酬関数実行| Attacked["lib:left_click/attacked"]
    
    subgraph "ターゲット検出 (Target Detection)"
        Attacked -->|レイキャスト開始| Target["lib:left_click/target"]
        Target -->|再帰処理| Target
        Target -->|敵を発見| TagEnemy["敵に'Hit'タグを付与"]
    end
    
    subgraph "衝撃処理 (Impact Processing)"
        Attacked -->|敵として実行| HitFunc["mob:on_hurt/hit"]
        HitFunc -->|攻撃者の向きで実行| Knockback["mob:on_hurt/knockback/"]
    end
    
    subgraph "物理演算 (Physics Calculation)"
        Knockback -->|AEC召喚| AEC["座標0,0,0にAEC召喚"]
        AEC -->|座標取得| Vector["X/Y/Z ベクトル計算"]
        Vector -->|パワー適用| Motion["敵のMotionに適用"]
    end
```

---

## 🧟 MOBスポーンシステム

### 概要
Pythonジェネレーターで生成されたデータバンクファイル (`bank:mob/...`) を利用し、ID指定でモブを召喚・初期化するフローです。
データの**定義**と**召喚**が分離されているのが特徴です。

### フロー図
```mermaid
graph TD
    User["ユーザー/コマンド"] -->|"/function mob:spawn/by_id {id:...}"| SpawnMacro["mob:spawn/by_id"]
    SpawnMacro -->|1. データ登録| Register["bank:mob/{id}/register"]
    SpawnMacro -->|2. 召喚実行| FromStorage["mob:spawn/from_storage"]

    subgraph "スポーンエッグ (Spawn Egg)"
        Item["Spawn Egg Item"] -->|設置| AS["Armor Stand (tag:mob.egg_spawn)"]
        AS -->|mob:tickで検知| Tick["mob:tick"]
        Tick -->|Macro起動| EggMacro["mob:spawn/ (.mcfunction)"]
        EggMacro -->|ID抽出| Generic["mob:spawn/generic"]
        Generic -->|1. データ登録| Register
        Generic -->|2. 召喚実行| FromStorage
        Generic -->|AS削除| Kill["Kill Armor Stand"]
    end
    
    subgraph "Generator Output (bank)"
        Register -->|Storage保存| Data["rpg_mob: Stats, Equipment..."]
    end
    
    subgraph "Spawn Process"
        FromStorage -->|Macro Call| SummonMacro["mob:spawn/macro"]
        SummonMacro -->|Summon| Entity["Entity Summoned"]
        SummonMacro -->|Init| Setup["mob:setup/init"]
    end
    
    Entity -.-> Setup

    subgraph "Initialization (Init Only)"
        Setup -->|Load Data| Apply["mob:setup/apply_from_storage"]
        Apply -->|Calc Factor| LevelCalc["レベル・Gold計算"]
        Apply -->|Set Attribute| MobStat["status:apply_mob"]
        Apply -->|Set AI| AI["ai:apply_attributes"]
        Apply -->|Set Tag| Asset["AssetMOBタグ付与"]
    end
```

### 主要コンポーネントとロジック

#### 1. データ登録 (`bank:mob/.../register`)
*   Storage (`rpg_mob:`) にモブの定義情報を書き込みます。
*   **注**: ここでは召喚を行いません。あくまでデータの定義のみです。

#### 2. 召喚と初期化 (`mob:spawn/from_storage` -> `macro` -> `init`)
*   Storageの情報を使って `summon` を行い、直後に `mob:setup/init` を実行します。
*   `init` は `tag=Init` を持つ新規モブに対して**1回のみ**実行されます（ループ監視は行いません）。

#### 3. ステータス計算式 (apply_from_storage / apply_mob)

| ステータス | 計算処理 | 最終適用先 |
| :--- | :--- | :--- |
| **STR** (攻撃力) | **STR =csv値** (直値) | `attribute atomic:attack_damage` |
| **AGI** (速度) | **AGI / 100** | `attribute generic.movement_speed` |
| **DEF** (防御) | **DEF - 5** | `attribute generic.armor` (負なら0) |
| **Gold** | **csv値 * LevelFactor** | `score @s DroppedGold` |
| **レベル補正** | **(Lv - BaseLv) * 5%** | 全ステータスに乗算 |

*   **STR/AGI**: 管理しやすいよう、倍率計算などを廃止し、CSVの数値がそのまま反映される直感的な方式を採用しています。
*   **Gold**: `Luck` ステータスを廃止し、ドロップゴールド (`DroppedGold`) として再実装しました。
