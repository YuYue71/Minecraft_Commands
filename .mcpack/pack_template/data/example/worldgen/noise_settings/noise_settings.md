# worldgen/noise_settings (噪音設置)

> **分類:** `世界生成` | **檔案格式:** `json` | **適用版本:** `JE ≤ 1.20.4` | **熱重載:** `/reload`

---

## 目錄

* [1. 目錄路徑 (Directory & Path)](#1-目錄路徑-directory--path)
* [2. 核心結構範本 (Core Structure Skeleton)](#2-核心結構範本-core-structure-skeleton)
* [3. 根節點屬性表 (Root Properties)](#3-根節點屬性表-root-properties)
* [4. 子對象詳解 (Sub-object Details)](#4-子對象詳解-sub-object-details)
    * [4.1 noise (空間規格)](#41-noise-空間規格)
    * [4.2 noise_router (密度函數路由)](#42-noise_router-密度函數路由)
    * [4.3 surface_rule (地表規則)](#43-surface_rule-地表規則)
* [5. 數據約束與邊界條件 (Data Constraints)](#5-數據約束與邊界條件-data-constraints)
* [6. 外部連結 (References)](#6-外部連結-references)

---

## 1. 目錄路徑 (Directory & Path)

> 定義地形生成的整體架構, 包含海平面高度、方塊填充規則與地表覆蓋邏輯.

```file
data/<namespace>/worldgen/noise_settings/[子資料夾]/<檔案名稱>.json
```

* `<namespace>`: 命名空間 (如 `minecraft`, `example`).
* `<registry>`: `worldgen/noise_settings`.
* 調用標識符: `<namespace>:[子資料夾]/<檔案名稱>`.

---

## 2. 核心結構範本 (Core Structure Skeleton)

> 噪音設置涉及地形規格、噪音路由 (Density Functions) 與地表材質規則.

```json
{
  "sea_level": 63,
  "disable_mob_generation": false,
  "aquifers_enabled": true,
  "ore_veins_enabled": true,
  "legacy_random_source": false,
  "default_block": { "Name": "minecraft:stone" },
  "default_fluid": { "Name": "minecraft:water" },
  "noise": {
    "min_y": -64,
    "height": 384,
    "size_horizontal": 1,
    "size_vertical": 2
  },
  "noise_router": {
    "final_density": "example:density_logic",
    "vein_toggle": 0,
    "vein_ridged": 0,
    "vein_gap": 0,
    "temperature": 0,
    "vegetation": 0,
    "continents": 0,
    "erosion": 0,
    "depth": 0,
    "ridges": 0
  },
  "surface_rule": {
    "type": "minecraft:sequence",
    "sequence": [
      {
        "type": "minecraft:condition",
        "if_true": { "type": "minecraft:stone_depth", "offset": 0, "add_surface_depth": false, "surface_type": "floor" },
        "then_run": { "type": "minecraft:block", "result_state": { "Name": "minecraft:grass_block" } }
      }
    ]
  }
}
```

---

## 3. 根節點屬性表 (Root Properties)

> 檔案第一層級的鍵值定義.

| 鍵值 (Key) | 類型 | 必填 | 簡述 | 說明、預設值與 Misode 對應項 |
| --- | --- | --- | --- | --- |
| `"sea_level"` | `int` | 是 | 海平面 | 定義液體生成的基準高度. 預設 `63`. |
| `"disable_mob_generation"` | `boolean` | 是 | 禁用生成 | 是否禁止此地形設置下的生物自然生成. |
| `"aquifers_enabled"` | `boolean` | 是 | 蓄水層 | 是否啟用雜訊水體 (局部湖泊與淹沒洞穴). |
| `"ore_veins_enabled"` | `boolean` | 是 | 礦脈 | 是否啟用 1.18+ 的大規模帶狀礦脈生成. |
| `"legacy_random_source"` | `boolean` | 是 | 舊版隨機 | 是否使用舊版隨機演算法 (通常設為 `false`). |
| `"default_block"` | `object` | 是 | 填充方塊 | 定義地形主要的固體方塊 (如石頭). |
| `"default_fluid"` | `object` | 是 | 填充液體 | 定義海平面以下的液體方塊 (如水). |
| `"noise"` | `object` | 是 | 物理規格 | 定義世界的高度區間與解析度. 連結至 [4.1](#41-noise-空間規格). |
| `"noise_router"` | `object` | 是 | 噪音路由 | 使用密度函數定義地形形狀. 連結至 [4.2](#42-noise_router-密度函數路由). |
| `"surface_rule"` | `object` | 是 | 地表規則 | 定義地形表面的方塊覆蓋邏輯. 連結至 [4.3](#43-surface_rule-地表規則). |

---

## 4. 子對象詳解 (Sub-object Details)

### 4.1 noise (空間規格)

> 定義地形演算的三維空間邊界.

| 子鍵值 (Sub-key) | 類型 | 必填 | 簡述 | 說明 |
| --- | --- | --- | --- | --- |
| `"min_y"` | `int` | 是 | 起始高度 | 地形生成的最低 Y 座標 (須與維度類型一致). |
| `"height"` | `int` | 是 | 總高度 | 可生成方塊的總垂直範圍 (須為 16 的倍數). |
| `"size_horizontal"` | `int` | 是 | 水平縮放 | 水平噪音取樣的解析度 (數值越小越精細, 通常為 1-2). |
| `"size_vertical"` | `int` | 是 | 垂直縮放 | 垂直噪音取樣的解析度 (通常為 1-2). |

### 4.2 noise_router (密度函數路由)

> 將各個「插槽」關聯至具體的 `density_function` 邏輯 (Misode: Noise Router).

| 子鍵值 (Sub-key) | 類型 | 必填 | 簡述 | 說明 |
| --- | --- | --- | --- | --- |
| `"final_density"` | `mixed` | 是 | 最終密度 | 決定方塊是否存在的核心函數 (大於 0 為固體). |
| `"vein_toggle"` | `mixed` | 是 | 礦脈開關 | 控制礦脈生成的密度分布. |
| `"temperature"` | `mixed` | 是 | 溫度噪音 | 傳遞至群系分佈系統的環境溫度數值. |
| `"vegetation"` | `mixed` | 是 | 植被噪音 | 傳遞至群系分佈系統的濕度/植被數值. |
| `"continents"` | `mixed` | 是 | 大陸度 | 影響陸地與海洋的宏觀分佈. |
| `"erosion"` | `mixed` | 是 | 侵蝕度 | 影響山脈尖銳度與地形平緩度. |
| `"depth"` | `mixed` | 是 | 深度 | 影響內陸與近海的垂直分佈. |
| `"ridges"` | `mixed` | 是 | 山脊度 | 影響山脈與河流的分佈形狀. |

*註: `mixed` 類型可填入數值、密度函數 ID 或嵌套對象. 詳見 [密度函數速查表](https://github.com/YuYue71/Minecraft_Commands/blob/main/pack_template/data/example/worldgen/density_function/density_function.md).*

### 4.3 surface_rule (地表規則)

> 一種遞迴判斷系統, 決定地形表面 (草地、沙子等) 如何覆蓋 (Misode: Surface Rule).

| 子鍵值 (Sub-key) | 類型 | 必填 | 簡述 | 說明 |
| --- | --- | --- | --- | --- |
| `"type"` | `enum` | 是 | 規則類型 | `block` (放置方塊), `condition` (判定), `sequence` (按順序執行). |
| `"if_true"` | `object` | 否 | 判定條件 | 當類型為 `condition` 時的判斷邏輯 (如 `stone_depth`). |
| `"then_run"` | `object` | 否 | 執行內容 | 當條件成立時運行的子規則. |
| `"result_state"` | `object` | 否 | 結果方塊 | 當類型為 `block` 時最終放置的方塊狀態. |

---

## 5. 數據約束與邊界條件 (Data Constraints)

* **高度規格**: `min_y` + `height` 的總合不可超過 `2016`.
* **高度對齊**: `height` 必須為 `16` 的倍數, 否則會拋出載入錯誤.
* **解析度限制**: `size_horizontal` 與 `size_vertical` 若設定過大會導致地形變形嚴重 (塊狀化).
* **海平面**: `sea_level` 應包含在 `min_y` 到 `min_y + height` 的區間內.

---

## 6. 外部連結 (References)

* [Misode Noise Settings Generator](https://misode.github.io/worldgen/noise-settings/)
* [Minecraft Wiki - Noise Settings](https://zh.minecraft.wiki/w/%E5%99%AA%E9%9F%B3%E8%AE%BE%E7%BD%AE)
* [密度函數速查表 (Density Function)](https://github.com/YuYue71/Minecraft_Commands/blob/main/pack_template/data/example/worldgen/density_function/density_function.md)
* [維度類型速查表 (Dimension Type)](https://github.com/YuYue71/Minecraft_Commands/blob/main/pack_template/data/example/dimension_type/dimension_type.md)
* [資源位置與命名空間規範 (Resource Locations)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/ResourceLocations.md)