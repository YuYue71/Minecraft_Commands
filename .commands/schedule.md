# /schedule

> **分類:** `指令` | **權限等級:** `2` | **適用版本:** `JE ≤ 1.20.4` | **命令方塊:** `true`

---

## 目錄

* [語法](#語法-syntax)
* [參數說明](#參數說明-parameters)
  * [function](#function)
  * [clear](#clear)
* [資料包結構參考 (Datapack Structure)](#資料包結構參考-datapack-structure)
* [外部連結](#外部連結-references)

---

## 語法 (Syntax)

```commands
/schedule function <function> <time> [append|replace]
/schedule clear <function>
```

* `<>` = 必填, `[]` = 選填, `|` = 二擇一, `..` = 範圍 (如 `1..10`)

| 參數 / 欄位 | 類型 | 預設 | 說明 |
| --- | --- | --- | --- |
| `function` | `keyword` | - | 安排函式在指定時間後執行 |
| `clear` | `keyword` | - | 取消已安排但尚未執行的函式任務 |
| `<function>` | `Resource Location` | - | 欲執行的函式命名空間位置 |
| `<time>` | `Time` | - | 延遲執行的時間長度 (需含單位) |
| `[append\|replace]` | `enum` | `replace` | 當任務重複時的處理方式 |

---

## 參數說明 (Parameters)

### `function`

> 用於在指定的時間延遲後觸發特定的函式 (Function).

| 值 | 說明 |
| --- | --- |
| `append` | 若該函式已有排程任務, 則新增一個新任務而不影響舊有的任務. |
| `replace` | 若該函式已有排程任務, 則刪除舊任務並以新任務替換 (預設值). |

---

### `clear`

> 用於移除所有尚未執行的指定函式排程. 

| 值 | 說明 |
| --- | --- |
| `<function>` | 欲清除排程的函式路徑. 執行後所有針對該函式的 `append` 或 `replace` 任務皆會被移除. |

---

## 資料包結構參考 (Datapack Structure)

### 函式 (Functions)
`/schedule` 僅能操作資料包中的函式檔案. 檔案路徑應為:
`data/<namespace>/functions/<path>.mcfunction`

**運作邏輯說明:**
1. 排程任務是儲存在存檔中的, 即使伺服器重啟, 剩餘的時間仍會繼續計數.
2. 指令執行的上下文 (如執行者, 執行位置) 不會被繼承. 排程函式將以伺服器 (Server) 權限在世界出生點執行.

---

## 外部連結 (References)

* [Minecraft Wiki - /schedule](https://zh.minecraft.wiki/w/%E5%91%BD%E4%BB%A4/schedule)
* [時間與時間單位 (Time & Duration Formats)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/TimeFormats.md)
* [資源位置與命名空間規範 (Resource Locations)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/ResourceLocations.md)