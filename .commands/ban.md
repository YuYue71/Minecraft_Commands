# `/ban` (玩家封鎖)
- > 封鎖特定玩家

## 語法結構 (Syntax)
```commands
/ban <目標玩家> <封鎖原因>
```

---

## 參數與引數拆解 (Arguments)
> 詳細解構語法中出現的每一個變數之填寫規範與底層資料型態

| 參數名稱 | 功能與語義說明 |
| --- | --- |
| `[必填]` `<目標玩家>` | 指定要加入伺服器黑名單的玩家名稱（該玩家可在線或離線） |
| `[選填]` `<封鎖原因>` | 當該玩家嘗試再次連線時, 畫面彈出的自訂踢出說明訊息（預設為 Banned by an operator） |

---

## 跨元素語法關聯表 (Links Matrix)
> 此指令中所呼叫的外部複合參數, 可透過以下相對路徑直接連結至專題獨立筆記頁面進行深度查詢

| 關聯參數欄位 | 參引語法元件名稱 |
| --- | --- |
| `<目標玩家>` | [目標選擇器 (Target Selectors)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/target_selectors.md) |
| `<封鎖原因>` | [文本NBT標籤](https://github.com/YuYue71/Minecraft_Commands/blob/main/.data_structures/nbt_legacy/text_components_legacy.md) |

---