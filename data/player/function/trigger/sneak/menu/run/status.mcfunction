## メニューボタンを押すと実行

# ステータス
    # HP
        execute if score @s Menu matches 101 if score @s StatusPoint matches 1.. run scoreboard players add @s MaxHP 1
        execute if score @s Menu matches 101 if score @s StatusPoint matches 1.. run scoreboard players add @s HP 1

    # MP
        execute if score @s Menu matches 102 if score @s StatusPoint matches 1.. run scoreboard players add @s MaxMP 1
        execute if score @s Menu matches 102 if score @s StatusPoint matches 1.. run scoreboard players add @s MP 1

    # STR
        execute if score @s Menu matches 103 if score @s StatusPoint matches 1.. run scoreboard players add @s STR 1

    # DEF
        execute if score @s Menu matches 104 if score @s StatusPoint matches 1.. run scoreboard players add @s DEF 1

    # AGI
        execute if score @s Menu matches 105 if score @s StatusPoint matches 1.. run scoreboard players add @s AGI 1

    # INT
        execute if score @s Menu matches 106 if score @s StatusPoint matches 1.. run scoreboard players add @s INT 1
        
    # SPD
        execute if score @s Menu matches 107 if score @s StatusPoint matches 1.. run scoreboard players add @s SPD 1

    # LUCK
        execute if score @s Menu matches 108 if score @s StatusPoint matches 1.. run scoreboard players add @s LUCK 1

    ## ステータス上昇失敗
        execute if score @s Menu matches 101..108 if score @s StatusPoint matches ..0 run tellraw @s [{"text": "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"},{"bold":true,"color":"red","text":"ポイントが足りない！"}]
        execute if score @s Menu matches 101..108 if score @s StatusPoint matches ..0 run playsound entity.villager.no master @s ~ ~ ~ 1 1

    ## ステータス上昇成功
        execute if score @s Menu matches 101..108 if score @s StatusPoint matches 1.. run playsound entity.player.levelup master @s ~ ~ ~ 1 2
        # もう一度表示させる
            execute if score @s Menu matches 101..199 if score @s StatusPoint matches 1.. run function player:status/allocation_screen
        execute if score @s Menu matches 101..108 if score @s StatusPoint matches 1.. run scoreboard players remove @s StatusPoint 1

        

#リセット
    scoreboard players set @s Menu 0
