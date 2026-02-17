# テスト子分をデバッグ召喚
# 使用方法: /function debug:summon/008.henchman

# IDをStorageにセット
data modify storage api: Argument.ID set value "008"

# API経由で召喚
function api:mob/summon
