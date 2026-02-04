#> mob:spawn/
#
#
#
# @within function mob:tick

# アーマースタンドの頭装備からMOB IDを読み取ってスポーン
# マクロ引数: equipment.head.components."minecraft:custom_data" (RPGMobId を持っている)

# 汎用的な spawn 関数を呼び出し（RPGMobIdを渡す）
# Data Inspection
#say [Debug] ArmorItems:
#data get entity @s ArmorItems

# 汎用的な spawn 関数を呼び出し（RPGMobIdを渡す）
#say Debug: Trying to spawn ID: $(RPGMobId)
    $function mob:spawn/generic {mob_id:"$(RPGMobId)"}
    #execute if entity @e[type=armor_stand,tag=mob.egg_spawn] run say 1
    # アーマースタンドを消す
        kill @s
