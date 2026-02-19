#> mob_manager:hp_bar/remove
#
# HPバー削除
#
# @within bank_manager:mob/death/

# 乗っているHPBarを削除
    execute on passengers if entity @s[type=text_display,tag=HPBar] run kill @s
