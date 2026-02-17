#> bank:mob/003.dark_knight/register
#
# ダークナイト データ登録
# ID: 003.dark_knight
#
# @within bank:mob/alias/003/register

# 初期化
data modify storage bank:mob Base set value {}

# Summon用データ
data modify storage bank:mob Base.Entity set value {id:"minecraft:wither_skeleton"}
data modify storage bank:mob Base.Tags set value {Tags:[Init,"003.dark_knight","ENEMY"]}
data modify storage bank:mob Costume.Mainhand set value {id:"minecraft:netherite_sword",Count:1b}
data modify storage bank:mob Costume.Offhand set value {}
data modify storage bank:mob Costume.Head set value {}
data modify storage bank:mob Costume.Chest set value {}
data modify storage bank:mob Costume.Legs set value {}
data modify storage bank:mob Costume.Feet set value {}

# CustomName
data modify storage bank:mob Base.CustomName set value '[{"color":"dark_red","text":"☠"},{"bold":true,"color":"dark_purple","text":"ダークナイト"}]'

# Type
data modify storage bank:mob Type set value "Enemy"

# 即時ステータス
data modify storage bank:mob Status.EyePower set value 0.0000d
data modify storage bank:mob Status.MovementPower set value 0.6000d
data modify storage bank:mob Status.KBResistance set value 0d
data modify storage bank:mob Status.KBPower set value 0d

# カスタムステータス
data modify storage bank:mob Status.Level set value 30
data modify storage bank:mob Status.HPMax set value 100f
data modify storage bank:mob Status.MPMax set value 0
data modify storage bank:mob Status.ATK set value 50
data modify storage bank:mob Status.DEF set value 30
data modify storage bank:mob Status.SPD set value 10
data modify storage bank:mob Status.GOLD set value 30

# Skill ai
data modify storage bank:mob AI set value {}
