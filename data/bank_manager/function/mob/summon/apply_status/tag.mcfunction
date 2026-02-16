#> bank_manager:mob/summon/tag
#
# 召喚されたBankMobのタグを初期化します
#
# @within function bank_manager:mob/summon/apply_status/set

# Friend
    execute if data storage bank:mob {Type:"Friend"} run tag @s add Friend
# Enemy
    execute if data storage bank:mob {Type:"Enemy"} run tag @s add Enemy

    #execute if data storage bank:mob {Type:"Enemy.Boss"} run data modify entity @s PersistenceRequired set value 1b
    #execute if data storage bank:mob {Type:"Enemy.Boss"} run tag @s add Enemy
    #execute if data storage bank:mob {Type:"Enemy.Boss"} run tag @s add Enemy.Boss
    #execute if data storage bank:mob {Type:"Enemy.Boss"} run tag @s add Immovable

    #execute if data storage bank:mob {Type:"Enemy.EndGameBoss"} run data modify entity @s PersistenceRequired set value 1b
    #execute if data storage bank:mob {Type:"Enemy.EndGameBoss"} run tag @s add Enemy
    #execute if data storage bank:mob {Type:"Enemy.EndGameBoss"} run tag @s add Enemy.Boss
    #execute if data storage bank:mob {Type:"Enemy.EndGameBoss"} run tag @s add Enemy.EndGameBoss
    #execute if data storage bank:mob {Type:"Enemy.EndGameBoss"} run tag @s add Immovable
# Projectile
    #execute if data storage bank:mob {Type:"Projectile"} run tag @s add Projectile
# Npc
    #execute if data storage bank:mob {Type:"Npc"} run tag @s add Npc
# Object
    #execute if data storage bank:mob {Type:"Object"} run tag @s add Object

# Uninterferable
    #execute if data storage bank:mob {Interferable:false} run data modify entity @s Invulnerable set value 1b
    #execute if data storage bank:mob {Interferable:false} run tag @s add Uninterferable
    #execute if data storage bank:mob {Interferable:false} run tag @s add Immovable

# skeleton or #lib:drownable ならば ProcessCommonTag
    #execute if entity @s[type=skeleton] run tag @s add ProcessCommonTag
    #execute if entity @s[type=#lib:drownable] run tag @s add ProcessCommonTag

# ForwardTarget
    #execute if data storage bank:mob {IsForwardTarget:true} run tag @s add ForwardTarget