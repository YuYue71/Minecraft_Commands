# functions (函式)

> **分類:** `資料包元素` | **檔案格式:** `mcfunction` | **命名空間支援:** `true` | **熱重載:** `/reload`

---

## 目錄

* [目錄路徑](#目錄路徑-directory--path)
* [核心結構](#核心結構-core-structure)
* [節點說明](#節點說明-node-explanations)
    * [指令與語法](#指令與語法)
    * [巨集系統 (Macros)](#巨集系統-macros)
* [外部連結](#外部連結-references)

---

## 目錄路徑 (Directory & Path)

> 說明該元素檔案在資料包內部的標準存放位置.

```file
data/<namespace>/functions/[子資料夾]/<檔案名稱>.mcfunction
```

* `<namespace>` = 命名空間 (如 `minecraft`, `example`)
* `[子資料夾]` = 開發者自訂的分類目錄 (選填)
* `<檔案名稱>` = 決定遊戲內調用該元素的 ID 名稱
* 遊戲內調用格式為: `<namespace>:[子資料夾/]<檔案名稱>` (例如 `example:magic/fireball`)

---

## 核心結構 (Core Structure)

> 函式由一系列純文字指令組成, 每行一條指令. 支援註解與 1.20+ 的巨集語法.

```mcfunction
# 這是註解 (Comment)
# 每一行代表一條指令
say 執行函式中...
execute as @a run particle flame ~ ~ ~ 0.5 0.5 0.5 0.1 10

# 巨集範例 (Macro) - 1.20+
$say 傳入的參數值為: $(value)
$give @s $(item){Count:1}
```

* 函式執行時具備原子性 (Atomicity), 所有指令會在同一個遊戲刻 (Tick) 內按順序執行.

| 語法元素 | 類型 | 說明 |
| --- | --- | --- |
| `#` | `Comment` | 註解行, 執行時會被忽略 |
| `$` | `Macro` | 巨集標記, 允許從 NBT 傳入參數 (1.20+) |
| `$(key)` | `Variable` | 巨集變數佔位符 |

---

## 節點說明 (Node Explanations)

### 指令與語法

> 函式內部的指令必須符合遊戲版本的語法規範.

| 屬性 | 說明 |
| --- | --- |
| `空行` | 執行時會被自動忽略, 用於增加代碼可讀性. |
| `執行上限` | 受遊戲規則 `maxCommandChainLength` 限制 (預設 65536). |
| `回傳值` | 可透過 `/return` 指令提前終止並傳回數值. |

---

### 巨集系統 (Macros)

> 於 JE 1.20 引進, 允許動態替換指令中的部分內容.

| 組件 | 說明 |
| --- | --- |
| `引導符 $` | 必須位於指令行的最開頭. |
| `定義變數` | 使用 `$(var_name)` 格式. |
| `呼叫方式` | 必須配合 `/function <id> with <source>` 語法傳遞 NBT 資料. |

---

## 外部連結 (References)

* [Minecraft Wiki - Function](https://minecraft.fandom.com/zh/wiki/Java%E7%89%88%E5%87%BD%E6%95%B0)
* [Misode Data Pack Generators - Function](https://misode.github.io/function/)
* [目標選擇器 (Target Selectors)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/TargetSelectors.md)
* [座標系統 (Coordinate Systems)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/coordinates.md)
* [資源位置與命名空間規範 (Resource Locations)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/ResourceLocations.md)
* [實體 NBT 矩陣 (Entities)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.NBT/list.md)
* [方塊實體 NBT 矩陣 (Block Entities)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.NBT/list.md)
* [物品 NBT 矩陣 (Items)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.NBT/list.md)
* [函式指令 (function)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.commands/function.md)