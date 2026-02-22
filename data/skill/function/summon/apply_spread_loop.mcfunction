#> skill:summon/apply_spread_loop
#
# Spread適用のループ処理 (最大10回)

# 試行回数追加
    scoreboard players add #spread_retry _ 1

# 一時マーカー召喚 (Origin基準で開始)
    execute as @e[type=marker,tag=SummonOrigin,limit=1,sort=nearest] at @s run summon marker ~ ~ ~ {Tags:["SpreadTry"]}

# 乱数計算してSpreadTryを動かす
    execute as @e[type=marker,tag=SpreadTry,limit=1,sort=nearest] at @s run function skill:summon/apply_spread_calc

# 安全確認
    execute as @e[type=marker,tag=SpreadTry,limit=1,sort=nearest] at @s run function skill:summon/check_safe_pos

# 成功したらタグ付け替えて終了
    execute if score #spread_success _ matches 1 as @e[type=marker,tag=SpreadTry] run tag @s add SummonTarget
    execute if score #spread_success _ matches 1 as @e[type=marker,tag=SpreadTry] run tag @s remove SpreadTry

# 失敗したら一時マーカー削除してリトライ
    execute if score #spread_success _ matches 0 run kill @e[type=marker,tag=SpreadTry]

# 10回未満ならリトライ
    execute if score #spread_success _ matches 0 if score #spread_retry _ matches ..9 run function skill:summon/apply_spread_loop
