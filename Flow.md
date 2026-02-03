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

### 主要コンポーネント
1.  **左クリック検知 (`lib:left_click`)**
    *   **Tick処理**: 常に目の前に `interaction` エンティティを維持。
    *   **Trigger**: `advancement/check_Lclick` (player_hurt_entity) で殴った瞬間をフック。
2.  **ターゲット特定 (`lib:left_click/target`)**
    *   視線方向に再帰的なレイキャストを行い、Hitタグを付与。
3.  **ノックバック計算 (`mob:on_hurt/knockback`)**
    *   **ベクトル生成**: `rotated as attacker` 状態で `positioned 0 0 0` にAECを召喚してベクトルを取得。
    *   **倍率適用**: スコアボード (`&XPower`, `&YPower`, `&ZPower`) で強さをXYZ個別に制御。
    *   **適用**: 計算結果を敵の `Motion` タグに書き込む。

---

## 🧟 MOBスポーンシステム

### 概要
Pythonジェネレーターで生成されたデータバンクファイル (`bank:mob/...`) を利用し、ID指定でモブを召喚・初期化するフローです。

### フロー図
```mermaid
graph TD
    User["ユーザー/コマンド"] -->|"/function mob:spawn/by_id {id:...}"| SpawnMacro["mob:spawn/by_id"]
    SpawnMacro -->|ID展開| Register["bank:mob/{id}/register"]

    subgraph "スポーンエッグ (Spawn Egg)"
        Item["Spawn Egg Item"] -->|設置| AS["Armor Stand (tag:mob.egg_spawn)"]
        AS -->|mob:tickで検知| Tick["mob:tick"]
        Tick -->|Macro起動| EggMacro["mob:spawn/ (.mcfunction)"]
        EggMacro -->|ID抽出| Generic["mob:spawn/generic"]
        Generic -->|AS削除| Kill["Kill Armor Stand"]
        Generic --> SpawnMacro
    end
    
    subgraph "Generator Output (bank)"
        Register -->|Storage設定| Data["rpg_mob: Stats, Equipment..."]
        Register -->|Summon| Entity["Entity Summoned at ~ ~ ~"]
    end
    
    Entity -->|初期化関数コール| Setup["mob:setup/apply_from_storage"]
    
    subgraph "Initialization"
        Setup -->|レベル補正| LevelCalc["レベル・ステータス計算"]
        Setup -->|属性適用| Status["status:apply_mob"]
        Setup -->|AI設定| AI["ai:apply_attributes"]
    end
    
    Status -->|Attribute設定| Attr["Generic Attribute Macro"]
```



### 主要コンポーネント
1.  **呼び出し (`mob:spawn/by_id`)**
    *   Macro引数 `{id:"..."}` を受け取り、対応するBankファイルを呼び出すエントリーポイント。
2.  **スポーンエッグ検知 (`mob:tick`)**
    *   アーマースタンドとして設置されたスポーンエッグ (`mob.egg_spawn`) を毎tick検知。
    *   NBTから `RPGMobId` を読み取り、自動的に `mob:spawn/generic` を経由して `by_id` を呼び出します。
3.  **データ登録 (`bank:mob/.../register`)**
    *   **生成元**: `generate_mobs.py`

    *   モブ固有のデータ（名前、装備、基礎ステータス）をStorageに保存し、エンティティを召喚します。
3.  **初期化 (`mob:setup/apply_from_storage`)**
    *   全モブ共通の初期化ロジック。
    *   Storageからデータを読み出し、レベル補正などを掛けてスコアボードに展開します。
4.  **ステータス適用 (`status:apply_mob`)**
    *   計算されたスコア（STR, DEFなど）を実際のマイクラのAttribute（攻撃力、防具値など）に変換・適用します。
    *   注: Damage計算をカスタムする場合はここでAttribute設定を行わない場合もあります。
