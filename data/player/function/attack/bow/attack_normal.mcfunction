#> player:attack/bow/attack_normal
# 通常の弓の射撃処理
# @within function player:attack/bow/tick

# プレイヤーの視線ベクトル（クロスヘア方向）を取得するためのマーカー召喚
# 足元基準の ^ ^1.62 ^ だと上下を向いた際にベクトルが狂うため、anchored eyes (視点基準) に変更する
    execute anchored eyes run summon marker ^ ^ ^ {Tags:["BowOrigin"]}
    execute anchored eyes run summon marker ^ ^ ^1 {Tags:["BowTarget"]}

# 目の前（視点の少し先）に矢を召喚する
    execute anchored eyes run summon arrow ^ ^ ^0.1 {Tags:["BankArrow","ArrowInit"],pickup:0b,life:0s}

# 召喚した矢の向き(Yaw/Pitch)をプレイヤーの視点角に強制的に合わせる
    execute as @e[type=arrow,tag=ArrowInit,limit=1,distance=..2] at @s rotated as @p run tp @s ~ ~ ~ ~ ~

# ベクトルを計算し召喚した矢の Motion に代入して射出
    execute as @e[type=arrow,tag=ArrowInit,limit=1,distance=..2] run function player:attack/bow/shoot

# 発射音
    playsound minecraft:entity.arrow.shoot player @a ~ ~ ~ 1 1.2
