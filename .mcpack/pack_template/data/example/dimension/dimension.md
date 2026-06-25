# dimension (維度)

> **分類:** `世界生成` | **檔案格式:** `json` | **適用版本:** `JE ≤ 1.20.4` | **熱重載:** `/reload`

---

## 目錄

* [1. 目錄路徑 (Directory & Path)](#1-目錄路徑-directory--path)
* [2. 核心結構範本 (Core Structure Skeleton)](#2-核心結構範本-core-structure-skeleton)
* [3. 根節點屬性表 (Root Properties)](#3-根節點屬性表-root-properties)
* [4. 子對象詳解 (Sub-object Details)](#4-子對象詳解-sub-object-details)
    * [4.1 generator (生成器配置)](#41-generator-生成器配置)
    * [4.2 biome_source (生物群系來源)](#42-biome_source-生物群系來源)
    * [4.3 multi_noise biomes 項目](#43-multi_noise-biomes-項目)
* [5. 參數枚舉與可用值全清單 (Value Enumerations)](#5-參數枚舉與可用值全清單-value-enumerations)
    * [5.1 生成器類型 (Generator Types)](#51-生成器類型-generator-types)
    * [5.2 生物群系分佈類型 (Biome Source Types)](#52-生物群系分佈類型-biome-source-types)
    * [5.3 預設集 (Presets)](#53-預設集-presets)
* [6. 數據約束與邊界條件 (Data Constraints)](#6-數據約束與邊界條件-data-constraints)
* [7. 外部連結 (References)](#7-外部連結-references)

---

## 1. 目錄路徑 (Directory & Path)

> 定義自定義維度的資源位置與地形生成配置規範.

```file
data/<namespace>/dimension/[子資料夾]/<檔案名稱>.json
```

* `<namespace>`: 命名空間 (如 `minecraft`, `example`).
* `<registry>`: `dimension`.
* 調用標識符: `<namespace>:[子資料夾]/<檔案名稱>`.

---

## 2. 核心結構範本 (Core Structure Skeleton)

> 包含標準噪音地形生成與多重噪音群系分佈的完整骨架.

```json
{
  "type": "minecraft:overworld",
  "generator": {
    "type": "minecraft:noise",
    "settings": "minecraft:overworld",
    "biome_source": {
      "type": "minecraft:multi_noise",
      "biomes": [
        {
          "biome": "minecraft:plains",
          "parameters": {
            "temperature": 0.0,
            "humidity": 0.0,
            "continentalness": 0.0,
            "erosion": 0.0,
            "weirdness": 0.0,
            "depth": 0.0,
            "offset": 0.0
          }
        }
      ]
    }
  }
}
```

---

## 3. 根節點屬性表 (Root Properties)

> 檔案第一層級的鍵值定義.

| 鍵值 (Key) | 類型 | 必填 | 簡述 | 說明、預設值與可用值索引 |
| --- | --- | --- | --- | --- |
| `"type"` | `string` | 是 | 特性引用 | 引用自定義或原版的 `dimension_type` ID. |
| `"generator"` | `object` | 是 | 生成邏輯 | 定義地形生成與群系分佈方式. 連結至 [4.1](#41-generator-生成器配置). |

---

## 4. 子對象詳解 (Sub-object Details)

### 4.1 generator (生成器配置)

> 控制地形演算的核心對象.

| 子鍵值 (Sub-key) | 類型 | 必填 | 簡述 | 說明、單位與範圍 |
| --- | --- | --- | --- | --- |
| `"type"` | `enum` | 是 | 生成類型 | 指定生成器類別. 詳見 [5.1](#51-生成器類型-generator-types). |
| `"settings"` | `string` | 是 | 噪音設定 | 引用 `worldgen/noise_settings` 的 ID. |
| `"biome_source"` | `object` | 是 | 群系來源 | 定義群系如何分佈. 連結至 [4.2](#42-biome_source-生物群系來源). |

### 4.2 biome_source (生物群系來源)

> 定義生物群系在該維度中的分佈邏輯.

| 子鍵值 (Sub-key) | 類型 | 必填 | 簡述 | 說明、單位與範圍 |
| --- | --- | --- | --- | --- |
| `"type"` | `enum` | 是 | 演算法 | 指定分佈類型. 詳見 [5.2](#52-生物群系分佈類型-biome-source-types). |
| `"preset"` | `enum` | 否 | 預設集 | 僅 `multi_noise` 可用. 詳見 [5.3](#53-預設集-presets). |
| `"biomes"` | `array` | 否 | 群系列表 | 僅 `multi_noise` 可用. 連結至 [4.3](#43-multi_noise-biomes-項目). |
| `"biome"` | `string` | 否 | 固定群系 | 僅 `fixed` 可用. 指定單一生物群系 ID. |
| `"scale"` | `int` | 否 | 縮放比例 | 僅 `checkerboard` 可用. 預設為 `2`. |
| `"seed"` | `long` | 否 | 隨機種子 | 強制固定生成種子, 否則隨世界種子隨機. |

### 4.3 multi_noise biomes 項目

> `biomes` 陣列中的各個群系定義項.

| 子鍵值 (Sub-key) | 類型 | 必填 | 簡述 | 說明 |
| --- | --- | --- | --- | --- |
| `"biome"` | `string` | 是 | 群系 ID | 指定生物群系資源位置. |
| `"parameters"` | `object` | 是 | 環境參數 | 定義該群系出現的環境條件 (濕度、溫度等). |

---

## 5. 參數枚舉與可用值全清單 (Value Enumerations)

### 5.1 生成器類型 (Generator Types)

| 參數值 (Value) | 簡述 | 完整遊戲行為說明與影響範圍 |
| --- | --- | --- |
| `minecraft:noise` | 噪音生成 | 支援 3D 地形、洞穴與完整噪音設置的標準生成器. |
| `minecraft:flat` | 超平坦 | 根據指定層級 (layers) 生成的純平地世界. |
| `minecraft:debug` | 除錯模式 | 包含所有方塊狀態展示的格狀測試世界. |

### 5.2 生物群系分佈類型 (Biome Source Types)

| 參數值 (Value) | 簡述 | 完整遊戲行為說明與影響範圍 |
| --- | --- | --- |
| `minecraft:multi_noise` | 多重噪音 | 根據氣候參數演進的自然分佈 (主世界與地獄預設). |
| `minecraft:fixed` | 固定群系 | 全世界僅由指定的單一生物群系構成. |
| `minecraft:checkerboard` | 棋盤格 | 將多個群系以規律的網格狀交錯排列. |
| `minecraft:the_end` | 終界島嶼 | 模擬終界中央島與外島分佈的專用邏輯. |

### 5.3 預設集 (Presets)

| 參數值 (Value) | 簡述 | 完整遊戲行為說明與影響範圍 |
| --- | --- | --- |
| `minecraft:overworld` | 主世界 | 使用原版主世界的五維氣候噪音分佈. |
| `minecraft:nether` | 地獄 | 使用原版地獄的五種群系交織分佈. |

---

## 6. 數據約束與邊界條件 (Data Constraints)

* **噪音環境參數**: `temperature`, `humidity`, `continentalness`, `erosion`, `weirdness`, `depth` 的值可以是單一 `float` 或 `[float, float]` 區間, 範圍建議在 `-2.0` 到 `2.0` 之間.
* **種子數值 (Seed)**: 必須為 64 位長整數 (Long), 範圍為 `-9223372036854775808` 到 `9223372036854775807`.
* **縮放比例 (Scale)**: `checkerboard` 的 `scale` 數值會以 $2^{scale}$ 的比例放大區塊.

---

## 7. 外部連結 (References)

* [Misode Data Pack Generators - Dimension](https://misode.github.io/dimension/)
* [Minecraft Wiki - Dimension Type](https://zh.minecraft.wiki/)
* [資源位置與命名空間規範 (Resource Locations)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/ResourceLocations.md)
* [生態域 ID (Biome IDs)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/Biome_IDs.md)
* [相關指令: /execute](https://github.com/YuYue71/Minecraft_Commands/blob/main/.commands/execute.md)
* [相關指令: /teleport](https://github.com/YuYue71/Minecraft_Commands/blob/main/.commands/teleport.md)