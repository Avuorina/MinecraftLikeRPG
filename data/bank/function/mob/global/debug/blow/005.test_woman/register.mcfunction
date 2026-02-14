# テストウーマン データ登録
# ID: 005.test_woman
# bank:mob/global/debug/blow/005.test_woman/register

# 初期化
data modify storage rpg_mob: Instant set value {}

# Summon用データ
data modify storage rpg_mob: Instant.Base set value {id:"minecraft:villager",Tags:["mob.005.test_woman","Init","Global","Debug","Blow","005.test_woman","FRIENDLY"]}
data modify storage rpg_mob: Instant.Costume set value {equipment:{feet:{},legs:{},chest:{},head:{id:"minecraft:command_block",Count:1b},mainhand:{},offhand:{}}}

# 見た目 (CustomName)
# CustomName は JSON String として BaseNameJSON に保存する (動的レベル表示のため) -> Baseに含まれるTagsやCustomNameは上記のInstant.Baseで設定済み
# ユーザーの例では CustomName:'...' となっていた。
data modify storage rpg_mob: Instant.Base.CustomName set value '{"color":"green","text":"テストウーマン"}'

# 即時ステータス
data modify storage rpg_mob: Instant.EyePower set value 0.0000d
data modify storage rpg_mob: Instant.MovementPower set value -0.9000d
data modify storage rpg_mob: Instant.KBResistance set value 0d
data modify storage rpg_mob: Instant.KBPower set value 0d

# カスタムステータス (Delay)
data modify storage rpg_mob: Delay.Status.Level set value 1
data modify storage rpg_mob: Delay.Status.HPMax set value 20f
data modify storage rpg_mob: Delay.Status.MPMax set value 0
data modify storage rpg_mob: Delay.Status.ATK set value 2
data modify storage rpg_mob: Delay.Status.DEF set value 3
data modify storage rpg_mob: Delay.Status.SPD set value 4
data modify storage rpg_mob: Delay.Status.GOLD set value 1

# Skill ai
data modify storage rpg_mob: Delay.AI set value {}
