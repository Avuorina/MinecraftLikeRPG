# スキル実行メインディスパッチャー
# rpg_skill:data に格納されたJSONスキルデータを解析して実行

# JSONをパースしてSkillタイプを取得
# 例: {Skill:"Motion",Direction:[180f,-15f],Speed:0.3d}

# Skillタイプに応じて分岐# Dispatch
    execute if data storage rpg_skill: data{Skill:"Motion"} run function skill:motion/execute
    execute if data storage rpg_skill: data{Skill:"ChangeNBT"} run function skill:change_nbt/execute
    execute if data storage rpg_skill: data{Skill:"Attack"} run function skill:attack/execute
    execute if data storage rpg_skill: data{Skill:"ChangeStatus"} run function skill:change_status/execute

# 適宜RESET
    data remove storage rpg_skill: data
