#> skill:change_nbt/execute

# ChangeNBT スキル実行
# skill:data に格納されたChangeNBTスキルデータを実行
# 例: {Skill:"ChangeNBT",NBT:{equipment:{mainhand:{id:"minecraft:diamond_sword",count:1}}}}

# NBTデータを実行者に適用
    function skill:change_nbt/execute_macro with storage skill: data
