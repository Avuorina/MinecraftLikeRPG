# テストやり手をデバッグ召喚
# 使用方法: /function debug:summon/6.test_master

# IDをStorageにセット
data modify storage api: Argument.ID set value "6"

# API経由で召喚
function api:mob/summon
