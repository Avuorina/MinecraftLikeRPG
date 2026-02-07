# テストやり手 - Tick Function
# Init Check
execute if entity @s[tag=Init] run function bank:mob/global/debug/blow/006.test_master/init
execute if entity @s[tag=Init] run tag @s remove Init
# Other Interval/Turn Skills can be added here
