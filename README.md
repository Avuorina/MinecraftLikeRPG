# Minecraft RPG Datapack

MinecraftならではのRPG体験を提供するデータパックです。

## ⚠️注意

このデータパックはAntigravityにて制作されたものであり、AIの力を借りて制作されております。

## 特徴

- 🎯 **成長システム** - レベルアップでステータスが上昇
- ⚔️ **ステータス** - HP, MP, STR, DEF, AGI, INT, LUCK, SPD
- 🏆 **経験値** - モブ討伐や採掘で獲得
- 📊 **HUD** - アクションバーにステータス表示、経験値バーにMPを表示
- 💎 **アイテム** - カスタムステータス付き装備、特殊ドロップ

## クレジット / 参考

本データパックの一部の機能は、以下のプロジェクトを参考にさせていただきました：

- **[TUSB (The Unusual SkyBlock)](https://github.com/TUSB/TheUnusualSkyBlock)**
- **[RPG-Datapack (HamaSSH)](https://github.com/HamaSSH/RPG-Datapack)**
- **[TheSkyBlessing](https://github.com/ProjectTSB/TheSkyBlessing)**

## 対応バージョン

- Minecraft Java Edition 1.21.11

## インストール

1. このフォルダを `.minecraft/saves/<ワールド名>/datapacks/` に配置
2. ゲーム内で `/reload` を実行
3. `/function rpg:init` で初期化
   - ※初回導入時に自動で実行される場合があります

## コマンド

| コマンド | 説明 |
|---------|------|
| `/function rpg:init` | データパックの初期化 |
| `/function rpg:player/setup` | プレイヤーのステータス初期化 |
| `/scoreboard players set @s MaxMP <数値>` | MaxMPの手動設定（デバッグ用） |

## 開発状況

- [x] 成長・ステータスシステム (HP, MP, 各種能力値)
- [x] MPバー表示 (Vanilla XP Bar連携)
- [x] カスタムアイテム生成 (Lore, Icons)
- [ ] 戦闘・スキルシステム
- [ ] クエストシステム
- [ ] 拠点システム

## ライセンス

**WTFPL** (DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE)
詳細は [LICENSE](LICENSE) ファイルをご確認ください。
