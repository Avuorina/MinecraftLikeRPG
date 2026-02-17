#> api:mob/summon
#
# MOBの召喚function
#
# @api

# やはりBankMobの「目次」を作り、そこをたたくことでMOBが召喚される感じにしたほうがいいのか..?
# 何千というMOBを作ったら何千というファイルが生成されるということなのだろうか?

# 検証
# BankMOBid欠損
    execute unless data storage api: Argument.ID run tellraw @a [{"storage":global,"nbt":"Prefix.ERROR"},{"text":"引数が足りません。","color":"red"},{"text":"(IDを指定してください)","color":"red"},{"text":"","color":"red"}]
    execute unless data storage api: Argument.ID run return fail
    # @s欠損
        execute unless entity @s run tellraw @a [{"storage":global,"nbt":"Prefix.ERROR"},{"text":"データを適用するEntityが存在しません\nasを利用して対象のEntityを実行者にしてください"}]
        execute unless entity @s run return fail

    # 呼びだし
        execute if data storage api: Argument.ID run function api:mob/core/summon

    ## RESET
        data remove storage api: Argument.ID
