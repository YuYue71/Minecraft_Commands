# `/return`（函數回傳控制指令）
* > 用於在 `.mcfunction` 函數執行過程中，強行中斷後續命令並向調用端回傳一個指定的整數值
* > 支援直接回傳固定常數，或是透過子指令動態擷取其他指令的執行結果（如成功次數或數據值）進行回傳
* > 常用於函數的早期退出（Early Exit）、條件分支控制、邏輯閘運算回傳以及與 `/execute store` 搭配進行模組化變數傳遞

---

## 語法結構 (Syntax)
```commands id="return"
/return <值>
/return fail
/return run <指令>
```

---

## 參數與引數拆解 (Arguments)
> 詳細解構語法中出現的每一個變數之填寫規範與底層資料型態

| 參數名稱 | 功能與語義說明 |
| --- | --- |
| `[必填]` `<值>` | 指定函數要回傳的固定有號整數值（同時作為該函數的最終執行結果分數） |
| `[必填]` `fail` | 強行宣告該函數執行失敗，立即使函數終止並回傳值 `0`，且其執行成功狀態（Success Count）記為 `0` |
| `[必填]` `run` | 終端執行回傳子指令，先觸發後續的特定指令，並直接將該指令的執行結果（Result）或成功狀態（Success）作為函數的回傳值 |
| `[必填]` `<指令>` | 銜接在 `run` 後方要執行的常規 Minecraft 指令（如 `/data get`、`/scoreboard players get` 等） |

---

## 參數枚舉列表 (Parameter Enumeration)

### 回傳模式與控制流行為

| 參數 | 說明 |
| --- | --- |
| `/return <值>` | **立即中斷與數值回傳**：函數在此行直接終止，不再執行該檔案內下方的任何指令。調用端（如 `/execute store ... run function`）將精確接收到此 `<值>`。 |
| `/return fail` | **失敗退出**：等同於宣告函數異常或條件不符。立即退出函數，回傳值為 `0`。此模式常規用於檢驗前置條件（例如玩家特徵、道具數量不符時直接退出）。 |
| `/return run <指令>` | **動態委託回傳**：將控制權與回傳值綁定給後方指令。該指令執行後的回傳值（或成功次數）將直接成為此函數的最終回傳值，且同樣會引發函數立即退出。 |

---

## 數值規則

### 回傳值 (Return Value)

| 參數 | 說明 |
| --- | --- |
| `<值>` | 最小值：`-2147483648` / 最大值：`2147483647`（標準 32 位元有號整數範圍） / 支援負數：是 / 預設值：無（必須明確填寫） |

---

## 核心限制與控制流中斷規範
> `/return` 指令會直接干預遊戲引擎的函數解析佇列（Function Queue），必須遵循以下運行邏輯：

1. **行內後續阻斷**：
* 在同一個 `.mcfunction` 檔案中，一旦執行到 `/return`，其下方的所有命令將被引擎直接跳過（Unexecuted）。


2. **巨集與循環限制**：
* 若 `/return` 位於 `/execute as @e at @s run function ...` 等群體觸發的外部循環中，它僅會中止「當前這一個實體所觸發的函數實例」，不會影響其他並行實體的函數執行。
* 如果在同一個函數內使用控制流，`/return` 會打破當前的代碼區塊（Code Block）並逐層向上彈出，直到完全退出該 `.mcfunction` 檔案。



---

## 跨元素語法關聯表 (Links Matrix)

| 關聯參數欄位 | 參引語法元件名稱 |
| --- | --- |
| `run` 後接指令 | [複合執行與條件判定指令 (Execute)](https://www.google.com/search?q=https://github.com/YuYue71/Minecraft_Commands/blob/main/execute.md) |
| 控制流主體 | [函數執行指令 (Function)](https://www.google.com/search?q=https://github.com/YuYue71/Minecraft_Commands/blob/main/function.md) |