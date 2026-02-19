#> debug:test_summon_skill


# Skill:Summon テスト用
# 自分の前方に3体のMOBを少し散らして召喚する

data modify storage skill: data set value {Skill:"Summon",MobID:"006.test_master",Count:3,Offset:[0.0,0.0,5.0],Spread:3.0}
function skill:execute
