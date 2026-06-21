# 聊天訊息 (`chat_type/`)

> **分類:** `資料包` | **適用版本:** `JE 1.20.4` | **路徑:** `data/<namespace>/chat_type/<名稱>.json`

* 引用格式: `namespace:名稱` (不含副檔名)

---

## 概覽 (Overview)

定義伺服器中聊天訊息與旁白(Narration)的顯示格式,翻譯鍵值與參數組合.

---

## JSON 結構

```json
{
    "chat": {
        "translation_key": "chat.type.text",
        "parameters": [
            "sender",
            "content"
        ]
    },
    "narration": {
        "translation_key": "chat.type.text.narrate",
        "parameters": [
            "sender",
            "content"
        ]
    }
}

```

---

## 欄位說明 (Fields)

### 根層欄位

| 欄位 | 類型 | 必填 | 預設 | 說明 |
| --- | --- | --- | --- | --- |
| `chat` | `object` | ✓ | - | 定義應用於一般文字聊天介面的格式設定 |
| `narration` | `object` | ✓ | - | 定義應用於遊戲內旁白(Narrator)系統的格式設定 |

### `chat` 與 `narration` 子欄位

| 欄位 | 類型 | 必填 | 預設 | 說明 |
| --- | --- | --- | --- | --- |
| `translation_key` | `string` | ✓ | - | 指定語言檔中的翻譯鍵值(如 `chat.type.text`) |
| `parameters` | `list` | ✓ | - | 定義要依序代入翻譯鍵值的變數陣列 |
| `style` | `object` |  | - | 定義這段訊息的基礎文本樣式(同 JSON 文本格式) |

---

## 枚舉值速查

### `parameters` 可填值

| 值 | 分類 | 說明 |
| --- | --- | --- |
| `"sender"` | 參數變數 | 代入發送訊息者的實體名稱或玩家名稱 |
| `"target"` | 參數變數 | 代入訊息接收者的名稱(通常用於私訊指令) |
| `"content"` | 參數變數 | 代入聊天訊息的具體內容文字 |

---

## 注意事項 (Notes)

* 透過 `translation_key` 可以自由搭配內建語言檔或資源包自訂的鍵值進行本地化顯示.
* `style` 欄位支援所有標準的文本組件樣式參數(如 `color`, `bold`, `italic`).

---

## 外部連結 (References)

* [Minecraft Wiki](https://#)

---

*最後更新: 2026-06-22*