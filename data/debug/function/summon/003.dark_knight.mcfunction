# ダークナイトをデバッグ召喚
# 使用方法: /function debug:summon/003.dark_knight

# 1. データ登録 (Storageにセット)
function bank:mob/global/ground/blow/003.dark_knight/register

# 2. 汎用召喚 (Storageの内容で召喚)
function mob:spawn/from_storage
