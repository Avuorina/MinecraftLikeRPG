# Storage から NBT を適用
# @s = 召喚されたばかりの MOB (tag=mob.new)

# ベースの Tags を追加
    data modify entity @s Tags append from storage rpg_mob: ベース.Tags[]

# 見た目を適用
    data modify entity @s CustomName set from storage rpg_mob: 見た目.CustomName
    data modify entity @s equipment set from storage rpg_mob: 見た目.equipment

# mob.new タグを削除（初期化完了）
    tag @s remove mob.new
