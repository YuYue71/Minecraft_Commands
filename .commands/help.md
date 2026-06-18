# `/help`（指令幫助資訊）
* > 用於查詢遊戲內所有可用指令的使用格式與說明
* > 可針對特定指令查詢其更深層的詳細引數結構
* > 在不熟悉系統指令或忘記參數順序時提供即時指引

---

## 語法結構 (Syntax)
```commands id="help0"
/help <指令>
```

---

## 參數與引數拆解 (Arguments)
> 詳細解構語法中出現的每一個變數之填寫規範與底層資料型態

| 參數名稱 | 功能與語義說明 |
| --- | --- |
| `[選填]` `<指令>` | 指定要查詢詳細幫助資訊的 Minecraft 指令名稱 |

---

## 參數枚舉列表 (Parameter Enumeration)

### 指令

| 參數 | 說明 |
| --- | --- |
| `<minecraft_command>` | 當前遊戲版本與權限等級下，所有可執行的 Minecraft 原始指令名稱（例如 `tp`、`gamemode`、`give` 等） |
| `<自訂指令>` | 若伺服器有安裝模組（Mods）或外掛（Plugins），也會在此欄位動態提示其註冊的指令名稱 |

---

## 跨元素語法關聯表 (Links Matrix)

| 關聯參數欄位 | 參引語法元件名稱 |
| --- | --- |
| `<指令>` | [指令系統總覽 (Commands System Overview)](https://www.google.com/search?q=https://github.com/YuYue71/Minecraft_Commands/blob/main/README.md) |