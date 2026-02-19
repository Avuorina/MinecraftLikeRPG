#> skill:attack/execute

# Attack スキル実行
# skill:data に格納されたAttackスキルデータを実行
# 例: {Skill:"Attack",Type:"fireball",Damage:10}

# マクロ関数を使用してパラメータを展開
    function skill:attack/execute_macro with storage skill: data
