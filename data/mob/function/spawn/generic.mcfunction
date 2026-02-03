# 汎用的な MOB spawn 関数
# マクロ引数: {mob_id: "goblin"}

# mob_id から bank ファイルのパスを決定して register を呼び出す
# register 内で summon が行われる
    $function bank:mob/$(mob_id)/register
    function mob:spawn/from_storage
