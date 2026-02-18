#> mob_manager:hp_bar/update
#
# HPバー更新（マクロ版）
# @within bank_manager:mob/hurt/hit

# HPRatio20 計算 (0-20)
    scoreboard players operation @s HPRatio = @s HP
    scoreboard players operation @s HPRatio *= $10000 Const
    scoreboard players operation @s HPRatio /= @s MaxHP
    scoreboard players operation @s HPRatio *= $20 Const
    scoreboard players operation @s HPRatio /= $10000 Const
    execute if score @s HP matches 1.. if score @s HPRatio matches ..0 run scoreboard players set @s HPRatio 1

    # HPBarID を storage に格納
    # ここで格納した UID を使って召喚判定とテキスト更新の両方を行う
    execute store result storage bank:mob HPBarID int 1 run scoreboard players get @s HPBarID

    # HPバーが存在しない場合、召喚する
    # マクロを使って、自分のIDを持つHPBarを探す
    function mob_manager:hp_bar/init_dispatcher with storage bank:mob

    # マクロ用データ作成
    # HP, MaxHP, HPRatio を storage に格納
        execute store result storage bank:mob HP int 1 run scoreboard players get @s HP
        execute store result storage bank:mob MaxHP int 1 run scoreboard players get @s MaxHP
        execute store result storage bank:mob HPRatio int 1 run scoreboard players get @s HPRatio


# 名前 (CustomName) を storage に格納
# 名前がない場合は空文字を入れるなどの処理が必要だが、基本的にRPGモブは名前を持つ前提
    data modify storage bank:mob Name set value '{"text":""}'
    data modify storage bank:mob Name set from entity @s CustomName

# マクロ実行 (Dispatcher)
# 確実に自分の近くのHPBarを更新するため、distance指定を追加
# scores checkも行うが、distance優先
    function mob_manager:hp_bar/apply_text_dispatcher with storage bank:mob
