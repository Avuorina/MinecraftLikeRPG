# テストやり手 - init trigger
# Skill: {Skill:"Motion",Direction:[180f,-15f],Speed:1.0d,SpeedRange:0.2}

# スキルデータをストレージに保存
data modify storage rpg_skill: data set value {Skill:"Motion",Direction:[180f,-15f],Speed:1.0d,SpeedRange:0.2}

# スキル実行
function skill:execute

#say inited