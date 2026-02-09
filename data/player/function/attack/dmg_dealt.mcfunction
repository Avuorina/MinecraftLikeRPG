#> player:attack/dmg_dealt
#
# ダメージ処理を計算
#
# @within function player:attack/

function player:status/atk/update
scoreboard players operation &DmgDealt _ = @s ATK