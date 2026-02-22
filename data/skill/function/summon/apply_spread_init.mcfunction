#> skill:summon/apply_spread_init
#
# Spread適用の初期化とリトライ制御

# 初期化
    scoreboard players set #spread_retry _ 0
    scoreboard players set #spread_success _ 0

# ランダム距離と角度の事前計算(共通)
# 最大Spreadの計算
    execute store result score #spread _ run data get storage skill: data.Spread 100

# ループ開始
    function skill:summon/apply_spread_loop

# 失敗した場合は妥協としてSummonOriginにSummonTargetを置く
    execute if score #spread_success _ matches 0 as @e[type=marker,tag=SummonOrigin,limit=1,sort=nearest] at @s run summon marker ~ ~ ~ {Tags:["SummonTarget"]}
