# chat_type (聊天類型)

> **分類:** `系統介面` | **檔案格式:** `json` | **適用版本:** `JE ≤ 1.20.4` | **熱重載:** `/reload`

---

## 目錄

* [1. 目錄路徑 (Directory & Path)](#1-目錄路徑-directory--path)
* [2. 核心結構範本 (Core Structure Skeleton)](#2-核心結構範本-core-structure-skeleton)
* [3. 根節點屬性表 (Root Properties)](#3-根節點屬性表-root-properties)
* [4. 子對象詳解 (Sub-object Details)](#4-子對象詳解-sub-object-details)
    * [4.1 顯示格式配置 (Display Format)](#41-顯示格式配置-display-format)
    * [4.2 視覺樣式細節 (Style Details)](#42-視覺樣式細節-style-details)
* [5. 參數枚舉與可用值全清單 (Value Enumerations)](#5-參數枚舉與可用值全清單-value-enumerations)
    * [5.1 翻譯參數項 (Parameters)](#51-翻譯參數項-parameters)
    * [5.2 訊息顏色 (Color IDs)](#52-訊息顏色-color-ids)
* [6. 數據約束與邊界條件 (Data Constraints)](#6-數據約束與邊界條件-data-constraints)
* [7. 外部連結 (References)](#7-外部連結-references)

---

## 1. 目錄路徑 (Directory & Path)

> 定義玩家訊息、系統公告與旁白在遊戲介面中的顯示模板與翻譯鍵值.

```file
data/<namespace>/chat_type/[子資料夾]/<檔案名稱>.json
```

* `<namespace>`: 命名空間 (如 `minecraft`, `example`).
* `<registry>`: `chat_type`.
* 調用標識符: `<namespace>:[子資料夾]/<檔案名稱>`.

---

## 2. 核心結構範本 (Core Structure Skeleton)

> 包含視覺顯示、動作列覆蓋與語音旁白的完整定義骨架.

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
  "overlay": {
    "translation_key": "chat.type.text",
    "parameters": ["sender", "content"]
  },
  "narration": {
    "translation_key": "chat.type.text.narrate",
    "parameters": ["sender", "content"]
  }
}
```

---

## 3. 根節點屬性表 (Root Properties)

> 檔案第一層級的鍵值定義, 分別對應不同的訊息輸出管道.

| 鍵值 (Key) | 類型 | 必填 | 簡述 | 說明、預設值與可用值索引 |
| --- | --- | --- | --- | --- |
| `"chat"` | `object` | 否 | 視窗顯示 | 定義在聊天訊息視窗中的外觀與格式. 詳見 [4.1](#41-顯示格式配置-display-format). |
| `"overlay"` | `object` | 否 | 覆蓋顯示 | 定義在動作列 (Action Bar) 上方顯示的格式. 詳見 [4.1](#41-顯示格式配置-display-format). |
| `"narration"` | `object` | 是 | 旁白輸出 | 定義語音旁白功能讀取訊息時的翻譯結構. 詳見 [4.1](#41-顯示格式配置-display-format). |

---

## 4. 子對象詳解 (Sub-object Details)

### 4.1 顯示格式配置 (Display Format)

> 定義訊息如何套用翻譯鍵值與參數 (Misode: Chat/Overlay/Narration).

| 子鍵值 (Sub-key) | 類型 | 必填 | 簡述 | 說明與範圍 |
| --- | --- | --- | --- | --- |
| `"translation_key"` | `string` | 是 | 翻譯鍵值 | 指向語言檔案中的模板 (如 `chat.type.announcement`). |
| `"parameters"` | `array` | 是 | 參數映射 | 定義傳遞至翻譯鍵值的變數順序. 詳見 [5.1](#51-翻譯參數項-parameters). |
| `"style"` | `object` | 否 | 視覺樣式 | 設置訊息的顏色與字體裝飾. 連結至 [4.2](#42-視覺樣式細節-style-details). |

### 4.2 視覺樣式細節 (Style Details)

> 控制文本的視覺呈現屬性 (Misode: Style).

| 子鍵值 (Sub-key) | 類型 | 必填 | 簡述 | 說明與預設值 |
| --- | --- | --- | --- | --- |
| `"color"` | `string` | 否 | 文字顏色 | 支援名稱或十六進位色碼. 可用值詳見 [5.2](#52-訊息顏色-color-ids). |
| `"bold"` | `boolean` | 否 | 粗體 | 預設為 `false`. |
| `"italic"` | `boolean` | 否 | 斜體 | 預設為 `false`. |
| `"underlined"` | `boolean` | 否 | 下劃線 | 預設為 `false`. |
| `"strikethrough"` | `boolean` | 否 | 刪除線 | 預設為 `false`. |
| `"font"` | `string` | 否 | 指定字體 | 引用 `assets/<namespace>/font` 下的資源 ID. |

---

## 5. 參數枚舉與可用值全清單 (Value Enumerations)

### 5.1 翻譯參數項 (Parameters)

> 可填入 `parameters` 陣列中的動態佔位符 ID.

| 參數值 (Value) | 簡述 | 完整遊戲行為說明與影響範圍 |
| --- | --- | --- |
| `sender` | 發送者 | 顯示訊息發送者的顯示名稱 (Display Name). |
| `content` | 內容 | 顯示發送出的原始訊息文字. |
| `target` | 接收者 | 顯示訊息接收者的顯示名稱 (常用於私訊). |

### 5.2 訊息顏色 (Color IDs)

> 常用於 `style.color` 的預設顏色 ID.

| 參數值 (Value) | 簡述 | 參數值 (Value) | 簡述 |
| --- | --- | --- | --- |
| `black` | 黑色 | `dark_blue` | 深藍色 |
| `dark_green` | 深綠色 | `dark_aqua` | 深青色 |
| `dark_red` | 深紅色 | `dark_purple` | 深紫色 |
| `gold` | 金色 | `gray` | 灰色 |
| `dark_gray` | 深灰色 | `blue` | 藍色 |
| `green` | 綠色 | `aqua` | 青色 |
| `red` | 紅色 | `light_purple` | 淺紫色 |
| `yellow` | 黃色 | `white` | 白色 |

---

## 6. 數據約束與邊界條件 (Data Constraints)

* **翻譯鍵值存續性**: `translation_key` 必須存在於客戶端的語言包檔案中, 否則會直接顯示原始鍵值名稱.
* **參數限制**: `parameters` 的數量必須與翻譯鍵值中的預留位置 (`%s`, `%1$s`) 數量相符.
* **旁白必要性**: `narration` 節點為必填, 以確保無障礙功能能正確讀取自定義訊息類型.

---

## 7. 外部連結 (References)

* [Misode Data Pack Generators - Chat Type](https://misode.github.io/chat-type/)
* [Minecraft Wiki - Chat Type](https://zh.minecraft.wiki/)
* [JSON 文本元件 (Raw JSON Text Components)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/json_text.md)
* [資源位置與命名空間規範 (Resource Locations)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/ResourceLocations.md)
* [相關指令: /tellraw](https://github.com/YuYue71/Minecraft_Commands/blob/main/.commands/tellraw.md)
* [相關指令: /say](https://github.com/YuYue71/Minecraft_Commands/blob/main/.commands/say.md)
* [相關指令: /me](https://github.com/YuYue71/Minecraft_Commands/blob/main/.commands/me.md)