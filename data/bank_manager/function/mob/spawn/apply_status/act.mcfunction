#> bank_manager:mob/spawn/apply_status/act
#
# 召喚されたカスタムモブに、ステータスを反映させる。
#
# @within function bank_manager:mob/spawn/apply_status/

### 攻撃力を計算
    execute if data storage rpg_mob: Delay.Status.ATK run function bank_manager:mob/status/str.atk/update
    #execute if data storage rpg_mob: Delay.Status.MATK run function bank_manager:mob/spawn/apply_status/status/special_attack

### モブに他のステータスを計算して反映する
    execute if entity @s[tag=BankMob] run function bank_manager:mob/spawn/apply_status/from_storage

### OhMyDatに保存
    function #oh_my_dat:please
    data modify storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].Status set from storage rpg_mob: Delay.Status
    data modify storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].AI set from storage rpg_mob: Delay.Status.AI

### Todo Initスキルの呼び出し
    #execute if entity @s[tag=CallOnInit] run function enemy:ai/call/trigger/initial
