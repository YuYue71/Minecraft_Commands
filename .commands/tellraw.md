以下是完全符合你專案規格的 `/tellraw` 指令說明文件：

# `/tellraw`（不經格式化私訊指令）

* > 用於向指定玩家發送高度自訂化的 JSON 文本訊息


* > 與 `/tell` 不同，此指令不會自動附加發送者的名稱前綴（例如 `[玩家 -> 你]`），且完全支援顏色、加粗、點擊事件、懸浮提示及動態變數


* > 常用於地圖製作、RPG 劇本對話、互動式選單、伺服器 UI 公告與高階動態提示系統



---

## 語法結構 (Syntax)

```commands id="tellraw"
/tellraw <目標> <JSON訊息>

```

---

## 參數與引數拆解 (Arguments)

> 詳細解構語法中出現的每一個變數之填寫規範與底層資料型態

| 參數名稱 | 功能與語義說明 |
| --- | --- |
| `[必填]` `<目標>` | 指定要接收此 JSON 訊息的目標玩家（支援玩家名稱或目標選擇器） |
| `[必填]` `<JSON訊息>` | 符合 Minecraft Raw JSON 文字元件規範的字串（必須以大括號 `{}` 或中括號外加引號包裹，但不得使用專案禁止的獨立中括號修飾符） |

---

## 參數枚舉列表 (Parameter Enumeration)

### JSON 訊息核心鍵值對（Key-Value）

| 鍵名 (Key) | 值型態 (Value Type) | 語義與功能說明 |
| --- | --- | --- |
| `text` | 字串 | 直接顯示的純文字內容 |
| `selector` | 字串（目標選擇器） | 動態顯示符合選擇器條件的實體/玩家名稱（如 `@p`） |
| `score` | JSON 物件 | 動態顯示指定實體在特定記分板上的分數（內含 `name` 與 `objective`） |
| `storage` | 字串（命名空間） | 配合 `nbt` 鍵名，動態讀取並顯示 Data Storage 內的特定資料 |
| `color` | 字串（顏色名稱/十六進位） | 設定文字顏色（如 `red`、`gold` 或 `#FF5555`） |
| `bold` | 布林值 (`true`/`false`) | 是否加粗文字 |
| `italic` | 布林值 (`true`/`false`) | 是否傾斜文字 |
| `underlined` | 布林值 (`true`/`false`) | 是否加上底線 |
| `strikethrough` | 布林值 (`true`/`false`) | 是否加上刪除線 |
| `obfuscated` | 布林值 (`true`/`false`) | 是否將文字變為隨機亂碼（麥塊魔幻字體） |
| `clickEvent` | JSON 物件 | 點擊文字時觸發的事件（內含 `action` 與 `value`） |
| `hoverEvent` | JSON 物件 | 滑鼠懸浮在文字上時顯示的提示（內含 `action` 與 `contents`） |
| `extra` | JSON 陣列 | 巢狀附加其他不同樣式的文字元件 |

---

## Raw JSON 語法範例

### 1. 帶顏色與樣式的純文字

```json
{"text":"歡迎來到地下城！","color":"red","bold":true}

```

### 2. 動態帶入最近玩家名稱與點擊指令選單

```json
{"text":"點擊這裡傳送給 ","color":"gray","extra":[{"selector":"@p","color":"gold"},{"text":" [傳送]","color":"green","clickEvent":{"action":"run_command","value":"/tp @p"}}]}

```

### 3. 動態顯示記分板數值

```json
{"text":"你的當前金幣：","color":"yellow","extra":[{"score":{"name":"@s","objective":"money"},"color":"gold"}]}

```

---

## 邊界行為與錯誤處理

* **格式嚴格度**：若傳入的 JSON 訊息語法有誤（例如缺少雙引號、括號未對齊），指令將拒絕執行並在控制台拋出 `Invalid chat component` 解析錯誤。
* **純淨輸出**：若僅輸入 `{"text":"Hello"}`，聊天欄只會乾淨地顯示 `Hello`，不帶任何發送者身分（哪怕是由命令方塊執行，也不會出現 `[@]` 前綴）。
* **權限限制**：透過 `clickEvent` 執行的 `run_command`，其執行權限取決於「點擊該文字的玩家本身權限」，而非發送指令的命令方塊。若普通玩家點擊了內含 `/stop` 的文字，將會因權限不足而無法觸發。

---

## 跨元素語法關聯表 (Links Matrix)

| 關聯參數欄位 | 參引語法元件名稱 |
| --- | --- |
| `<目標>` | [目標選擇器 (Target Selectors)](https://www.google.com/search?q=https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/target_selectors.md) |
| `<JSON訊息>` | [文本NBT標籤](https://github.com/YuYue71/Minecraft_Commands/blob/main/.data_structures/nbt_legacy/text_components_legacy.md) |