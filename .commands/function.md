# /function

> **分類:** `指令` | **權限等級:** `2` | **適用版本:** `JE ≤ 1.20.4` | **命令方塊:** `true`

---

## 目錄

* [語法](#語法-syntax)
* [參數說明](#參數說明-parameters)
  * [name](#name)
  * [arguments](#arguments-macro-arguments)
* [資料包結構參考 (Datapack Structure)](#資料包結構參考-datapack-structure)
* [外部連結](#外部連結-references)

---

## 語法 (Syntax)

```commands
/function <name>
/function <name> with block <pos> [<path>]
/function <name> with entity <target> [<path>]
/function <name> with storage <id> [<path>]
```

* `<>` = 必填, `[]` = 選填, `|` = 二擇一, `..` = 範圍 (如 `1..10`)

| 參數 / 欄位 | 類型 | 預設 | 說明 |
| --- | --- | --- | --- |
| `<name>` | `Resource Location` | - | 指定要執行的函式路徑 |
| `with` | `keyword` | - | (1.20+) 指定用於巨集 (Macro) 的參數來源 |
| `<pos>` | `Coordinate` | - | 作為參數來源的方塊座標 |
| `<target>` | `Target Selector` | - | 作為參數來源的實體 |
| `<id>` | `Resource Location` | - | 作為參數來源的全域儲存空間 ID |
| `[path]` | `NBT Path` | - | 指定來源資料中的特定 NBT 路徑 |

---

## 參數說明 (Parameters)

### `name`

> 指定欲執行的函式 (Function) 命名空間位置. 該函式包含一系列按順序執行的指令.

| 值 | 說明 |
| --- | --- |
| `<namespace>:<path>` | 函式的完整資源定位符 (預設值) |

---

### `arguments` (Macro Arguments)

> 在 1.20 及以上版本中, 可透過 `with` 關鍵字將 NBT 資料傳遞至具備巨集語法的函式中.

| 來源類型 | 說明 |
| --- | --- |
| `block` | 從方塊實體 (Block Entity) 讀取 NBT 作為參數. |
| `entity` | 從指定實體 (Entity) 讀取 NBT 作為參數. |
| `storage` | 從指定的全域儲存空間 (Command Storage) 讀取 NBT 作為參數. |

---

## 資料包結構參考 (Datapack Structure)

### 函式 (Functions)
函式檔案必須以 `.mcfunction` 為副檔名, 且每一行代表一條指令.
檔案位置應位於:
`data/<namespace>/functions/<path_to_file>.mcfunction`

**巨集 (Macro) 範例:**
若函式內容包含 `say $(value)`, 則執行 `/function example:test with storage example:data {value:"Hello"}` 時, `$(value)` 會被替換為 `Hello`.

---

## 外部連結 (References)

* [Minecraft Wiki - /function](https://zh.minecraft.wiki/w/%E5%91%BD%E4%BB%A4/function)
* [資源位置與命名空間規範 (Resource Locations)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/ResourceLocations.md)
* [目標選擇器 (Target Selectors)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/TargetSelectors.md)
* [座標系統 (Coordinate Systems)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/coordinates.md)
* [實體 NBT 矩陣 (Entities)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.NBT/list.md)
* [方塊實體 NBT 矩陣 (Block Entities)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.NBT/list.md)