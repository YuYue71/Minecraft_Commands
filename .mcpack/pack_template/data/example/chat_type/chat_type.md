# chat_type (聊天類型)

> **分類:** `資料包元素` | **檔案格式:** `json` | **命名空間支援:** `true` | **熱重載:** `/reload`

---

## 目錄

* [目錄路徑](#目錄路徑-directory--path)
* [核心結構](#核心結構-core-structure)
* [節點說明](#節點說明-node-explanations)
    * [chat (聊天格式)](#chat-與-overlay-object)
    * [overlay (覆蓋層格式)](#chat-與-overlay-object)
    * [narration (旁白格式)](#style-object)
* [外部連結](#)

---

## 目錄路徑 (Directory & Path)

> 聊天類型定義了玩家訊息、系統指令與旁白在遊戲介面中的顯示方式與翻譯架構.

```file
data/<namespace>/chat_type/[子資料夾]/<檔案名稱>.json
```

* `<namespace>` = 命名空間 (如 `minecraft`, `example`)
* `[子資料夾]` = 開發者自訂的分類目錄 (選填)
* `<檔案名稱>` = 決定該聊天類型的 ID 名稱
* 遊戲內調用格式通常涉及內部的登錄機制, 自定義類型可用於特定系統訊息調用.

---

## 核心結構 (Core Structure)

> 每個聊天類型包含視覺顯示 (chat/overlay) 與聽覺輔助 (narration) 的定義.

```json
{
    "chat": {
        "translation_key": "chat.type.text",
        "parameters": ["sender", "content"],
        "style": {
            "color": "gray",
            "italic": true
        }
    },
    "narration": {
        "translation_key": "chat.type.text.narrate",
        "parameters": ["sender", "content"]
    }
}
```

| 鍵值 / 節點 (Key) | 類型 | 必填 | 說明 |
| --- | --- | --- | --- |
| `"chat"` | `object` | 否 | 定義在聊天視窗中顯示的格式 |
| `"overlay"` | `object` | 否 | 定義在動作列 (Action Bar) 上方覆蓋顯示的格式 |
| `"narration"` | `object` | 是 | 定義語音旁白讀取訊息時的格式 |

---

## 節點說明 (Node Explanations)

### `chat` 與 `overlay` (Object)

> 這兩個節點使用相同的內部結構, 決定訊息的視覺外觀.

| 子節點 (Sub-key) | 類型 | 必填 | 說明 |
| --- | --- | --- | --- |
| `"translation_key"` | `string` | 是 | 用於顯示格式的翻譯鍵值 (如 `chat.type.text`) |
| `"parameters"` | `array` | 是 | 傳遞至翻譯鍵值的參數順序列表 |
| `"style"` | `object` | 否 | 套用至整條訊息的視覺樣式 |

**參數列表 (Parameters) 常用值:**
* `sender`: 發送者的顯示名稱.
* `content`: 訊息的具體內容.
* `target`: 接收者的名稱 (常用於私訊).

---

### `style (Object)`

> 定義訊息的顏色、字體與特殊裝飾.

| 子節點 (Sub-key) | 類型 | 必填 | 說明 |
| --- | --- | --- | --- |
| `"color"` | `string` | 否 | 顏色 ID (如 `red`, `gold`) 或十六進位色碼. |
| `"italic"` | `boolean` | 否 | 是否斜體. |
| `"bold"` | `boolean` | 否 | 是否粗體. |
| `"font"` | `string` | 否 | 指定使用的字體資源位置. |

---

### `narration (Object)`

> 定義針對開啟「旁白」功能的玩家所輸出的格式.

| 子節點 (Sub-key) | 類型 | 必填 | 說明 |
| --- | --- | --- | --- |
| `"translation_key"` | `string` | 是 | 旁白讀取時使用的翻譯鍵值. |
| `"parameters"` | `array` | 是 | 傳遞至旁白翻譯鍵值的參數列表 (如 `["sender", "content"]`). |

---

## 外部連結 (References)

* [Minecraft Wiki - Chat Type](https://zh.minecraft.wiki/w/%E8%81%8A%E5%A4%A9%E7%B1%BB%E5%9E%8B%E5%AE%9A%E4%B9%89%E6%A0%BC%E5%BC%8F?variant=zh-tw)
* [Misode Data Pack Generators - Chat Type](https://misode.github.io/chat-type/)
* [資源位置與命名空間規範 (Resource Locations)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/ResourceLocations.md)
* [JSON 文本元件 (Raw JSON Text Components)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/json_text.md)
* [文本指令 (tellraw)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.commands/tellraw.md)
* [聊天指令 (say)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.commands/say.md)
* [動作指令 (me)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.commands/me.md)