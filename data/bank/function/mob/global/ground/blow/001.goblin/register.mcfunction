# テストゴブリン データ登録
# ID: 001.goblin
# bank:mob/global/ground/blow/001.goblin/register

# 初期化
data modify storage rpg_mob: Instant set value {}

# Summon用データ
data modify storage rpg_mob: Instant.Base set value {id:"minecraft:zombie",Tags:["mob.001.goblin","Init","Global","Ground","Blow","001.goblin","ENEMY"]}
data modify storage rpg_mob: Instant.Costume set value {equipment:{feet:{},legs:{},chest:{},head:{},mainhand:{},offhand:{}}}

# 見た目 (CustomName)
# CustomName は JSON String として BaseNameJSON に保存する (動的レベル表示のため) -> Baseに含まれるTagsやCustomNameは上記のInstant.Baseで設定済み
# ユーザーの例では CustomName:'...' となっていた。
data modify storage rpg_mob: Instant.Base.CustomName set value '{"color":"green","text":"ゴブリン"}'

# 即時ステータス
data modify storage rpg_mob: Instant.EyePower set value 0.0000d
data modify storage rpg_mob: Instant.MovementPower set value 0.0000d
data modify storage rpg_mob: Instant.KBResistance set value 0d
data modify storage rpg_mob: Instant.KBPower set value 0d

# カスタムステータス (Delay)
data modify storage rpg_mob: Delay.Status.Level set value 2
data modify storage rpg_mob: Delay.Status.HPMax set value 20f
data modify storage rpg_mob: Delay.Status.MPMax set value 0
data modify storage rpg_mob: Delay.Status.ATK set value 10
data modify storage rpg_mob: Delay.Status.DEF set value 5
data modify storage rpg_mob: Delay.Status.SPD set value 7
data modify storage rpg_mob: Delay.Status.GOLD set value 1

# Skill ai
data modify storage rpg_mob: Delay.AI set value {}
