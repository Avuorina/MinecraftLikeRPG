#> player/status/mp/regen/
#
# MP自動回復
#
# @within player:status/mp/regen/tick
# MP自動回復
    scoreboard players add @s MP 1
# タイマーから消費（リセットではなく引くことで、余剰分を無駄にしない）
    scoreboard players remove @s MPRegenTimer 2000
# もしまだ余ってたら再帰的に呼ぶ（超高速回復のサポート）
    execute if score @s MPRegenTimer matches 2000.. run function player:status/mp/regen/