# レベル表示の更新 (マクロ)
# 実行者: モブ (@s)
# マクロ引数: lv (現在レベル)

# 1. LevelJSON文字列を作成してStorageに保存
# マクロ展開して文字列を構築: {"text":" Lv.30", "color":"gray", "bold":false}
# 重要: シングルクォート ' で囲むことで、NBTではなく「JSON形式の文字列」として保存する
# (囲まないとSNBT形式になり、CustomNameでエラーになる)
    $data modify storage rpg_mob: LevelJSON set value {"text":" Lv.$(lv)", "color":"gray", "bold":false}

# 2. マクロ呼び出し (BaseNameJSON と LevelJSON を使用)
# rpg_mob: BaseNameJSON は Generatorによって既にセットされている前提
    function mob:setup/level/apply with storage rpg_mob:
