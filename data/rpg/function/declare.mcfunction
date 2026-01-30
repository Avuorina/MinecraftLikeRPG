## なんでも定義.mcf

## スコアボード作成
    scoreboard objectives add level dummy "Level"
    scoreboard objectives add exp dummy "Experience"
    scoreboard objectives add exp_next dummy "EXP to Next"
    scoreboard objectives add hp dummy "HP"
    scoreboard objectives add max_hp dummy "Max HP"
    scoreboard objectives add mp dummy "MP"
    scoreboard objectives add max_mp dummy "Max MP"
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
        scoreboard objectives add _hp dummy "HP保存用"

    # 討伐数カウント用
        scoreboard objectives add kills minecraft.custom:minecraft.mob_kills

    # 定数
        function rpg:box

## チーム
    team add ENEMY
        team modify ENEMY displayName "敵"
