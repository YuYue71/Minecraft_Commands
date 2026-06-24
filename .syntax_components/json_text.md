# JSON 文本元件 (Raw JSON Text Components)

> **分類:** `全域系統` | **適用版本:** `JE ≤ 1.20.4`

---

## 目錄

* [核心結構](#核心結構-core-structure)
* [屬性說明](#屬性說明-attributes)
    * [基礎文本屬性](#基礎文本屬性)
    * [樣式與字體屬性](#樣式與字體屬性)
    * [點擊與懸停事件](#點擊與懸停事件)
* [外部連結](#外部連結-references)

---

## 核心結構 (Core Structure)

```json
{"text":"Hello","color":"red","bold":true,"extra":[{"text":" World"}]}

```

* 用於在聊天室, 標題, 書籍, 物品敘述等處顯示具備豐富樣式與互動功能的文字.
* 支援單一物件格式或由多個物件組成的陣列格式.

| 屬性 / 欄位 | 類型 | 預設 | 說明 |
| --- | --- | --- | --- |
| `text` | `string` | - | 直接顯示的純文字內容 |
| `selector` | `string` | - | 目標選擇器, 自動轉換為目標名稱顯示 |
| `score` | `object` | - | 顯示計分板分數, 內含子欄位 |
| `translate` | `string` | - | 語言檔案中的翻譯鍵值 (Translation Key) |
| `with` | `array` | - | 配合 translate 使用的參數取代清單 |
| `keybind` | `string` | - | 顯示玩家當前設定的快捷鍵名稱 |
| `nbt` | `string` | - | 指定讀取的 NBT 標籤路徑 |
| `block` | `string` | - | 配合 nbt 使用的方塊座標 |
| `entity` | `string` | - | 配合 nbt 使用的實體選擇器 |
| `storage` | `string` | - | 配合 nbt 使用的資料儲存位置 (Storage) |
| `interpret` | `boolean` | `false` | 是否將讀取到的 NBT 數據解析為 JSON 文本 |
| `extra` | `array` | - | 子元件清單, 清單內的元件會繼承父元件的樣式 |
| `color` | `string` | - | 文字顏色, 支援顏色名稱或十六進位值 |
| `bold` | `boolean` | `false` | 是否啟用粗體 |
| `italic` | `boolean` | `false` | 是否啟用斜體 |
| `underlined` | `boolean` | `false` | 是否啟用底線 |
| `strikethrough` | `boolean` | `false` | 是否啟用刪除線 |
| `obfuscated` | `boolean` | `false` | 是否啟用隨機亂碼 (魔幻文字) |
| `font` | `string` | - | 預設為 `minecraft:default`, 指定字體資源路徑 |
| `insertion` | `string` | - | 當玩家按住 Shift 點擊此文字時, 插入聊天欄的文字 |
| `clickEvent` | `object` | - | 點擊文字後觸發的事件 |
| `hoverEvent` | `object` | - | 滑鼠懸停在文字上方時觸發的事件 |

---

## 屬性說明 (Attributes)

### `基礎文本屬性`

> 控制核心顯示內容來源的特殊屬性. 一個 JSON 物件內通常僅能存在 `text`, `selector`, `score`, `translate`, `keybind`, `nbt` 其中一種.

#### `score` 子欄位

| 欄位 | 類型 | 說明 |
| --- | --- | --- |
| `name` | `string` | 計分板目標名稱 (如 `*` 代表看見文字的玩家本人, 或指定玩家名/選擇器) |
| `objective` | `string` | 計分板項目名稱 (Objective) |

---

### `樣式與字體屬性`

> 控制文字視覺外觀的參數集合.

#### `color` 可填值清單

| 值 | 說明 |
| --- | --- |
| `black` | 黑色 |
| `dark_blue` | 深藍色 |
| `dark_green` | 深綠色 |
| `dark_aqua` | 深青色 |
| `dark_red` | 深紅色 |
| `dark_purple` | 深紫色 |
| `gold` | 金黃色 |
| `gray` | 灰色 |
| `dark_gray` | 深灰色 |
| `blue` | 藍色 |
| `green` | 綠色 |
| `aqua` | 青色 |
| `red` | 紅色 |
| `light_purple` | 淺紫色 |
| `yellow` | 黃色 |
| `white` | 白色 |
| `#十六進位值` | 支援自訂色碼 (如 `#FF5555`) |

---

### `點擊與懸停事件`

> 定義文字的互動邏輯.

#### `clickEvent` 結構與動作 (Actions)

```json
"clickEvent": {"action": "run_command", "value": "/say Hello"}

```

| action 值 | 說明 |
| --- | --- |
| `open_url` | 在玩家瀏覽器開啟 value 指定的網址 |
| `open_file` | 開啟本地檔案 (通常僅限遊戲本體系統訊息使用) |
| `run_command` | 讓玩家強制執行 value 指定的指令或發送聊天訊息 |
| `suggest_command` | 將 value 指定的文字填入玩家的聊天輸入欄中 |
| `change_page` | 適用於書本, 跳轉至 value 指定的頁數 (1-based) |
| `copy_to_clipboard` | 將 value 指定的文字複製到玩家的剪貼簿中 |

#### `hoverEvent` 結構與動作 (Actions)

```json
"hoverEvent": {"action": "show_text", "contents": "提示文字"}

```

| action 值 | 說明 |
| --- | --- |
| `show_text` | 懸停時顯示 contents 指定的另一個 JSON 文本元件 |
| `show_item` | 懸停時顯示指定物品的詳細資訊 (contents 包含 id, count, tag 屬性) |
| `show_entity` | 懸停時顯示指定實體的詳細資訊 (contents 包含 id, name, type 屬性) |

---

## 外部連結 (References)

* [Minecraft Wiki - 原始 JSON 文本組件](https://minecraft.fandom.com/zh/wiki/%E5%8E%9F%E5%A7%8BJSON%E6%96%87%E6%9C%AC%E6%A0%BC%E5%BC%8F?variant=zh-tw)