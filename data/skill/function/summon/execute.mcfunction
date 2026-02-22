#> skill:summon/execute


#> skill:summon/execute
#
# Skill:Summon 実行関数
# 
# パラメータ:
# - data.MobID: String (召喚するMobのID)
# - data.Count: Int (召喚数)
# - data.Offset: List [x, y, z] (相対座標)
# - data.Spread: Double (拡散範囲)

# 1. ID検証
    execute unless data storage skill: data.MobID run tellraw @a [{"storage":global,"nbt":"Prefix.ERROR"},{"text":"引数が足りません。","color":red},{"text":"(IDを指定してください)"},{"text":"[skill:summon/execute]",color:gray}]
    execute unless data storage skill: data.MobID run return fail

# 2. API引数セット
    data modify storage api: Argument.ID set from storage skill: data.MobID

# 3. カウンターセット (デフォルト1)
    scoreboard players set #count _ 1
    execute if data storage skill: data.Count store result score #count _ run data get storage skill: data.Count

# 4. ループ実行
    execute at @s run function skill:summon/loop
