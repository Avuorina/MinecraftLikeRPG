# Raycast Loop
# 実行者: プレイヤー
# 位置: Rayの先端

# 1. カウンターチェック (0以下なら終了)
    execute if score @s RaycastCount matches ..0 run return 0
    scoreboard players remove @s RaycastCount 1

# 2. 衝突判定 (ENEMYタグを持つエンティティがいるか)
# dx/dy/dz=0 で「そのブロック内」を判定
    execute as @e[type=!player,tag=ENEMY,dx=0,dy=0,dz=0,limit=1,sort=nearest] positioned as @s run return run function player:magic/sword_raycast/hit

# 3. 前進して再帰 (0.5ブロック)
# パーティクルも出しておく（デバッグ用＆視覚効果）
    particle crit ^ ^ ^0.5 0 0 0 0 1 normal
    execute positioned ^ ^ ^0.5 run function player:magic/sword_raycast/loop
