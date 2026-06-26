# worldgen/density_function (密度函數)

> **分類:** `世界生成` | **檔案格式:** `json` | **適用版本:** `JE ≤ 1.20.4` | **熱重載:** `/reload`

---

## 目錄

* [1. 目錄路徑 (Directory & Path)](#1-目錄路徑-directory--path)
* [2. 核心結構範本 (Core Structure Skeleton)](#2-核心結構範本-core-structure-skeleton)
* [3. 根節點屬性表 (Root Properties)](#3-根節點屬性表-root-properties)
* [4. 子對象詳解 (Sub-object Details)](#4-子對象詳解-sub-object-details)
    * [4.1 數學運算類 (Mathematical Operations)](#41-數學運算類-mathematical-operations)
    * [4.2 噪音取樣類 (Noise Sampling)](#42-噪音取樣類-noise-sampling)
    * [4.3 座標轉換類 (Coordinate Mapping)](#43-座標轉換類-coordinate-mapping)
* [5. 參數枚舉與可用值全清單 (Value Enumerations)](#5-參數枚舉與可用值全清單-value-enumerations)
    * [5.1 函數類型 (Density Function Types)](#51-函數類型-density-function-types)
* [6. 數據約束與邊界條件 (Data Constraints)](#6-數據約束與邊界條件-data-constraints)
* [7. 外部連結 (References)](#7-外部連結-references)

---

## 1. 目錄路徑 (Directory & Path)

> 定義用於 1.18+ 噪音地形系統的數學函數, 用於精確雕刻山脈、洞穴與地表形狀.

```file
data/<namespace>/worldgen/density_function/[子資料夾]/<檔案名稱>.json
```

* `<namespace>`: 命名空間 (如 `minecraft`, `example`).
* `<registry>`: `worldgen/density_function`.
* 調用標識符: `<namespace>:[子資料夾]/<檔案名稱>`.

---

## 2. 核心結構範本 (Core Structure Skeleton)

> 密度函數透過嵌套 (Nested) 結構進行複雜的數學運算.

```json
// 範例: 將噪音值加上 Y 軸高度梯度
{
  "type": "minecraft:add",
  "argument1": "example:base_noise",
  "argument2": {
    "type": "minecraft:y_clamped_gradient",
    "from_y": -64,
    "to_y": 320,
    "from_value": -1,
    "to_value": 1
  }
}
```

---

## 3. 根節點屬性表 (Root Properties)

> 檔案第一層級的鍵值定義.

| 鍵值 (Key) | 類型 | 必填 | 簡述 | 說明與可用值索引 |
| --- | --- | --- | --- | --- |
| `"type"` | `string` | 是 | 函數種類 | 指定此數學或噪音邏輯的類別. 詳見 [5.1](#51-函數類型-density-function-types). |
| `...` | `mixed` | 是 | 專屬參數 | 根據 `type` 的不同, 填入對應的數學引數或噪音參數. |

---

## 4. 子對象詳解 (Sub-object Details)

### 4.1 數學運算類 (Mathematical Operations)

> 用於合併、修剪或轉換多個密度函數的數值.

| 子鍵值 (Sub-key) | 類型 | 必填 | 簡述 | 說明 |
| --- | --- | --- | --- | --- |
| `"argument1"` / `"argument2"` | `mixed` | 是 | 運算元 | 支援雙輸入的運算 (如 `add`, `mul`, `min`, `max`). |
| `"argument"` | `mixed` | 是 | 單一輸入 | 支援單輸入的運算 (如 `abs`, `square`, `cube`, `negate`). |
| `"input"` | `mixed` | 是 | 輸入來源 | 用於 `clamp` (修剪) 或 `cache_2d` 等. |
| `"min"` / `"max"` | `double` | 是 | 數值邊界 | 僅用於 `clamp`, 定義輸出的最小值與最大值. |

### 4.2 噪音取樣類 (Noise Sampling)

> 從噪音參數檔案中獲取隨機數值.

| 子鍵值 (Sub-key) | 類型 | 必填 | 簡述 | 說明 |
| --- | --- | --- | --- | --- |
| `"noise"` | `string` | 是 | 噪音 ID | 引用 `worldgen/noise` 中的定義. |
| `"xz_scale"` | `double` | 是 | 水平縮放 | 縮放噪音在水平面上的頻率. |
| `"y_scale"` | `double` | 是 | 垂直縮放 | 縮放噪音在垂直軸上的頻率. |

### 4.3 座標轉換類 (Coordinate Mapping)

> 改變噪音取樣時的座標參考系.

| 子鍵值 (Sub-key) | 類型 | 必填 | 簡述 | 說明 |
| --- | --- | --- | --- | --- |
| `"shift_x"` / `"shift_y"` / `"shift_z"` | `mixed` | 是 | 座標偏移 | 用於 `shifted_noise`, 透過其他函數來扭曲座標軸. |
| `"from_y"` / `"to_y"` | `int` | 是 | Y 軸區間 | 僅用於 `y_clamped_gradient`, 定義漸層的起始與終點高度. |

---

## 5. 參數枚舉與可用值全清單 (Value Enumerations)

### 5.1 函數類型 (Density Function Types)

| 參數值 (Value) | 簡述 | 完整遊戲行為說明 |
| --- | --- | --- |
| `minecraft:constant` | 常數 | 傳回一個固定的數字 (Double). |
| `minecraft:add` / `mul` | 加法/乘法 | 對兩個函數結果進行基礎算術運算. |
| `minecraft:min` / `max` | 最小值/最大值 | 從兩個函數中取極值 (常用於複合地形). |
| `minecraft:clamp` | 數值修剪 | 將輸入限制在指定的 Min 與 Max 之間. |
| `minecraft:noise` | 噪音取樣 | 基於指定噪音產生連續隨機值. |
| `minecraft:shifted_noise` | 偏移噪音 | 透過其他函數扭曲 X/Y/Z 座標後取樣 (用於不規則地貌). |
| `minecraft:y_clamped_gradient` | Y 軸漸層 | 隨高度變化的線性數值 (常用於控制地底與高空的方塊填充密度). |
| `minecraft:spline` | 樣條曲線 | 最複雜的類型, 根據多個參數 (如大陸度、侵蝕度) 定義非線性的地形曲線. |
| `minecraft:interpolated` | 插值運算 | 降低運算解析度以提升效能 (將 4x8x4 區塊內的數值平滑化). |
| `minecraft:range_choice` | 範圍選擇 | 根據一個輸入函數的值區間, 決定採用哪一個子函數 (如特定高度切換地形). |

---

## 6. 數據約束與邊界條件 (Data Constraints)

*   **引用方式**: 所有參數欄位若類型標註為 `mixed`, 皆可填入單一 `double` 數字, 或另一個嵌套的 `object` 函數, 或是一個 `string` (引用另一個密度函數檔案).
*   **嵌套深度**: 過深的嵌套會嚴重降低世界生成的初始化速度與效能.
*   **數值範圍**: 地形生成邏輯通常以 `0.0` 為「方塊填充界限」. 大於 0 為固體方塊, 小於 0 為空氣/水.
*   **座標縮放**: `xz_scale` 與 `y_scale` 若設為 0 會導致生成異常或除以零錯誤.

---

## 7. 外部連結 (References)

* [Misode Density Function Generator](https://misode.github.io/worldgen/density-function/)
* [Minecraft Wiki - Density Function](https://zh.minecraft.wiki/w/%E5%AF%86%E5%BA%A6%E5%87%BD%E6%95%B0)
* [世界生成噪音速查表 (Noise)](https://misode.github.io/worldgen/noise/)
* [資源位置與命名空間規範 (Resource Locations)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/ResourceLocations.md)