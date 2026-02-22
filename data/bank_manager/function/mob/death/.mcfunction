#> bank_manager:mob/death/
#
# MOB死亡処理
#
# @within function bank_manager:mob/hurt/hit

## 渡すEXPの計算
    function bank_manager:mob/death/adj_exp

## 経験値をプレイヤーに渡す
    scoreboard players operation @a[distance=..20] EXP += @s EXP
    scoreboard players operation $EXP EXP = @s EXP

## 渡すGOLDの計算
    function bank_manager:mob/death/adj_gold
    scoreboard players operation @a[distance=..20] GOLD += @s DropGold
    scoreboard players operation $DropGold DropGold = @s DropGold

## display
    execute at @s positioned ~ ~2 ~ run summon text_display ~ ~ ~ {billboard:"center",Tags:["Loot","PC"],text:[{"bold":false,"color":"dark_aqua","text":"獲得EXP："},{"bold":true,"color":"white","score":{"name":"$EXP","objective":"EXP"}},{"bold":false,"color":"gold","text":"\n獲得GOLD："},{"bold":true,"color":"white","score":{"name":"$DropGold","objective":"DropGold"}}]}
    execute at @s run scoreboard players set @e[type=text_display,tag=Loot,limit=1,sort=nearest] PortalCooldown 120
    ## tellraw
        tellraw @a[distance=..20] [{"text":"獲得EXP：","color":"dark_aqua"},{"score":{"name":"$EXP","objective":"EXP"},"color":"white"},{"text":"\n獲得GOLD：","color":"gold"},{"score":{"name":"$DropGold","objective":"DropGold"},"color":"white"}]

    ## RESET
        scoreboard players reset $Diff LV
        scoreboard players reset $Random _
        scoreboard players reset $EXP EXP
        scoreboard players reset $DropGold DropGold
    # HPバー削除
        function mob_manager:hp_bar/remove
    # 削除
        attribute @s max_health base set 1
        kill @s
