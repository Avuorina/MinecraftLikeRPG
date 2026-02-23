#> player:attack/bow/hit
# 矢が敵（Enemy）にヒットした瞬間に呼ばれる処理 (arrow_tick から execute as @e[Enemy] at @s... run function で呼ばれる)
# @within function player:attack/bow/advancement_hit

# 連続ヒット防止用のタグ付与
    tag @s add HitByArrow

# 矢が持っている合計ダメージ（DmgDealt）を、ターゲットのヒット処理用スコア（&DmgDealt _）にコピー
    scoreboard players operation &DmgDealt _ = @e[type=arrow,tag=BankArrow,limit=1,sort=nearest] DmgDealt

# プレイヤーのID（ダメージソース）を記録（必要であれば実装）
# scoreboard players operation @s AttackerID = @e[type=arrow,tag=BankArrow,limit=1,sort=nearest] PlayerID

# 攻撃タイプを一時的に保存 "Bow"
    data modify storage lib: Damage.Type set value "Bow"

# Debug
    tellraw @a ["[DEBUG] 矢がヒット！対象=", {"selector":"@s"} ,", ダメージ量=", {"score":{"name":"&DmgDealt","objective":"_"}}]

# bank_manager へダメージ処理を投げる
    function bank_manager:mob/hurt/hit

# 処理後、矢は役割を終えたので自身をキルする
    kill @e[type=arrow,tag=BankArrow,limit=1,sort=nearest]
