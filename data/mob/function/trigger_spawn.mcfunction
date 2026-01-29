# アーマースタンドの頭装備からMOB IDを読み取ってスポーン
# マクロ引数: ArmorItems[3].components."minecraft:custom_data" (TUSBMobIdを持ってる)

$function mob:spawn/$(TUSBMobId) with entity @s equipment.head.components."minecraft:custom_data"

# アーマースタンドを消す
    kill @s
