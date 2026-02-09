#> player:attack/tick
#
#
#
# @within function player:tick

## 左クリック検知用のモブを召喚
    execute as @a[team=!DEBUG] run function player:attack/summon
    #PortalCooldownが0のInteractionをkill
        scoreboard players remove @e[tag=check.Lclick] PortalCooldown 1
        kill @e[tag=check.Lclick,scores={PortalCooldown=0}]