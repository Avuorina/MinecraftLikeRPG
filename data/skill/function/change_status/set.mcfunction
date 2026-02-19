
#> skill:change_status/set

# ChangeStatus: Set Mode
# skill: data.set から値を読み込んで適用

# STR
    execute if data storage skill: data.set.STR store result score @s STR run data get storage skill: data.set.STR

# ATK
    execute if data storage skill: data.set.ATK store result score @s ATK run data get storage skill: data.set.ATK

# DEF
    execute if data storage skill: data.set.DEF store result score @s DEF run data get storage skill: data.set.DEF

# AGI
    execute if data storage skill: data.set.AGI store result score @s AGI run data get storage skill: data.set.AGI

# INT
    execute if data storage skill: data.set.INT store result score @s INT run data get storage skill: data.set.INT

# SPD
    execute if data storage skill: data.set.SPD store result score @s SPD run data get storage skill: data.set.SPD

# LUCK
    execute if data storage skill: data.set.LUCK store result score @s LUCK run data get storage skill: data.set.LUCK

# MaxHP
    execute if data storage skill: data.set.MaxHP run function skill:change_status/maxhp_set
