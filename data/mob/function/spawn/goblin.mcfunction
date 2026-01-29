# テストゴブリンを召喚
# 使用方法: /function mob:spawn/goblin

# 設定をロード（Storage: rpg_mob）
function bank:mob/global/ground/blow/goblin

summon zombie ~ ~ ~ {Tags:[MOB,mob.goblin,Global,Ground,Blow,Goblin],CustomName:[{"color":"green","text":"ゴブリン"},{"color":"gray","text":"Lv5"}],CustomNameVisible:true,PersistenceRequired:true}

# 新規MOBにステータスを設定
execute as @e[tag=mob.goblin,tag=!mob.initialized,limit=1] run function mob:setup/apply_from_storage