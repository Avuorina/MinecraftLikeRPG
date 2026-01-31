## メニューを開く

# 許可
    scoreboard players enable @s Menu

# tellraw
    tellraw @s [{"bold":false,"color":"white","text":"====="},{"bold":true,"color":"gold","text":"RPG Menu"},{"bold":false,"color":"white","text":"====="}]
    tellraw @s [{"bold":false,"color":"white","text":"|  "},{"bold":true,"click_event":{"action":"run_command","command":"/trigger Menu set 1"},"color":"gold","text":"⏺"},{"click_event":{"action":"run_command","command":"/trigger Menu set 1"},"color":"white","text":"ステータス割り振り"},{"bold":false,"color":"white","text":"    |"}]
