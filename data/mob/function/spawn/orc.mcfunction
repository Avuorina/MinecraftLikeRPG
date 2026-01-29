# オークを召喚
# 使用方法: /function mob:spawn/orc

summon zombie ~ ~ ~ {CustomName:'[{"text": "オーク", "color": "dark_green"}, {"text": " Lv15", "color": "gray"}]',CustomNameVisible:true,Tags:["MOB","mob.orc","mob.new"],PersistenceRequired:true,HandItems:[{id:"minecraft:iron_axe",count:1},{}]}

# 新規MOBにステータスを設定
execute as @e[tag=mob.new,limit=1] run function mob:setup/orc
execute as @e[tag=mob.new,limit=1] run tag @s remove mob.new