# mob:tick
# 毎tick実行

# スポーンエッグ（アーマースタンド）を検知してトリガー
# スポーンエッグ（アーマースタンド）を検知してトリガー
    execute as @e[type=armor_stand,tag=mob.egg_spawn] at @s run function mob:trigger_spawn with entity @s equipment.head.components."minecraft:custom_data"
