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
data merge entity @e[type=text_display,tag=debug_status,limit=1,sort=nearest] {text:[{"text":"=== Status ===\n"},"LEVEL:",{"score":{"name":"@p","objective":"level"}},{"text":"\nHP:"},{"score":{"name":"@p","objective":"hp"}},"/",{"score":{"name":"@p","objective":"max_hp"}},{"text":"\n一時スコア"},{"score":{"name":"@p","objective":"_"}}]}