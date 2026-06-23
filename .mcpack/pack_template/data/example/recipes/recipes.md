# recipes (合成表)

> **分類:** `資料包元素` | **檔案格式:** `json` | **命名空間支援:** `true` | **熱重載:** `/reload`

---

## 目錄

* [目錄路徑](#目錄路徑-directory--path)
* [核心結構](#核心結構-core-structure)
* [節點說明](#節點說明-node-explanations)
    * [type (類型)](#type-原版合成類型-清單)
    * [pattern & key (形狀與材料映射)](#pattern--key-僅限有形合成)
    * [result (輸出結果)](#result-object)
* [外部連結](#外部連結-references)

---

## 目錄路徑 (Directory & Path)

> 說明該元素檔案在資料包內部的標準存放位置.

```file
data/<namespace>/recipes/[子資料夾]/<檔案名稱>.json
```

* `<namespace>` = 命名空間 (如 `minecraft`, `example`)
* `<檔案名稱>` = 決定遊戲內調用該合成表的 ID 名稱
* 遊戲內調用格式為: `<namespace>:[子資料夾]/<檔案名稱>` (例如 `example:ruby_sword`)

---

## 核心結構 (Core Structure)

> 合成表定義了輸入材料與產出物品的邏輯. 以下以「有形合成 (Shaped Crafting)」為例.

```json
{
    "type": "minecraft:crafting_shaped",
    "pattern": [
        " # ",
        " # ",
        " S "
    ],
    "key": {
        "#": {
            "item": "minecraft:diamond"
        },
        "S": {
            "item": "minecraft:stick"
        }
    },
    "result": {
        "item": "minecraft:diamond_sword",
        "count": 1
    }
}
```

| 鍵值 / 節點 (Key) | 類型 | 必填 | 說明 |
| --- | --- | --- | --- |
| `"type"` | `string` | 是 | 指定合成類型 (如 `crafting_shaped`, `smelting`) |
| `"group"` | `string` | 否 | 將多個合成表歸類於合成譜中的同一組 |
| `"category"` | `string` | 否 | 指定合成譜分類 (如 `equipment`, `building`, `misc`) |

---

## 節點說明 (Node Explanations)

### `type` (原版合成類型) 清單

| 值 | 說明 |
| --- | --- |
| `minecraft:crafting_shaped` | 有形合成 (需按照特定排佈). |
| `minecraft:crafting_shapeless` | 無形合成 (材料隨機放置於網格). |
| `minecraft:smelting` | 熔爐燒煉. |
| `minecraft:blasting` | 高爐燒煉. |
| `minecraft:smoking` | 煙燻爐烹飪. |
| `minecraft:campfire_cooking` | 營火烹飪. |
| `minecraft:stonecutting` | 切石機加工. |
| `minecraft:smithing_transform` | 鍛造台升級 (1.20+). |
| `minecraft:smithing_trim` | 鍛造台裝飾 (1.20+). |

---

### `pattern & key` (僅限有形合成)

> 定義 3x3 網格內的字元佈局及對應的材料.

| 子節點 (Sub-key) | 類型 | 必填 | 說明 |
| --- | --- | --- | --- |
| `"pattern"` | `array` | 是 | 字串陣列 (最多 3x3). 空格代表空位. |
| `"key"` | `object` | 是 | 映射 pattern 中的字元至具體物品或標籤. |
| `"key.<char>"` | `object\|array` | 是 | 可指定 `item` 或 `tag`. 陣列代表多選一. |

---

### `result (Object)`

> 定義合成產出的物品資訊.

| 子節點 (Sub-key) | 類型 | 必填 | 說明 |
| --- | --- | --- | --- |
| `"item"` | `string` | 是 | 產出物品的 ID. |
| `"count"` | `int` | 否 | 產出數量 (預設 `1`). |
| `"template"` | `string` | 是 | 僅限鍛造台: 模板物品 ID. |
| `"base"` | `string` | 是 | 僅限鍛造台: 基礎物品 ID. |
| `"addition"` | `string` | 是 | 僅限鍛造台: 添加物品 ID. |

---

### `cooking (燒煉類專用)`

> 適用於 `smelting`, `blasting`, `smoking`, `campfire_cooking`.

| 子節點 (Sub-key) | 類型 | 必填 | 說明 |
| --- | --- | --- | --- |
| `"ingredient"` | `object\|array` | 是 | 輸入材料 (單一物品或標籤清單). |
| `"experience"` | `float` | 否 | 燒煉完成後獲得的經驗值 (預設 `0`). |
| `"cookingtime"` | `int` | 否 | 燒煉所需刻數 (預設依類型而定, 如熔爐為 `200`). |

---

## 外部連結 (References)

* [Minecraft Wiki - Recipe](https://zh.minecraft.wiki/w/%E9%85%8D%E6%96%B9?variant=zh-tw)
* [Misode Data Pack Generators - Recipe](https://misode.github.io/recipe/)
* [資源位置與命名空間規範 (Resource Locations)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/ResourceLocations.md)
* [方塊狀態與標籤 (Block States & Tags)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/BlockStates_or_Tags.md)
* [物品 NBT 矩陣 (Items)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.NBT/list.md)
* [合成表指令 (recipe)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.commands/recipe.md)