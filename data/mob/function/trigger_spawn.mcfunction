# アーマースタンドの頭装備からMOB IDを読み取ってスポーン
# マクロ引数: equipment.head.components."minecraft:custom_data" (RPGMobId を持っている)

# 汎用的な spawn 関数を呼び出し（RPGMobIdを渡す）
    $function mob:spawn_generic {mob_id:"$(RPGMobId)"}

# アーマースタンドを消す
    kill @s
