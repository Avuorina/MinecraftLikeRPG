#> player/status/mp/bar/set
#
# MPバー表示 (Vanilla XP Bar)
# 参考 / https://github.com/TUSB/TheUnusualSkyBlock/tree/releases/1-21-4/data/player/function/mp_bar [TUSB]
#        https://github.com/HamaSSH/RPG-Datapack/blob/main/Datapack/data/player/function/status/mp/bar/_.mcfunction [RPG-Datapack]
# @within player:status/mp/bar/set
# 一旦保存
    scoreboard players operation $XPLevel _ = @s MP

# 129lvがMAX1002なんだってさ。
    experience set @s 129 levels
# 割合を検証
    execute store result score $XPp _ run xp query @s points
# MPの割合との違いを調べる
    scoreboard players operation $XPDif _ = @s MPRatio
    scoreboard players operation $XPDif _ -= $XPp _
    scoreboard players operation $XPDif _ /= $8 Const

# 経験値ポイント操作
    xp set @s 0 points
    scoreboard players operation $XPp _ += $XPDif _
    execute store result storage player: XPbar.Point int 1 run scoreboard players get $XPp _
    function player:status/mp/bar/set_point with storage player: XPbar

# レベル操作
    xp set @s 0 levels
    execute store result storage player: XPbar.Level int 1 run scoreboard players get $XPLevel _
    function player:status/mp/bar/set_level with storage player: XPbar

# MPに変化がある時だけ、常時実行
    scoreboard players set @s PreviousMPRatio -1
    execute if score $XPDif _ matches 0 run scoreboard players operation @s PreviousMPRatio = @s MPRatio

# RESET
    data remove storage player: XPbar
    scoreboard players reset $XPLevel _
    scoreboard players reset $XPp _
    scoreboard players reset $XPDif _