# /tell | /msg | /w

> **分類:** `指令` | **權限等級:** `0` | **適用版本:** `JE ≤ 1.20.4` | **命令方塊:** `true`

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
/tell <targets> <message>
/msg <targets> <message>
/w <targets> <message>
```

* `<>` = 必填
* `/tell`, `/msg` 與 `/w` (whisper) 在遊戲底層互為別名 (Alias), 三者的功能與語法結構完全相同, 玩家可依據個人習慣交替使用.

| 參數 / 欄位 | 類型 | 預設 | 說明 |
| --- | --- | --- | --- |
| `<targets>` | `entity` | - | 欲發送私訊的目標玩家 |
| `<message>` | `string` | - | 欲發送的私訊文字內容 |

---

## 參數說明 (Parameters)

### `targets`

> 指定要接收私人訊息的對象.

* 必須為玩家 (Player) 實體, 支援使用目標選擇器 (如 `@a`, `@p`, `@r`).
* 可以同時選取多個玩家. 例如使用 `@a[distance=..10]`, 系統會將私訊同時發送給半徑 10 格內的所有玩家, 而範圍外的玩家將無法看見此訊息.
* 若使用目標選擇器選中了非玩家的實體 (如僵屍, 豬), 指令雖然可以成功執行, 但非玩家實體無法接收與顯示任何聊天資訊, 因此沒有實質意義.

---

### `message`

> 指定要發送的私人文字訊息內容.

* 允許直接包含空格, 且不需要使用引號包覆整段文字.
* 發送成功後, 發送者的聊天框會顯示: `你對 目標名稱 悄悄說: <message>`.
* 接收者的聊天框則會顯示: `發送者名稱 對你悄悄說: <message>`.
* 支援使用目標選擇器 (如 `@a`, `@p`). 若訊息中包含目標選擇器 (例如 `/tell Steve 請掩護 @p`), 系統會在發送時自動將其解析為對應的目標實體名稱顯示出來.
* 私訊是一種不受距離限制的通訊方式, 只要接收對象在線上且處於同一個伺服器內 (無論身處哪個維度), 都能順利收到訊息.

---

## 外部連結 (References)

* [Minecraft Wiki - /tell | /msg | /w](https://zh.minecraft.wiki/w/%E5%91%BD%E4%BB%A4/msg?variant=zh-tw)
* [目標選擇器 (Target Selectors)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/TargetSelectors.md)