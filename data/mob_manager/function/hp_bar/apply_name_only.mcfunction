#> mob_manager:hp_bar/apply_name_only
#
# 初期状態の名前表示（マクロ）
# $(Name) を受け取る
# 実行者(@s)はText Display
#
# @within mob_manager:hp_bar/init

$data modify entity @s text set value [$(Name)]
