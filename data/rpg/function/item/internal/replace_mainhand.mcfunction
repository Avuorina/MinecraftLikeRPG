# マクロ展開用の中間関数
# rpg_item:tmp の id_macro タグの内容を使って item replace する
# 呼び出し元で: data modify storage rpg_item:tmp id_macro set value "minecraft:wooden_sword"
# バージョン 1.20.2以降、マクロ引数はCompoundである必要があるため、{id:"..."} の形で渡す

$item replace entity @s weapon.mainhand with $(id_macro)
