## なんでも定義.mcf

## スコアボード作成
    # ダミー
        scoreboard objectives add LV dummy "レベル"
        scoreboard objectives add LV_Base dummy "レベル（基準）"
        scoreboard objectives add EXP dummy "経験値"
        scoreboard objectives add nextEXP dummy "次の経験値"
        scoreboard objectives add HP dummy "HP"
        scoreboard objectives add MaxHP dummy "最大HP"
        scoreboard objectives add HPRegen dummy "HP回復量"
        scoreboard objectives add HPRegenTimer dummy "HP回復タイマー"
        scoreboard objectives add MP dummy "MP"
        scoreboard objectives add MaxMP dummy "最大MP"
        scoreboard objectives add StatusPoint dummy "ステータスポイント"
        scoreboard objectives add STR dummy "筋力"
        scoreboard objectives add ATK dummy "攻撃力"
        scoreboard objectives add DEF dummy "防御力"
        scoreboard objectives add AGI dummy "瞬発力"
        scoreboard objectives add INT dummy "知力"
        scoreboard objectives add SPD dummy "速さ"
        scoreboard objectives add LUCK dummy "幸運"
        scoreboard objectives add GOLD dummy "ゴールド"
        scoreboard objectives add DropGold dummy "ドロップゴールド"
        scoreboard objectives add DmgReceived dummy "受ダメージ"
        scoreboard objectives add SneakFrequency dummy "スニーク頻度"
        scoreboard objectives add Progress dummy "進行度"
        scoreboard objectives add Factor dummy "ステータス補正倍率"
        scoreboard objectives add Interval dummy "インターバル"
        scoreboard objectives add Turn dummy "ターン"
        scoreboard objectives add Random dummy "乱数"
        scoreboard objectives add MobID dummy "MobID"
        scoreboard objectives add Reach dummy "リーチ"

    # 内部用スコアボード
        scoreboard objectives add Timer dummy "タイマー"
        scoreboard objectives add _ dummy "一時保存用"
        scoreboard objectives add Initialized dummy "初期化の有無"
        scoreboard objectives add Const dummy "定数"
        scoreboard objectives add PortalCooldown dummy "ポータルクールダウン"

    # 検知用
        scoreboard objectives add Kills minecraft.custom:minecraft.mob_kills
        scoreboard objectives add SneakTimer minecraft.custom:minecraft.sneak_time "スニークタイマー"
        scoreboard objectives add DmgDealt minecraft.custom:minecraft.damage_dealt "被ダメージ"

    # トリガー
        scoreboard objectives add Menu trigger "メニュースコア"

    # 定数
        function rpg:box

    ## チーム
        team add ENEMY
        team modify ENEMY displayName "敵"
        team add DEBUG
        team modify DEBUG color gray
