#> bank_manager:mob/spawn/set_spawner/
#
# モブの(計算の要らない)基本情報を、スポナーに反映させる。
#
# @within function bank_manager:mob/spawn/

# スポナーカートでOhMyDatIDを取得
function #oh_my_dat:please
data modify storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].DelayedDataList set value []

# それぞれのモブの情報を読み取る
data remove storage rpg_mob: Passengers
data remove storage rpg_mob: PrevPassengers
execute if data storage rpg_mob: MobLayers[-1] run function bank_manager:mob/spawn/set_spawner/each_layer

### SpawnDataに保存
data modify entity @s SpawnData.entity.Passengers[0] set from storage rpg_mob: SpawnData
### Pos設定
data modify entity @s SpawnData.entity.Pos set from storage tusb_mob: Pos
### 召喚したら消えるようにタグを付与
data modify entity @s Tags set value [OneTimeSpawner,TickingRequired]

# タグ付け
tag @s add Runner