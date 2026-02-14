# スケルトン戦士 データ登録
# ID: 002.skeleton_warrior
# bank:mob/global/ground/shoot/002.skeleton_warrior/register

# 初期化
data modify storage rpg_mob: Instant set value {}

# Summon用データ
data modify storage rpg_mob: Instant.Base set value {id:"minecraft:skeleton",Tags:["mob.002.skeleton_warrior","Init","Global","Ground","Shoot","002.skeleton_warrior","ENEMY"]}
data modify storage rpg_mob: Instant.Costume set value {equipment:{feet:{},legs:{},chest:{},head:{},mainhand:{id:"minecraft:bow",Count:1b},offhand:{}}}

# 見た目 (CustomName)
# CustomName は JSON String として BaseNameJSON に保存する (動的レベル表示のため) -> Baseに含まれるTagsやCustomNameは上記のInstant.Baseで設定済み
# ユーザーの例では CustomName:'...' となっていた。
data modify storage rpg_mob: Instant.Base.CustomName set value '{"color":"white","text":"スケルトン戦士"}'

# 即時ステータス
data modify storage rpg_mob: Instant.EyePower set value 0.0000d
data modify storage rpg_mob: Instant.MovementPower set value 0.5000d
data modify storage rpg_mob: Instant.KBResistance set value 0d
data modify storage rpg_mob: Instant.KBPower set value 0d

# カスタムステータス (Delay)
data modify storage rpg_mob: Delay.Status.Level set value 10
data modify storage rpg_mob: Delay.Status.HPMax set value 80f
data modify storage rpg_mob: Delay.Status.MPMax set value 0
data modify storage rpg_mob: Delay.Status.ATK set value 15
data modify storage rpg_mob: Delay.Status.DEF set value 10
data modify storage rpg_mob: Delay.Status.SPD set value 5
data modify storage rpg_mob: Delay.Status.GOLD set value 10

# Skill ai
data modify storage rpg_mob: Delay.AI set value {}

# AI (Type)
# Type: shoot
