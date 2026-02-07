# 武器種に応じてリーチを設定する
# リーチ単位: 1 = 0.25ブロック

# デフォルト: 2.0ブロック (8)
    scoreboard players set @s Reach 16

# 剣なら 3.0ブロック (12)
    execute if predicate lib:is_sword run scoreboard players set @s Reach 24

# 斧なら 2.5ブロック (10)
    execute if predicate lib:is_axe run scoreboard players set @s Reach 20

# ※必要に応じて追加
