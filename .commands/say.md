# /say

> **分類:** `指令` | **權限等級:** `2` | **適用版本:** `JE ≤ 1.20.4` | **命令方塊:** `true`

---

## 目錄

* [語法](#語法-syntax)
    * [參數說明](#參數說明-parameters)
    * [message](#message)
* [外部連結](#外部連結-references)

---

## 語法 (Syntax)

```commands
/say <message>
```

* `<>` = 必填

| 參數 / 欄位 | 類型 | 預設 | 說明 |
| --- | --- | --- | --- |
| `<message>` | `string` | - | 欲廣播的訊息內容 |

---

## 參數說明 (Parameters)

### `message`

> 指定要在聊天框中向所有玩家廣播的文字內容.

* 允許直接包含空格, 且不需要使用引號包覆整段文字.
* 執行後, 聊天框中會以特定格式顯示: `[執行者名稱] <message>`. 若由玩家執行, 訊息會顯示為 `[玩家名稱] 訊息內容`; 若由命令方塊執行, 則顯示為 `[@] 訊息內容`.
* 支援使用目標選擇器 (如 `@a`, `@p`). 若訊息中包含目標選擇器 (例如 `/say 哈囉 @p`), 系統會在發送時自動將其解析為對應的目標玩家名稱並顯示出來.
* 由於此指令會強制發送給伺服器內的所有玩家, 若用於高頻率執行的命令方塊 (如循環型命令方塊), 可能會導致聊天框洗頻, 影響玩家閱讀遊戲資訊.

---

## 外部連結 (References)

* [Minecraft Wiki - /say](https://zh.minecraft.wiki/w/%E5%91%BD%E4%BB%A4/say)
* [目標選擇器 (Target Selectors)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/TargetSelectors.md)