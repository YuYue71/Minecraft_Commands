# recipes (合成表)

> **分類:** `物品產出` | **檔案格式:** `json` | **適用版本:** `JE ≤ 1.20.4` | **熱重載:** `/reload`

---

## 目錄

* [1. 目錄路徑 (Directory & Path)](#1-目錄路徑-directory--path)
* [2. 核心結構範本 (Core Structure Skeleton)](#2-核心結構範本-core-structure-skeleton)
* [3. 根節點屬性表 (Root Properties)](#3-根節點屬性表-root-properties)
* [4. 子對象詳解 (Sub-object Details)](#4-子對象詳解-sub-object-details)
    * [4.1 pattern & key (有形合成佈局)](#41-pattern--key-有形合成佈局)
    * [4.2 result (產出結果配置)](#42-result-產出結果配置)
    * [4.3 ingredient (消耗材料定義)](#43-ingredient-消耗材料定義)
* [5. 參數枚舉與可用值全清單 (Value Enumerations)](#5-參數枚舉與可用值全清單-value-enumerations)
    * [5.1 合成類型 (Recipe Types)](#51-合成類型-recipe-types)
    * [5.2 合成分類 (Category Types)](#52-合成分類-category-types)
* [6. 數據約束與邊界條件 (Data Constraints)](#6-數據約束與邊界條件-data-constraints)
* [7. 資料包結構參考 (Datapack Structure)](#7-資料包結構參考-datapack-structure)
* [8. 外部連結 (References)](#8-外部連結-references)

---

## 1. 目錄路徑 (Directory & Path)

> 定義物品在工作台、熔爐、切石機或鍛造台中的合成與轉換規則.

```file
data/<namespace>/recipes/[子資料夾]/<檔案名稱>.json
```

* `<namespace>`: 命名空間 (如 `minecraft`, `example`).
* `<registry>`: `recipes`.
* 調用標識符: `<namespace>:[子資料夾]/<檔案名稱>`.

---

## 2. 核心結構範本 (Core Structure Skeleton)

> 包含不同合成類型的分支骨架.

```json
// type: "minecraft:crafting_shaped" (有形合成)
{
  "type": "minecraft:crafting_shaped",
  "pattern": [ " # ", " # ", " S " ],
  "key": { "#": { "item": "minecraft:diamond" }, "S": { "item": "minecraft:stick" } },
  "result": { "item": "minecraft:diamond_sword", "count": 1 }
}

// type: "minecraft:smelting" (燒煉類: smelting, blasting, smoking, campfire_cooking)
{
  "type": "minecraft:smelting",
  "ingredient": { "item": "minecraft:raw_iron" },
  "result": "minecraft:iron_ingot",
  "experience": 0.7,
  "cookingtime": 200
}

// type: "minecraft:smithing_transform" (鍛造台升級)
{
  "type": "minecraft:smithing_transform",
  "template": { "item": "minecraft:netherite_upgrade_smithing_template" },
  "base": { "item": "minecraft:diamond_pickaxe" },
  "addition": { "item": "minecraft:netherite_ingot" },
  "result": { "item": "minecraft:netherite_pickaxe" }
}
```

---

## 3. 根節點屬性表 (Root Properties)

> 檔案第一層級的鍵值定義.

| 鍵值 (Key) | 類型 | 必填 | 簡述 | 說明、預設值與可用值索引 |
| --- | --- | --- | --- | --- |
| `"type"` | `string` | 是 | 合成類型 | 指定此合成表所屬的設備與邏輯. 詳見 [5.1](#51-合成類型-recipe-types). |
| `"group"` | `string` | 否 | 介面歸類 | 在合成譜中將多個合成表合併為同一個顯示圖示. |
| `"category"` | `enum` | 否 | 類別標籤 | 定義在合成譜中的分類分頁. 詳見 [5.2](#52-合成分類-category-types). |
| `"pattern"` | `array` | 否 | 符號佈局 | 僅適用 `crafting_shaped`. 連結至 [4.1](#41-pattern--key-有形合成佈局). |
| `"key"` | `object` | 否 | 符號映射 | 僅適用 `crafting_shaped`. 連結至 [4.1](#41-pattern--key-有形合成佈局). |
| `"ingredients"` | `array` | 否 | 無形材料 | 僅適用 `crafting_shapeless`. 連結至 [4.3](#43-ingredient-消耗材料定義). |
| `"ingredient"` | `object\|array` | 否 | 單一材料 | 適用於燒煉、切石. 連結至 [4.3](#43-ingredient-消耗材料定義). |
| `"result"` | `mixed` | 是 | 產出項目 | 支援字串 ID 或物件格式. 連結至 [4.2](#42-result-產出結果配置). |
| `"experience"` | `float` | 否 | 經驗獎勵 | 僅適用燒煉類. 成功燒煉後獲得的經驗值. |
| `"cookingtime"` | `int` | 否 | 燒煉耗時 | 僅適用燒煉類. 所需刻數 (Tick). |

---

## 4. 子對象詳解 (Sub-object Details)

### 4.1 pattern & key (有形合成佈局)

> 定義 3x3 網格內的字元形狀及其代表的物品 (Misode: Pattern/Key).

| 子鍵值 (Sub-key) | 類型 | 必填 | 簡述 | 說明 |
| --- | --- | --- | --- | --- |
| `"pattern"` | `array` | 是 | 網格形狀 | 最多 3 條字串, 每條長度 1-3. 空格代表空位. |
| `"key"` | `object` | 是 | 字元定義 | 每個字元對應一個 `ingredient` 物件. |

### 4.2 result (產出結果配置)

> 定義合成後的產物資訊 (Misode: Result).

| 子鍵值 (Sub-key) | 類型 | 必填 | 簡述 | 說明 |
| --- | --- | --- | --- | --- |
| `"item"` | `string` | 是 | 產出 ID | 產出物品的資源位置標識符. |
| `"count"` | `int` | 否 | 產出數量 | 單次合成產出的堆疊數量 (預設 `1`). |

### 4.3 ingredient (消耗材料定義)

> 定義輸入的材料, 支援多選一機制 (Misode: Ingredient).

| 子鍵值 (Sub-key) | 類型 | 必填 | 簡述 | 說明 |
| --- | --- | --- | --- | --- |
| `"item"` | `string` | 否 | 具體物品 | 必須存在的特定物品 ID. |
| `"tag"` | `string` | 否 | 物品標籤 | 任何屬於該標籤的物品皆可作為材料. |
| `陣列格式` | `array` | 否 | 混合清單 | 以上兩者的陣列, 玩家可放入其中任一物品. |

---

## 5. 參數枚舉與可用值全清單 (Value Enumerations)

### 5.1 合成類型 (Recipe Types)

| 參數值 (Value) | 簡述 | 完整遊戲行為說明與影響範圍 |
| --- | --- | --- |
| `minecraft:crafting_shaped` | 有形合成 | 在工作台中必須依照 `pattern` 排列. |
| `minecraft:crafting_shapeless` | 無形合成 | 在工作台中隨意擺放指定的 `ingredients` 即可. |
| `minecraft:smelting` | 熔爐燒煉 | 標準熔爐製作, 適用於多數資源轉換. |
| `minecraft:blasting` | 高爐燒煉 | 燒煉礦石, 速度為熔爐的 2 倍. |
| `minecraft:smoking` | 煙燻燒煉 | 烹飪食物, 速度為熔爐的 2 倍. |
| `minecraft:campfire_cooking` | 營火烹飪 | 在營火上加熱食物, 耗時較長且不消耗燃料. |
| `minecraft:stonecutting` | 切石加工 | 切石機專用, 將單一材料轉換為各種衍生方塊. |
| `minecraft:smithing_transform` | 鍛造升級 | 鍛造台升級 (如鑽石升級為獄髓). |
| `minecraft:smithing_trim` | 鍛造裝飾 | 鍛造台盔甲紋飾 (Armor Trim) 專用. |

### 5.2 合成分類 (Category Types)

| 參數值 (Value) | 簡述 | 完整遊戲行為說明與影響範圍 |
| --- | --- | --- |
| `building` | 建築類 | 方塊、裝飾、樓梯等. |
| `redstone` | 紅石類 | 活塞、中繼器、紅石火把等. |
| `equipment` | 裝備類 | 武器、防具、工具等. |
| `misc` | 其他類 | 雜項、食物、染料等. |

---

## 6. 數據約束與邊界條件 (Data Constraints)

* **網格尺寸**: `pattern` 的高度與寬度不能超過 3, 否則會導致載入錯誤.
* **經驗限制**: `experience` 必須為正浮點數, 指的是單個物品燒煉產生的經驗.
* **燒煉時間**: `cookingtime` 必須為正整數. 預設值參考: 熔爐 `200`, 高爐/煙燻爐 `100`, 營火 `600`.
* **無形限制**: `crafting_shapeless` 的 `ingredients` 總數不得超過 9 個.

---

## 7. 資料包結構參考 (Datapack Structure)

### 合成表位置與命名
`data/<namespace>/recipes/<name>.json`

**範例:**
自定義麵包合成, 檔案位於 `data/example/recipes/bread.json`. 遊戲內可透過 `/recipe give @p example:bread` 進行解鎖.

---

## 8. 外部連結 (References)

* [Misode Data Pack Generators - Recipe](https://misode.github.io/recipe/)
* [Minecraft Wiki - Recipe Definition](https://zh.minecraft.wiki/)
* [資源位置與命名空間規範 (Resource Locations)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/ResourceLocations.md)
* [方塊狀態與標籤 (Block States & Tags)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/BlockStates_or_Tags.md)
* [物品 NBT 矩陣 (Items)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.NBT/list.md)
* [相關指令: /recipe](https://github.com/YuYue71/Minecraft_Commands/blob/main/.commands/recipe.md)