# テスト子分をデバッグ召喚
# 使用方法: /function debug:summon/008.henchman

# 1. データ登録 (Storageにセット)
function bank:mob/global/debug/shoot/007.test_summoner/008.henchman/register

# 2. 汎用召喚 (Storageの内容で召喚)
function mob:spawn/from_storage
