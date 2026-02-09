# 武器種に応じてリーチを設定する
# リーチ単位: 1 = 0.125ブロック

# デフォルト: 2.0ブロック (16)
    scoreboard players set @s Reach 16

# 剣なら 3.0ブロック (24)
    execute if predicate lib:is_sword run scoreboard players set @s Reach 24

# 斧なら 2.5ブロック (20)
    execute if predicate lib:is_axe run scoreboard players set @s Reach 20

# ※必要に応じて追加
