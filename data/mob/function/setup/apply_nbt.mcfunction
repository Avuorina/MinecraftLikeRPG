say apply_nbt
# Storage から NBT を適用
# @s = 召喚されたばかりの MOB (tag=mob.new)

# ベースの Tags を追加
#say [Debug] Applying NBT...
    data modify entity @s Tags append from storage rpg_mob: "ベース".Tags[]

# 見た目を適用
    data modify entity @s CustomName set from storage rpg_mob: "見た目".CustomName
    # 装備 (generate_mobs.py で ArmorItems / HandItems に変換済み)
    # Mainhand
        data modify entity @s equipment.mainhand set from storage rpg_mob: "見た目".HandItems[0]
        # Offhand
            data modify entity @s equipment.offhand set from storage rpg_mob: "見た目".HandItems[1]
            # Feet
                data modify entity @s equipment.feet set from storage rpg_mob: "見た目".ArmorItems[0]
                # Legs
                    data modify entity @s equipment.legs set from storage rpg_mob: "見た目".ArmorItems[1]
                    # Chest
                        data modify entity @s equipment.chest set from storage rpg_mob: "見た目".ArmorItems[2]
                        # Head 
                            data modify entity @s equipment.head set from storage rpg_mob: "見た目".ArmorItems[3]

                        # Init タグを削除（初期化完了）
                            tag @s remove Init
