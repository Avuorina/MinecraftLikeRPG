
#> skill:change_status/add

# ChangeStatus: Add Mode
# skill: data.add から値を読み込んで加算

# STR
    execute if data storage skill: data.add.STR store result score _ _ run data get storage skill: data.add.STR
    execute if data storage skill: data.add.STR run scoreboard players operation @s STR += _ _

# ATK
    execute if data storage skill: data.add.ATK store result score _ _ run data get storage skill: data.add.ATK
    execute if data storage skill: data.add.ATK run scoreboard players operation @s ATK += _ _

# DEF
    execute if data storage skill: data.add.DEF store result score _ _ run data get storage skill: data.add.DEF
    execute if data storage skill: data.add.DEF run scoreboard players operation @s DEF += _ _

# AGI
    execute if data storage skill: data.add.AGI store result score _ _ run data get storage skill: data.add.AGI
    execute if data storage skill: data.add.AGI run scoreboard players operation @s AGI += _ _

# INT
    execute if data storage skill: data.add.INT store result score _ _ run data get storage skill: data.add.INT
    execute if data storage skill: data.add.INT run scoreboard players operation @s INT += _ _

# SPD
    execute if data storage skill: data.add.SPD store result score _ _ run data get storage skill: data.add.SPD
    execute if data storage skill: data.add.SPD run scoreboard players operation @s SPD += _ _

# LUCK
    execute if data storage skill: data.add.LUCK store result score _ _ run data get storage skill: data.add.LUCK
    execute if data storage skill: data.add.LUCK run scoreboard players operation @s LUCK += _ _

# MaxHP
    execute if data storage skill: data.add.MaxHP run function skill:change_status/maxhp_add
