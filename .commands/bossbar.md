# `/bossbar`（魔王血條控制指令）
* > 用於建立、修改、刪除或查詢自訂的魔王血條（Bossbar）
* > 可動態調整血條的顏色、外觀樣式、數值與可見性
* > 常用於地圖製作、RPG 伺服器與小遊戲內建的視覺提示



---

## 語法結構 (Syntax)
```commands id="bossbar0"
/bossbar <操作> <識別碼> <屬性> <值>
```

---

## 參數與引數拆解 (Arguments)
> 詳細解構語法中出現的每一個變數之填寫規範與底層資料型態

| 參數名稱 | 功能與語義說明 |
| --- | --- |
| `[必填]` `<操作>` | 指定魔王血條的管理動作 |
| `[必填]` `<識別碼>` | 該魔王血條的唯一命名空間 ID |
| `[選填]` `<屬性>` | 在變更屬性模式下，指定要修改的血條設定項 |
| `[選填]` `<值>` | 根據操作或屬性所填入的對應設定數值或內容 |

---

## 參數枚舉列表 (Parameter Enumeration)

### 操作

| 參數 | 說明 |
| --- | --- |
| `add` | 建立一個新的魔王血條 |
| `remove` | 刪除一個現存的魔王血條 |
| `list` | 列出當前所有已建立的魔王血條 |
| `get` | 查詢指定魔王血條的特定數值設定 |
| `set` | 修改指定魔王血條的各項屬性值 |

---

### 屬性（僅在 set 操作時使用）

| 參數 | 說明 |
| --- | --- |
| `color` | 變更血條的文字與條體顏色 |
| `max` | 設定血條的最大上限值 |
| `name` | 修改血條顯示的中文名稱（支援 JSON 文本） |
| `players` | 指定哪些玩家可以看見這個血條 |
| `style` | 變更血條的分段外觀樣式 |
| `value` | 設定血條當前的數值（當前血量） |
| `visible` | 控制血條是否對指定玩家顯示（可見性） |

---

### 屬性值：color（顏色）

| 參數 | 說明 |
| --- | --- |
| `blue` | 藍色 |
| `green` | 綠色 |
| `pink` | 粉紅色 |
| `purple` | 紫色 |
| `red` | 紅色（預設值） |
| `white` | 白色 |
| `yellow` | 黃色 |

---

### 屬性值：style（樣式）

| 參數 | 說明 |
| --- | --- |
| `progress` | 連續的不分段血條（預設值） |
| `notched_6` | 分為 6 段的血條 |
| `notched_10` | 分為 10 段的血條 |
| `notched_12` | 分為 12 段的血條 |
| `notched_20` | 分為 20 段的血條 |

---

### 屬性值：visible（可見性）

| 參數 | 說明 |
| --- | --- |
| `true` | 設定為顯示（可見） |
| `false` | 設定為隱藏（不可見） |

---

### 識別碼 與 屬性值：name

| 參數 | 說明 |
| --- | --- |
| `<namespace:id>` | 唯一識別碼，格式為 `命名空間:英文識別碼`（例如 `mymap:boss_dragon`） |
| `<文字內容>` | 支援包含顏色、粗體等屬性的 Raw JSON 文本結構（例如 `{"text":"終界使者","color":"purple"}`） |

---

## 數值規則

### 最大值 與 當前值 (max / value)

| 參數 | 說明 |
| --- | --- |
| `<數值>` | 最小值：0 / 最大值：2147483647 / 支援負數：否 / 預設最大值：100 / 預設當前值：0 |

---

## 跨元素語法關聯表 (Links Matrix)

| 關聯參數欄位 | 參引語法元件名稱 |
| --- | --- |
| `<值>`（當屬性為 players 時） | [目標選擇器 (Target Selectors)](https://www.google.com/search?q=https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/target_selectors.md) |
| `<值>`（當屬性為 name 時） | [Raw JSON 文本 NBT 格式 (Legacy Text Component)](https://www.google.com/search?q=https%3A%2F%2Fgithub.com%2FYuYue71%2FMinecraft_Commands%2Fblob%2Fmain%2F.data_structures%2Fnbt_legacy%2Ftext_components_legacy.md) |