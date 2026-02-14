# テストサモナー データ登録
# ID: 007.test_summoner
# bank:mob/global/debug/shoot/007.test_summoner/main/register

# 初期化
data modify storage rpg_mob: Instant set value {}

# Summon用データ
data modify storage rpg_mob: Instant.Base set value {id:"minecraft:vindicator",Tags:["mob.007.test_summoner","Init","mob.main","Global","Debug","Shoot","007.test_summoner","ENEMY"]}
data modify storage rpg_mob: Instant.Costume set value {equipment:{feet:{},legs:{},chest:{},head:{},mainhand:{id:"minecraft:enchanted_book",Count:1b},offhand:{}}}

# 見た目 (CustomName)
# CustomName は JSON String として BaseNameJSON に保存する (動的レベル表示のため) -> Baseに含まれるTagsやCustomNameは上記のInstant.Baseで設定済み
# ユーザーの例では CustomName:'...' となっていた。
data modify storage rpg_mob: Instant.Base.CustomName set value '{"color":"gold","text":"サモナー"}'

# 即時ステータス
data modify storage rpg_mob: Instant.EyePower set value 2.0000d
data modify storage rpg_mob: Instant.MovementPower set value -0.1000d
data modify storage rpg_mob: Instant.KBResistance set value 0d
data modify storage rpg_mob: Instant.KBPower set value 0d

# カスタムステータス (Delay)
data modify storage rpg_mob: Delay.Status.Level set value 10
data modify storage rpg_mob: Delay.Status.HPMax set value 40f
data modify storage rpg_mob: Delay.Status.MPMax set value 0
data modify storage rpg_mob: Delay.Status.ATK set value 5
data modify storage rpg_mob: Delay.Status.DEF set value 5
data modify storage rpg_mob: Delay.Status.SPD set value 8
data modify storage rpg_mob: Delay.Status.GOLD set value 30

# Skill ai
data modify storage rpg_mob: Delay.AI set value {}

# AI (Type)
# Type: shoot
