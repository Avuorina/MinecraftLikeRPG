# テストサモナーをデバッグ召喚
# 使用方法: /function debug:summon/007.test_summoner

# IDをStorageにセット
data modify storage api: Argument.ID set value "007"

# API経由で召喚
function api:mob/summon
