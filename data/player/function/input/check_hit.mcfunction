# R: function player:input/tick
# 攻撃判定の確認と処理 - マルチプレイ対応版
# 実行者: Interaction Entity (@s)

# マルチプレイ対応: UUIDスコアを持つプレイヤーを特定
# EntityのスコアとマッチするプレイヤーがOwner
    execute as @a if score @s inputUUID = @e[type=interaction,tag=input.click,limit=1,sort=nearest] inputUUID run function player:input/click_action

# データをリセット (これを行わないと毎tick反応してしまう)
    data remove entity @s interaction
    data remove entity @s attack
