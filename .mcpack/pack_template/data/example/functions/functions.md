# functions (函式腳本)

> **分類:** `函式巨集` | **檔案格式:** `mcfunction` | **適用版本:** `JE ≤ 1.20.4` | **熱重載:** `/reload`

---

## 目錄

* [1. 目錄路徑 (Directory & Path)](#1-目錄路徑-directory--path)
* [2. 語法規範 (Syntax Rules)](#2-語法規範-syntax-rules)
* [3. 執行環境與上下文 (Execution Context)](#3-執行環境與上下文-execution-context)
* [4. 標籤調用 (Function Tags)](#4-標籤調用-function-tags)
* [5. 外部連結 (References)](#5-外部連結-references)

---

## 1. 目錄路徑 (Directory & Path)

> 定義函式檔案在資料包中的物理位置與遊戲內調用路徑.

```file
data/<namespace>/functions/[子資料夾]/<檔案名稱>.mcfunction
```

* `<namespace>`: 命名空間 (如 `minecraft`, `example`).
* `[子資料夾]`: 可選, 用於指令腳本的分類管理.
* 調用指令: `/function <namespace>:[子資料夾]/<檔案名稱>`.
* 標籤調用: `/function #<namespace>:[子資料夾]/<標籤名稱>`.

---

## 2. 語法規範 (Syntax Rules)

> 函式檔案為純文字格式, 每行指令皆在同一遊戲刻 (Tick) 內按順序執行.

* **基本語法**: 每行僅限一條指令, 且指令前綴 **禁止** 加上斜線 `/`.
* **註釋規範**: 以 `#` 開頭的行會被視為註釋, 系統將自動忽略不執行.
* **空白行**: 允許使用空白行分隔邏輯區塊, 不會影響指令執行效能.
* **指令上限**: 單次函式調用的指令執行總量受遊戲規則 `maxCommandChainLength` 限制 (預設為 65536 條).
* **巨集 (Macros)**: (1.20.2+) 支援以 `$` 開頭的行, 並透過 `$(變數名)` 接收來自 NBT 的動態參數.

---

## 3. 執行環境與上下文 (Execution Context)

> 函式執行時會繼承調用者的狀態, 除非透過 `execute` 指令重新定義.

* **執行者 (Executor)**: 預設為執行 `/function` 指令的實體、命令方塊或伺服器後台.
* **座標與維度**: 預設繼承執行者當前所在的座標、朝向與維度.
* **權限等級**: 函式內的指令執行權限通常與調用源相同.
* **上下文偏移**: 常用 `/execute as <實體> at @s run function <路徑>` 來切換執行環境.

---

## 4. 標籤調用 (Function Tags)

> 透過 JSON 標籤將多個函式組合成一個組, 實現批量執行或系統事件掛載.

* **標籤路徑**: `data/<namespace>/tags/functions/<標籤名稱>.json`.
* **預設保留標籤**:
    * `minecraft:tick`: 每遊戲刻自動執行一次 (每秒 20 次). 常見於偵測邏輯與計時器.
    * `minecraft:load`: 世界載入或執行 `/reload` 時自動執行一次. 常見於初始化計分板或系統宣告.

---

## 5. 外部連結 (References)

* [Misode Data Pack Generators - Function](https://misode.github.io/function/)
* [Minecraft Wiki - Functions](https://zh.minecraft.wiki/)
* [資源位置與命名空間規範 (Resource Locations)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/ResourceLocations.md)
* [相關指令: /function](https://github.com/YuYue71/Minecraft_Commands/blob/main/.commands/function.md)
* [相關指令: /execute](https://github.com/YuYue71/Minecraft_Commands/blob/main/.commands/execute.md)
* [相關指令: /reload](https://github.com/YuYue71/Minecraft_Commands/blob/main/.commands/reload.md)