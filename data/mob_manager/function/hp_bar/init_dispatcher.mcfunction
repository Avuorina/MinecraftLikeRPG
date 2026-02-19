#> mob_manager:hp_bar/init_dispatcher
#
# HPバー召喚ディスパッチャー（マクロ）
# 
# @within mob_manager:hp_bar/update

$execute unless entity @e[type=text_display,tag=HPBar,scores={HPBarID=$(HPBarID)},limit=1] at @s run function mob_manager:hp_bar/init
