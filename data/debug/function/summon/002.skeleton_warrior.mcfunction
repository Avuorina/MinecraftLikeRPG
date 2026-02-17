# スケルトン戦士をデバッグ召喚
# 使用方法: /function debug:summon/002.skeleton_warrior

# IDをStorageにセット
data modify storage api: Argument.ID set value "002"

# API経由で召喚
function api:mob/summon
