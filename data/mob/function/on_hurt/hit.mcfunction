### 攻撃されたモブに対する処理

# ノックバック
# Attackerの向きに合わせて実行
    execute rotated as @p[tag=Attacker] run function mob:on_hurt/knockback/

# ダメージ演出/回復
    execute if entity @s[type=#mob:undead] run effect give @s instant_health 1 1 true
    execute if entity @s[type=#mob:undead] run effect give @s instant_damage 1 10 true
# Hitタグリセット
    tag @s remove Hit
