#> api:mob/core/summon
#
#
#
# @within function api:mob/summon

## ID登録
    data modify storage bank:mob ID set from storage api: Argument.ID

## データ呼び出し
    function bank_manager:mob/summon/register with storage bank:mob

## 検証
    execute unless data storage bank:mob ID run tellraw @a [{"storage":global,"nbt":"Prefix.ERROR"},{"text":"引数が足りません。","color":red},{"text":"(IDを指定してください)"},{"text":"[api:mob/core/summon]",color:gray}]
    execute unless data storage bank:mob ID run tellraw @a [{"storage":global,"nbt":"Prefix.ERROR"},{"text":"データを適用するEntityが存在しません\nasを利用して対象のEntityを実行者にしてください"}]

## ~SUMMON~
    function bank_manager:mob/trigger/summon/

## 初期化
    execute as @e[tag=BankInit,distance=..0.01] run function bank_manager:mob/summon/init
