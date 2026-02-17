#> bank:mob/007.test_summoner/main/register
#
# テストサモナー データ登録
# ID: 007.test_summoner
#
# @within bank:mob/alias/007/register

# 初期化
data modify storage bank:mob Base set value {}

# Summon用データ
data modify storage bank:mob Base.Entity set value {id:"minecraft:vindicator"}
data modify storage bank:mob Base.Tags set value {Tags:[Init,"007.test_summoner","main","ENEMY"]}
data modify storage bank:mob Costume.Mainhand set value {id:"minecraft:enchanted_book",Count:1b}
data modify storage bank:mob Costume.Offhand set value {}
data modify storage bank:mob Costume.Head set value {}
data modify storage bank:mob Costume.Chest set value {}
data modify storage bank:mob Costume.Legs set value {}
data modify storage bank:mob Costume.Feet set value {}

# CustomName
data modify storage bank:mob Base.CustomName set value '{"color":"gold","text":"サモナー"}'

# Type
data modify storage bank:mob Type set value "Enemy"

# 即時ステータス
data modify storage bank:mob Status.EyePower set value 2.0000d
data modify storage bank:mob Status.MovementPower set value -0.1000d
data modify storage bank:mob Status.KBResistance set value 0d
data modify storage bank:mob Status.KBPower set value 0d

# カスタムステータス
data modify storage bank:mob Status.Level set value 10
data modify storage bank:mob Status.HPMax set value 40f
data modify storage bank:mob Status.MPMax set value 0
data modify storage bank:mob Status.ATK set value 5
data modify storage bank:mob Status.DEF set value 5
data modify storage bank:mob Status.SPD set value 8
data modify storage bank:mob Status.GOLD set value 30

# Skill ai
data modify storage bank:mob AI set value {}

# AI (Type)
# Type: shoot
