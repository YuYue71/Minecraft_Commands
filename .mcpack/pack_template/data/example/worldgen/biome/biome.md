# worldgen/biome (生物群系)

> **分類:** `世界生成` | **檔案格式:** `json` | **適用版本:** `JE ≤ 1.20.4` | **熱重載:** `/reload`

---

## 目錄

* [1. 目錄路徑 (Directory & Path)](#1-目錄路徑-directory--path)
* [2. 核心結構範本 (Core Structure Skeleton)](#2-核心結構範本-core-structure-skeleton)
* [3. 根節點屬性表 (Root Properties)](#3-根節點屬性表-root-properties)
* [4. 子對象詳解 (Sub-object Details)](#4-子對象詳解-sub-object-details)
    * [4.1 effects (環境效果配置)](#41-effects-環境效果配置)
    * [4.2 spawners (生物生成配置)](#42-spawners-生物生成配置)
    * [4.3 features & carvers (地表特徵與雕刻)](#43-features--carvers-地表特徵與雕刻)
* [5. 參數枚舉與可用值全清單 (Value Enumerations)](#5-參數枚舉與可用值全清單-value-enumerations)
    * [5.1 溫度修飾器 (Temperature Modifiers)](#51-溫度修飾器-temperature-modifiers)
    * [5.2 草地顏色修飾器 (Grass Color Modifiers)](#52-草地顏色修飾器-grass-color-modifiers)
* [6. 數據約束與邊界條件 (Data Constraints)](#6-數據約束與邊界條件-data-constraints)
* [7. 外部連結 (References)](#7-外部連結-references)

---

## 1. 目錄路徑 (Directory & Path)

> 定義生物群系的氣候、視覺外觀、環境音效與特徵生成規則.

```file
data/<namespace>/worldgen/biome/[子資料夾]/<檔案名稱>.json
```

* `<namespace>`: 命名空間 (如 `minecraft`, `example`).
* `<registry>`: `worldgen/biome`.
* 調用標識符: `<namespace>:[子資料夾]/<檔案名稱>`.

---

## 2. 核心結構範本 (Core Structure Skeleton)

> 包含氣候設定、視覺特效與生成列表的完整 JSON 結構.

```json
{
  "has_precipitation": true,
  "temperature": 0.8,
  "temperature_modifier": "none",
  "downfall": 0.4,
  "effects": {
    "sky_color": 7907327,
    "fog_color": 12638463,
    "water_color": 4159231,
    "water_fog_color": 329011,
    "foliage_color": 10387789,
    "grass_color": 9470285,
    "grass_color_modifier": "none",
    "particle": {
      "options": { "type": "minecraft:ash" },
      "probability": 0.01
    },
    "ambient_sound": "minecraft:ambient.cave",
    "mood_sound": {
      "sound": "minecraft:ambient.cave",
      "tick_delay": 6000,
      "block_search_extent": 8,
      "offset": 2.0
    }
  },
  "spawners": {
    "monster": [
      { "type": "minecraft:zombie", "weight": 100, "minCount": 4, "maxCount": 4 }
    ]
  },
  "spawn_costs": {},
  "carvers": {
    "air": [ "minecraft:cave" ]
  },
  "features": [
    [], [], [], [], [], [],
    [ "minecraft:ore_iron" ],
    [], [], []
  ]
}
```

---

## 3. 根節點屬性表 (Root Properties)

> 檔案第一層級的鍵值定義.

| 鍵值 (Key) | 類型 | 必填 | 簡述 | 說明、預設值與可用值索引 |
| --- | --- | --- | --- | --- |
| `"has_precipitation"` | `boolean` | 是 | 降水開關 | 決定該群系是否會下雨或下雪. |
| `"temperature"` | `float` | 是 | 基礎溫度 | 影響草地顏色與降雪判定 (低於 0.15 為雪). |
| `"temperature_modifier"` | `enum` | 否 | 溫度修飾 | 用於海洋等特殊環境的溫度計算. 詳見 [5.1](#). |
| `"downfall"` | `float` | 是 | 濕度/降雨量 | 影響植物顏色分佈 (範圍 0.0 - 1.0). |
| `"effects"` | `object` | 是 | 環境效果 | 設定色彩、粒子與音效. 連結至 [4.1](#). |
| `"spawners"` | `object` | 是 | 生物生成 | 定義各類別生物的出現機率. 連結至 [4.2](#). |
| `"spawn_costs"` | `object` | 是 | 生成消耗 | 控制生物生成的密度限制, 預設為 `{}`. |
| `"features"` | `array` | 是 | 地表特徵 | 配置特徵列表 (裝飾、礦石、樹木). 連結至 [4.3](#). |
| `"carvers"` | `object` | 是 | 雕刻器 | 定義洞穴與峽谷的生成邏輯. 連結至 [4.3](#). |

---

## 4. 子對象詳解 (Sub-object Details)

### 4.1 effects (環境效果配置)

> 控制群系的視覺渲染與聽覺體驗 (Misode: Effects).

| 子鍵值 (Sub-key) | 類型 | 必填 | 簡述 | 說明與格式 |
| --- | --- | --- | --- | --- |
| `"sky_color"` | `int` | 是 | 天空顏色 | 十進位 RGB 色碼. |
| `"fog_color"` | `int` | 是 | 迷霧顏色 | 十進位 RGB 色碼. |
| `"water_color"` | `int` | 是 | 水體顏色 | 十進位 RGB 色碼. |
| `"water_fog_color"` | `int` | 是 | 水霧顏色 | 十進位 RGB 色碼. |
| `"foliage_color"` | `int` | 否 | 葉片顏色 | 選填, 覆寫預設的樹葉色彩. |
| `"grass_color"` | `int` | 否 | 草地顏色 | 選填, 覆寫預設的草地色彩. |
| `"grass_color_modifier"`| `enum`| 否 | 草地修飾 | 特殊群系(如沼澤)的顏色演算法. 詳見 [5.2](#52-草地顏色修飾器-grass-color-modifiers). |
| `"particle"` | `object` | 否 | 環境粒子 | 設定漂浮粒子的類型與出現機率. |
| `"ambient_sound"` | `string` | 否 | 背景循環音 | 定義該群系恆常播放的環境音效 ID. |
| `"mood_sound"` | `object` | 否 | 情緒音效 | 隨機觸發的「洞穴聲」或環境音效配置. |

### 4.2 spawners (生物生成配置)

> 按類別定義生物生成規律 (Misode: Spawners).

| 子鍵值 (Sub-key) | 類型 | 必填 | 簡述 | 說明 |
| --- | --- | --- | --- | --- |
| `"monster"` | `array` | 否 | 敵對生物 | 殭屍、骷髏等怪物清單. |
| `"creature"` | `array` | 否 | 被動生物 | 豬、牛、羊等動物清單. |
| `"ambient"` | `array` | 否 | 環境生物 | 蝙蝠等. |
| `"water_creature"` | `array` | 否 | 水生生物 | 魷魚、海豚等. |
| `"axolotls"` | `array` | 否 | 六角恐龍 | 專門針對六角恐龍的生成清單. |

* **項目結構**: 每個項目包含 `{ "type": "id", "weight": int, "minCount": int, "maxCount": int }`.

### 4.3 features & carvers (地表特徵與雕刻)

> 定義該群系包含的地形裝飾與洞穴.

| 類別 | 說明 | 引用路徑 |
| --- | --- | --- |
| `carvers` | 包含 `air` 與 `liquid` 兩類, 決定地形切割方式. | `worldgen/configured_carver` |
| `features` | 包含 10 個步驟的陣列 (層級), 對應不同生成階段. | `worldgen/placed_feature` |

* **10 步生成層級 (Step Index)**:
    0. RAW_GENERATION, 1. LAKES, 2. LOCAL_MODIFICATIONS, 3. UNDERGROUND_STRUCTURES, 4. SURFACE_STRUCTURES, 5. STRONGHOLDS, 6. UNDERGROUND_ORES, 7. UNDERGROUND_DECORATION, 8. FLUID_SPRINGS, 9. VEGETAL_DECORATION.

---

## 5. 參數枚舉與可用值全清單 (Value Enumerations)

### 5.1 溫度修飾器 (Temperature Modifiers)

| 參數值 (Value) | 簡述 | 完整遊戲行為說明與影響範圍 |
| --- | --- | --- |
| `none` | 無 | 使用標準溫度演算法 (預設值). |
| `frozen` | 寒冷/凍結 | 用於凍結海洋, 降低基礎溫度判定. |

### 5.2 草地顏色修飾器 (Grass Color Modifiers)

| 參數值 (Value) | 簡述 | 完整遊戲行為說明與影響範圍 |
| --- | --- | --- |
| `none` | 無 | 使用標準溫度/濕度色彩映射. |
| `dark_forest` | 黑森林 | 賦予草地特有的深綠色調. |
| `swamp` | 沼澤 | 隨座標產生枯黃/深綠交替的斑駁效果. |

---

## 6. 數據約束與邊界條件 (Data Constraints)

* **顏色數值**: 必須為 `0` 到 `16777215` 之間的整數 (24-bit RGB).
* **溫度限制**: 數值可超過 `2.0` (如沙漠), 低於 `0.15` 且 `has_precipitation` 為 true 時會降雪.
* **Feature 層級**: `features` 根陣列必須包含恰好 10 個子陣列, 即使部分為空 `[]`.
* **機率數值**: `probability` 等欄位必須介於 `0.0` - `1.0`.

---

## 7. 外部連結 (References)

* [Misode Biome Generator](https://misode.github.io/worldgen/biome/)
* [Minecraft Wiki - Biome](https://zh.minecraft.wiki/w/%E7%94%9F%E7%89%A9%E7%BE%A4%E7%B3%BB)
* [資源位置與命名空間規範 (Resource Locations)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/ResourceLocations.md)
* [生態域 ID (Biome IDs)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/Biome_IDs.md)
* [實體 ID (Entity IDs)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/Entity_IDs.md)
* [音效 ID (Sound effects)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/SoundEffects.md)