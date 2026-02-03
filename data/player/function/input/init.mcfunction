# R: function player:input/tick
# 左クリック検知用の Interaction Entity を召喚 - マルチプレイ対応版
# 実行者: プレイヤー (@s)

# スコアボード初期化
    scoreboard objectives add inputUUID dummy

# 召喚
    summon interaction ~ ~ ~ {Tags:["input.click","new"],width:2f,height:1f,response:true}

# 召喚したEntityのUUIDをプレイヤーのスコアに保存
    execute store result score @s inputUUID run data get entity @e[tag=new,type=interaction,limit=1,sort=nearest] UUID[0]

# EntityにもUUIDスコアをコピー (後でマッチングに使う)
    execute as @e[tag=new,type=interaction] store result score @s inputUUID run data get entity @s UUID[0]

# 初期化タグを削除
    tag @e[tag=new,type=interaction] remove new
