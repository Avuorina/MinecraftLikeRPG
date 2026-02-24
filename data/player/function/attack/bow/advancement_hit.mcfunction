#> player:attack/bow/advancement_hit
# プレイヤーが放った貫通付きの矢がモブに命中した瞬間に呼ばれる
# @within advancement lib:player_shot_arrow

# 再利用のために進捗を即時剥がす
    advancement revoke @s only lib:player_shot_arrow

# ダメージを受けたばかりのモブ（今この瞬間HurtTimeが10sになった奴）を特定して、そいつ起点でヒット関数を呼ぶ
    execute as @e[type=#lib:every_mob,nbt={HurtTime:10s},distance=..100] at @s run function player:attack/bow/hit
