# ステータス割り振り

# 許可
    scoreboard players enable @s Menu

# 音を出す
    execute at @s run playsound minecraft:entity.experience_orb.pickup master @s ~ ~ ~ 1 2

## 改行してみえなくする
    tellraw @s {"text": "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"}

tellraw @s [{"bold":false,"color":"white","text":"------"},{"bold":true,"color":"light_purple","text":"ステータス割り振り"},{"bold":false,"color":"white","text":"------"}]
tellraw @s [{"bold":false,"color":"white","text":"| "},{"bold":true,"color":"white","text":"残りポイント："},{"bold":true,"color":"yellow","score":{"name":"@s","objective":"StatusPoint"}},{"bold":false,"color":"white","text":"   |"}]
tellraw @s [{"bold":false,"color":"white","text":"| "},{"click_event":{"action":"run_command","command":"/trigger Menu set 1"},"color":"red","text":"♥"},{"bold":true,"click_event":{"action":"run_command","command":"/trigger Menu set 101"},"color":"white","hover_event":{"action":"show_text","value":[{"text":"HPを上昇させる","color":"yellow"}]},"text":"+1"},{"bold":false,"color":"dark_gray","text":"("},{"color":"dark_gray","score":{"name":"@s","objective":"MaxHP"}},{"color":"dark_gray","text":")"},"  ",{"color":"aqua","text":"✦"},{"bold":true,"click_event":{"action":"run_command","command":"/trigger Menu set 102"},"color":"white","hover_event":{"action":"show_text","value":[{"text":"MPを上昇させる","color":"yellow"}]},"text":"+1"},{"color":"dark_gray","text":"("},{"color":"dark_gray","score":{"name":"@s","objective":"MaxMP"}},{"color":"dark_gray","text":")"},{"bold":false,"color":"white","text":" |"}]