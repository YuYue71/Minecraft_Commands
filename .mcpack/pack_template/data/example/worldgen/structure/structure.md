# worldgen/structure (結構配置)

> **分類:** `世界生成` | **檔案格式:** `json` | **適用版本:** `JE ≤ 1.20.4` | **熱重載:** `/reload`

---

## 目錄

* [1. 目錄路徑 (Directory & Path)](#1-目錄路徑-directory--path)
* [2. 核心結構範本 (Core Structure Skeleton)](#2-核心結構範本-core-structure-skeleton)
* [3. 根節點屬性表 (Root Properties)](#3-根節點屬性表-root-properties)
* [4. 子對象詳解 (Sub-object Details)](#4-子對象詳解-sub-object-details)
    * [4.1 spawn_overrides (生物生成覆寫)](#41-spawn_overrides-生物生成覆寫)
    * [4.2 jigsaw 專屬配置](#42-jigsaw-專屬配置)
* [5. 參數枚舉與可用值全清單 (Value Enumerations)](#5-參數枚舉與可用值全清單-value-enumerations)
    * [5.1 結構類型 (Structure Types)](#51-結構類型-structure-types)
    * [5.2 地形適應 (Terrain Adaptation)](#52-地形適應-terrain-adaptation)
    * [5.3 生成階段 (Generation Steps)](#53-生成階段-generation-steps)
* [6. 數據約束與邊界條件 (Data Constraints)](#6-數據約束與邊界條件-data-constraints)
* [7. 外部連結 (References)](#7-外部連結-references)

---

## 1. 目錄路徑 (Directory & Path)

> 定義結構的生成邏輯, 包含其所屬生物群系、地形適應方式與生成組件引用.

```file
data/<namespace>/worldgen/structure/[子資料夾]/<檔案名稱>.json
```

* `<namespace>`: 命名空間 (如 `minecraft`, `example`).
* `<registry>`: `worldgen/structure`.
* 調用標識符: `<namespace>:[子資料夾]/<檔案名稱>`.

---

## 2. 核心結構範本 (Core Structure Skeleton)

> 以下為最通用的拼圖式結構 (Jigsaw Structure) 編寫骨架.

```json
{
  "type": "minecraft:jigsaw",
  "biomes": "#minecraft:has_structure/pillager_outpost",
  "step": "surface_structures",
  "spawn_overrides": {
    "monster": {
      "bounding_box": "piece",
      "spawns": [
        { "type": "minecraft:pillager", "weight": 1, "minCount": 1, "maxCount": 1 }
      ]
    }
  },
  "terrain_adaptation": "beard_thin",
  "start_pool": "minecraft:pillager_outpost/base_plate",
  "size": 7,
  "start_height": { "absolute": 0 },
  "project_start_to_heightmap": "WORLD_SURFACE_WG",
  "max_distance_from_center": 80,
  "use_expansion_hack": false
}
```

---

## 3. 根節點屬性表 (Root Properties)

> 檔案第一層級的鍵值定義.

| 鍵值 (Key) | 類型 | 必填 | 簡述 | 說明、預設值與可用值索引 |
| --- | --- | --- | --- | --- |
| `"type"` | `string` | 是 | 結構種類 | 指定結構的演算法模型. 詳見 [5.1](#51-結構類型-structure-types). |
| `"biomes"` | `string \| array` | 是 | 適用群系 | 指定該結構可生成的生物群系標籤或 ID 列表. |
| `"step"` | `enum` | 是 | 生成階段 | 決定結構在地形生成序列中的順序. 詳見 [5.3](#53-生成階段-generation-steps). |
| `"spawn_overrides"` | `object` | 否 | 生成覆寫 | 定義結構範圍內的特殊生物生成規則. 連結至 [4.1](#41-spawn_overrides-生物生成覆寫). |
| `"terrain_adaptation"` | `enum` | 否 | 地形適應 | 決定結構如何與周圍地形融合 (如地基挖掘). 詳見 [5.2](#52-地形適應-terrain-adaptation). |
| `"start_pool"` | `string` | 否 | 起始模板池 | **僅 jigsaw 可用**. 引用 `worldgen/template_pool` ID. |
| `"size"` | `int` | 否 | 展開深度 | **僅 jigsaw 可用**. 結構從起點延伸的最大零件數量. |

---

## 4. 子對象詳解 (Sub-object Details)

### 4.1 spawn_overrides (生物生成覆寫)

> 用於讓特定結構內部生成與環境群系不同的生物 (如掠奪者前哨站生成掠奪者).

| 子鍵值 (Sub-key) | 類型 | 必填 | 簡述 | 說明 |
| --- | --- | --- | --- | --- |
| `"bounding_box"` | `enum` | 是 | 判定邊框 | `piece` (僅零件內) 或 `full` (整個結構邊框). |
| `"spawns"` | `array` | 是 | 生成清單 | 包含實體 `type`, `weight`, `minCount`, `maxCount` 的列表. |

### 4.2 jigsaw 專屬配置

| 子鍵值 (Sub-key) | 類型 | 必填 | 簡述 | 說明 |
| --- | --- | --- | --- | --- |
| `"start_height"` | `object` | 是 | 起始高度 | 定義結構起點的垂直位置 (支援 `absolute`, `uniform` 等). |
| `"project_start_to_heightmap"` | `string` | 否 | 高度圖投影 | 將起點投影至地表 (如 `WORLD_SURFACE_WG`). |
| `"max_distance_from_center"` | `int` | 是 | 最大半徑 | 零件能離開起點的最遠水平距離 (1-128). |

---

## 5. 參數枚舉與可用值全清單 (Value Enumerations)

### 5.1 結構類型 (Structure Types)

| 參數值 (Value) | 簡述 | 完整遊戲行為說明 |
| --- | --- | --- |
| `minecraft:jigsaw` | 拼圖式結構 | 透過模板池動態拼接多個 NBT, 最常用的自訂結構類型. |
| `minecraft:mineshaft` | 廢棄礦坑 | 具備專屬的木架與鐵軌生成邏輯. |
| `minecraft:ocean_monument` | 海底神殿 | 具備預設的深海生成限制. |
| `minecraft:stronghold` | 要塞 | 具備特殊的末地門房與圖書館生成邏輯. |
| `minecraft:buried_treasure` | 埋藏寶藏 | 僅生成單一寶箱的簡易結構. |
| `minecraft:ruined_portal` | 毀壞傳送門 | 具備地形侵蝕與金塊生成邏輯. |
| `minecraft:shipwreck` | 沉船 | 支援不同受損程度的變體生成. |

### 5.2 地形適應 (Terrain Adaptation)

| 參數值 (Value) | 簡述 | 完整遊戲行為說明 |
| --- | --- | --- |
| `none` | 無 | 結構直接覆蓋在地形上, 不改變周圍地勢. |
| `bury` | 埋入 | 將結構完全埋入地底. |
| `beard_thin` | 薄地基 | 在結構下方產生少量方塊以支撐建築, 使其不懸空. |
| `beard_box` | 盒狀地基 | 在結構周圍產生整齊的方塊底座, 適合建築物. |
| `encapsulate` | 封裝 | 完全包裹結構, 常用於地底密閉空間. |

### 5.3 生成階段 (Generation Steps)

| 參數值 (Value) | 簡述 | 對應生物群系步驟索引 |
| --- | --- | --- |
| `raw_generation` | 原始生成 | 0 (地殼基礎) |
| `underground_structures` | 地底結構 | 3 (礦坑、堡壘) |
| `surface_structures` | 地表結構 | 4 (村莊、前哨站) |
| `strongholds` | 要塞專用 | 5 |

---

## 6. 數據約束與邊界條件 (Data Constraints)

*   **Jigsaw 深度 (size)**: 數值範圍為 `1` - `7`. 超過 7 需要特殊手段否則會增加效能負擔.
*   **最大距離**: `max_distance_from_center` 數值必須與 `size` 以及零件實際大小匹配, 否則零件會被截斷.
*   **群系過濾**: `biomes` 必須引用有效的標籤. 若結構被分配到不含此標籤的群系, 則不會生成.
*   **結構集連結**: 單純有 `structure` 檔案不會在世界上生成, 必須在 `worldgen/structure_set` 中將其加入分佈清單.

---

## 7. 外部連結 (References)

* [Misode Structure Generator](https://misode.github.io/worldgen/structure/)
* [Minecraft Wiki - Structure](https://zh.minecraft.wiki/w/%E7%BB%93%E6%9E%84)
* [模板池速查表 (Template Pool)](https://github.com/YuYue71/Minecraft_Commands/blob/main/pack_template/data/example/worldgen/template_pool/template_pool.md)
* [結構集速查表 (Structure Set)](https://github.com/YuYue71/Minecraft_Commands/blob/main/pack_template/data/example/worldgen/structure_set/structure_set.md)
* [生態域 ID (Biome IDs)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/Biome_IDs.md)
* [資源位置與命名空間規範 (Resource Locations)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/ResourceLocations.md)