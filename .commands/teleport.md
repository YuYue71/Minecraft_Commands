# `/teleport`（傳送）

* > 將玩家或實體移動到指定位置或目標
* > 可用於座標傳送與目標跟隨傳送

## 語法結構 (Syntax)

```commands id="teleport"
/teleport <目標> <座標>
/teleport <目標> <目標實體>
/teleport <座標> <朝向座標>
```

## 參數與引數拆解 (Arguments)

| 參數名稱     | 功能與語義說明 |
| -------- | ------- |
| `<目標>`   | 被傳送的實體  |
| `<座標>`   | 傳送目標位置  |
| `<目標實體>` | 傳送跟隨的目標 |
| `<朝向座標>` | 傳送後面向方向 |

---

## 參數枚舉列表 (Parameter Enumeration)

### 目標

| 參數   | 說明   |
| ---- | ---- |
| `@s` | 自身   |
| `@p` | 最近玩家 |
| `@a` | 全部玩家 |
| `@e` | 所有實體 |
| `@r` | 隨機玩家 |

---

## 數值規則

### 座標

| 參數     | 說明                                  |
| ------ | ----------------------------------- |
| `<數值>` | 最小值 -30000000 最大值 30000000 是否支援負數 是 |

---

## 跨元素語法關聯表 (Links Matrix)

| 關聯參數欄位 | 參引語法元件名稱                                                                                                                   |
| ------ | -------------------------------------------------------------------------------------------------------------------------- |
| `<座標>` | [空間座標系統全指南（Coordinates）](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/coordinates.md)        |
| `<目標>` | [目標選擇器 (Target Selectors)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/target_selectors.md) |
