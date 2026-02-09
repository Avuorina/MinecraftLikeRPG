#> mob:on_hurt/hit
#
# 攻撃されたモブに対する処理
#
# @within function lib:left_click/attacked

# ノックバック
# Attackerの向きに合わせて実行
    execute rotated as @p[tag=Attacker] run function mob:on_hurt/knockback/

# ダメージ演出/回復
    execute if entity @s[type=#lib:undead] run effect give @s instant_health 1 1 true
    execute if entity @s[type=#lib:every_mob] run effect give @s instant_damage 1 10 true

# ダメージ処理


scoreboard players operation @s HP -= &DmgDealt _
# 死のチェック
    execute if score @s HP matches ..0 run function mob:on_death/
    # tag=ShowDmgLogにダメージと残りHPを表示
        tellraw @p[tag=Attacker,tag=ShowDmgLog] [{"text":">","color":"white",bold:false},{"text":"> ","color":"gray",bold:false},{"score":{"name":"&DmgDealt","objective":"_"},"color":"red",bold:true},{"text":" (","color":"gray",bold:false},{"score":{"name":"@s","objective":"HP"},"color":"gray",bold:false},{text:")","color":"gray",bold:false}]

    ## RESET
    # Hitタグリセット
        tag @s remove Hit
        # ダメージリセット
            scoreboard players reset &DmgDealt _
