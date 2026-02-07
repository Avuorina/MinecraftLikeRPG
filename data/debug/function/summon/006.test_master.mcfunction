# テストやり手をデバッグ召喚
# 使用方法: /function debug:summon/006.test_master

# 1. データ登録 (Storageにセット)
function bank:mob/global/debug/blow/006.test_master/register

# 2. 汎用召喚 (Storageの内容で召喚)
function mob:spawn/from_storage
