# スケルトン戦士を召喚
# 使用方法: /function mob:spawn/skeleton_warrior

# 設定をロード（Storage: rpg_mob）
function bank:mob/global/ground/blow/skeleton_warrior

summon skeleton ~ ~ ~ {Tags:[MOB,mob.skeleton_warrior,Global,Ground,Blow,Shoot,SkeletonWarrior],CustomName:[{"color":"white","text":"スケルトン戦士"},{"color":"gray","text":"Lv10"}],equipment:{mainhand:{id:"minecraft:bow",count:1}},CustomNameVisible:true,PersistenceRequired:true}

# 新規MOBにステータスを設定
execute as @e[tag=mob.skeleton_warrior,tag=!mob.initialized,limit=1] run function mob:setup/apply_from_storage