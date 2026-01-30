# ステータス表示デバッグ用
# 実行者の目の前に text_display を召喚してステータスを表示し続ける
# 終了するには kill コマンドなどを使用してください

# 既存の表示を消す（重複防止）
    kill @e[type=text_display,tag=debug_status]

# text_display を召喚
    summon text_display ^ ^1.5 ^2 {Tags:["debug_status"],billboard:"center",background:167772160,text:'{"text":"Loading..."}'}

# データ更新（即時反映）
# ユーザー提案の形式（配列）を採用し、シンプルに記述。
# ただしNBTとしては「文字列」である必要があるため、全体をシングルクォートで囲みます。
    data merge entity @e[type=text_display,tag=debug_status,limit=1,sort=nearest] {text:[{"text":"=== Status ===\n"},"LEVEL:",{"score":{"name":"@p","objective":"level"}},{"text":"\nHP:"},{"score":{"name":"@p","objective":"hp"}},"/",{"score":{"name":"@p","objective":"max_hp"}}]}

# メッセージ
    tellraw @s ["",{"text":"目の前にステータスを表示しました。","color":"green"}]
