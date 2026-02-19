#> mob_manager:hp_bar/apply_text_dispatcher
#
# テキスト適用ディスパッチャー（マクロ）
# $(HPBarID) を使用して対象の text_display を特定し、apply_text を実行する
#
# @within mob_manager:hp_bar/update

$execute as @e[type=text_display,tag=HPBar,scores={HPBarID=$(HPBarID)},limit=1] run function mob_manager:hp_bar/apply_text with storage bank:mob
