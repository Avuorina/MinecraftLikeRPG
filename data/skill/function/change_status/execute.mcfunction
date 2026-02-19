#> skill:change_status/execute

# ChangeStatus スキル実行
# {Skill:"ChangeStatus", add:{...}, set:{...}}

# Add Mode
    execute if data storage skill: data.add run function skill:change_status/add

# Set Mode
    execute if data storage skill: data.set run function skill:change_status/set
