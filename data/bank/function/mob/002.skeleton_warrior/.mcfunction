# スケルトン戦士 - Tick Function
# 初期化チェック
execute if entity @s[tag=Init] run function bank:mob/002.skeleton_warrior/init
execute if entity @s[tag=Init] run tag @s remove Init


# ここにインターバル/ターン制スキルを追加可能
