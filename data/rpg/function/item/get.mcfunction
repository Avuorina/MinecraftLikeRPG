# アイテム入手関数 (マクロ)
# $id: アイテムID (例: "001.wodden_sword")
# 使用法: function rpg:item/get {id:"001.wodden_sword"}

# 1. データをStorageの一時領域にロード
    $function bank:item/$(id)/register

# 2. ベースアイテムを取り出し
# StorageからIDを取得し、マクロ引数として渡すためのCompoundを作る
# 初期化 (mergeを使えば存在しなくても作成される)
    data merge storage rpg_item:arg {}
    # rpg_item:tmp の id パスから、rpg_item:arg の id_macro パスへコピー
        data modify storage rpg_item:arg id_macro set from storage rpg_item:tmp id

    # マクロ実行 (引数は storage rpg_item:arg)
        function rpg:item/internal/replace_mainhand with storage rpg_item:arg

    # 3. Item Modifierで残りのデータ(Components)を適用
        item modify entity @s weapon.mainhand rpg:apply_from_storage

    # 4. 完了メッセージ (オプション)
    # tellraw @s [{"text":"Item Generated: ","color":"green"},{"storage":"rpg_item:tmp","nbt":"components.'minecraft:custom_name'"}]
