# Minecraft RPG Datapack - 初期化
# ワールドロード時に実行される


# ワールド設定
    forceload add 0 0
    gamerule natural_health_regeneration false
    gamerule spawn_mobs false
    gamerule advance_weather false

# 定義を宣言する
    function rpg:declare

tellraw @a [{"color":"dark_gray","text":"["},{"bold":true,"text":"SYSTEM"},{"bold":false,"text":"]"},\
{"text":"データパックのロードが完了"}]
