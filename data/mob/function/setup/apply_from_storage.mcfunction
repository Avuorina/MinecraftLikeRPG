# ストレージからスコアボードへステータスを適用
# 実行者(@s)に対して実行される

# レベル
    execute store result score @s level run data get storage rpg_mob: レベル

# 基本ステータス（HPは現在値と最大値の両方を設定）
    execute store result score @s max_hp run data get storage rpg_mob: 最大HP
    execute store result score @s hp run data get storage rpg_mob: 最大HP

# Mp (もしあれば)
# execute store result score @s max_mp run data get storage rpg_mob: 最大MP
# execute store result score @s mp run data get storage rpg_mob: 最大MP

# 能力値
    execute store result score @s str run data get storage rpg_mob: 物理攻撃力
    execute store result score @s def run data get storage rpg_mob: 物理防御力
    execute store result score @s agi run data get storage rpg_mob: 素早さ
    execute store result score @s luck run data get storage rpg_mob: 運

# 初期化済みタグ付与
    tag @s add mob.initialized
