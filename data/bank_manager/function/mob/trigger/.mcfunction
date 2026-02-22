#> bank_manager:mob/trigger/
#
# MOBイベント処理 (Tick, Hurt, Death) のディスパッチハブ
# @within bank_manager:mob/tick/ (execute as @e[tag=BankMob] at @s)

# --- Context の設定 ---
# 自身の BankIDを一時保存IDに代入
    function #oh_my_dat:please
    data modify storage bank:manager ID set from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].BankID

# --- イベント処理 ---

# 1. Death イベント 
# タグ 'MobDeath' が付与されていれば死亡時処理を実行
# スキルを持つMOB(HasDeath)ならマクロ、持たないなら共通処理
    execute if entity @s[tag=MobDeath,tag=HasDeath] run function bank_manager:mob/trigger/macro/death with storage bank:manager
    execute if entity @s[tag=MobDeath,tag=!HasDeath] run function bank_manager:mob/death/

# Death したらここで終了 (以降のHurtやTickは呼ばない)
    execute if entity @s[tag=MobDeath] run return 0
    execute unless entity @s run return 0

# 2. Hurt イベント
# タグ 'MobHurt' が付与されていれば被ダメージ時処理(hurt)を実行
# スキルを持つMOB(HasHurt)のみマクロ呼び出し
    execute if entity @s[tag=MobHurt,tag=HasHurt] run function bank_manager:mob/trigger/macro/hurt with storage bank:manager
    # 処理終わったらタグを消す
        execute if entity @s[tag=MobHurt] run tag @s remove MobHurt

    # (TODO: 追加する場合はここに 3. Attack イベント などを実装)

    # 4. Tick イベント (生存中)
    # ターン制スキルや継続ダメージなどの通常処理
    # スキル・ターン設定を持つMOB(HasTick)のみマクロ呼び出し
        execute if entity @s[tag=HasTick] run function bank_manager:mob/trigger/macro/tick with storage bank:manager

