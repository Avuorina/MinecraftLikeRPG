#> mob_manager:hp_bar/update
#
# HPバー更新（マクロ版）
#
# @within bank_manager:mob/hurt/hit

# HPの比率計算
    scoreboard players operation @s HPRatio = @s HP
    scoreboard players operation @s HPRatio *= $10000 Const
    scoreboard players operation @s HPRatio /= @s MaxHP
    scoreboard players operation @s HPRatio *= $20 Const
    scoreboard players operation @s HPRatio /= $10000 Const
    execute if score @s HP matches 1.. if score @s HPRatio matches ..0 run scoreboard players set @s HPRatio 1

    # HPBarIDを格納
    execute store result storage bank:mob HPBarID int 1 run scoreboard players get @s HPBarID

    # HPバーが存在しない場合、召喚する
    function mob_manager:hp_bar/init_dispatcher with storage bank:mob

    # マクロ用データ作成
        execute store result storage bank:mob HP int 1 run scoreboard players get @s HP
        execute store result storage bank:mob MaxHP int 1 run scoreboard players get @s MaxHP
        execute store result storage bank:mob HPRatio int 1 run scoreboard players get @s HPRatio


# 名前 (CustomName) を storage に格納
    data remove storage bank:mob Name
    data modify storage bank:mob Name set from entity @s CustomName

# マクロ実行 (Dispatcher)
# 確実に自分の近くのHPBarを更新するため、distance指定を追加
# scores checkも行うが、distance優先
    function mob_manager:hp_bar/apply_text_dispatcher with storage bank:mob

# RESET
    scoreboard players reset @s HPRatio
