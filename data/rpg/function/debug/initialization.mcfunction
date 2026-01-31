## スコアボード初期化

## スコアボード作成
    scoreboard objectives remove LV
    scoreboard objectives remove EXP
    scoreboard objectives remove nextEXP
    scoreboard objectives remove HP
    scoreboard objectives remove MaxHP
    scoreboard objectives remove MP
    scoreboard objectives remove MaxMP
    scoreboard objectives remove STR
    scoreboard objectives remove DEF
    scoreboard objectives remove AGI
    scoreboard objectives remove INT
    scoreboard objectives remove SPD
    scoreboard objectives remove LUCK

    # 内部用スコアボード
        scoreboard objectives remove Timer
        scoreboard objectives remove _
        scoreboard objectives remove Initialized
        scoreboard objectives remove Const

    # 討伐数カウント用
        scoreboard objectives remove Kills


## チーム
    team remove ENEMY

## もっかい作る
    function rpg:declare
