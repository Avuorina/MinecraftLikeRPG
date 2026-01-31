## 初期化

## スコアボード削除
    # ダミー
        scoreboard objectives remove LV
        scoreboard objectives remove EXP
        scoreboard objectives remove nextEXP
        scoreboard objectives remove HP
        scoreboard objectives remove MaxHP
        scoreboard objectives remove HPRegen
        scoreboard objectives remove HPRegenTimer
        scoreboard objectives remove MP
        scoreboard objectives remove MaxMP
        scoreboard objectives remove StatusPoint
        scoreboard objectives remove BaseATK
        scoreboard objectives remove ATK
        scoreboard objectives remove STR
        scoreboard objectives remove DEF
        scoreboard objectives remove AGI
        scoreboard objectives remove INT
        scoreboard objectives remove SPD
        scoreboard objectives remove LUCK
        scoreboard objectives remove SneakFrequency

        # 内部用スコアボード
            scoreboard objectives remove Timer
            scoreboard objectives remove _
            scoreboard objectives remove Initialized
            scoreboard objectives remove Const

        # 検知用
            scoreboard objectives remove Kills
            scoreboard objectives remove SneakTimer
        
        # トリガー
            scoreboard objectives remove Menu

## チーム削除
    team remove ENEMY

## もっかい作る
    function rpg:declare