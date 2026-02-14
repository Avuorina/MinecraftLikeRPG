# テストやり手 データ登録
# ID: 006.test_master
# bank:mob/global/debug/blow/006.test_master/register

# 初期化
data modify storage rpg_mob: Instant set value {}

# Summon用データ
data modify storage rpg_mob: Instant.Base set value {id:"minecraft:husk",Tags:["mob.006.test_master","Init","Global","Debug","Blow","006.test_master","ENEMY"]}
data modify storage rpg_mob: Instant.Costume set value {equipment:{feet:{id:"minecraft:leather_boots",Count:1b,components:{"minecraft:dyed_color":0}},legs:{},chest:{id:"minecraft:leather_chestplate",Count:1b,components:{"minecraft:dyed_color":0}},head:{},mainhand:{id:"minecraft:iron_sword",Count:1b},offhand:{}}}

# 見た目 (CustomName)
# CustomName は JSON String として BaseNameJSON に保存する (動的レベル表示のため) -> Baseに含まれるTagsやCustomNameは上記のInstant.Baseで設定済み
# ユーザーの例では CustomName:'...' となっていた。
data modify storage rpg_mob: Instant.Base.CustomName set value '{"color":"gold","text":"やり手"}'

# 即時ステータス
data modify storage rpg_mob: Instant.EyePower set value 1.0000d
data modify storage rpg_mob: Instant.MovementPower set value 0.0000d
data modify storage rpg_mob: Instant.KBResistance set value 0d
data modify storage rpg_mob: Instant.KBPower set value 0d

# カスタムステータス (Delay)
data modify storage rpg_mob: Delay.Status.Level set value 10
data modify storage rpg_mob: Delay.Status.HPMax set value 40f
data modify storage rpg_mob: Delay.Status.MPMax set value 0
data modify storage rpg_mob: Delay.Status.ATK set value 10
data modify storage rpg_mob: Delay.Status.DEF set value 5
data modify storage rpg_mob: Delay.Status.SPD set value 7
data modify storage rpg_mob: Delay.Status.GOLD set value 10

# Skill ai
data modify storage rpg_mob: Delay.AI set value {}
