#> mob:spawn/from_storage
#
# Storageの情報を元にMOBを召喚する
#
# @within function mob:spawn/generic

# 前提: rpg_mob: ベース に {id:"...", Tags:[...]} が入っていること

function mob:spawn/macro with storage rpg_mob: ベース
