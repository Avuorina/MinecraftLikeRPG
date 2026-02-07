#> mob:setup/init
#
#
#
# @within function mob:setup/generator/apply

tag @s add BankMOB

# Storageからのステータス・装備適用
    function mob:setup/apply_from_storage

# AIパラメータ適用 (移動速度、索敵範囲など)
    function ai:apply_attributes

# 見た目・装備適用 (Storage -> Entity)
    function mob:setup/apply_nbt

# アトリビュートに代入
    function status:apply_mob

# 初期化済みタグ付与
    tag @s add mob.initialized

# 初期スキル実行（Dispatcher: bank内 .mcfunction）
    function bank:mob/

