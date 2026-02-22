#> bank:mob/6.test_master/register
#
# テストやり手 データ登録
# ID: 6.test_master
#
# @within bank:mob/alias/6/register

# 初期化
data modify storage bank:mob Base set value {}

# Summon用データ
data modify storage bank:mob Base.Entity set value {id:"minecraft:husk"}
data modify storage bank:mob Base.Tags set value {Tags:[Init,"6.test_master","HasTick","006.test_master","ENEMY"]}
data modify storage bank:mob Costume.Mainhand set value {id:"minecraft:iron_sword",Count:1b}
data modify storage bank:mob Costume.Offhand set value {}
data modify storage bank:mob Costume.Head set value {}
data modify storage bank:mob Costume.Chest set value {id:"minecraft:leather_chestplate",Count:1b,components:{"minecraft:dyed_color":0}}
data modify storage bank:mob Costume.Legs set value {}
data modify storage bank:mob Costume.Feet set value {id:"minecraft:leather_boots",Count:1b,components:{"minecraft:dyed_color":0}}

# CustomName
data modify storage bank:mob Base.CustomName set value '{"color":"gold","text":"やり手"}'

# Type
data modify storage bank:mob Type set value "Enemy"

# 即時ステータス
data modify storage bank:mob Status.EyePower set value 1.0000d
data modify storage bank:mob Status.MovementPower set value 0.0000d
data modify storage bank:mob Status.KBResistance set value 0d
data modify storage bank:mob Status.KBPower set value 0d

# カスタムステータス
data modify storage bank:mob Status.Level set value 10
data modify storage bank:mob Status.HPMax set value 40f
data modify storage bank:mob Status.MPMax set value 0
data modify storage bank:mob Status.ATK set value 10
data modify storage bank:mob Status.DEF set value 5
data modify storage bank:mob Status.SPD set value 7
data modify storage bank:mob Status.GOLD set value 10

# Skill ai
data modify storage bank:mob AI set value {}
