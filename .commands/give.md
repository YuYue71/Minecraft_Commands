# /give

> **分類:** `指令` | **權限等級:** `2` | **適用版本:** `JE ≤ 1.20.4` | **命令方塊:** `true`

---

## 目錄

* [語法](#語法-syntax)
* [參數說明](#參數說明-parameters)
    * [targets](#targets)
    * [item](#item)
    * [count](#count)
* [外部連結](#外部連結-references)

---

## 語法 (Syntax)

```commands
/give <targets> <item> [count]

```

* `<>` = 必填, `[]` = 選填

| 參數 / 欄位 | 類型 | 預設 | 說明 |
| --- | --- | --- | --- |
| `<targets>` | `entity` | - | 欲給予物品的目標玩家 |
| `<item>` | `item_stack` | - | 欲給予的物品 ID (可包含 NBT 標籤) |
| `[count]` | `int` | `1` | 欲給予的物品數量 |

---

## 參數說明 (Parameters)

### `targets`

> 決定要發放物品給誰.

* 僅能對玩家 (Player) 實體生效. 無法給予非玩家實體 (如殭屍, 盔甲座) 物品. 若要強制修改非玩家實體的裝備或手持物品, 應使用 `/item` 或 `/data` 指令.
* 支援使用目標選擇器 (如 `@p`, `@a`, `@r`). 若同時選中多名玩家, 將會一併給予所有符合條件的玩家該物品.

---

### `item`

> 指定要給予的物品種類與附加資料.

* 必須輸入標準的物品資源位置 (如 `minecraft:diamond_sword`).
* 高度依賴 NBT 結構. 支援在物品 ID 後方直接串接 NBT 標籤 (如 `minecraft:iron_sword{Damage:10,display:{Name:'{"text":"Custom Sword"}'}}`), 用於生成包含自訂名稱, 特殊附魔, 屬性修飾符 (Attribute Modifiers) 或是預先受損的客製化裝備.
* 與 `/clear` 指令不同, 此處的 `<item>` 參數不支援使用物品標籤 (如 `#minecraft:logs`) 來隨機或批量給予該類別下的物品, 必須指定單一且明確的實體物品 ID.

---

### `count`

> 設定要發放的物品總數.

* 必須為大於 `0` 的有效整數.
* 若未填寫此參數, 系統預設只會給予 `1` 個該物品.
* 允許給予的數量超過該物品在原版生存模式下的單組堆疊上限 (例如一次給予 `100` 把鐵劍, 或是 `1000` 顆鑽石). 伺服器會自動將這些物品進行分組, 並依序填滿玩家背包內的空位.
* 若發放的總數超出了玩家背包所能容納的最大極限, 多出來無法塞入背包的物品將會直接以掉落物 (Item Entity) 的形式生成在該玩家的腳下.

---

## 外部連結 (References)

* [Minecraft Wiki - /give](https://zh.minecraft.wiki/w/%E5%91%BD%E4%BB%A4/give)
* [目標選擇器 (Target Selectors)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/TargetSelectors.md)
* [資源位置與命名空間規範 (Resource Locations)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/ResourceLocations.md)
* [物品 NBT 矩陣 (Items)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.NBT/list.md)