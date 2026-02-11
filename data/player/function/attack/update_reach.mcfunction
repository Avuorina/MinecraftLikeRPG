# 武器種に応じてリーチを設定する
# リーチ単位: 1 = 0.25ブロック
# ＋１はプレイヤーの当たり判定分

# デフォルト: 2.0ブロック (8+4)
    scoreboard players set @s Reach 12

# 剣なら 3.0ブロック (12+4)
    execute if predicate lib:is_sword run scoreboard players set @s Reach 16

# 斧なら 2.5ブロック (10+4)
    execute if predicate lib:is_axe run scoreboard players set @s Reach 14

# 槍なら 7.5ブロック (30+4)　◀お前について、俺は何も知らねぇ。
    execute if predicate lib:is_spear run scoreboard players set @s Reach 34

# ※必要に応じて追加
