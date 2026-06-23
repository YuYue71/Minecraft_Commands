# /gamemode

> **分類:** `指令` | **權限等級:** `2` | **適用版本:** `JE ≤ 1.20.4` | **命令方塊:** `true`

---

## 目錄

* [語法](#語法-syntax)
* [參數說明](#參數說明-parameters)
    * [gamemode](#gamemode)
    * [targets](#targets)
* [外部連結](#外部連結-references)

---

## 語法 (Syntax)

```commands
/gamemode <gamemode>
/gamemode <gamemode> [targets]

```

* `<>` = 必填, `[]` = 選填

| 參數 / 欄位 | 類型 | 預設 | 說明 |
| --- | --- | --- | --- |
| `<gamemode>` | `enum` | - | 欲切換的目標遊戲模式 |
| `[targets]` | `entity` | 執行者本身 | 欲更改遊戲模式的目標玩家 |

---

## 參數說明 (Parameters)

### `gamemode`

> 指定要切換到的遊戲模式.

| 值 | 說明 |
| --- | --- |
| `survival` | 生存模式. 玩家需要收集資源, 管理生命值與飢餓值, 且會受到環境與敵對生物的傷害. |
| `creative` | 創造模式. 玩家擁有無限資源, 可飛行, 且免疫絕大部分傷害 (除了虛空與 /kill 指令). |
| `adventure` | 冒險模式. 玩家無法任意破壞或放置方塊 (除非使用帶有特殊 NBT 標籤的工具), 通常用於解謎或自訂地圖. |
| `spectator` | 旁觀模式. 玩家隱形且可穿透方塊飛行, 無法與世界進行任何實體或方塊互動, 但可切換視角觀察其他實體. |

---

### `targets`

> 決定要改變誰的遊戲模式.

* 僅能對玩家 (Player) 實體生效. 無法更改非玩家實體 (如怪物, 動物) 的遊戲模式.
* 若不填寫此參數, 系統預設會改變執行指令者本人的遊戲模式.
* 支援使用目標選擇器 (如 `@p`, `@a`, `@r`). 若選中多名玩家, 將會同時更改所有符合條件玩家的遊戲模式.

---

## 外部連結 (References)

* [Minecraft Wiki - /gamemode](https://zh.minecraft.wiki/w/%E5%91%BD%E4%BB%A4/gamemode)
* [目標選擇器 (Target Selectors)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/TargetSelectors.md)
* [物品 NBT 矩陣 (Items)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.NBT/list.md)