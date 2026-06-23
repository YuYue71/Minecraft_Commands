# /datapack

> **分類:** `指令` | **權限等級:** `2` | **適用版本:** `JE ≤ 1.20.4` | **命令方塊:** `true`

---

## 目錄

* [語法](#語法-syntax)
* [參數說明](#參數說明-parameters)
    * [name 與 existing](#name-與-existing)
    * [enable 排序位置](#enable-排序位置)
    * [list 過濾器](#list-過濾器)
* [外部連結](#外部連結-references)

---

## 語法 (Syntax)

```commands
/datapack disable <name>
/datapack enable <name>
/datapack enable <name> first
/datapack enable <name> last
/datapack enable <name> before <existing>
/datapack enable <name> after <existing>
/datapack list
/datapack list available
/datapack list enabled
```

* `<>` = 必填

| 參數 / 欄位 | 類型 | 預設 | 說明 |
| --- | --- | --- | --- |
| `<name>` | `string` | - | 欲啟用或停用的目標資料包名稱 |
| `<existing>` | `string` | - | 已啟用的資料包名稱, 作為相對排序的基準點 |
| `first` | `enum` | - | 將資料包置於載入序列的最前端 (優先度最低) |
| `last` | `enum` | - | 將資料包置於載入序列的最末端 (優先度最高) |
| `before` | `enum` | - | 將資料包插入至 `<existing>` 之前 (優先度較低) |
| `after` | `enum` | - | 將資料包插入至 `<existing>` 之後 (優先度較高) |
| `available` | `enum` | - | 僅列出目前可使用但尚未啟用的資料包 |
| `enabled` | `enum` | - | 僅列出目前已啟用的資料包 |

---

## 參數說明 (Parameters)

### `name` 與 `existing`

> 伺服器中資料包的精確識別名稱.

* 若資料包是放置在 `datapacks` 資料夾內的獨立檔案或資料夾, 其名稱通常帶有 `"file/"` 前綴 (如 `"file/my_custom_pack.zip"`).
* 原版內建的基礎資料包名稱為 `"vanilla"`.
* 名稱若包含空格或特殊符號, 必須使用雙引號 `""` 將整串名稱包覆起來.

---

### `enable` 排序位置

> Minecraft 處理資料包覆寫的邏輯是由上到下 (由先到後) 載入. 較後載入的資料包會覆寫較早載入的同名檔案.

| 值 | 說明 |
| --- | --- |
| `first` | 移至載入順序第 1 位. 若有其他資料包包含相同路徑檔案, 此資料包的內容將會被覆寫 (優先度最低) |
| `last` | 移至載入順序最後 1 位. 此資料包將強制覆寫前面所有包含相同路徑的檔案 (優先度最高) |
| `before` | 移至 `<existing>` 的緊接前方. 若兩者檔案衝突, 將優先採用 `<existing>` 的設定 |
| `after` | 移至 `<existing>` 的緊接後方. 若兩者檔案衝突, 將會覆寫 `<existing>` 的設定 |

---

### `list` 過濾器

> 用於過濾 `/datapack list` 指令輸出的清單範圍.

| 值 | 說明 |
| --- | --- |
| `available` | 僅列出存放於 `datapacks` 資料夾中, 且目前尚未被啟用的資料包 |
| `enabled` | 僅列出目前已經啟用的資料包, 系統會同時顯示它們目前的載入排序 |

* 若僅執行 `/datapack list` 而不附加任何過濾器, 系統會統整並列出已啟用與未啟用的所有資料包清單.

---

## 外部連結 (References)

* [Minecraft Wiki - /datapack](https://minecraft.fandom.com/zh/wiki/%E6%95%B0%E6%8D%AE%E5%8C%85)