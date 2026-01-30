# メインループ - 毎tick実行

# 新規プレイヤーのセットアップ
    execute as @a unless score @s initialized matches 1 run function player:setup

# 経験値獲得（モブ討伐）
    function player:exp/gain

# ステータス適用（プレイヤー＆MOB）
    function status:apply

# MP回復
    execute as @a run function status:regen_mp

# HUD表示
    function player:hud/display
