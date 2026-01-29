# スライムキングを召喚
# 使用方法: /function mob:spawn/boss/slime_king

summon slime ~ ~ ~ {CustomName:'[{"text": "☠ ", "color": "dark_red"}, {"text": "スライムキング", "color": "aqua", "bold": true}, {"text": " Lv20", "color": "gray"}]',CustomNameVisible:true,Tags:["MOB","mob.slime_king","mob.new","mob.boss"],PersistenceRequired:true}

# 新規MOBにステータスを設定
execute as @e[tag=mob.new,limit=1] run function mob:setup/boss/slime_king
execute as @e[tag=mob.new,limit=1] run tag @s remove mob.new