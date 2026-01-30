# Storage から MOB を召喚するマクロ
# Storage rpg_mob: ベース.id を使用

# デバッグ: エンティティタイプを表示
    $say [Debug] Summoning: $(id)

# マクロで summon (id は Storage rpg_mob: ベース から渡される)
    $summon $(id) ~ ~ ~ {Tags:["mob.new"],CustomNameVisible:true,PersistenceRequired:true}

# 召喚した MOB にタグと見た目を適用
    execute as @e[tag=mob.new,limit=1,sort=nearest] run function mob:setup/apply_nbt
