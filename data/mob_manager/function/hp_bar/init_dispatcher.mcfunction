#> mob_manager:hp_bar/init_dispatcher
#
# HPバー召喚ディスパッチャー（マクロ）
# $(HPBarID) を使用して対象の text_display (自分のHPバー) が存在するかチェック
# 存在しなければ init を呼び出す

$execute unless entity @e[type=text_display,tag=HPBar,scores={HPBarID=$(HPBarID)},limit=1] at @s run function mob_manager:hp_bar/init
    