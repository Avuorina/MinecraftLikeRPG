#> bank:mob/2.skeleton_warrior/register
#
# スケルトン戦士 データ登録
# ID: 2.skeleton_warrior
#
# @within bank:mob/alias/2/register

# 初期化
data modify storage bank:mob Base set value {}

# Summon用データ
data modify storage bank:mob Base.Entity set value {id:"minecraft:skeleton"}
data modify storage bank:mob Base.Tags set value {Tags:[Init,"2.skeleton_warrior","002.skeleton_warrior","ENEMY"]}
data modify storage bank:mob Costume.Mainhand set value {id:"minecraft:bow",Count:1b}
data modify storage bank:mob Costume.Offhand set value {}
data modify storage bank:mob Costume.Head set value {}
data modify storage bank:mob Costume.Chest set value {}
data modify storage bank:mob Costume.Legs set value {}
data modify storage bank:mob Costume.Feet set value {}

# CustomName
data modify storage bank:mob Base.CustomName set value '{"color":"white","text":"スケルトン戦士"}'

# Type
data modify storage bank:mob Type set value "Enemy"

# 即時ステータス
data modify storage bank:mob Status.EyePower set value 0.0000d
data modify storage bank:mob Status.MovementPower set value 0.5000d
data modify storage bank:mob Status.KBResistance set value 0d
data modify storage bank:mob Status.KBPower set value 0d

# カスタムステータス
data modify storage bank:mob Status.Level set value 10
data modify storage bank:mob Status.HPMax set value 80f
data modify storage bank:mob Status.MPMax set value 0
data modify storage bank:mob Status.ATK set value 15
data modify storage bank:mob Status.DEF set value 10
data modify storage bank:mob Status.SPD set value 5
data modify storage bank:mob Status.GOLD set value 10

# Skill ai
data modify storage bank:mob AI set value {}
