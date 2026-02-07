# テストウーマンをデバッグ召喚
# 使用方法: /function debug:summon/005.test_woman

# 1. データ登録 (Storageにセット)
function bank:mob/global/debug/blow/005.test_woman/register

# 2. 汎用召喚 (Storageの内容で召喚)
function mob:spawn/from_storage
