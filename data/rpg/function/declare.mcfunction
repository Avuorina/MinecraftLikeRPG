## なんでも定義.mcf

## スコアボード作成
    scoreboard objectives add level dummy "レベル"
    scoreboard objectives add exp dummy "経験値"
    scoreboard objectives add exp_next dummy "次の経験値"
    scoreboard objectives add hp dummy "HP"
    scoreboard objectives add max_hp dummy "最大HP"
    scoreboard objectives add hpRegen dummy "HP回復量"
    scoreboard objectives add hpRTimer dummy "HP回復タイマー"
    scoreboard objectives add mp dummy "MP"
    scoreboard objectives add max_mp dummy "最大MP"
    scoreboard objectives add str dummy "攻撃力"
    scoreboard objectives add def dummy "防御力"
    scoreboard objectives add agi dummy "瞬発力"
    scoreboard objectives add int dummy "知力"
    scoreboard objectives add spd dummy "速さ"
    scoreboard objectives add luck dummy "幸運"

    # 内部用スコアボード
        scoreboard objectives add timer dummy "タイマー"
        scoreboard objectives add _ dummy "一時保存用"
        scoreboard objectives add initialized dummy "初期化の有無"
        scoreboard objectives add Const dummy "定数"

    # 討伐数カウント用
        scoreboard objectives add kills minecraft.custom:minecraft.mob_kills

    # 定数
        function rpg:box

## チーム
    team add ENEMY
        team modify ENEMY displayName "敵"
