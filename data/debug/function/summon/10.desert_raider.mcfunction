# 砂漠のレイダーをデバッグ召喚
# 使用方法: /function debug:summon/10.desert_raider

# IDをStorageにセット
data modify storage api: Argument.ID set value "10"

# API経由で召喚
function api:mob/summon
