#> player/status/mp/regen/tick
#
# MPtick
#
# @within player:status/mp/regen/tick

# 自然回復
    execute if score @s MP >= @s MaxMP run scoreboard players operation @s MP = @s MaxMP
    execute if score @s MP < @s MaxMP run scoreboard players operation @s MPRegenTimer += @s MPRegen
    execute if score @s MPRegenTimer matches 2000.. run function player:status/mp/regen/

# 割合を計算
    scoreboard players operation @s MPRatio = @s MP
    scoreboard players operation @s MPRatio *= $1002 Const
    scoreboard players operation @s MPRatio /= @s MaxMP

# MPバー更新
    execute unless score @s PreviousMPRatio = @s MPRatio run function player:status/mp/bar/set
