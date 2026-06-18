# `/teammsg`（隊伍訊息指令）
* > 用於向執行指令者當前所屬隊伍的所有成員發送私密訊息
* > 只有與發送者處於同一個 Scoreboard 隊伍（Team）的玩家才能看見該訊息
* > 常用於多人對抗地圖、PVP 競賽、團隊副本內部的指令自動化溝通與戰術通報

---

## 語法結構 (Syntax)
```commands id="teammsg"
/teammsg <訊息>
```

---

## 縮寫別名 (Aliases)

```commands id="tm"
/tm <訊息>

```

---

## 參數與引數拆解 (Arguments)
> 詳細解構語法中出現的每一個變數之填寫規範與底層資料型態

| 參數名稱 | 功能與語義說明 |
| --- | --- |
| `[必填]` `<訊息>` | 要發送給同隊成員的文字內容。若執行者當下未加入任何隊伍，指令將拒絕執行並拋出錯誤提示 |

---

## 參數枚舉列表 (Parameter Enumeration)

### 訊息

| 參數 | 說明 |
| --- | --- |
| `<文字內容>` | 自由輸入的純文字字串，支援包含空格的多個單字 |
| `<目標選擇器>` | 支援在訊息中嵌入目標選擇器（例如輸入 `目前擊殺目標為 @p`，執行時會自動將 `@p` 解析為符合條件的玩家名稱） |

---

## 運作邏輯與邊界行為

### 執行限制與規則

* **隊伍依賴性**：執行此指令的實體（玩家或經由 `execute as` 指定的實體）必須已加入某個 Scoreboard 隊伍。若無隊伍，系統會回傳錯誤訊息。
* **命令方塊限制**：若由命令方塊或伺服器主控台直接執行此指令，由於其本身不屬於任何隊伍，除非透過 `/execute as <玩家> run teammsg <訊息>` 進行身分偽裝，否則無法直接發送。
* **文字格式化**：接收到的隊伍訊息在聊天欄中通常會帶有特殊的隊伍前後綴（例如 `[隊伍名稱] <玩家名> 訊息內容`），且文字顏色會自動匹配該隊伍所設定的代表顏色。

---

## 跨元素語法關聯表 (Links Matrix)

| 關聯參數欄位 | 參引語法元件名稱 |
| --- | --- |
| `<訊息>`（內嵌選擇器時） | [目標選擇器 (Target Selectors)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/target_selectors.md) |
| `<訊息>` | [聊天與文本系統 (Chat and Text System)](https://www.google.com/search?q=https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/chat_system.md) |