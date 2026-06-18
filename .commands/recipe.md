# `/recipe`（配方管理）

* > 用於授予或移除玩家已解鎖的合成配方

## 語法結構 (Syntax)

```commands
/recipe give <目標> <配方ID>
/recipe take <目標> <配方ID>
/recipe give <目標> *
/recipe take <目標> *
```

## 參數與引數拆解 (Arguments)

| 參數名稱      | 功能與語義說明                  |
| --------- | ------------------------ |
| `<目標選擇器>` | 指定要操作的玩家                 |
| `<配方ID>`  | Minecraft 配方識別ID（命名空間格式） |

## 參數枚舉列表 (Parameter Enumeration)

### 子指令類型

| 參數     | 說明     |
| ------ | ------ |
| `give` | 解鎖指定配方 |
| `take` | 移除指定配方 |

### 配方範圍

| 參數                 | 說明     |
| ------------------ | ------ |
| `minecraft:*`      | 所有配方   |
| `minecraft:<配方名稱>` | 單一指定配方 |

## 跨元素語法關聯表 (Links Matrix)

| 關聯參數欄位    | 參引語法元件名稱 |
| --------- | --------------- |
| `<目標>` | [目標選擇器 (Target Selectors)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/target_selectors.md)                               |
