# /tellraw

> **分類:** `指令` | **權限等級:** `2` | **適用版本:** `JE ≤ 1.20.4` | **命令方塊:** `true`

---

## 目錄

* [語法](#語法-syntax)
* [參數說明](#參數說明-parameters)
    * [targets](#targets)
    * [message](#message)
* [外部連結](#外部連結-references)

---

## 語法 (Syntax)

```commands
/tellraw <targets> <message>
```

* `<>` = 必填

| 參數 / 欄位 | 類型 | 預設 | 說明 |
| --- | --- | --- | --- |
| `<targets>` | `entity` | - | 欲發送訊息的目標玩家 |
| `<message>` | `json` | - | 欲發送的 JSON 文本訊息內容 |

---

## 參數說明 (Parameters)

### `targets`

> 指定要接收此 JSON 訊息的玩家對象.

* 必須為玩家 (Player) 實體, 支援使用目標選擇器 (如 `@a`, `@p`, `@r`).
* 可以同時選取多個玩家. 系統會將設計好的 JSON 訊息同步發送給所有被選中的玩家.
* 若使用目標選擇器選中了非玩家的實體 (如 `@e[type=pig]`), 指令雖然可能判定執行成功, 但非玩家實體無法接收與顯示任何聊天資訊, 因此沒有實質意義.

---

### `message`

> 決定訊息的具體內容與強大的視覺, 互動格式.

* 必須輸入嚴格的 JSON 文本元件格式 (例如 `{"text":"哈囉","color":"red","bold":true}`).
* 與普通的 `/say` 或 `/tell` 不同, `/tellraw` 絕對不會在訊息前方自動加上發送者的名稱標籤或任何系統前綴 (如 `[Server]`, `[@]`), 而是呈現完全純粹的自訂文本.
* 支援所有進階的文本互動事件. 例如: 允許玩家點擊文字來開啟外部網頁 (Click Event), 點擊文字來觸發其他指令, 或是滑鼠游標懸停在文字上時顯示某把武器的詳細附魔與 NBT 屬性 (Hover Event).
* 支援動態資料綁定. 可以在 JSON 中調用特定的選擇器 (`selector`), 計分板分數 (`score`), 或是 NBT 數據 (`nbt`), 讓不同玩家收到的訊息內容根據自身的狀態動態改變.
* 若 JSON 格式有任何大括號未閉合, 逗號遺漏或語法結構錯誤, 指令將會直接報錯並拒絕執行.

---

## 外部連結 (References)

* [Minecraft Wiki - /tellraw](https://zh.minecraft.wiki/w/%E5%91%BD%E4%BB%A4/tellraw)
* [目標選擇器 (Target Selectors)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/TargetSelectors.md)
* [JSON 文本元件 (Raw JSON Text Components)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/json_text.md)