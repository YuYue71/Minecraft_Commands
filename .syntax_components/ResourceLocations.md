# 資源位置與命名空間規範 (Resource Locations)

> **分類:** `全域系統` | **適用版本:** `JE ≤ 1.20.4`

---

## 目錄

* [核心結構](#核心結構-core-structure)
* [屬性說明](#屬性說明-attributes)
    * [字元限制規範](#字元限制規範)
    * [資料包路徑映射](#資料包路徑映射)
* [外部連結](#外部連結-references)

---

## 核心結構 (Core Structure)

```text
<namespace>:<path/to/resource>

```

* 用於全域系統中定位資源檔案, 指令實體與資料包元素的唯一識別碼 (ID).
* 若在指令或檔案中未明確填寫 `<namespace>:`, 系統通常預設視為 `minecraft:`.

| 屬性 / 欄位 | 類型 | 預設 | 說明 |
| --- | --- | --- | --- |
| `<namespace>` | `string` | `minecraft` | 命名空間, 代表資源的所屬來源 (如原版, 模組名稱或特定資料包) |
| `<path>` | `string` | - | 資源在此命名空間下的具體目錄階層與名稱 |

---

## 屬性說明 (Attributes)

### `字元限制規範`

> 定義命名空間與路徑中允許使用的合法字元集. 系統對命名空間有嚴格的格式驗證, 強制要求全小寫.

| 屬性 | 允許字元 | 限制說明 |
| --- | --- | --- |
| `<namespace>` | `0-9`, `a-z`, `_`, `-`, `.` | 嚴禁大寫字母, 空格與特殊符號. 不能包含斜線 `/` |
| `<path>` | `0-9`, `a-z`, `_`, `-`, `.`, `/` | 嚴禁大寫字母. 允許使用斜線 `/` 來建立目錄階層與資料夾結構 |

---

### `資料包路徑映射`

> 資源位置在指令 (`/function`, `/loot`, `/advancement` 等) 中呼叫時, 其實際對應到本機資料夾結構的映射關係. 使用時不包含副檔名 (如 `.json` 或 `.mcfunction`).

| 資源類型 | 引用格式範例 | 對應的實際檔案系統路徑 |
| --- | --- | --- |
| 函式 (Function) | `custom:folder/my_func` | `data/custom/functions/folder/my_func.mcfunction` |
| 戰利品表 (Loot Table) | `custom:chests/rare` | `data/custom/loot_tables/chests/rare.json` |
| 進度/成就 (Advancement) | `custom:story/start` | `data/custom/advancements/story/start.json` |
| 條件謂詞 (Predicate) | `custom:is_raining` | `data/custom/predicates/is_raining.json` |
| 配方 (Recipe) | `custom:weapons/sword` | `data/custom/recipes/weapons/sword.json` |
| 標籤 (Tag) | `#custom:blocks/my_blocks` | `data/custom/tags/blocks/my_blocks.json` |
| 結構 (Structure) | `custom:ruins/tower` | `data/custom/structures/ruins/tower.nbt` |

---

## 外部連結 (References)

* [Minecraft Wiki - 資源位置](https://minecraft.fandom.com/zh/wiki/.minecraft?variant=zh-tw)