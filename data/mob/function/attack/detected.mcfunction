#> mob:attack/detected
#
# MOB(@s)からプレイヤー(@p[tag=Victim])への攻撃処理
#
# @within function mob:attack/filter/0

## 被ダメージ
# @sの攻撃力を取得
    function mob:status/str.atk/update
    scoreboard players operation $DmgDealt _ = @s ATK
# @p[tag=Victim]の防御力を取得
    scoreboard players operation $TempDef _ = @p[tag=Victim] DEF
# 被ダメージ= 受ダメージ *200/(200+ def*2)
    scoreboard players operation $DmgDealt _ *= $200 Const
    scoreboard players operation $TempDef _ *= $2 Const
    scoreboard players operation $TempDef _ += $200 Const
    scoreboard players operation $DmgDealt _ /= $TempDef _

# ダメージ適用
    scoreboard players operation @p[tag=Victim] DmgReceived = $DmgDealt _
    scoreboard players operation @p[tag=Victim] HP -= @p[tag=Victim] DmgReceived 
    #　↑完全に無駄やね。

# HP適用
    execute as @p[tag=Victim] run function player:status/hp/update

# RESET
    scoreboard players reset @s DmgReceived
    scoreboard players reset $DmgDealt _
    scoreboard players reset $TempDef _
