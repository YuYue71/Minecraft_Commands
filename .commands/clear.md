# /clear

> **分類:** `指令` | **權限等級:** `2` | **適用版本:** `JE ≤ 1.20.4` | **命令方塊:** `true`

---

## 目錄

* [語法](#語法-syntax)
* [參數說明](#參數說明-parameters)
    * [targets](#targets)
    * [item](#item)
    * [maxCount](#maxcount)
* [外部連結](#外部連結-references)

---

## 語法 (Syntax)

```commands
/clear
/clear [targets]
/clear [targets] [item]
/clear [targets] [item] [maxCount]

```

* `[]` = 選填. 若不輸入任何參數, 預設將清空執行者本身背包內的所有物品.

| 參數 / 欄位 | 類型 | 預設 | 說明 |
| --- | --- | --- | --- |
| `[targets]` | `entity` | 執行者本身 | 欲清除背包物品的目標玩家或實體 |
| `[item]` | `item_predicate` | 所有物品 | 欲清除的特定物品種類或標籤 |
| `[maxCount]` | `int` | `-1` (無上限) | 限制最多清除該物品的數量 |

---

## 參數說明 (Parameters)

### `targets`

> 決定被清除物品的目標實體.

* 通常對玩家 (包含離線玩家) 使用. 若目標擁有背包 (例如裝備有箱子的驢子, 或某些能拾取物品的怪物), 也能清除其身上的物品.
* 支援使用目標選擇器 (如 `@p`, `@a`).

---

### `item`

> 指定欲清除的特定物品.

* 若不填寫此參數, 系統將無差別清空玩家背包內的所有東西 (包含裝備欄與副手欄).
* 支援輸入單一物品的資源位置 (如 `minecraft:diamond`), 或是使用物品標籤一次清除一整個類別的物品 (如 `#minecraft:logs` 代表清除所有種類的原木).
* 支援結合 NBT 標籤進行精準過濾. 例如 `minecraft:diamond_sword{Damage:0}` 只會清除毫無耗損的全新鑽石劍, 而不會影響玩家身上已經用過的鑽石劍.

---

### `maxCount`

> 控制清除數量的上限與特殊探測用法.

* 填入大於 `0` 的整數: 伺服器會從玩家背包中扣除指定數量的該物品. 如果玩家身上的數量少於此數值, 則全數扣除.
* **特殊用法 (填入 `0`)**: 若將數量設為 `0` (例如 `/clear @p minecraft:apple 0`), 指令將**不會**實際拿走玩家的任何蘋果. 相反地, 伺服器會單純「掃描」玩家背包, 若有蘋果則指令執行成功並回傳數量, 若無則執行失敗. 這個技巧極常被用於指令方塊或資料包中, 作為搭配 `execute` 的物品條件檢測器.

---

## 外部連結 (References)

* [Minecraft Wiki - /clear](https://zh.minecraft.wiki/w/%E5%91%BD%E4%BB%A4/clear)
* [Minecraft Wiki - 方塊物品ID](https://zh.minecraft.wiki/w/Java%E7%89%881.13/%E6%89%81%E5%B9%B3%E5%8C%96#%E6%96%B9%E5%9D%97%E5%92%8C%E7%89%A9%E5%93%81ID)
* [目標選擇器 (Target Selectors)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/TargetSelectors.md)
* [資源位置與命名空間規範 (Resource Locations)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/ResourceLocations.md)
* [物品 NBT 矩陣 (Items)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.NBT/list.md)