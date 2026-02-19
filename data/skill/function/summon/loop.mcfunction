#> skill:summon/loop


#> skill:summon/loop


#> skill:summon/loop
#
# 召喚ループ
# 

# 1. マーカー召喚 (実行者の位置)
    summon marker ~ ~ ~ {Tags:["SummonPos"]}

# 2. Offset適用 (ローカル座標)
# Offsetがない場合は 0,0,0
    execute as @e[type=marker,tag=SummonPos,distance=..0.01] at @s run tp @s ~ ~ ~

# Offset: [x, y, z] を取得して tp
# マクロを使わないと動的なローカル座標tpは難しい...いや、マーカーをtpさせるなら、
# 実行者の向きを持たせてから ^ ^ ^ で飛ばせばいい

# マーカーに実行者の向きを同期
    execute as @e[type=marker,tag=SummonPos,distance=..0.01] run data modify entity @s Rotation set from entity @p Rotation
    # @pだとプレイヤーになっちゃうので、@s(実行者)のRotationを取りたいが、function内コンテキストの@sは実行者
    # しかし as @marker してるので context @s はマーカー
    # つまり、 execute at @s(実行者) run summon ... した時点でマーカーは実行者の位置・向き? -> いや向きは0,0

    # もう一度 @s (実行者) でマーカーを操作する
        data modify entity @e[type=marker,tag=SummonPos,limit=1,sort=nearest] Rotation set from entity @s Rotation

    # Offset適用 (マクロなしでやる場合、個別にtpする必要があるが、Listからの動的tpはマクロ必須)
    # Offset適用
    # マクロでListアクセス $(Offset[0]) ができないため、個別にtempにコピーする
        data modify storage skill: temp.OffsetX set from storage skill: data.Offset[0]
        data modify storage skill: temp.OffsetY set from storage skill: data.Offset[1]
        data modify storage skill: temp.OffsetZ set from storage skill: data.Offset[2]

    execute at @s run function skill:summon/apply_offset with storage skill: temp

# 3. Spread適用
    execute if data storage skill: data.Spread at @s run function skill:summon/apply_spread

# 4. 召喚実行 (api:mob/summon)
# @s: 実行者(Summoner) - 親設定などに必要なら
# at: マーカー位置
    execute at @e[type=marker,tag=SummonPos,limit=1,sort=nearest] run function api:mob/summon

# 5. マーカー削除
    kill @e[type=marker,tag=SummonPos]

# 6. ループ継続判定
    scoreboard players remove #count _ 1
    execute if score #count _ matches 1.. at @s run function skill:summon/loop
