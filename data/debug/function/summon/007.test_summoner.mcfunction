# テストサモナーをデバッグ召喚
# 使用方法: /function debug:summon/007.test_summoner

# 1. データ登録 (Storageにセット)
function bank:mob/global/debug/shoot/007.test_summoner/main/register

# 2. 汎用召喚 (Storageの内容で召喚)
function mob:spawn/from_storage
