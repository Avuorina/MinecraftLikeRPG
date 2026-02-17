#> bank_manager:mob/summon/register
#
# モブの召喚登録呼び出し
#
# @within function api:mob/core/summon

## MOBの召喚手順
# 今のところ [function api:mob/summon with {api:{Argument.ID:X}}] で呼び出し
# [function api:mob/core/summon]
    # [bank_manager:mob/summon/register]
    # [bank_manager:mob/trigger/summon/core]
    # [bank_manager:mob/summon/init]
        # [bank_manager:mob/summon/set_id]
        # [bank_manager:mob/summon/apply_status/set]
            # [bank_manager:mob/summon/apply_status/level/]
            # [bank_manager:mob/summon/apply_status/tag]

## 登録MOBを呼び出す
    $function bank:mob/alias/$(ID)/register