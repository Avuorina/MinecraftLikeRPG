#> mob:spawn/macro
#
#
#
# @within function mob:spawn/from_storage

# generic summon macro
# Arguments: $(id), $(Tags)

$summon $(id) ~ ~ ~ {Tags:$(Tags), CustomNameVisible:1b, PersistenceRequired:1b}

# 新規MOBにステータスを設定 (tag=Init should be present in $(Tags))
    execute as @e[tag=Init,tag=!mob.initialized] run function mob:setup/init
