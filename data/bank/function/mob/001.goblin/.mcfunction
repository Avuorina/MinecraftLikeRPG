# テストゴブリン - Tick Function
# 初期化チェック
execute if entity @s[tag=Init] run function bank:mob/001.goblin/init
execute if entity @s[tag=Init] run tag @s remove Init


# ここにインターバル/ターン制スキルを追加可能
