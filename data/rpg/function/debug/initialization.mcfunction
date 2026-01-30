## スコアボード初期化

## スコアボード作成
    scoreboard objectives remove level
    scoreboard objectives remove exp
    scoreboard objectives remove exp_next
    scoreboard objectives remove hp
    scoreboard objectives remove max_hp
    scoreboard objectives remove mp
    scoreboard objectives remove max_mp
    scoreboard objectives remove str
    scoreboard objectives remove def
    scoreboard objectives remove agi
    scoreboard objectives remove int
    scoreboard objectives remove spd
    scoreboard objectives remove luck

    # 内部用スコアボード
        scoreboard objectives remove timer
        scoreboard objectives remove _
        scoreboard objectives remove initialized
        scoreboard objectives remove Const

    # 討伐数カウント用
        scoreboard objectives remove kills


## チーム
    team remove ENEMY

## もっかい作る
    function rpg:declare
