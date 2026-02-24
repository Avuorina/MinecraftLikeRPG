#> player:attack/bow/arrow_init
# 弓から放たれた矢の初期データ設定（矢起点で実行）
# @within function player:attack/bow/shoot

# 初期化済みフラグ
    tag @s add ArrowInit
    tag @s add BankArrow
    data modify entity @s pickup set value 0b

# バニラの進捗(player_hurt_entity)を発火させ、かつ自分が誰から放たれたかを明確にするために Owner を設定する
    data modify entity @s Owner set from entity @p[distance=..5] UUID

# Hit時に矢が即座に消滅してDmgDealtスコアが読めなくなるのを防ぐため、最大貫通状態にする
    data modify entity @s PierceLevel set value 127b

# 射出したプレイヤーのダメージを正規ルートで再計算して一時変数(&DmgDealt)に出力させる
# より正確なマルチ対応の場合は UUID を用いるが、今回は簡易的に最近接プレイヤーの攻撃力を参照する
    execute as @p[distance=..5] run function player:attack/dmg_dealt

# チャージ倍率の適用
    scoreboard players set $10 _ 10
    scoreboard players operation &DmgDealt _ *= $ChargeModifier _
    scoreboard players operation &DmgDealt _ /= $10 _

# プレイヤーが産み出したダメージ(&DmgDealt _)を矢エンティティ自身(DmgDealt)にコピーする
    scoreboard players operation @s DmgDealt = &DmgDealt _

# ゴミが残らないように一時変数をリセットしておく
    scoreboard players reset &DmgDealt _

# 自動消滅タイマーの設定
    scoreboard players set @s Timer 100

# 矢が飛んでいる間のTick処理用のタグ
    tag @s add Flying
