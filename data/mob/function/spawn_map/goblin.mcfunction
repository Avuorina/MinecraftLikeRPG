# Goblin の spawn map
# このファイルは generate_mobs.py によって自動生成されます

# bank ファイルをロード
    function bank:mob/global/ground/blow/goblin

# Storage から MOB を召喚
    function mob:setup/summon_from_storage

# 新規MOBにステータスを設定
    execute as @e[tag=mob.new,limit=1,sort=nearest] run function mob:setup/apply_from_storage
