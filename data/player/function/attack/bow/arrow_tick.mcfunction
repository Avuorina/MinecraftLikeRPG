#> player:attack/bow/arrow_tick
# 飛んでいる矢の常時実行処理（core:tick などから呼び出される）
# @within function core:tick

# 自動消滅タイマーの減算
    scoreboard players remove @s[nbt={inGround:1b}] Timer 1

# 着弾・あるいはタイマー切れで消去
    execute if score @s Timer matches ..0 run kill @s
    execute if data entity @s {inGround:1b} if entity @s[tag=Flying] run tag @s add Landed
    execute if entity @s[tag=Landed] run tag @s remove Flying

# 着弾音とディレイ消去 (Landedタグがついてから少し後に消す)
    execute if entity @s[tag=Landed] run scoreboard players set @s Timer 100
    execute if entity @s[tag=Landed] run tag @s remove Landed

# 飛翔中のパーティクル（軌道確認用）
    execute if entity @s[tag=Flying] at @s run particle crit ~ ~ ~ 0 0 0 0 1 force
