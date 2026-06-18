# `/me`（動作敘述指令）
* > 用於在聊天欄中以第三人稱視角發送一段關於自己的動作敘述
* > 常用於角色扮演（RP）、增添聊天趣味或強調玩家當前的行為狀態
* > 訊息會發送給全世界或當前維度的所有玩家

---

## 語法結構 (Syntax)
```commands id="me0"
/me <訊息>
```

---

## 參數與引數拆解 (Arguments)
> 詳細解構語法中出現的每一個變數之填寫規範與底層資料型態

| 參數名稱 | 功能與語義說明 |
| --- | --- |
| `[必填]` `<訊息>` | 要發送的動作文字內容，發送後會自動在前方加上玩家的名稱（例如輸入 `正在挖礦`，聊天欄會顯示 `* PlayerName 正在挖礦`） |

---

## 參數枚舉列表 (Parameter Enumeration)

### 訊息

| 參數 | 說明 |
| --- | --- |
| `<文字內容>` | 自由輸入的純文字字串，支援包含空格的多個單字，但在此指令中不支持 Raw JSON 文本格式（直接顯示原始輸入的純文字） |

---

## 跨元素語法關聯表 (Links Matrix)

| 關聯參數欄位 | 參引語法元件名稱 |
| --- | --- |
| `<訊息>` | [聊天與文本系統 (Chat and Text System)](https://www.google.com/search?q=https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/chat_system.md) |