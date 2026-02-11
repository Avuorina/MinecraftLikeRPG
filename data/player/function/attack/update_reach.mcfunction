# 武器種に応じてリーチを設定する
# リーチ単位: 1 = 0.25ブロック

# デフォルト: 2.0ブロック (8)
    scoreboard players set @s Reach 8

# 剣なら 3.0ブロック (12)
    execute if predicate lib:is_sword run scoreboard players set @s Reach 12

# 斧なら 2.5ブロック (10)
    execute if predicate lib:is_axe run scoreboard players set @s Reach 10

# 槍なら 7.5ブロック (30)　◀お前について、俺は何も知らねぇ。
    execute if predicate lib:is_spear run scoreboard players set @s Reach 30

# ※必要に応じて追加
