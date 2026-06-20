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

| 參數名稱 | 功能與語義說明 |
| --- | --- |
| `[必填]` `<函數名稱>` | 指定要執行的函數命名空間路徑（格式為 `命名空間:函數檔案路徑`） |
| `[選填]` `with` | 巨集啟用關鍵字，宣告後續要將特定 NBT 資料結構傳遞給該函數作為內部巨集變數使用 |
| `[必填]` `block` | 指定從世界中的特定方塊實體（如箱子、命令方塊、熔爐）讀取 NBT 資料源 |
| `[必填]` `entity` | 指定從遊戲世界中的特定實體（如生物、盔甲架、玩家）讀取 NBT 資料源 |
| `[必填]` `storage` | 指定從全域獨立儲存空間（Storage）讀取 NBT 資料源 |
| `[必填]` `<座標>` | 標記方塊實體在三維空間中的精確世界座標（支援絕對與相對 `~` 座標） |
| `[必填]` `<目標>` | 指定要讀取其 NBT 的目標實體選擇器（如 `@e[type=armor_stand,limit=1]`） |
| `[必填]` `<資料夾名稱>` | 全域獨立儲存空間的命名空間識別碼（Storage ID，格式為 `命名空間:路徑`） |
| `[必填]` `<路徑>` | 指定 NBT 內部的特定標籤節點路徑，對應的節點必須是一個複合標籤（Compound） |

---

## 巨集數據傳遞機制 (Macro Arguments)
> 使用 `with` 時，NBT 路徑下的所有鍵值對會映射為該函數檔案內部的巨集引數。

* **函數內部寫法範例 (`spawn_mob.mcfunction`)**：
    * `summon $(mob_type) ~ ~ ~ {Health:$(hp)f}`
* **數據映射對應表**：
    | 傳入 NBT 鍵值 | 函數內部對應 | 說明 |
    |:---|:---|:---|
    | `mob_type: "minecraft:zombie"` | `$(mob_type)` | 替換生物實體識別碼 |
    | `hp: 100` | `$(hp)` | 替換生命值數值 |

---

## 資料包 (Datapack) 開發標準流程

要使 `/function` 正常運作，請嚴格遵守以下開發架構：

1. **建立根目錄**：在 `world/datapacks/` 下建立資料夾（如 `my_project`）。
2. **設定清單**：在根目錄建立 `pack.mcmeta`，定義 `pack_format`（如 48）。
3. **定義路徑**：建立 `data/<命名空間>/function/` 檔案路徑（**註：資料夾名必須為單數 `function**`）。
4. **編寫邏輯**：在 `function/` 內撰寫 `.mcfunction` 檔案，每行寫入一條指令。
5. **載入與校驗**：輸入 `/reload`，並使用 `/function <命名空間>:` 加按 `Tab` 鍵驗證路徑。

---

## 核心執行規則與引擎邊界

### 1. 執行負載限制 (Command Limits)

* **最大指令行數 (`maxCommandChainLength`)**：預設 `65536`。當單次執行中觸發的指令總量（含連鎖與遞迴）超過此數值，引擎將強制停止以防止伺服器崩潰。
* **開發提示**：大規模邏輯應透過拆分函數來分散負載。

### 2. 遞迴呼叫限制 (Recursion Limit)

* **最大堆疊深度**：`100` 層。函數間的巢狀調用（如 A -> B -> C...）若超過 100 層，超出部分的指令將被忽略。

---

## 跨元素語法關聯表 (Links Matrix)

| 關聯參數欄位 | 參引語法元件名稱 |
| --- | --- |
| `<目標>` | [目標選擇器 (Target Selectors)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/target_selectors.md) |
| `<座標>` | [空間座標系統全指南 (Coordinates)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/coordinates.md) |
| 關於函式 | [function/](https://github.com/YuYue71/Minecraft_Commands/blob/main/.mcpack/data/function.md) |
| 資料包 | [資料包編寫說明 (Data package preparation)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.mcpack/illustrate.md) |