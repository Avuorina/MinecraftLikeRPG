# ダークナイトを召喚
# 使用方法: /function mob:spawn/boss/dark_knight

# 設定をロード（Storage: rpg_mob）
function bank:mob/global/ground/blow/boss/dark_knight

summon wither_skeleton ~ ~ ~ {Tags:[MOB,mob.dark_knight,Global,Ground,BOSS,DarkKnight],CustomName:[{"color":"dark_red","text":"☠"},{"bold":true,"color":"dark_purple","text":"ダークナイト"},{"bold":false,"color":"gray","text":"Lv.30"}],equipment:{mainhand:{id:"minecraft:netherite_sword",count:1}},CustomNameVisible:true,PersistenceRequired:true}

# 新規MOBにステータスを設定
execute as @e[tag=mob.dark_knight,tag=!mob.initialized,limit=1] run function mob:setup/apply_from_storage