# テストウーマンをデバッグ召喚
# 使用方法: /function debug:summon/005.test_woman

# IDをStorageにセット
data modify storage api: Argument.ID set value "005"

# API経由で召喚
function api:mob/summon
