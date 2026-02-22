# テストサモナーをデバッグ召喚
# 使用方法: /function debug:summon/7.test_summoner

# IDをStorageにセット
data modify storage api: Argument.ID set value "7"

# API経由で召喚
function api:mob/summon
