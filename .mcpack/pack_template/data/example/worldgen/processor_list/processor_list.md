# worldgen/processor_list (處理器列表)

> **分類:** `世界生成` | **檔案格式:** `json` | **適用版本:** `JE ≤ 1.20.4` | **熱重載:** `/reload`

---

## 目錄

* [1. 目錄路徑 (Directory & Path)](#1-目錄路徑-directory--path)
* [2. 核心結構範本 (Core Structure Skeleton)](#2-核心結構範本-core-structure-skeleton)
* [3. 根節點屬性表 (Root Properties)](#3-根節點屬性表-root-properties)
* [4. 子對象詳解 (Sub-object Details)](#4-子對象詳解-sub-object-details)
    * [4.1 規則項 (Rule Entry) 屬性細節](#41-規則項-rule-entry-屬性細節)
    * [4.2 判定器 (Predicates) 屬性細節](#42-判定器-predicates-屬性細節)
* [5. 參數枚舉與可用值全清單 (Value Enumerations)](#5-參數枚舉與可用值全清單-value-enumerations)
    * [5.1 處理器類型 (Processor Types)](#51-處理器類型-processor-types)
    * [5.2 判定器類型 (Predicate Types)](#52-判定器類型-predicate-types)
* [6. 數據約束與邊界條件 (Data Constraints)](#6-數據約束與邊界條件-data-constraints)
* [7. 外部連結 (References)](#7-外部連結-references)

---

## 1. 目錄路徑 (Directory & Path)

> 定義在放置結構 (Structure) 時的方塊替換、隨機損壞或狀態修改規則.

```file
data/<namespace>/worldgen/processor_list/[子資料夾]/<檔案名稱>.json
```

* `<namespace>`: 命名空間 (如 `minecraft`, `example`).
* `<registry>`: `worldgen/processor_list`.
* 調用標識符: `<namespace>:[子資料夾]/<檔案名稱>`.

---

## 2. 核心結構範本 (Core Structure Skeleton)

> 包含一系列按順序執行的處理器, 最常用的是基於規則的替換 (rule).

```json
{
  "processors": [
    {
      "processor_type": "minecraft:rule",
      "rules": [
        {
          "input_predicate": {
            "predicate_type": "minecraft:random_block_match",
            "block": "minecraft:cobblestone",
            "probability": 0.5
          },
          "location_predicate": {
            "predicate_type": "minecraft:always_true"
          },
          "output_state": {
            "Name": "minecraft:mossy_cobblestone"
          }
        }
      ]
    }
  ]
}
```

---

## 3. 根節點屬性表 (Root Properties)

> 檔案第一層級的鍵值定義.

| 鍵值 (Key) | 類型 | 必填 | 簡述 | 說明與可用值索引 |
| --- | --- | --- | --- | --- |
| `"processors"` | `array` | 是 | 處理器清單 | 包含一或多個處理器物件, 系統將依序處理方塊. |

---

## 4. 子對象詳解 (Sub-object Details)

### 4.1 規則項 (Rule Entry) 屬性細節

> 適用於 `processor_type: "minecraft:rule"`. 定義「若符合某種條件, 則將方塊 A 替換為 B」.

| 子鍵值 (Sub-key) | 類型 | 必填 | 簡述 | 說明 |
| --- | --- | --- | --- | --- |
| `"input_predicate"` | `object` | 是 | 輸入判定 | 檢查 NBT 結構檔案中的原始方塊是否符合條件. 詳見 [4.2](#42-判定器-predicates-屬性細節). |
| `"location_predicate"` | `object` | 是 | 位置判定 | 檢查結構被放置在世界中的目標位置方塊. 詳見 [4.2](#42-判定器-predicates-屬性細節). |
| `"output_state"` | `object` | 是 | 輸出方塊 | 符合上述兩項判定後, 最終生成的方塊狀態. |
| `"output_nbt"` | `compound` | 否 | 輸出 NBT | 替換後方塊所攜帶的新 NBT 數據 (SNBT 格式). |

### 4.2 判定器 (Predicates) 屬性細節

> 用於 `input_predicate` 或 `location_predicate`.

| 子鍵值 (Sub-key) | 類型 | 必填 | 簡述 | 說明 |
| --- | --- | --- | --- | --- |
| `"predicate_type"` | `string` | 是 | 判定類型 | 指定判定邏輯. 可用值詳見 [5.2](#52-判定器類型-predicate-types). |
| `"block"` | `string` | 否 | 方塊 ID | 用於單一方塊匹配. |
| `"tag"` | `string` | 否 | 標籤 ID | 用於標籤清單匹配. |
| `"probability"` | `float` | 否 | 隨機機率 | 範圍 `0.0` - `1.0`. 決定觸發判定成功的機率. |

---

## 5. 參數枚舉與可用值全清單 (Value Enumerations)

### 5.1 處理器類型 (Processor Types)

| 參數值 (Value) | 簡述 | 完整遊戲行為說明 |
| --- | --- | --- |
| `minecraft:rule` | 規則替換 | 最核心類型, 根據條件執行方塊替換 (如將圓石換成苔石). |
| `minecraft:gravity` | 重力處理 | 將結構內的方塊「下沉」直到接觸地表或指定高度圖. |
| `minecraft:block_age` | 隨機老化 | 根據鄰近空氣的程度隨機移除方塊 (常用於海底遺跡或遺骸). |
| `minecraft:capped` | 數量限制 | 限制某種處理器在結構中生效的最大方塊數量. |
| `minecraft:protected_blocks` | 區域保護 | 防止特定標籤中的方塊被後續的處理器修改. |

### 5.2 判定器類型 (Predicate Types)

| 參數值 (Value) | 簡述 | 完整遊戲行為說明 |
| --- | --- | --- |
| `minecraft:always_true` | 恆真 | 不進行任何檢查, 直接視為條件成立. |
| `minecraft:block_match` | 方塊匹配 | 僅當目標為指定的特定方塊時成立. |
| `minecraft:block_state_match` | 狀態匹配 | 同時檢查方塊 ID 與具體狀態 (Properties). |
| `minecraft:tag_match` | 標籤匹配 | 目標屬於指定的方塊標籤時成立. |
| `minecraft:random_block_match` | 隨機匹配 | 指定方塊且通過機率滾骰時成立. |
| `minecraft:random_block_state_match` | 隨機狀態匹配 | 指定方塊狀態且通過機率滾骰時成立. |

---

## 6. 數據約束與邊界條件 (Data Constraints)

*   **執行順序**: `processors` 陣列中的項目按索引順序處理, 前一個處理器的輸出會成為後一個處理器的輸入.
*   **機率限制**: `probability` 必須介於 `0.0` 與 `1.0` 之間.
*   **效能開銷**: 過長的規則清單 (`rules`) 會在生成大型結構 (如堡壘) 時造成顯著的效能卡頓.
*   **結構應用**: 必須在 `worldgen/structure` 檔案或 `worldgen/template_pool` 中引用此列表 ID 方可生效.

---

## 7. 外部連結 (References)

* [Misode Processor List Generator](https://misode.github.io/worldgen/processor-list/)
* [Minecraft Wiki - Structure Processor](https://zh.minecraft.wiki/w/%E7%BB%93%E6%9E%84%E5%A4%84%E7%90%86%E5%99%88)
* [資源位置與命名空間規範 (Resource Locations)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/ResourceLocations.md)
* [方塊狀態與標籤 (Block States & Tags)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/BlockStates_or_Tags.md)
* [模板池速查表 (Template Pool)](https://github.com/YuYue71/Minecraft_Commands/blob/main/pack_template/data/example/worldgen/template_pool/template_pool.md)