## 自訂合成配方 (`recipes/`)

> **分類:** `資料包` ｜ **適用版本:** `JE ≤ 1.20.4`
> **路徑:** `data/<namespace>/recipes/<名稱>.json` ｜ **引用格式:** `namespace:<名稱>`

---

## 目錄

* [概覽](#概覽-overview)
* [JSON 結構](#json-結構)
    * [type = crafting_shaped (有形合成)](#type--minecraftcrafting_shaped-時-有形合成)
    * [type = smelting (熔爐燒煉)](#type--minecraftsmelting-時-熔爐燒煉)
* [欄位說明](#欄位說明-fields)
    * [通用欄位](#通用欄位-所有配方共用)
    * [子欄位：crafting_shaped 專屬](#子欄位crafting_shaped-專屬-有形合成)
    * [子欄位：smelting 專屬](#子欄位smelting-專屬-熔爐燒煉)
* [枚舉值速查](#枚舉值速查)
    * [配方類型 (type)](#配方類型-type-可填值)
    * [配方簿分類 (category)](#配方簿分類-category-可填值)
* [條件依賴](#條件依賴-conditional-fields)
* [注意事項](#注意事項-notes)
* [外部連結](#外部連結-references)

---

## 概覽 (Overview)

自訂合成配方 (Recipes) 管轄遊戲內所有的 Item Conversion (物品轉換) 邏輯，包含工作台 (Crafting Table)、熔爐類 (Furnaces)、切石機 (Stonecutter) 與鍛造台 (Smithing Table)。配方簿的解鎖通常與 `advancements/` 中的 `recipe_unlocked` 觸發器連動。

---

## JSON 結構

由於配方系統依賴 `type` 決定底層轉換邏輯，以下展示工作台與熔爐兩種最核心之結構範本：

### type = `"minecraft:crafting_shaped"` 時 (有形合成)

```json
{
    "type": "minecraft:crafting_shaped",
    "category": "equipment",
    "group": "diamond_gear",
    "pattern": [
        "###",
        " # ",
        " # "
    ],
    "key": {
        "#": {
            "item": "minecraft:diamond"
        }
    },
    "result": {
        "item": "minecraft:diamond_pickaxe",
        "count": 1
    },
    "show_notification": true
}

```

### type = `"minecraft:smelting"` 時 (熔爐燒煉)

```json
{
    "type": "minecraft:smelting",
    "category": "misc",
    "group": "gold_ingot",
    "ingredient": {
        "item": "minecraft:raw_gold"
    },
    "result": "minecraft:gold_ingot",
    "experience": 0.7,
    "cookingtime": 200
}

```

---

## 欄位說明 (Fields)

### 通用欄位 (所有配方共用)

| 欄位 | 類型 | 必填 | 預設 | 說明 |
| --- | --- | --- | --- | --- |
| `type` | `string` | ✓ | — | Recipe Type (配方類型) 之 Registry ID (註冊識別碼)。枚舉值見下方 |
| `category` | `string` |  | `"misc"` | Recipe Book Category (配方簿分類) `[1.19.3+]`。決定此配方在 UI 介面中的分頁標籤 |
| `group` | `string` |  | `""` | Group Name (群組名稱)。將多個相似的配方（如不同木材合成木板）在配方簿中折疊為同一格 |

### 子欄位：`crafting_shaped` 專屬 (有形合成)

| 欄位 | 類型 | 必填 | 預設 | 說明 |
| --- | --- | --- | --- | --- |
| `pattern` | `array[]` | ✓ | — | Shape Pattern (形狀矩陣)。字串陣列，代表合成網格（1x1 至 3x3），以單一字元代表物品位置，空白表示不放物品 |
| `key` | `object` | ✓ | — | Key Mapping (字元映射表)。定義 `pattern` 中的每一個字元所對應的 Item Predicate (物品條件，支援 `item` 或 `tag`) |
| `result` | `object` | ✓ | — | Result Object (結果物件)。包含 `item` (產出物品識別碼) 與可選的 `count` (產出數量，預設 1) |
| `show_notification` | `boolean` |  | `true` | 當玩家解鎖此配方時，是否於畫面右上角顯示 Toast (解鎖通知) |

### 子欄位：`smelting` 專屬 (熔爐燒煉)
> 此結構同樣適用於 `blasting` (高爐)、`smoking` (煙燻爐) 與 `campfire_cooking` (營火)。

| 欄位 | 類型 | 必填 | 預設 | 說明 |
| --- | --- | --- | --- | --- |
| `ingredient` | `object`/`array` | ✓ | — | Ingredient (原料)。定義需燒煉的 Item Predicate，支援陣列形式（多種原料皆可燒出同一結果） |
| `result` | `string` | ✓ | — | Result Item (結果物品)。產出之物品 Registry ID（熔爐類配方**不可**自訂數量，永遠為 1） |
| `experience` | `float` |  | `0.0` | Experience (經驗值)。玩家將物品從熔爐取出時獲得的經驗球點數 |
| `cookingtime` | `int` |  | `200` | Cooking Time (燒煉時間)。以 Tick (遊戲刻) 為單位。一般熔爐預設 200，高爐/煙燻爐建議設為 100 |

---

## 枚舉值速查

### 配方類型 (`type` 可填值)

| 值 | 分類 | 說明 |
| --- | --- | --- |
| `minecraft:crafting_shaped` | 工作台 | 有形合成。原料必須嚴格排列成指定形狀 |
| `minecraft:crafting_shapeless` | 工作台 | 無序合成。原料位置不拘，只需數量與種類吻合即可 |
| `minecraft:smelting` | 熔爐 | 一般熔爐燒煉 |
| `minecraft:blasting` | 熔爐 | 礦石與金屬高爐燒煉（速度通常為 2 倍） |
| `minecraft:smoking` | 熔爐 | 食物煙燻爐燒煉（速度通常為 2 倍） |
| `minecraft:campfire_cooking` | 熔爐 | 營火燒烤（無介面，將物品放置於營火上） |
| `minecraft:stonecutting` | 切石 | 切石機轉換。將 1 個原料直接轉化為指定數量的結果物品 |
| `minecraft:smithing_transform` | 鍛造 | `[1.20+]` 鍛造台裝備升級。需 `template` (模板)、`base` (基底)、`addition` (添加物) |
| `minecraft:smithing_trim` | 鍛造 | `[1.20+]` 鍛造台護甲紋飾。消耗自訂裝飾模板以變更護甲外觀 NBT |

### 配方簿分類 (`category` 可填值)
> 僅適用於 1.19.3 以後版本，不同 `type` 支援的 `category` 枚舉有所差異。

| 值 | 適用 type | 說明 |
| --- | --- | --- |
| `building` | 工作台 | 建築方塊分頁 |
| `redstone` | 工作台 | 紅石與工具分頁 |
| `equipment` | 工作台 | 裝備與武器分頁 |
| `misc` | 工作台、熔爐 | 雜項分頁 (預設值) |
| `food` | 熔爐 | 食物分頁 (高爐無法使用此類別) |
| `blocks` | 熔爐 | 礦物與方塊分頁 (煙燻爐無法使用此類別) |

---

## 條件依賴 (Conditional Fields)

| 條件 | 生效欄位 | 失效 / 忽略欄位 |
| --- | --- | --- |
| `type` = `"minecraft:crafting_shaped"` 時 | `pattern` 與 `key` 轉為強制必填 | 忽略 `ingredient` 等無序合成欄位 |
| `type` = `"minecraft:crafting_shapeless"` 時 | 必須包含 `ingredients` (物件陣列) | 忽略 `pattern` 與 `key` 引數 |
| `type` 為熔爐類 (`smelting` 等) 時 | `result` 轉為字串型態 | 無法使用物件型態自訂 `count` (數量固定為 1) |

---

## 注意事項 (Notes)

* 在 `crafting_shaped` 的 `pattern` 中，空白字元 (`" "`) 為系統保留字，代表「該格不放物品」，絕對不可將 `" "` 宣告在 `key` 映射表中。
* 配方中的 `result` 無法直接附帶 NBT 資料（如自訂附魔、名稱）。若需產出帶有 NBT 的物品，必須搭配 `advancements/` 的 `recipe_unlocked` 觸發器，並透過 `rewards` 執行 `function` 給予玩家，或於 `1.20.5+` 運用新版 `components` (超出本文件版本邊界)。

---

## 外部連結 (References)

* [Minecraft Wiki - 配方](https://www.google.com/search?q=%23)

---

*最後更新：2026-06-22*