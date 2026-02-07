# テストマンをデバッグ召喚
# 使用方法: /function debug:summon/004.test_man

# 1. データ登録 (Storageにセット)
function bank:mob/global/debug/blow/004.test_man/register

# 2. 汎用召喚 (Storageの内容で召喚)
function mob:spawn/from_storage
