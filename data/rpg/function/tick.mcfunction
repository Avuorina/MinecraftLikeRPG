# メインループ - 毎tick実行

# 新規プレイヤーのセットアップ
    execute as @a unless score @s Initialized matches 1 run function player:setup

# 経験値獲得（モブ討伐）
    function player:exp/gain

# ステータス適用（プレイヤー＆MOB）
    function status:apply

# プレイヤーtick
    execute as @a run function player:tick

# MP回復
    execute as @a run function status:regen_mp

# Timerを減らす
    # TimerKill
        scoreboard players remove @e[tag=TimerKill] Timer 1
        kill @e[tag=TimerKill,scores={Timer=..0}]

# HUD表示
    function player:hud/display
    data merge entity @e[type=text_display,tag=debug_status,limit=1,sort=nearest] {text:[{"text":"=== Status ===\n"},"LEVEL:",{"score":{"name":"@p","objective":"LV"}},{"text":"\nHP:"},{"score":{"name":"@p","objective":"HP"}},"/",{"score":{"name":"@p","objective":"MaxHP"}},{"text":"\n一時スコア"},{"score":{"name":"@p","objective":"_"}}]}
