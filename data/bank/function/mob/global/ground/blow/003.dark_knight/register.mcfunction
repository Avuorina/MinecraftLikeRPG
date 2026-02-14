# ダークナイト データ登録
# ID: 003.dark_knight
# bank:mob/global/ground/blow/003.dark_knight/register

# 初期化
data modify storage rpg_mob: Instant set value {}

# Summon用データ
data modify storage rpg_mob: Instant.Base set value {id:"minecraft:wither_skeleton",Tags:["mob.003.dark_knight","Init","Global","Ground","Blow","003.dark_knight","ENEMY"]}
data modify storage rpg_mob: Instant.Costume set value {equipment:{feet:{},legs:{},chest:{},head:{},mainhand:{id:"minecraft:netherite_sword",Count:1b},offhand:{}}}

# 見た目 (CustomName)
# CustomName は JSON String として BaseNameJSON に保存する (動的レベル表示のため) -> Baseに含まれるTagsやCustomNameは上記のInstant.Baseで設定済み
# ユーザーの例では CustomName:'...' となっていた。
data modify storage rpg_mob: Instant.Base.CustomName set value '[{"color":"dark_red","text":"☠"},{"bold":true,"color":"dark_purple","text":"ダークナイト"}]'

# 即時ステータス
data modify storage rpg_mob: Instant.EyePower set value 0.0000d
data modify storage rpg_mob: Instant.MovementPower set value 0.6000d
data modify storage rpg_mob: Instant.KBResistance set value 0d
data modify storage rpg_mob: Instant.KBPower set value 0d

# カスタムステータス (Delay)
data modify storage rpg_mob: Delay.Status.Level set value 30
data modify storage rpg_mob: Delay.Status.HPMax set value 100f
data modify storage rpg_mob: Delay.Status.MPMax set value 0
data modify storage rpg_mob: Delay.Status.ATK set value 50
data modify storage rpg_mob: Delay.Status.DEF set value 30
data modify storage rpg_mob: Delay.Status.SPD set value 10
data modify storage rpg_mob: Delay.Status.GOLD set value 30

# Skill ai
data modify storage rpg_mob: Delay.AI set value {}
