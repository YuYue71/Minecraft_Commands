# `/kick`（踢出玩家指令）

* > 用於將玩家從伺服器中移除
* > 可指定踢出原因
* > 僅限具有足夠權限的管理員使用

## 語法結構 (Syntax)

```commands
/kick <目標> <原因>
```

---

## 參數與引數拆解 (Arguments)

> 詳細解構語法中出現的每一個變數之填寫規範與底層資料型態

| 參數名稱          | 功能與語義說明       |
| ------------- | ------------- |
| `[必填]` `<目標>` | 指定要踢出的玩家      |
| `[選填]` `<原因>` | 顯示給被踢出玩家的訊息內容 |

---

## 跨元素語法關聯表 (Links Matrix)

| 關聯參數欄位 | 參引語法元件名稱                                                                                                                   |
| ------ | -------------------------------------------------------------------------------------------------------------------------- |
| `<目標>` | [目標選擇器 (Target Selectors)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/target_selectors.md) |
| `<原因>` | [文本NBT標籤](https://github.com/YuYue71/Minecraft_Commands/blob/main/.data_structures/nbt_legacy/text_components_legacy.md)   |
