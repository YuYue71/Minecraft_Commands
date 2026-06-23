# /kill

> **分類:** `指令` | **權限等級:** `2` | **適用版本:** `JE ≤ 1.20.4` | **命令方塊:** `true`

---

## 目錄

* [語法](#語法-syntax)
* [參數說明](#參數說明-parameters)
    * [targets](#targets)
* [外部連結](#外部連結-references)

---

## 語法 (Syntax)

```commands
/kill
/kill [targets]

```

* `[]` = 選填. 若不填寫任何參數, 預設為抹殺執行指令者本人.

| 參數 / 欄位 | 類型 | 預設 | 說明 |
| --- | --- | --- | --- |
| `[targets]` | `entity` | 執行者本身 | 欲強制抹殺的目標實體 |

---

## 參數說明 (Parameters)

### `targets`

> 決定要從世界上移除或殺死的具體對象.

* 可以是任何種類的活動實體, 包含玩家, 怪物, 動物, 以及非生物實體 (如掉落的物品, 礦車, 船隻, 盔甲座, 甚至射出的箭矢).
* 支援使用目標選擇器 (如 `@p`, `@a`, `@e`). 若要刪除特定類型的實體, 強烈建議搭配過濾器使用 (例如 `/kill @e[type=zombie]`).
* **極度危險警告**: 若單純輸入 `/kill @e` 且沒有加上任何過濾條件, 系統將會無差別抹殺當前所有已載入區塊內的「所有實體」, 包含玩家自己, 所有動物, 以及掛在牆上的物品展示框與畫, 可能會對地圖造成不可逆的嚴重破壞.
* **絕對抹殺機制**: `/kill` 所造成的傷害是無法防禦的. 它會直接將目標生命值強制歸零, 無視任何等級的護甲, 狀態效果 (如抗性提升), 甚至是創造模式 (Creative Mode) 的無敵狀態. 即便是手持「不死圖騰 (Totem of Undying)」也無法免於死亡.
* 若是由「指令方塊」或「伺服器後台控制台 (Console)」執行 `/kill` 且未填寫此參數, 指令將會執行失敗, 因為這兩者本身並非實體, 無法被殺死.

---

## 外部連結 (References)

* [Minecraft Wiki - /kill](https://zh.minecraft.wiki/w/%E5%91%BD%E4%BB%A4/kill)
* [目標選擇器 (Target Selectors)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/TargetSelectors.md)
* [實體 ID (Entity IDs)](https%3A%2F%2Fgithub.com%2FYuYue71%2FMinecraft_Commands%2Fblob%2Fmain%2F.syntax_components%2FEntity_IDs.md)