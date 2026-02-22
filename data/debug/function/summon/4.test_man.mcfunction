# テストマンをデバッグ召喚
# 使用方法: /function debug:summon/4.test_man

# IDをStorageにセット
data modify storage api: Argument.ID set value "4"

# API経由で召喚
function api:mob/summon
