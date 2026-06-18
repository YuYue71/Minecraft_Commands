# `/recipe`（配方管理）

* > 用於授予或移除玩家已解鎖的合成配方

## 語法結構 (Syntax)

```commands
/recipe give <目標選擇器> <配方ID>
/recipe take <目標選擇器> <配方ID>
/recipe give <目標選擇器> *
/recipe take <目標選擇器> *
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

| 關聯參數欄位    | 連結                        |
| --------- | ------------------------- |
| `<座標位置>`  | coordinates.md            |
| `<目標選擇器>` | target_selectors.md       |
| `<物品ID>`  | item_nbt.md               |
| `<文字內容>`  | text_components_legacy.md |
