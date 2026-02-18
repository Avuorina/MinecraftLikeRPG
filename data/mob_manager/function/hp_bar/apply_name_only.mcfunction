#> mob_manager:hp_bar/apply_name_only
#
# 初期状態の名前表示（マクロ）
# $(Name) を受け取る
# 実行者(@s)はText Display

$data modify entity @s text set value [$(Name)]
