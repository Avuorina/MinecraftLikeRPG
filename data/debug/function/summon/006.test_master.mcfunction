# テストやり手をデバッグ召喚
# 使用方法: /function debug:summon/006.test_master

# IDをStorageにセット
data modify storage api: Argument.ID set value "006"

# API経由で召喚
function api:mob/summon
