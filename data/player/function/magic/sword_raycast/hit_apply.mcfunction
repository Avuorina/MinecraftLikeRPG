# ダメージ適用 (マクロ)
# 実行者: 敵
# 引数: Attack
    $damage @s $(Attack) player_attack by @p
    particle explosion ~ ~ ~ 0.5 0.5 0.5 0.1 5 normal
    playsound entity.player.attack.sweep master @a ~ ~ ~ 1 1.2
