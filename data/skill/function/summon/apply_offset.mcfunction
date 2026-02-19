#> skill:summon/apply_offset


#> skill:summon/apply_offset
# 
# マクロによるOffset適用
# $OffsetX: double
# $OffsetY: double
# $OffsetZ: double

$tp @e[type=marker,tag=SummonPos,limit=1,sort=nearest] ^$(OffsetX) ^$(OffsetY) ^$(OffsetZ)
