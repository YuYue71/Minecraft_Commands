# /data

> **分類:** `指令` | **權限等級:** `2` | **適用版本:** `JE ≤ 1.20.4` | **命令方塊:** `true`

---

## 目錄

* [語法](#語法-syntax)
* [參數說明](#參數說明-parameters)
*   [目標類型 (Target Types)](#目標類型-target-types)
*   [操作模式 (Operations)](#操作模式-operations)
*   [modify 運算邏輯 (Modify Operations)](#modify-運算邏輯-modify-operations)
*   [modify 資料來源 (Modify Sources)](#modify-資料來源-modify-sources)
* [外部連結](#外部連結-references)

---

## 語法 (Syntax)

```commands
/data get block <pos> [path] [scale]
/data get entity <target> [path] [scale]
/data get storage <id> [path] [scale]
/data merge block <pos> <nbt>
/data merge entity <target> <nbt>
/data merge storage <id> <nbt>
/data modify block <pos> <targetPath> <operation> <source>
/data modify entity <target> <targetPath> <operation> <source>
/data modify storage <id> <targetPath> <operation> <source>
/data remove block <pos> <path>
/data remove entity <target> <path>
/data remove storage <id> <path>
```

* `<>` = 必填, `[]` = 選填, `\|` = 二擇一

| 參數 / 欄位 | 類型 | 預設 | 說明 |
| --- | --- | --- | --- |
| `get | merge | modify | remove` | `enum` | `-` | 決定對 NBT 資料執行的操作類型 |
| `block | entity | storage` | `enum` | `-` | 欲操作的 NBT 目標屬性分類 |
| `<pos>` | `vec3` | `-` | 目標方塊實體的三維座標 |
| `<target>` | `entity` | `-` | 目標實體 (必須限制為單一實體) |
| `<id>` | `string` | `-` | 虛擬存儲的資源位置 (Resource Location) |
| `[path]` / `<targetPath>` | `string` | `-` | 指定的精確 NBT 節點路徑 (NBT Path) |
| `[scale]` | `float` | `1.0` | 數值回傳時的乘算放大倍率 |
| `<nbt>` | `nbt` | `-` | 欲寫入或合併的 NBT 複合標籤資料 |
| `<operation>` | `enum` | `-` | modify 模式下的具體修改邏輯 |
| `<source>` | `enum` | `-` | modify 模式下的資料來源分支 |

---

## 參數說明 (Parameters)

### `目標類型 (Target Types)`

> 決定系統要去哪裡尋找並讀寫 NBT 資料.

| 值 | 說明 |
| --- | --- |
| `block` | 針對具有額外資料庫的方塊實體 (Block Entity) 進行操作 (例如箱子, 告示牌). 留意一般方塊 (如石頭) 不具備 NBT. |
| `entity` | 針對活動實體進行操作. 注意: 玩家 (Player) 的 NBT 資料僅允許使用 get 讀取, 絕對無法透過指令修改. |
| `storage` | 虛擬存儲 (Storage). 指令系統專屬的全域資料庫. 不綁定於實體或方塊, 跨維度皆可調用. |

---

### `操作模式 (Operations)`

> 決定對目標的 NBT 資料執行何種動作.

| 值 | 說明 |
| --- | --- |
| `get` | 讀取並於聊天框回傳 NBT 數值或結構. 搭配 `[scale]` 可將小數點數值放大為整數以供計分板擷取. |
| `merge` | 將輸入的 NBT 複合標籤與目標現有的根 NBT 合併. 若鍵值已存在則覆寫, 若不存在則自動新增. |
| `remove` | 徹底刪除指定 NBT 路徑 `<path>` 上的所有資料結構或特定元素. |
| `modify` | 允許深入特定的清單 (List) 內部, 進行精確的節點替換, 插入, 甚至從其他目標複製資料. |

---

### `modify 運算邏輯 (Modify Operations)`

> 當使用 modify 模式時, 決定來源資料要如何整合進目標路徑中.

| 值 | 說明 |
| --- | --- |
| `set` | 完全覆寫目標路徑上的現有資料為來源資料. |
| `merge` | 限定於指定的深層目標路徑內進行合併覆寫. 目標路徑與來源資料都必須是複合標籤. |
| `append` | 將來源資料作為新的獨立元素, 直接新增至目標清單的最尾端. |
| `prepend` | 將來源資料作為新的獨立元素, 直接新增至目標清單的最前端. |
| `insert` | 將來源資料強制插入至目標清單的特定索引位置 (需於指令後方附加索引數值 `<index>`). |

---

### `modify 資料來源 (Modify Sources)`

> 銜接在運算邏輯後方的分支, 決定要寫入的新資料從何而來.

| 值 | 說明 |
| --- | --- |
| `value <nbt>` | 直接以手動輸入的方式, 寫入一段固定的 NBT 數值, 字串或結構. |
| `from <類型> <目標> [path]` | 從另一個方塊, 實體或存儲中, 擷取指定路徑的資料並原封不動地複製過來. |
| `string <類型> <目標> [path] [start] [end]` | 從來源中讀取資料, 並強制將其轉換為純文字的字串 (String) 型態. 可利用附加參數擷取特定字元片段. |

---

## 外部連結 (References)

* [Minecraft Wiki - /data](https://zh.minecraft.wiki/w/%E5%91%BD%E4%BB%A4/data)
* [目標選擇器 (Target Selectors)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/TargetSelectors.md)
* [座標系統 (Coordinate Systems)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/coordinates.md)
* [資源位置與命名空間規範 (Resource Locations)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/ResourceLocations.md)
* [實體 NBT 矩陣 (Entities)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.NBT/list.md)
* [方塊實體 NBT 矩陣 (Block Entities)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.NBT/list.md)