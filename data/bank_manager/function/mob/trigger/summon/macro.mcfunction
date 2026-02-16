#> bank_manager:mob/trigger/summon/macro
#
# MOBの召喚マクロ
#
# @within function bank_manager:mob/trigger/summon/

$function bank:mob/alias/$(id)/summon
$execute store success storage bank:mob Implement byte 1 run schedule function bank:mob/alias/$(id)/summon 2147483647t
$schedule clear bank:mob/alias/$(id)/summon