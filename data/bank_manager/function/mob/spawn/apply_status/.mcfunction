#> bank_manager:mob/spawn/apply_status/
#
# スポナーカートからデータを取り出す
#
# @within function entity:initialize

### スポナーカートのOhMyDatIDを取得
execute store result score _ OhMyDatID run data get entity @s TicksFrozen
data remove entity @s TicksFrozen

### OhMyDatIDをIDを使って呼び出す
function #oh_its_dat:please

### ストレージからレベルとステータスを取り出す
execute store result score @s LV run data get storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].DelayedDataList[-1].Level
execute if data storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].DelayedDataList[-1].ParentID store result score @s ParentID run data get storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].DelayedDataList[-1].ParentID
data modify storage rpg_mob: Delay set from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].DelayedDataList[-1].Delay
data remove storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].DelayedDataList[-1]

function bank_manager:mob/spawn/apply_status/act
