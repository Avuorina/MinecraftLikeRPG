#> skill:summon/loop
#
# 召喚ループ
# 

# 1. マーカー召喚 (実行者の位置と向きを継承)
    summon marker ~ ~ ~ {Tags:["SummonOrigin"]}
    execute as @e[type=marker,tag=SummonOrigin,limit=1,sort=nearest] run tp @s ~ ~ ~ ~ 0

# Offset適用
    data modify storage skill: temp.OffsetX set from storage skill: data.Offset[0]
    data modify storage skill: temp.OffsetY set from storage skill: data.Offset[1]
    data modify storage skill: temp.OffsetZ set from storage skill: data.Offset[2]
    execute as @e[type=marker,tag=SummonOrigin,limit=1,sort=nearest] at @s run function skill:summon/apply_offset with storage skill: temp

# 3. Spread適用
    execute if data storage skill: data.Spread run function skill:summon/apply_spread_init
    execute unless data storage skill: data.Spread as @e[type=marker,tag=SummonOrigin,limit=1,sort=nearest] at @s run summon marker ~ ~ ~ {Tags:["SummonTarget"]}

# 4. 召喚実行 (api:mob/summon)
    data modify storage api: Argument.ID set from storage skill: data.MobID
    execute at @e[type=marker,tag=SummonTarget,limit=1,sort=nearest] run function api:mob/summon

# 5. マーカー削除
    kill @e[type=marker,tag=SummonOrigin]
    kill @e[type=marker,tag=SummonTarget]

# 6. ループ継続判定
    scoreboard players remove #count _ 1
    execute if score #count _ matches 1.. at @s run function skill:summon/loop
