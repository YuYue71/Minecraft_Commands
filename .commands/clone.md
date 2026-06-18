# `/clone`（方塊複製）

* > 複製指定區域方塊到目標位置

## 語法結構 (Syntax)

```commands id="clone"
/clone <起始座標> <結束座標> <目標座標> <覆蓋模式> <方塊模式>
```

## 參數與引數拆解 (Arguments)

| 參數名稱     | 功能與語義說明   |
| -------- | --------- |
| `<起始座標>` | 複製區域第一個角落 |
| `<結束座標>` | 複製區域第二個角落 |
| `<目標座標>` | 放置複製內容的位置 |
| `<覆蓋模式>` | 是否覆蓋目標區域  |
| `<方塊模式>` | 複製行為模式    |

## 參數枚舉列表 (Parameter Enumeration)

### 覆蓋模式

| 參數        | 說明     |
| --------- | ------ |
| `replace` | 覆蓋目標方塊 |
| `masked`  | 忽略空氣   |

### 方塊模式

| 參數       | 說明       |
| -------- | -------- |
| `normal` | 正常複製     |
| `force`  | 強制覆蓋     |
| `move`   | 複製並刪除原區域 |

## 跨元素語法關聯表 (Links Matrix)

| 關聯參數欄位   | 參引語法元件名稱                                                                                                            |
| -------- | ------------------------------------------------------------------------------------------------------------------- |
| `<起始座標>` | [空間座標系統全指南（Coordinates）](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/coordinates.md) |
| `<結束座標>` | [空間座標系統全指南（Coordinates）](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/coordinates.md) |
| `<目標座標>` | [空間座標系統全指南（Coordinates）](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/coordinates.md) |
