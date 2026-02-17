# テストマンをデバッグ召喚
# 使用方法: /function debug:summon/004.test_man

# IDをStorageにセット
data modify storage api: Argument.ID set value "004"

# API経由で召喚
function api:mob/summon
