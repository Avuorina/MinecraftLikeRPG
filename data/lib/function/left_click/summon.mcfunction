# 検知用のInteractionを召喚
    execute anchored eyes positioned ^ ^ ^ run summon interaction ~ ~ ~ {width:2f,height:1f,Tags:["check.Lclick","new"]}
# スコアを代入
    scoreboard players set @e[tag=check.Lclick,tag=new] PortalCooldown 2
# タグを外す
    tag @e[tag=new] remove new
