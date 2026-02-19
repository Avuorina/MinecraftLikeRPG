#> bank:mob/007.test_summoner/main/turn/turn_2

# ターン 2 のアクション
    data modify storage skill: data set value {Skill:"Motion",Direction:[180f,-15f],Speed:-1.0d,SpeedRange:0.2}
    function skill:execute

# 次のターンのセットアップ
    scoreboard players set @s Interval 1000
    scoreboard players set @s Turn 1
