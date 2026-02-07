# テストゴブリンをデバッグ召喚
# 使用方法: /function debug:summon/001.goblin

# 1. データ登録 (Storageにセット)
function bank:mob/global/ground/blow/001.goblin/register

# 2. 汎用召喚 (Storageの内容で召喚)
function mob:spawn/from_storage
