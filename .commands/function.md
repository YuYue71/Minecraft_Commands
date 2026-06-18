# `/function`（函數執行指令）
* > 用於調用並執行指定命名空間下的 `.mcfunction` 文字檔案（即一連串命令的集合）
* > 支援傳入 NBT 資料作為變數，進而動態生成並執行包含巨集變數（`$(變數名)`）的自訂指令
* > 常用於模組化指令結構、降低命令方塊使用量、提高伺服器運作效能與建構高階動態 RPG 系統

---

## 語法結構 (Syntax)
```commands id="function"
/function <函數名稱>
/function <函數名稱> with block <座標> <路徑>
/function <函數名稱> with entity <目標> <路徑>
/function <函數名稱> with storage <資料夾名稱> <路徑>
```

---

## 參數與引數拆解 (Arguments)
> 詳細解構語法中出現的每一個變數之填寫規範與底層資料型態

| 參數名稱 | 功能與語義說明 |
| --- | --- |
| `[必填]` `<函數名稱>` | 指定要執行的函數命名空間路徑（格式為 `命名空間:函數檔案路徑`） |
| `[選填]` `with` | 巨集啟用關鍵字，宣告後續要將特定 NBT 資料結構傳遞給該函數作為內部巨集變數使用 |
| `[必填]` `block` | 指定從世界中的特定方塊實體（如箱子、命令方塊、熔爐）讀取 NBT 資料源 |
| `[必填]` `entity` | 指定從遊戲世界中的特定實體（如生物、盔甲架、玩家）讀取 NBT 資料源 |
| `[必填]` `storage` | 指定從全域獨立儲存空間（Storage）讀取 NBT 資料源 |
| `[必填]` `<座標>` | 標記方塊實體在三維空間中的精確世界座標（支援绝对座標與相對座標 `~`） |
| `[必填]` `<目標>` | 指定要讀取其 NBT 的目標實體選擇器（如 `@e[type=armor_stand,limit=1]`） |
| `[必填]` `<資料夾名稱>` | 全域獨立儲存空間的命名空間識別碼（Storage ID，格式為 `命名空間:路徑`） |
| `[必填]` `<路徑>` | 指定 NBT 內部的特定標籤節點路徑，對應的節點必須是一個複合標籤（Compound） |

---

## 參數枚舉列表 (Parameter Enumeration)

### 函數名稱路徑規範

| 參數 | 說明 |
| --- | --- |
| `<命名空間>:<路徑>` | 函數檔案儲存於資料包（Data Pack）內部的路徑。例如 `minecraft:tick`、`custom_rpg:skills/fireball`（對應資料包中 `data/custom_rpg/functions/skills/fireball.mcfunction` 檔案） |

### 巨集數據傳遞機制 (Macro Arguments)
> 當使用 `with` 子指令時，目標 NBT 路徑下的所有鍵值對（Key-Value Pairs）會被自動映射為該函數檔案內部的巨集引數。

#### 函數內部接收寫法範例：

```commands id="function_macro_example"
# 在 custom_rpg:spawn_mob.mcfunction 檔案內部
summon $(mob_type) ~ ~ ~ {Health:$(hp)f}
```

#### 外部 NBT 資料源欄位對應表（傳入範例）：

| 傳入 NBT 鍵值 | 資料型態 | 函數內部對應巨集代換 | 說明 |
| --- | --- | --- | --- |
| `mob_type: "minecraft:zombie"` | 雙引號字串 (String) | `$(mob_type)` $\rightarrow$ `minecraft:zombie` | 替換要召喚的生物種類識別碼 |
| `hp: 100` | 整數/浮點數 (Number) | `$(hp)` $\rightarrow$ `100` | 替換生物底層的健康度數值 |

---

## 數值規則與引擎硬性限制

### 1. 單次執行上限 (Command Limit)
* > **最大指令行數限制**：由遊戲規則 `maxCommandChainLength` 進行全域控制。
* > **預設值**：`65536`。
* > **機制說明**：當單次 `/function` 調用中觸發的所有連鎖指令、循環邏輯或遞迴調用的總行數超過此設定值時，遊戲引擎會強行終止該函數的後續指令執行，以防止伺服器死鎖或崩潰（Crash）。

### 2. 遞迴呼叫限制 (Recursion Limit)
* > **最大堆疊深度**：`100` 層。
* > **機制說明**：函數內部若呼叫自身（遞迴）或呼叫其他函數，其巢狀堆疊深度上限為 100 層。超過此限制時，超出部分的調用會被直接拒絕。

---

## 跨元素語法關聯表 (Links Matrix)

| 關聯參數欄位 | 參引語法元件名稱 |
| --- | --- |
| `<目標>` | [目標選擇器 (Target Selectors)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/target_selectors.md) |
| `<座標>` | [空間座標系統全指南 (Coordinates)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/coordinates.md) |