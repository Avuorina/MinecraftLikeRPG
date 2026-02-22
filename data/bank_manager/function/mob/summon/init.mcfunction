#> bank_manager:mob/summon/init
#
#
#
# @within function api:mob/core/summon

## 検証
    execute unless entity @s run tellraw @a [{"storage":"global","nbt":"Prefix.ERROR"},{"text":"データを適用するEntityが存在しません\nasを利用して対象のEntityを実行者にしてください"}]
    execute unless data storage bank:mob ID run tellraw @a [{"storage":"global","nbt":"Prefix.ERROR"},{"text":"引数が足りません (IDを指定してください)"},{"text":"[bank_manager:mob/summon/init]",color:gray}]

# RESET
    tag @s remove BankInit

## ID付与
    function bank_manager:mob/summon/set_id
    # エンティティにデータIDをセット
        function #oh_my_dat:please
        data modify storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].BankID set from storage api: Argument.ID

    # 共通タグ付与
        tag @s add BankMob

    # データセット
        function bank_manager:mob/summon/apply_status/set
        ## PreInitInterceptFn があるなら呼び出す (????)
        #execute if data storage api: Argument.PreInitInterceptFn run function asset_manager:mob/summon/call_pre_init_intercept_fn.m with storage api: Argument

        ## Mob側に実装されてるInitを実行(TODO:Initスキル)
            # function asset_manager:mob/triggers/init/ with storage asset:context

            # EntityStorage呼び出し
                execute if score @s MobID matches -2147483648..2147483647 run function oh_my_dat:please

            # フィールドを元に戻す
                execute if score @s MobID matches -2147483648..2147483647 run data modify storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].MobField set from storage bank:mob this

            # MobUID発行
                scoreboard players add #Global HPBarID 1
                scoreboard players operation @s HPBarID = #Global HPBarID

            # CustomNameを常に表示
                data modify entity @s CustomNameVisible set value 1b
                # リセット
                    data remove storage bank:mob this
                    data remove storage bank:mob ID
                    data remove storage bank:mob Field
