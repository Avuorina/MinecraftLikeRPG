#> mob_manager:hp_bar/init
#
# HPバーの初期化
#
# @within bank_manager:mob/summon/init

# HPBarID発行
    scoreboard players add #Global HPBarID 1
    scoreboard players operation @s HPBarID = #Global HPBarID

# Text Display召喚
    execute at @s run summon text_display ~ ~ ~ {Tags:["HPBar"],billboard:"center",default_background:true,text:{"text":""},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[1f,1f,1f]}}
    execute at @s run scoreboard players operation @e[type=text_display,tag=HPBar,distance=..1,limit=1,sort=nearest] HPBarID = @s HPBarID

# 名前 (CustomName) を storage に格納
    data remove storage bank:mob Name
    data modify storage bank:mob Name set from entity @s CustomName

# 名前のみ表示 (マクロ実行)
    execute as @e[type=text_display,tag=HPBar,distance=..1,limit=1,sort=nearest] at @s run function mob_manager:hp_bar/apply_name_only with storage bank:mob

# 乗せる (Passenger)
    execute at @s run ride @e[type=text_display,tag=HPBar,distance=..1,limit=1,sort=nearest] mount @s