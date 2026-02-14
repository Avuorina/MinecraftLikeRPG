# ダークナイト - Tick Function
# 初期化チェック
execute if entity @s[tag=Init] run function bank:mob/global/ground/blow/003.dark_knight/init
execute if entity @s[tag=Init] run tag @s remove Init


# ここにインターバル/ターン制スキルを追加可能
