# worldgen/placed_feature (放置特徵)

> **分類:** `世界生成` | **檔案格式:** `json` | **適用版本:** `JE ≤ 1.20.4` | **熱重載:** `/reload`

---

## 目錄

* [1. 目錄路徑 (Directory & Path)](#1-目錄路徑-directory--path)
* [2. 核心結構範本 (Core Structure Skeleton)](#2-核心結構範本-core-structure-skeleton)
* [3. 根節點屬性表 (Root Properties)](#3-根節點屬性表-root-properties)
* [4. 子對象詳解 (Sub-object Details)](#4-子對象詳解-sub-object-details)
    * [4.1 放置修飾器 (Placement Modifiers)](#41-放置修飾器-placement-modifiers)
* [5. 參數枚舉與可用值全清單 (Value Enumerations)](#5-參數枚舉與可用值全清單-value-enumerations)
    * [5.1 修飾器類型 (Modifier Types)](#51-修飾器類型-modifier-types)
    * [5.2 高度分佈類型 (Height Providers)](#52-高度分佈類型-height-providers)
* [6. 數據約束與邊界條件 (Data Constraints)](#6-數據約束與邊界條件-data-constraints)
* [7. 外部連結 (References)](#7-外部連結-references)

---

## 1. 目錄路徑 (Directory & Path)

> 定義特徵 (Feature) 「如何」分佈. 設定生成頻率、高度範圍、水平偏移與環境過濾規則.

```file
data/<namespace>/worldgen/placed_feature/[子資料夾]/<檔案名稱>.json
```

* `<namespace>`: 命名空間 (如 `minecraft`, `example`).
* `<registry>`: `worldgen/placed_feature`.
* 調用標識符: `<namespace>:[子資料夾]/<檔案名稱>`.

---

## 2. 核心結構範本 (Core Structure Skeleton)

> 包含指向的配置特徵與一系列依序執行的放置修飾器.

```json
{
  "feature": "minecraft:ore_iron",
  "placement": [
    {
      "type": "minecraft:count",
      "count": 10
    },
    {
      "type": "minecraft:in_square"
    },
    {
      "type": "minecraft:height_range",
      "height": {
        "type": "minecraft:uniform",
        "min_inclusive": { "absolute": -64 },
        "max_inclusive": { "absolute": 72 }
      }
    },
    {
      "type": "minecraft:biome"
    }
  ]
}
```

---

## 3. 根節點屬性表 (Root Properties)

> 檔案第一層級的鍵值定義.

| 鍵值 (Key) | 類型 | 必填 | 簡述 | 說明與可用值索引 |
| --- | --- | --- | --- | --- |
| `"feature"` | `string` | 是 | 特徵引用 | 引用 `worldgen/configured_feature` 的資源 ID. |
| `"placement"` | `array` | 是 | 修飾器清單 | 定義生成位置與頻率的邏輯列表. 詳見 [4.1](#41-放置修飾器-placement-modifiers). |

---

## 4. 子對象詳解 (Sub-object Details)

### 4.1 放置修飾器 (Placement Modifiers)

> `placement` 陣列中的物件, 按照索引順序執行 (Pipeline). 若其中一個修飾器判斷失敗, 該次生成嘗試即終止.

| 子鍵值 (Sub-key) | 類型 | 必填 | 簡述 | 說明 |
| --- | --- | --- | --- | --- |
| `"type"` | `string` | 是 | 修飾器 ID | 指定修飾器的類別. 可用值詳見 [5.1](#51-修飾器類型-modifier-types). |
| `"count"` | `int \| object` | 否 | 生成次數 | 每個區塊嘗試生成的次數 (用於 `count`). |
| `"chance"` | `int` | 否 | 稀有度 | 每 $1/n$ 的區塊才會生成 (用於 `rarity_filter`). |
| `"height"` | `object` | 否 | 高度設定 | 定義垂直分佈的範圍與權重. 連結至 [5.2](#52-高度分佈類型-height-providers). |
| `"predicate"` | `object` | 否 | 環境判定 | 僅用於 `block_predicate_filter`, 檢查周圍方塊狀態. |

---

## 5. 參數枚舉與可用值全清單 (Value Enumerations)

### 5.1 修飾器類型 (Modifier Types)

| 參數值 (Value) | 簡述 | 完整遊戲行為說明 |
| --- | --- | --- |
| `minecraft:count` | 固定次數 | 在每個區塊中嘗試執行指定次數的生成. |
| `minecraft:rarity_filter` | 稀有度過濾 | 僅在 $1/n$ 的機率下允許生成 (常用於花卉或南瓜). |
| `minecraft:in_square` | 水平隨機 | 在區塊內的 X 軸與 Z 軸隨機偏移 (0-15). |
| `minecraft:height_range` | 高度範圍 | 限制特徵生成的 Y 軸區間. |
| `minecraft:biome` | 生物群系檢查 | 檢查當前位置是否符合該生物群系的特徵列表定義 (必填於列表末尾). |
| `minecraft:heightmap` | 高度圖對齊 | 將特徵放置在指定高度圖的最頂端 (如地表). |
| `minecraft:block_predicate_filter` | 方塊過濾 | 只有當指定位置符合方塊判定條件時才生成. |
| `minecraft:surface_relative_threshold_filter` | 地表相對過濾 | 根據相對於地表的高度差進行判定. |

### 5.2 高度分佈類型 (Height Providers)

| 參數值 (Value) | 簡述 | 完整遊戲行為說明 |
| --- | --- | --- |
| `minecraft:constant` | 固定高度 | 永遠生成在特定的 Y 座標. |
| `minecraft:uniform` | 均勻分佈 | 在指定的最小值與最大值之間等機率分佈. |
| `minecraft:trapezoid` | 梯形分佈 | 越接近範圍中心生成機率越高 (常用於礦石). |
| `minecraft:weighted_list` | 權重清單 | 根據權重從多個高度提供器中選取. |

---

## 6. 數據約束與邊界條件 (Data Constraints)

*   **執行順序**: `placement` 的順序至關重要. 通常先放 `count` 或 `rarity_filter`, 接著是 `in_square`, 最後是 `height_range` 與 `biome`.
*   **高度圖常量**: `heightmap` 常用值為 `MOTION_BLOCKING` (阻擋運動的方塊) 或 `WORLD_SURFACE` (世界表面).
*   **座標溢出**: 雖然 `in_square` 限定在區塊內, 但若 `configured_feature` 體積過大且位於區塊邊緣, 可能會切割生成.
*   **性能建議**: 避免在單一區塊內使用過高的 `count` 數值 (例如超過 100), 這會顯著增加世界生成時的計算開銷.

---

## 7. 外部連結 (References)

* [Misode Placed Feature Generator](https://misode.github.io/worldgen/placed-feature/)
* [Minecraft Wiki - Placed Feature](https://zh.minecraft.wiki/w/%E6%94%BE%E7%BD%AE%E7%89%B9%E5%BE%81)
* [配置特徵速查表 (Configured Feature)](https://github.com/YuYue71/Minecraft_Commands/blob/main/pack_template/data/example/worldgen/configured_feature/configured_feature.md)
* [資源位置與命名空間規範 (Resource Locations)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/ResourceLocations.md)
* [方塊狀態與標籤 (Block States & Tags)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/BlockStates_or_Tags.md)