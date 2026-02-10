# HPに関するtick

# 自然回復
    execute if score @s HP >= @s MaxHP run scoreboard players operation @s HP = @s MaxHP
    execute if score @s HP < @s MaxHP run scoreboard players operation @s HPRegenTimer += @s HPRegen
    execute if score @s HPRegenTimer matches 2000.. run function player:status/hp/regen

# バニラのダメージを受けないように
    effect give @s resistance infinite 5 true


