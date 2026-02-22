# テストウーマンをデバッグ召喚
# 使用方法: /function debug:summon/5.test_woman

# IDをStorageにセット
data modify storage api: Argument.ID set value "5"

# API経由で召喚
function api:mob/summon
