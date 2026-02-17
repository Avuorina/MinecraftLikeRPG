#> bank:mob/004.test_man/register
#
# テストマン データ登録
# ID: 004.test_man
#
# @within bank:mob/alias/004/register

# 初期化
data modify storage bank:mob Base set value {}

# Summon用データ
data modify storage bank:mob Base.Entity set value {id:"minecraft:zombie"}
data modify storage bank:mob Base.Tags set value {Tags:[Init,"004.test_man","ENEMY"]}
data modify storage bank:mob Costume.Mainhand set value {id:"minecraft:command_block",Count:1b}
data modify storage bank:mob Costume.Offhand set value {id:"minecraft:book",Count:1b}
data modify storage bank:mob Costume.Head set value {id:"minecraft:netherite_helmet",Count:1b}
data modify storage bank:mob Costume.Chest set value {id:"minecraft:leather_chestplate",Count:1b}
data modify storage bank:mob Costume.Legs set value {id:"minecraft:leather_leggings",Count:1b}
data modify storage bank:mob Costume.Feet set value {id:"minecraft:leather_boots",Count:1b}

# CustomName
data modify storage bank:mob Base.CustomName set value '{"color":"red","text":"テストマン"}'

# Type
data modify storage bank:mob Type set value "Enemy"

# 即時ステータス
data modify storage bank:mob Status.EyePower set value 0.0000d
data modify storage bank:mob Status.MovementPower set value -0.9000d
data modify storage bank:mob Status.KBResistance set value 0d
data modify storage bank:mob Status.KBPower set value 0d

# カスタムステータス
data modify storage bank:mob Status.Level set value 1
data modify storage bank:mob Status.HPMax set value 20f
data modify storage bank:mob Status.MPMax set value 0
data modify storage bank:mob Status.ATK set value 2
data modify storage bank:mob Status.DEF set value 3
data modify storage bank:mob Status.SPD set value 4
data modify storage bank:mob Status.GOLD set value 1

# Skill ai
data modify storage bank:mob AI set value {}
