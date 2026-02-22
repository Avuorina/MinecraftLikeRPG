# メインループ - 毎tick実行

# プレイヤーtick
    execute as @a run function player:tick

# Timerを減らす
    scoreboard players remove @e[tag=PC] PortalCooldown 1
    kill @e[scores={PortalCooldown=..0}]
    # HUD表示
        function player:hud/display
        data merge entity @e[type=text_display,tag=debug_status,limit=1,sort=nearest] {text:[{"text":"=== Status ===\n"},"LEVEL:",{"score":{"name":"@p","objective":"LV"}},{"text":"\nHP:"},{"score":{"name":"@p","objective":"HP"}},"/",{"score":{"name":"@p","objective":"MaxHP"}},{"text":"\nMP:"},{"score":{"name":"@p","objective":"MP"}},"/",{"score":{"name":"@p","objective":"MaxMP"}},{"text":"\n一時スコア"},{"score":{"name":"@p","objective":"_"}}]}

    # 経験値オーブはいらないね
        kill @e[type=experience_orb]

    # MOB Tick (スキル・ターン制)
        execute as @e[tag=BankMob] at @s run function bank_manager:mob/tick/
