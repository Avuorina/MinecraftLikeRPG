# mob:tick
# 毎tick実行

# スポーンエッグ（アーマースタンド）を検知してトリガー
# スポーンエッグ（アーマースタンド）を検知してトリガー
# Debug
    #execute as @e[type=armor_stand,tag=mob.egg_spawn] run say [Debug] Found SpawnEgg

# Debug: Check actual NBT
    execute as @e[type=armor_stand,tag=mob.egg_spawn] run data get entity @s equipment.head.components."minecraft:custom_data"

# Try macro (will likely fail if above shows no data)
    execute as @e[type=armor_stand,tag=mob.egg_spawn] at @s run function mob:spawn/ with entity @s equipment.head.components."minecraft:custom_data"

# Debug
    #execute as @e[type=armor_stand,tag=mob.egg_spawn] run say [Debug] Triggered Spawn
