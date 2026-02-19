#> skill:motion/direction

# Direction: [Yaw, Pitch]
# マーカーのRotationを変更する

# Yaw (Horizontal)
    execute store result score #calc _ run data get entity @e[type=marker,tag=motion_calc,limit=1] Rotation[0] 100
    # Absoluteフラグがある場合は0リセット（絶対指定）
        execute if data storage skill: data.Absolute run scoreboard players set #calc _ 0

    execute store result score #val _ run data get storage skill: data.Direction[0] 100
    scoreboard players operation #calc _ += #val _
    execute store result entity @e[type=marker,tag=motion_calc,limit=1] Rotation[0] float 0.01 run scoreboard players get #calc _

# Pitch (Vertical)
    execute store result score #calc _ run data get entity @e[type=marker,tag=motion_calc,limit=1] Rotation[1] 100
    execute if data storage skill: data.Absolute run scoreboard players set #calc _ 0

execute store result score #val _ run data get storage skill: data.Direction[1] 100
scoreboard players operation #calc _ += #val _
execute store result entity @e[type=marker,tag=motion_calc,limit=1] Rotation[1] float 0.01 run scoreboard players get #calc _
