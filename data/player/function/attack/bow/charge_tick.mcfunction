#> player:attack/bow/charge_tick
# 弓のチャージ進行と解放判定
# @within function player:attack/tick

# チャージ量を加算 (最大60)
    scoreboard players add @s BowCharge 1
    execute if score @s BowCharge matches 61.. run scoreboard players set @s BowCharge 60

# タイムアウトを減算
    scoreboard players remove @s BowTimeout 1

# 演出 (音とパーティクル)
# 30% (12tick)
    execute if score @s BowCharge matches 12 run playsound minecraft:block.note_block.hat player @s ~ ~ ~ 1 1.0
    execute if score @s BowCharge matches 12 run particle minecraft:crit ^ ^1.5 ^1 0.2 0.2 0.2 0.05 5
    # 60% (24tick)
        execute if score @s BowCharge matches 24 run playsound minecraft:block.note_block.hat player @s ~ ~ ~ 1 1.2
        execute if score @s BowCharge matches 24 run particle minecraft:crit ^ ^1.5 ^1 0.2 0.2 0.2 0.05 10
        # 100% (40tick)
            execute if score @s BowCharge matches 40 run playsound minecraft:entity.experience_orb.pickup player @s ~ ~ ~ 1 1.0
            execute if score @s BowCharge matches 40 run particle minecraft:enchanted_hit ^ ^1.5 ^1 0.3 0.3 0.3 0.1 15
            # 150% (60tick)
                execute if score @s BowCharge matches 60 run playsound minecraft:entity.player.levelup player @s ~ ~ ~ 1 1.5
                execute if score @s BowCharge matches 60 run particle minecraft:flame ^ ^1.5 ^1 0 0 0 0 1

            # 解放判定（タイムアウトが0以下になったら発射）
                execute if score @s BowTimeout matches ..0 run function player:attack/bow/release