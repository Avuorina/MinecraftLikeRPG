# ダークナイトをデバッグ召喚
# 使用方法: /function debug:summon/3.dark_knight

# IDをStorageにセット
data modify storage api: Argument.ID set value "3"

# API経由で召喚
function api:mob/summon
