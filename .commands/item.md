# /item

> **分類:** `指令` | **權限等級:** `2` | **適用版本:** `JE ≤ 1.20.4` | **命令方塊:** `true`

---

## 目錄

* [語法](#語法-syntax)
* [參數說明](#參數說明-parameters)
    * [目標類型 (block, entity)](#目標類型-block-entity)
    * [動作類型 (replace, modify)](#動作類型-replace-modify)
    * [slot](#slot)
    * [modifier](#modifier)
* [外部連結](#外部連結-references)

---

## 語法 (Syntax)

```commands
/item block <pos> <slot> replace <item> [count]
/item block <pos> <slot> modify <modifier>
/item entity <targets> <slot> replace <item> [count]
/item entity <targets> <slot> modify <modifier>

```

* `<>` = 必填, `[]` = 選填

| 參數 / 欄位 | 類型 | 預設 | 說明 |
| --- | --- | --- | --- |
| `block` / `entity` | `enum` | - | 決定要操作方塊容器或實體的物品欄 |
| `<pos>` | `vec3` | - | 欲修改的目標方塊座標 |
| `<targets>` | `entity` | - | 欲修改的目標實體 |
| `<slot>` | `string` | - | 指定要操作的特定物品欄位代碼 |
| `replace` / `modify` | `enum` | - | 決定直接替換新物品或修改現有物品 |
| `<item>` | `item_stack` | - | 欲放置的新物品 ID (可包含 NBT 標籤) |
| `[count]` | `int` | `1` | 欲放置的新物品總數 |
| `<modifier>` | `string` | - | 欲套用在現存物品上的修飾器資源位置 |

---

## 參數說明 (Parameters)

### `目標類型 (block, entity)`

> 決定此指令的修改對象是方塊還是活動實體.

* `block`: 目標必須是帶有物品欄的方塊實體 (Block Entity), 例如箱子, 熔爐, 漏斗或發射器. 若輸入的座標為一般無實體方塊 (如石頭), 指令將會報錯失敗.
* `entity`: 目標必須是帶有裝備欄或背包的實體 (如玩家, 殭屍, 盔甲座, 驢子). 支援使用目標選擇器 (如 `@p`, `@e`).

---

### `動作類型 (replace, modify)`

> 決定對該欄位執行的具體操作.

* `replace`: 覆蓋模式. 會直接將指定欄位內原有的物品清除, 並替換為 `<item>` 參數所定義的新物品與數量 `<count>`. 類似於舊版 (1.17 以前) 的 `/replaceitem` 功能.
* `modify`: 修改模式. 不會直接替換物品, 而是針對該欄位內「原本就存在的物品」套用一個資料包修飾器 (Item Modifier). 若該欄位為空, 則此動作無效.

---

### `slot`

> 精確指定要修改的物品欄位位置.

* 必須輸入標準的欄位代碼字串, 例如 `armor.head` (頭盔欄位), `weapon.mainhand` (主手), `container.0` (容器的第一格).
* 不同的實體與方塊支援的欄位代碼不同. 例如殭屍不支援 `container` 系列, 而箱子不支援 `armor` 系列.
* 詳細的欄位代碼清單請參見下方的外部連結規範.

---

### `modifier`

> 修改模式下調用的資料包腳本.

* 必須輸入標準的資源位置 (如 `minecraft:furnace_smelt`).
* 物品修飾器 (Item Modifier) 是透過資料包 (Datapack) 自訂的 JSON 檔案, 可以對目標物品執行複雜的運算, 例如: 增加附魔, 修改 NBT 標籤, 轉換物品類型 (如熔煉), 或根據特定條件動態改變數量.

---

## 外部連結 (References)

* [Minecraft Wiki - /item](https://zh.minecraft.wiki/w/%E5%91%BD%E4%BB%A4/item)
* [Minecraft Wiki - 方塊物品ID](https://zh.minecraft.wiki/w/Java%E7%89%881.13/%E6%89%81%E5%B9%B3%E5%8C%96#%E6%96%B9%E5%9D%97%E5%92%8C%E7%89%A9%E5%93%81ID)
* [目標選擇器 (Target Selectors)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/TargetSelectors.md)
* [座標系統 (Coordinate Systems)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/coordinates.md)
* [資源位置與命名空間規範 (Resource Locations)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/ResourceLocations.md)
* [物品欄位編號 (Slot IDs)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/Slot_IDs.md)
* [物品 NBT 矩陣 (Items)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.NBT/list.md)