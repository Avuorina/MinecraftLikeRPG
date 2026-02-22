# テスト子分をデバッグ召喚
# 使用方法: /function debug:summon/8.test_henchman

# IDをStorageにセット
data modify storage api: Argument.ID set value "8"

# API経由で召喚
function api:mob/summon
