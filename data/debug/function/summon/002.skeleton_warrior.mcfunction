# スケルトン戦士をデバッグ召喚
# 使用方法: /function debug:summon/002.skeleton_warrior

# 1. データ登録 (Storageにセット)
function bank:mob/global/ground/shoot/002.skeleton_warrior/register

# 2. 汎用召喚 (Storageの内容で召喚)
function mob:spawn/from_storage
