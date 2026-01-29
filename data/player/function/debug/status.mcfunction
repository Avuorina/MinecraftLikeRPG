# 現在のステータスを表示
    tellraw @s [{"text":"═══ ステータス ═══","color":"gold"}]
    tellraw @s [{"text":"Level: ","color":"gray"},{"score":{"name":"@s","objective":"level"},"color":"yellow"},{"text":" (","color":"gray"},{"score":{"name":"@s","objective":"exp"},"color":"green"},{"text":"/","color":"gray"},{"score":{"name":"@s","objective":"exp_next"},"color":"dark_green"},{"text":" EXP)","color":"gray"}]
    tellraw @s [{"text":"HP: ","color":"gray"},{"score":{"name":"@s","objective":"hp"},"color":"red"},{"text":"/","color":"gray"},{"score":{"name":"@s","objective":"max_hp"},"color":"dark_red"}]
    tellraw @s [{"text":"MP: ","color":"gray"},{"score":{"name":"@s","objective":"mp"},"color":"aqua"},{"text":"/","color":"gray"},{"score":{"name":"@s","objective":"max_mp"},"color":"dark_aqua"}]
    tellraw @s [{"text":"STR: ","color":"gray"},{"score":{"name":"@s","objective":"str"},"color":"gold"},{"text":" DEF: ","color":"gray"},{"score":{"name":"@s","objective":"def"},"color":"blue"},{"text":" AGI: ","color":"gray"},{"score":{"name":"@s","objective":"agi"},"color":"white"}]
    tellraw @s [{"text":"INT: ","color":"gray"},{"score":{"name":"@s","objective":"int"},"color":"light_purple"},{"text":" SPD: ","color":"gray"},{"score":{"name":"@s","objective":"spd"},"color":"aqua"},{"text":" LUCK: ","color":"gray"},{"score":{"name":"@s","objective":"luck"},"color":"green"}]
    tellraw @s [{"text":"════════════════","color":"gold"}]
