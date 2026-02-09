#> mob:attack/detected
#
# MOB(@s)からプレイヤー(@p[tag=Victim])への攻撃処理
#
# @within function mob:attack/filter/0

# 被ダメージ
    scoreboard players operation @p[tag=Victim] DmgReceived -= @s DmgDealt