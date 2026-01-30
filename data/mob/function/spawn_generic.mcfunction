# 汎用的な MOB spawn 関数
# マクロ引数: {mob_id: "goblin"}

# mob_id から bank ファイルのパスを決定するために、マップファイルを呼び出す
    $function mob:spawn_map/$(mob_id)
