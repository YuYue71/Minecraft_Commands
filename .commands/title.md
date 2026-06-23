# `/title`

> **分類:** `指令` | **權限等級:** `2` | **適用版本:** `JE ≤ 1.20.4` | **命令方塊:** `true`

---

## 目錄

* [語法](#語法-syntax)
* [參數說明](#參數說明-parameters)
    * [操作類型 (Action Types)](#操作類型-action-types)
    * [targets](#targets)
    * [title (JSON 文本)](#title-json-文本)
    * [times (時間參數)](#times-時間參數)
* [外部連結](#外部連結-references)

---

## 語法 (Syntax)

```commands
/title <targets> clear
/title <targets> reset
/title <targets> title <title>
/title <targets> subtitle <title>
/title <targets> actionbar <title>
/title <targets> times <fadeIn> <stay> <fadeOut>
```

* `<>` = 必填

| 參數 / 欄位 | 類型 | 預設 | 說明 |
| --- | --- | --- | --- |
| `clear` / `reset` / `title` / `subtitle` / `actionbar` / `times` | `enum` | - | 決定要對標題執行的具體操作 |
| `<targets>` | `entity` | - | 欲顯示或清除標題的目標玩家 |
| `<title>` | `json` | - | 欲顯示的 JSON 文本標題內容 |
| `<fadeIn>` | `time` | `10t` | 標題淡入畫面所需的持續時間 |
| `<stay>` | `time` | `70t` | 標題在畫面上完全清晰停留的時間 |
| `<fadeOut>` | `time` | `20t` | 標題淡出至消失所需的持續時間 |

---

## 參數說明 (Parameters)

### `操作類型 (Action Types)`

> 決定 `/title` 指令具體要更新畫面的哪個區塊, 或是要執行清除與時間設定.

| 值 | 說明 |
| --- | --- |
| `title` | 在目標畫面的正中央顯示主標題. 若之前已設定了 `subtitle`, 則副標題會與主標題同時出現在畫面上. |
| `subtitle` | 設定或更新副標題的文字內容. 注意: 副標題**必須**在觸發 `title` 顯示時才會被一併渲染出來, 單獨發送 `subtitle` 是不會有任何畫面效果的. |
| `actionbar` | 在目標畫面的快捷列 (物品欄) 上方顯示小字體的狀態文字. 此區塊的文字不受 `times` 淡入淡出時間的控制, 固定有自己的顯示邏輯與時長. |
| `times` | 自訂標題的顯示節奏. 執行後, 該時間設定會寫入玩家資料中, 之後所有發送給該玩家的標題皆會套用此自訂的淡入, 停留, 淡出時間. |
| `clear` | 立刻清除目標畫面上當前正在顯示的主標題與副標題. 不會重置 `times` 的自訂時間設定. |
| `reset` | 立刻清除目標畫面上的標題, 並將標題的 `times` 設定 (淡入, 停留, 淡出) 強制恢復為系統預設值 (10, 70, 20 遊戲刻). |

---

### `targets`

> 指定哪些玩家的客戶端畫面上會出現標題文字.

* 必須為玩家 (Player) 實體, 支援使用目標選擇器 (如 `@a`, `@p`, `@r`).
* 可以同時選取多個玩家. 系統會將設計好的標題同步發送給所有被選中的玩家.
* 標題與音效相同, 渲染完全由玩家的客戶端獨立處理, 因此必須精確選擇玩家. 若選擇了非玩家實體 (如 `@e[type=zombie]`), 指令將無法生效.

---

### `title (JSON 文本)`

> 決定標題或快捷列文字的具體內容與視覺設計.

* 必須輸入嚴格的 JSON 文本元件格式 (例如 `{"text":"Game Over","color":"red","bold":true}`).
* 與 `/tellraw` 類似, 支援各種進階格式, 且能在 JSON 中綁定計分板分數 (`score`) 或是目標選擇器 (`selector`), 讓不同玩家看到的標題文字內容根據自身的資料動態改變 (例如顯示各玩家獨自的剩餘時間).

---

### `times (時間參數)`

> 設定文字特效的時間長度, 可接受附帶單位的時間格式.

* `<fadeIn>`, `<stay>`, `<fadeOut>` 這三個參數必須同時填寫.
* 輸入的數值支援時間單位字尾 (Time Formats). 若不加上任何字尾, 系統預設以「遊戲刻 (Ticks, 1/20 秒)」為單位. 例如輸入 `60` 等同於 3 秒.
* 亦可直接加上 `s` (秒) 或 `d` (遊戲日) 作為單位, 例如 `/title @a times 1s 5s 2s`.

---

## 外部連結 (References)

* [Minecraft Wiki - /title](https://zh.minecraft.wiki/w/%E5%91%BD%E4%BB%A4/title)
* [目標選擇器 (Target Selectors)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/TargetSelectors.md)
* [JSON 文本元件 (Raw JSON Text Components)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/json_text.md)
* [時間與時間單位 (Time & Duration Formats)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/TimeFormats.md)