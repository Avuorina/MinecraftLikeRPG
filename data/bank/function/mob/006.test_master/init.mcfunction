#> bank:mob/006.test_master/init

# テストやり手 - init トリガー
# Skill: {Skill:"Motion",Direction:[180f,-15f],Speed:1.0d,SpeedRange:0.2}

# スキルデータをストレージに保存
    data modify storage skill: data set value {Skill:"Motion",Direction:[180f,-15f],Speed:1.0d,SpeedRange:0.2}

# スキル実行
    function skill:execute

# ターン制システムのセットアップ
    scoreboard players set @s Turn 1
    scoreboard players set @s Interval 60
