# `/spectate`（觀察模式）

* > 使玩家進入觀察模式並鎖定觀看目標

## 語法結構 (Syntax)

```commands
/spectate <目標選擇器> <觀看目標>
```

## 參數與引數拆解 (Arguments)

| 參數名稱             | 功能與語義說明   |
| ---------------- | --------- |
| `[必填]` `<目標選擇器>` | 進入觀察模式的玩家 |
| `[選填]` `<觀看目標>`  | 被觀看的實體目標  |

## 參數枚舉列表 (Parameter Enumeration)

### 觀看目標類型

| 參數        | 說明            |
| --------- | ------------- |
| `<目標選擇器>` | 可選擇任何實體作為觀看目標 |
| `<空>`     | 取消觀察模式並回到正常視角 |

## 跨元素語法關聯表 (Links Matrix)

| 關聯參數欄位    | 參引語法元件名稱 |
| --------- | --------------- |
| `<目標>` | [目標選擇器 (Target Selectors)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/target_selectors.md)|
