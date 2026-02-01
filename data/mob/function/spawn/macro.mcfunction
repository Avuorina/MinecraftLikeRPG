# generic summon macro
# Arguments: $(id), $(Tags)

$summon $(id) ~ ~ ~ {Tags:$(Tags), CustomNameVisible:1b, PersistenceRequired:1b}

# 新規MOBにステータスを設定 (tag=mob.new should be present in $(Tags))
    execute as @e[tag=mob.new,tag=!mob.initialized] run function mob:setup/apply_from_storage
