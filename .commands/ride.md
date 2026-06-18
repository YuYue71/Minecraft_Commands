# `/ride`（騎乘控制）

* > 控制實體之間的騎乘關係
* > 可用於讓實體騎乘或解除騎乘

## 語法結構 (Syntax)

```commands id="ride"
/ride <目標> mount <載具目標>
/ride <目標> dismount
/ride <目標> stop_riding
```

## 參數與引數拆解 (Arguments)

| 參數名稱     | 功能與語義說明 |
| -------- | ------- |
| `<目標>`   | 要被控制的實體 |
| `<載具目標>` | 被騎乘的實體  |
| `<動作>`   | 騎乘控制方式  |

---

## 參數枚舉列表 (Parameter Enumeration)

### 動作

| 參數            | 說明        |
| ------------- | --------- |
| `mount`       | 讓目標騎上指定實體 |
| `dismount`    | 強制下馬      |
| `stop_riding` | 解除所有騎乘關係  |

---

## 跨元素語法關聯表 (Links Matrix)

| 關聯參數欄位 | 參引語法元件名稱                                                                                                                   |
| ------ | -------------------------------------------------------------------------------------------------------------------------- |
| `<目標>` | [目標選擇器 (Target Selectors)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/target_selectors.md) |
