# worldgen/structure_set (結構集)

> **分類:** `世界生成` | **檔案格式:** `json` | **適用版本:** `JE ≤ 1.20.4` | **熱重載:** `/reload`

---

## 目錄

* [1. 目錄路徑 (Directory & Path)](#1-目錄路徑-directory--path)
* [2. 核心結構範本 (Core Structure Skeleton)](#2-核心結構範本-core-structure-skeleton)
* [3. 根節點屬性表 (Root Properties)](#3-根節點屬性表-root-properties)
* [4. 子對象詳解 (Sub-object Details)](#4-子對象詳解-sub-object-details)
    * [4.1 structures (結構權重列表)](#41-structures-結構權重列表)
    * [4.2 placement (放置分佈配置)](#42-placement-放置分佈配置)
* [5. 參數枚舉與可用值全清單 (Value Enumerations)](#5-參數枚舉與可用值全清單-value-enumerations)
    * [5.1 放置類型 (Placement Types)](#51-放置類型-placement-types)
    * [5.2 分佈方式 (Spread Types)](#52-分佈方式-spread-types)
* [6. 數據約束與邊界條件 (Data Constraints)](#6-數據約束與邊界條件-data-constraints)
* [7. 外部連結 (References)](#7-外部連結-references)

---

## 1. 目錄路徑 (Directory & Path)

> 定義結構在世界地圖上的分佈規律, 包含密度、間距以及如何隨機選取結構。

```file
data/<namespace>/worldgen/structure_set/[子資料夾]/<檔案名稱>.json
```

* `<namespace>`: 命名空間 (如 `minecraft`, `example`).
* `<registry>`: `worldgen/structure_set`.
* 調用標識符: `<namespace>:[子資料夾]/<檔案名稱>`.

---

## 2. 核心結構範本 (Core Structure Skeleton)

> 包含結構列表與放置屬性的標準 JSON 骨架。

```json
{
  "structures": [
    {
      "structure": "minecraft:pillager_outpost",
      "weight": 1
    }
  ],
  "placement": {
    "type": "minecraft:random_spread",
    "spacing": 32,
    "separation": 8,
    "spread_type": "linear",
    "salt": 165745296
  }
}
```

---

## 3. 根節點屬性表 (Root Properties)

> 檔案第一層級的鍵值定義。

| 鍵值 (Key) | 類型 | 必填 | 簡述 | 說明、預設值與可用值索引 |
| --- | --- | --- | --- | --- |
| `"structures"` | `array` | 是 | 結構內容 | 定義該集合中包含的一或多個結構及其出現權重。詳見 [4.1](#41-structures-結構權重列表)。 |
| `"placement"` | `object` | 是 | 分佈配置 | 定義結構在世界網格中的間距、密度與隨機性。連結至 [4.2](#42-placement-放置分佈配置)。 |

---

## 4. 子對象詳解 (Sub-object Details)

### 4.1 structures (結構權重列表)

> 定義在指定的放置區域內, 遊戲會從中隨機選取哪一個結構。

| 子鍵值 (Sub-key) | 類型 | 必填 | 簡述 | 說明 |
| --- | --- | --- | --- | --- |
| `"structure"` | `string` | 是 | 結構 ID | 引用 `worldgen/structure` 的資源路徑。 |
| `"weight"` | `int` | 是 | 隨機權重 | 數值越高，在該分佈點生成此結構的機率越大。 |

### 4.2 placement (放置分佈配置)

> 控制結構在地圖上的生成位置邏輯 (Misode: Placement)。

| 子鍵值 (Sub-key) | 類型 | 必填 | 簡述 | 說明 |
| --- | --- | --- | --- | --- |
| `"type"` | `enum` | 是 | 放置類型 | `random_spread` (隨機分佈) 或 `concentric_rings` (同心圓, 要塞專用)。詳見 [5.1](#51-放置類型-placement-types)。 |
| `"spacing"` | `int` | 否 | 網格間距 | **僅 random_spread**: 結構生成的最大範圍網格 (以區塊為單位)。 |
| `"separation"` | `int` | 否 | 最小間隔 | **僅 random_spread**: 結構之間必須保持的最小距離 (以區塊為單位)。 |
| `"spread_type"` | `enum` | 否 | 分佈方式 | 決定區塊在網格內的偏移演算法。詳見 [5.2](#52-分佈方式-spread-types)。 |
| `"salt"` | `int` | 否 | 隨機偏移 | 隨機種子偏移值, 避免不同種類的結構在相同座標重疊。 |
| `"distance"` | `int` | 否 | 環距離 | **僅 concentric_rings**: 要塞環與中心點的平均距離。 |
| `"count"` | `int` | 否 | 生成總數 | **僅 concentric_rings**: 該集合生成的總結構數量。 |

---

## 5. 參數枚舉與可用值全清單 (Value Enumerations)

### 5.1 放置類型 (Placement Types)

| 參數值 (Value) | 簡述 | 完整遊戲行為說明與影響範圍 |
| --- | --- | --- |
| `minecraft:random_spread` | 隨機分佈 | 最常用的類型。將世界劃分為 `spacing` 大小的網格, 並在其中放置結構。 |
| `minecraft:concentric_rings` | 同心圓分佈 | 專用於要塞 (Stronghold)。結構圍繞世界原點以環狀路徑分佈。 |

### 5.2 分佈方式 (Spread Types)

| 參數值 (Value) | 簡述 | 完整遊戲行為說明與影響範圍 |
| --- | --- | --- |
| `linear` | 線性分佈 | 隨機座標在網格內均勻分佈 (預設)。 |
| `triangular` | 三角形分佈 | 隨機座標會向網格中心點靠攏，使得分佈更為集中。 |

---

## 6. 數據約束與邊界條件 (Data Constraints)

*   **間距規則**: `spacing` 必須嚴格大於 `separation`。否則會導致世界生成時邏輯崩潰。
*   **單位限制**: `spacing` 與 `separation` 的單位均為 **區塊 (Chunk)**, 而非方塊。
*   **Salt 建議**: 為自定義結構設定一個較大且唯一的 `salt` 數值, 以防止其生成位置與原版結構 (如村莊) 完全同步。
*   **重疊處理**: 若多個 `structure_set` 同時在同一個區塊生成, 系統會優先保留權重較高或載入順序較前的結構。

---

## 7. 外部連結 (References)

* [Misode Structure Set Generator](https://misode.github.io/worldgen/structure-set/)
* [Minecraft Wiki - Structure Set](https://zh.minecraft.wiki/w/%E7%BB%93%E6%9E%84%E9%9B%86)
* [結構配置速查表 (Structure)](https://github.com/YuYue71/Minecraft_Commands/blob/main/pack_template/data/example/worldgen/structure/structure.md)
* [資源位置與命名空間規範 (Resource Locations)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/ResourceLocations.md)
* [相關指令: /locate](https://github.com/YuYue71/Minecraft_Commands/blob/main/.commands/locate.md)