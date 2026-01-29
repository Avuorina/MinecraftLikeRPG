# メインループ - 毎tick実行
# TODO: ステータスシステム実装後に有効化

# 新規プレイヤーのセットアップ
execute as @a unless score @s rpg.initialized matches 1 run function rpg:player/setup

# ステータス適用
# function rpg:stats/apply

# MP回復
# function rpg:stats/regen_mp

# レベルアップチェック
# function rpg:level/check

# HUD表示
# function rpg:hud/display
