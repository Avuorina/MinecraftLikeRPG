# MOBタグを持つ全てのエンティティ（プレイヤー以外）に対してステータス適用を実行
    execute as @e[type=!player,tag=MOB] run function status:apply_mob_each
