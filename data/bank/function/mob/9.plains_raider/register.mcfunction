#> bank:mob/9.plains_raider/register
#
# 平原のレイダー データ登録
# ID: 9.plains_raider
#
# @within bank:mob/alias/9/register

# 初期化
data modify storage bank:mob Base set value {}

# Summon用データ
data modify storage bank:mob Base.Entity set value {id:"minecraft:vindicator"}
data modify storage bank:mob Base.Tags set value {Tags:[Init,"9.plains_raider","009.PlainRaider","ENEMY"]}
data modify storage bank:mob Costume.Mainhand set value {id:"minecraft:stone_sword",Count:1b}
data modify storage bank:mob Costume.Offhand set value {}
data modify storage bank:mob Costume.Head set value {}
data modify storage bank:mob Costume.Chest set value {}
data modify storage bank:mob Costume.Legs set value {}
data modify storage bank:mob Costume.Feet set value {}

# CustomName
data modify storage bank:mob Base.CustomName set value '{"color":"green","text":"レイダー"}'

# Type
data modify storage bank:mob Type set value "Enemy"

# 即時ステータス
data modify storage bank:mob Status.EyePower set value 0.0000d
data modify storage bank:mob Status.MovementPower set value 0.0000d
data modify storage bank:mob Status.KBResistance set value 0d
data modify storage bank:mob Status.KBPower set value 0d

# カスタムステータス
data modify storage bank:mob Status.Level set value 1
data modify storage bank:mob Status.HPMax set value 1f
data modify storage bank:mob Status.MPMax set value 0
data modify storage bank:mob Status.ATK set value 1
data modify storage bank:mob Status.DEF set value 1
data modify storage bank:mob Status.SPD set value 1
data modify storage bank:mob Status.GOLD set value 1

# Skill ai
data modify storage bank:mob AI set value {}
