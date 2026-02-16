# 進行度(難易度)を設定するデバッグコマンド
# Global Progress が全てのMOBのレベルに加算されます

# 引数(数値)があればその値に設定、なければ表示
    execute if score Global Progress matches -2147483648..2147483647 run tellraw @s [{"text":"現在の進行度: ","color":"gold"},{"score":{"name":"Global","objective":"Progress"},"color":"yellow"}]

# 使用例:
# scoreboard players set Global Progress 5
# -> 次にスポーンするMOBのレベルが +5 される
