# テストゴブリンをデバッグ召喚
# 使用方法: /function debug:summon/001.goblin

# IDをStorageにセット
    data modify storage api: Argument.ID set value "001"

# API経由で召喚
    function api:mob/summon
