# ID指定でMOBを召喚するマクロ (spawn_by_id)
# Arguments: {id:"001.test_man"}

# データ登録＆召喚
# register.mcfunction 内に summon コマンドが含まれています
    $function bank:mob/$(id)/register
    function mob:spawn/from_storage
