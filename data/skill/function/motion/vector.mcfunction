# マーカーを向いている方向に1ブロック進める（単位ベクトル作成）
    execute as @e[type=marker,tag=motion_calc,limit=1] at @s run tp @s ^ ^ ^1

# 各軸の座標（＝ベクトル成分）を取得してSpeed倍する
# Speed単位: 0.1d = 100 (in storage *1000)

# Speed取得 (default 1.0 if missing? no, checking storage)
    execute store result score #speed _ run data get storage rpg_skill: data.Speed 1000

# X軸
    execute store result score #vec _ run data get entity @e[type=marker,tag=motion_calc,limit=1] Pos[0] 10000
    scoreboard players operation #vec _ *= #speed _
    # 10000(Pos) * 1000(Speed) = 10,000,000 scale. We want double.
    # Pos[0] scale 1.0. 
    # Better:
    # 1. Get Pos[0] as double scale (wait, connection works better with high precision int)
    # TUSB uses: Pos[0] * Speed(ratio) -> Pos[0]
    # My Speed is like "0.5".
    # Marker Pos is at dist 1.0. So Pos[0] is e.g. 0.7.
    # 0.7 * 0.5 = 0.35.

    # Re-implementing TUSB logic exactly for stability
    # TUSB:
    # store result score _ Calc run data get entity 0-0-0-0-0 Pos[0] 100
    # store result entity 0-0-0-0-0 Pos[0] double 0.0001 run scoreboard players operation _ Calc *= _ _ (Speed*100)
    # 100 * 100 = 10000. 10000 * 0.0001 = 1.0. Correct.

    # My Speed: data.Speed is double, e.g. 0.3
        execute store result score #speed _ run data get storage rpg_skill: data.Speed 100

    # X
        execute store result score #calc _ run data get entity @e[type=marker,tag=motion_calc,limit=1] Pos[0] 100
        scoreboard players operation #calc _ *= #speed _
        execute store result entity @e[type=marker,tag=motion_calc,limit=1] Pos[0] double 0.0001 run scoreboard players get #calc _

    # Y
        execute store result score #calc _ run data get entity @e[type=marker,tag=motion_calc,limit=1] Pos[1] 100
        scoreboard players operation #calc _ *= #speed _
        execute store result entity @e[type=marker,tag=motion_calc,limit=1] Pos[1] double 0.0001 run scoreboard players get #calc _

    # Z
        execute store result score #calc _ run data get entity @e[type=marker,tag=motion_calc,limit=1] Pos[2] 100
        scoreboard players operation #calc _ *= #speed _
        execute store result entity @e[type=marker,tag=motion_calc,limit=1] Pos[2] double 0.0001 run scoreboard players get #calc _

    # Apply to entity
        data modify entity @s Motion set from entity @e[type=marker,tag=motion_calc,limit=1] Pos
