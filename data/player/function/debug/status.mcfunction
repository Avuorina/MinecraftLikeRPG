# 現在のステータスを表示
    tellraw @s [{"text":"═══ ステータス ═══","color":"gold"}]
    tellraw @s [{"text":"Level: ","color":"gray"},{"score":{"name":"@s","objective":"LV"},"color":"yellow"},{"text":" (","color":"gray"},{"score":{"name":"@s","objective":"EXP"},"color":"green"},{"text":"/","color":"gray"},{"score":{"name":"@s","objective":"nextEXP"},"color":"dark_green"},{"text":" EXP)","color":"gray"}]
    tellraw @s [{"text":"HP: ","color":"gray"},{"score":{"name":"@s","objective":"HP"},"color":"red"},{"text":"/","color":"gray"},{"score":{"name":"@s","objective":"MaxHP"},"color":"dark_red"}]
    tellraw @s [{"text":"MP: ","color":"gray"},{"score":{"name":"@s","objective":"MP"},"color":"aqua"},{"text":"/","color":"gray"},{"score":{"name":"@s","objective":"MaxMP"},"color":"dark_aqua"}]
    tellraw @s [{"text":"STR: ","color":"gray"},{"score":{"name":"@s","objective":"STR"},"color":"gold"},{"text":" DEF: ","color":"gray"},{"score":{"name":"@s","objective":"DEF"},"color":"blue"},{"text":" AGI: ","color":"gray"},{"score":{"name":"@s","objective":"AGI"},"color":"white"}]
    tellraw @s [{"text":"INT: ","color":"gray"},{"score":{"name":"@s","objective":"INT"},"color":"light_purple"},{"text":" SPD: ","color":"gray"},{"score":{"name":"@s","objective":"SPD"},"color":"aqua"},{"text":" LUCK: ","color":"gray"},{"score":{"name":"@s","objective":"LUCK"},"color":"green"}]
    tellraw @s [{"text":"════════════════","color":"gold"}]
