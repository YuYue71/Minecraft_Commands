# `/spawnpoint`（重生點設定）

* > 設定玩家重生點位置與朝向

## 語法結構 (Syntax)

```commands id="k8m4q1"
/spawnpoint <目標選擇器> <座標位置> <朝向角度>
```

## 參數與引數拆解 (Arguments)

| 參數名稱             | 功能與語義說明     |
| ---------------- | ----------- |
| `[選填]` `<目標選擇器>` | 指定要設定重生點的玩家 |
| `[選填]` `<座標位置>`  | 設定重生點座標     |
| `[選填]` `<朝向角度>`  | 設定玩家重生後面向方向 |

## 參數枚舉列表 (Parameter Enumeration)

### 朝向角度

| 參數     | 說明                      |
| ------ | ----------------------- |
| `<數值>` | 最小值 -180 最大值 180 支援負數 是 |

## 跨元素語法關聯表 (Links Matrix)

| 關聯參數欄位    | 參引語法元件名稱 |
| --------- | --------------- |
| `<座標>`  | [空間座標系統全指南（Coordinates）](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/coordinates.md)                                         |
| `<目標>` | [目標選擇器 (Target Selectors)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/target_selectors.md)                               |
