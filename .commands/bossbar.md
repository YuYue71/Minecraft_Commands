# /bossbar

> **分類:** `指令` | **權限等級:** `2` | **適用版本:** `JE ≤ 1.20.4` | **命令方塊:** `true`

---

## 目錄

* [語法](#語法-syntax)
* [參數說明](#參數說明-parameters)
    * [動作類型 (add, get, list, remove, set)](#動作類型-add-get-list-remove-set)
    * [id 與 name](#id-與-name)
    * [set 分支參數設定](#set-分支參數設定)
* [原版 Bossbar 顏色清單](#原版-bossbar-顏色清單)
* [原版 Bossbar 樣式清單](#原版-bossbar-樣式清單)
* [外部連結](#外部連結-references)

---

## 語法 (Syntax)

```commands
/bossbar add <id> <name>
/bossbar get <id> max
/bossbar get <id> players
/bossbar get <id> value
/bossbar get <id> visible
/bossbar list
/bossbar remove <id>
/bossbar set <id> color <color>
/bossbar set <id> max <max>
/bossbar set <id> name <name>
/bossbar set <id> players [players]
/bossbar set <id> style <style>
/bossbar set <id> value <value>
/bossbar set <id> visible <visible>

```

* `<>` = 必填, `[]` = 選填

| 參數 / 欄位 | 類型 | 預設 | 說明 |
| --- | --- | --- | --- |
| `add` / `get` / `list` / `remove` / `set` | `enum` | - | 決定對自訂 Bossbar 執行的操作類型 |
| `<id>` | `string` | - | 指定 Bossbar 的命名空間與唯一 ID |
| `<name>` | `json` | - | Bossbar 顯示的標題文字 |
| `max` / `players` / `value` / `visible` | `enum` | - | `get` 或 `set` 操作的屬性分支 |
| `color` / `style` / `name` | `enum` | - | `set` 操作的樣式設定分支 |
| `<color>` | `enum` | `white` | Bossbar 的視覺顏色 |
| `<style>` | `enum` | `progress` | Bossbar 的分段刻度樣式 |
| `<max>` | `int` | `100` | Bossbar 的最大值 (必須大於 0) |
| `<value>` | `int` | `0` | Bossbar 的當前值 |
| `<visible>` | `boolean` | `true` | 是否顯示此 Bossbar |
| `[players]` | `entity` | 無 | 能看見此 Bossbar 的目標玩家 |

---

## 參數說明 (Parameters)

### `動作類型 (add, get, list, remove, set)`

> 決定要對自訂 Bossbar 執行何種操作.

| 值 | 說明 |
| --- | --- |
| `add` | 建立一個全新的 Bossbar. 建立時必須指定 ID 與顯示名稱. |
| `get` | 獲取現有 Bossbar 的特定屬性數值 (如當前血量). 這些數值可以被指令方塊或資料包捕捉並用於後續運算. |
| `list` | 於聊天框中列出當前世界內所有已建立的自訂 Bossbar ID. |
| `remove` | 完全刪除一個已存在的 Bossbar. |
| `set` | 針對已存在的 Bossbar, 修改其外觀, 數值或可見性等屬性. |

---

### `id` 與 `name`

> 定義 Bossbar 的系統代碼與玩家看到的標題文字.

* `id`: 作為系統識別該 Bossbar 的唯一代碼. 必須符合標準的資源位置格式 (如 `minecraft:custom_boss`). 在自訂建立時通常可省略前綴直接寫 `custom_boss`, 系統會自動將其歸類為 `minecraft:custom_boss`.
* `name`: 顯示在 Bossbar 上方的文字標題. 此欄位完全支援 JSON 文本元件格式, 允許自訂顏色, 粗體斜體, 甚至插入分數與多國語言 (例如 `{"text":"最終決戰","color":"red","bold":true}`).

---

### `set 分支參數設定`

> 使用 `set` 指令時, 可以修改的具體屬性項目.

* `color`: 更改 Bossbar 本身的顏色.
* `style`: 更改 Bossbar 的刻度與視覺分段樣式 (常見於不同階段的 Boss 戰).
* `max`: 設定血條的上限值 (代表 100% 滿血時的數值). 預設為 100.
* `value`: 設定血條當前的數值. 當此數值等於 `max` 時, 血條將呈現全滿狀態; 數值為 0 時則為空血.
* `visible`: 切換該 Bossbar 的顯示狀態. 若設為 `false`, 即使玩家被加入到顯示名單內也無法看見該血條.
* `players`: 指定哪些玩家可以看見這條 Bossbar. 支援目標選擇器 (如 `@a`, `@p`). 若執行 `/bossbar set <id> players` 且不填寫任何玩家參數, 則等同於清空顯示名單, 不會有任何玩家看見.

---

## 原版 Bossbar 顏色清單

### 顏色 (Color)

| 顏色 ID | 說明 | 顏色 ID | 說明 |
| --- | --- | --- | --- |
| `blue` | 藍色 | `green` | 綠色 |
| `pink` | 粉紅色 | `purple` | 紫色 |
| `red` | 紅色 | `white` | 白色 (預設值) |
| `yellow` | 黃色 |  |  |

---

## 原版 Bossbar 樣式清單

### 樣式 (Style)

| 樣式 ID | 說明 |
| --- | --- |
| `progress` | 連續無分段的進度條 (預設值) |
| `notched_6` | 分為 6 個格段的血條 |
| `notched_10` | 分為 10 個格段的血條 |
| `notched_12` | 分為 12 個格段的血條 |
| `notched_20` | 分為 20 個格段的血條 |

---

## 外部連結 (References)

* [Minecraft Wiki - /bossbar](https://zh.minecraft.wiki/w/%E5%91%BD%E4%BB%A4/bossbar)
* [資源位置與命名空間規範 (Resource Locations)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/ResourceLocations.md)
* [JSON 文本元件 (Raw JSON Text Components)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/json_text.md)
* [目標選擇器 (Target Selectors)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/TargetSelectors.md)