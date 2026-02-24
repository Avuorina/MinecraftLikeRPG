#> player:attack/bow/tick
# キャロットオンアスティック（弓）の右クリックを検知した際のチャージ開始・維持処理
# @within function player:attack/tick

# チャージタイムアウトを更新 (右クリック継続判定, CoaSは最低4tickに1回反応するため5を指定)
    scoreboard players set @s BowTimeout 5

# チャージ中でなければチャージ開始
    execute unless entity @s[tag=ChargingBow] run tag @s add ChargingBow

# リセット
    scoreboard players reset @s Used.CoaS
