# predicates (謂詞 / 判定條件)

> **分類:** `資料包元素` | **檔案格式:** `json` | **命名空間支援:** `true` | **熱重載:** `/reload`

---

## 目錄

* [目錄路徑](#目錄路徑-directory--path)
* [核心結構](#核心結構-core-structure)
* [節點說明](#節點說明-node-explanations)
    * [condition (條件類型)](#condition-條件類型)
    * [terms (複合條件)](#terms-array)
* [原版條件類型 (Conditions) 窮舉清單](#原版條件類型-conditions-窮舉清單)
* [外部連結](#外部連結-references)

---

## 目錄路徑 (Directory & Path)

> 謂詞檔案用於定義複雜的邏輯判斷, 常與 `/execute if predicate` 或戰利品表配合使用.

```file
data/<namespace>/predicates/[子資料夾]/<檔案名稱>.json
```

* `<namespace>` = 命名空間 (如 `minecraft`, `example`)
* `[子資料夾]` = 開發者自訂的分類目錄 (選填)
* `<檔案名稱>` = 決定該謂詞的 ID 名稱
* 遊戲內調用格式為: `<namespace>:[子資料夾]/<檔案名稱>` (例如 `example:is_sneaking`)

---

## 核心結構 (Core Structure)

> 謂詞的核心是一個條件物件或多個條件的邏輯組合.

```json
{
    "condition": "minecraft:entity_properties",
    "entity": "this",
    "predicate": {
        "flags": {
            "is_sneaking": true
        }
    }
}
```

| 鍵值 / 節點 (Key) | 類型 | 必填 | 說明 |
| --- | --- | --- | --- |
| `"condition"` | `string` | 是 | 指定判斷條件的類型 ID |
| `"terms"` | `array` | 否 | 用於複合條件 (如 `all_of`, `any_of`) 的子條件列表 |

---

## 節點說明 (Node Explanations)

### `condition` (條件類型)

> 定義該謂詞執行的具體邏輯判斷方式.

| 屬性 | 說明 |
| --- | --- |
| `類型` | 必須為有效的原版條件 ID (詳見下表). |
| `參數` | 根據不同的 `"condition"` 類型, 根目錄需填入對應的參數節點. |

---

### `terms (Array)`

> 僅在 `condition` 為 `all_of`, `any_of` 等複合類型時使用.

| 鍵值 / 節點 (Key) | 類型 | 必填 | 說明 |
| --- | --- | --- | --- |
| `"condition"` | `string` | 是 | 子條件的類型 ID |
| `...` | `mixed` | 否 | 該子條件所需的特定參數 |

---

## 原版條件類型 (Conditions) 窮舉清單

### 邏輯組合類 (Logical Composites)

| ID | 說明 |
| --- | --- |
| `minecraft:all_of` | 所有子條件 (terms) 皆須成立 (AND). |
| `minecraft:any_of` | 任一子條件 (terms) 成立即可 (OR). |
| `minecraft:inverted` | 反轉子條件的結果 (NOT). 需使用 `term` 節點. |
| `minecraft:reference` | 引用另一個謂詞檔案. 需使用 `name` 節點. |

### 環境與狀態類 (Environment & States)

| ID | 說明 |
| --- | --- |
| `minecraft:weather_check` | 檢查天氣狀態 (如 `is_raining`, `is_thundering`). |
| `minecraft:time_check` | 檢查世界時間 (Time). |
| `minecraft:location_check` | 檢查座標、維度、生物群系或方塊狀態. |
| `minecraft:entity_properties` | 檢查實體的屬性 (如 NBT、裝備、效果、旗標). |
| `minecraft:entity_scores` | 檢查實體的計分板數值. |
| `minecraft:value_check` | 檢查一個動態數值是否在範圍內. |

### 物品與戰鬥類 (Items & Combat)

| ID | 說明 |
| --- | --- |
| `minecraft:match_tool` | 檢查工具/物品是否符合特定屬性 (常用於挖掘條件). |
| `minecraft:damage_source_properties` | 檢查傷害來源的屬性. |
| `minecraft:killed_by_player` | 檢查是否被玩家擊殺. |
| `minecraft:random_chance` | 隨機機率判定 (0.0 到 1.0). |
| `minecraft:random_chance_with_looting` | 結合掠奪 (Looting) 等級的隨機機率判定. |

---

## 外部連結 (References)

* [Minecraft Wiki - Predicate](https://zh.minecraft.wiki/w/%E8%B0%93%E8%AF%8D?variant=zh-tw)
* [Misode Data Pack Generators - Predicate](https://misode.github.io/predicate/)
* [資源位置與命名空間規範 (Resource Locations)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/ResourceLocations.md)
* [目標選擇器 (Target Selectors)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/TargetSelectors.md)
* [座標系統 (Coordinate Systems)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/coordinates.md)
* [實體 NBT 矩陣 (Entities)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.NBT/list.md)
* [方塊狀態與標籤 (Block States & Tags)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/BlockStates_or_Tags.md)
* [判定條件指令 (execute)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.commands/execute.md)