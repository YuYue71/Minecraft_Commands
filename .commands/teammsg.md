# /teammsg

> **分類:** `指令` | **權限等級:** `0` | **適用版本:** `JE ≤ 1.20.4` | **命令方塊:** `true`

---

## 目錄

* [語法](#語法-syntax)
* [參數說明](#參數說明-parameters)
    * [message](#message)
* [外部連結](#外部連結-references)

---

## 語法 (Syntax)

```commands
/teammsg <message>
```

* `<>` = 必填. 此指令具備簡寫別名 `/tm`, 兩者功能與語法完全相同.

| 參數 / 欄位 | 類型 | 預設 | 說明 |
| --- | --- | --- | --- |
| `<message>` | `string` | - | 欲發送給同隊隊伍成員的訊息內容 |

---

## 參數說明 (Parameters)

### `message`

> 指定要發送給同一個計分板隊伍 (Scoreboard Team) 玩家的專屬文字訊息.

* 允許直接包含空格, 且不需要使用引號包覆整段文字.
* 發送後, 只有與執行者處於相同隊伍的玩家才能在聊天框中看見此訊息, 其他隊伍或無隊伍的玩家完全無法察覺.
* 訊息的顯示格式通常會帶有隊伍前綴 (例如 `[隊伍名稱] <發送者名稱> 訊息內容`), 並且會自動套用該隊伍所設定的專屬顏色 (Team Color).
* 若執行此指令的實體或玩家本身並未加入任何隊伍, 系統將會直接回傳錯誤提示 (您不在任何隊伍中), 且訊息不會被發送.
* 支援使用目標選擇器 (如 `@a`, `@p`). 若訊息中包含目標選擇器 (例如 `/teammsg 請掩護 @p`), 系統會在發送時自動將其解析為對應的目標實體名稱顯示出來.
* 在快速節奏的小遊戲或 PvP 戰鬥中, 玩家可以直接使用別名指令 `/tm <message>` 來進行團隊溝通, 以節省打字時間.

---

## 外部連結 (References)

* [Minecraft Wiki - /teammsg](https://zh.minecraft.wiki/w/%E5%91%BD%E4%BB%A4/teammsg)
* [目標選擇器 (Target Selectors)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/TargetSelectors.md)