# 平原のレイダーをデバッグ召喚
# 使用方法: /function debug:summon/9.plains_raider

# IDをStorageにセット
data modify storage api: Argument.ID set value "9"

# API経由で召喚
function api:mob/summon
