
#> skill:execute

# スキル実行メインディスパッチャー
# skill:data に格納されたJSONスキルデータを解析して実行

# JSONをパースしてSkillタイプを取得
# 例: {Skill:"Motion",Direction:[180f,-15f],Speed:0.3d}

# Skillタイプに応じて分岐# Dispatch
    execute if data storage skill: data{Skill:"Motion"} run function skill:motion/execute
    execute if data storage skill: data{Skill:"ChangeNBT"} run function skill:change_nbt/execute
    execute if data storage skill: data{Skill:"Attack"} run function skill:attack/execute
    execute if data storage skill: data{Skill:"ChangeStatus"} run function skill:change_status/execute
    execute if data storage skill: data{Skill:"Summon"} run function skill:summon/execute

# 適宜RESET
    data remove storage skill: data
