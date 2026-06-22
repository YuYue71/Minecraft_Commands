## 結構 (`structure/`)

> 定義大型複合建構物（如村莊、要塞、洋陣）之生成邏輯、地貌融合演算法與組裝起點。

**路徑：** `data/<namespace>/worldgen/structure/<名稱>.json`

### JSON 結構

由於自訂結構高達 95% 依賴 Jigsaw Block (拼圖方塊) 系統進行動態組裝，以下展示 `type` 為 `"minecraft:jigsaw"` 之標準結構配置：

```json
{
    "type": "minecraft:jigsaw",
    "biomes": "#minecraft:has_structure/village_plains",
    "step": "surface_structures",
    "terrain_adaptation": "beard_thin",
    "spawn_overrides": {
        "monster": {
            "bounding_box": "piece",
            "spawns": [
                {
                    "type": "minecraft:pillager",
                    "weight": 1,
                    "minCount": 1,
                    "maxCount": 1
                }
            ]
        }
    },
    "start_pool": "minecraft:village/plains/town_centers",
    "size": 6,
    "start_height": {
        "absolute": 0
    },
    "project_start_to_heightmap": "WORLD_SURFACE_WG",
    "max_distance_from_center": 80,
    "use_expansion_hack": false
}

```

### 欄位說明

#### 根層欄位 (所有結構共用)

| 欄位 | 類型 | 必填 | 預設 | 說明 |
| --- | --- | --- | --- | --- |
| `type` | `string` | ✓ | — | Structure Type (結構類型) 之 Registry ID (註冊識別碼)，決定後續參數結構 |
| `biomes` | `string`/`array` | ✓ | — | 允許生成此結構之 Biome (生物群系) 列表，通常引用 Tag (標籤，如 `#minecraft:has_structure/igloo`) |
| `step` | `string` | ✓ | — | Generation Step (生成階段)，決定結構於世界生成管線中之實體化順序 |
| `terrain_adaptation` | `string` |  | `"none"` | Terrain Adaptation (地形適應) 演算法，控制結構周圍地形之自動形變與包覆，枚舉值見下方 |
| `spawn_overrides` | `object` |  | `{}` | Spawn Overrides (生成覆蓋)，自訂結構 Bounding Box (邊界框) 內部之專屬生物生成規則 |

#### 子欄位：`type` = `"minecraft:jigsaw"` 時之專屬引數

| 欄位 | 類型 | 必填 | 預設 | 說明 |
| --- | --- | --- | --- | --- |
| `start_pool` | `string` | ✓ | — | 起始 Template Pool (模板池) 之識別碼，作為整個結構展開的根節點（Root Piece） |
| `size` | `int` | ✓ | — | 結構展開之 Maximum Depth (最大深度/代數)，範圍 `1` 至 `7`（極端情況可至 `116`，但極易引發效能崩潰） |
| `start_height` | `object` | ✓ | — | Height Provider (高度提供者)，決定起始結構拼圖之絕對或相對 Y 軸生成基準高度 |
| `project_start_to_heightmap` | `string` |  | — | 若設定，會強制將起始拼圖之高度貼齊至指定的 Heightmap (高度圖，如 `"WORLD_SURFACE_WG"`) |
| `max_distance_from_center` | `int` | ✓ | — | 結構邊緣距離中心點之 Maximum Radius (最大半徑限制)，硬限制範圍 `1` 至 `116` |
| `use_expansion_hack` | `boolean` | ✓ | — | 專用於原版村莊向後相容之 Expansion Hack (擴展駭客) 邏輯，自訂結構應一律設為 `false` |

#### 子欄位：`spawn_overrides` (內部實體分類鍵值)

| 欄位 | 類型 | 必填 | 預設 | 說明 |
| --- | --- | --- | --- | --- |
| `bounding_box` | `string` | ✓ | — | 生成範圍限制模式：`"piece"` (僅限個別結構方塊內部) 或 `"full"` (橫跨整個結構之總體邊界框) |
| `spawns` | `array[]` | ✓ | — | 覆蓋生成之實體權重陣列（結構同 `biome` 內部之 `spawners`） |

### 枚舉值速查

#### `type` 可填值 (核心邏輯)

| 值 | 分類 | 說明 |
| --- | --- | --- |
| `minecraft:jigsaw` | 泛用組裝 | 透過 Template Pool (模板池) 與 Jigsaw Block (拼圖方塊) 進行遞迴組裝（現代結構標準） |
| `minecraft:mineshaft` | 原版硬編碼 | 生成原版廢棄礦坑，具備特殊之管狀生成與蜘蛛網散佈邏輯 |
| `minecraft:ocean_monument` | 原版硬編碼 | 生成海底神殿，具備硬編碼之守衛者生成與海綿房邏輯 |
| `minecraft:fortress` | 原版硬編碼 | 生成地獄要塞，具備硬編碼之烈焰使者與凋零骷髏生成範圍 |
| `minecraft:woodland_mansion` | 原版硬編碼 | 生成林地府邸，內部房間分配為硬編碼演算法 |

#### `terrain_adaptation` 可填值

| 值 | 分類 | 說明 |
| --- | --- | --- |
| `"none"` | 靜態 | 地形不會為結構產生任何形變，若結構位於空中則會懸空 |
| `"beard_thin"` | 支撐 | 於結構底部生成較薄之 Terrain Beard (地形鬍鬚) 支撐柱，確保房屋不懸空（如平原村莊） |
| `"beard_box"` | 支撐 | 於結構底部與周邊生成厚實之盒狀地形支撐（如沙漠神殿、前哨站） |
| `"bury"` | 侵蝕 | 將結構埋入地形內部，周圍地形會向內塌陷包覆邊界（如要塞、地下遺跡） |
| `"encapsulate"` | 侵蝕 | 於結構外部生成一個完美包覆之 Terrain Capsule (地形膠囊/外殼)（如遠古城市） |

#### `step` 可填值

| 值 | 說明 |
| --- | --- |
| `"surface_structures"` | 於地表階段生成（大多數地面結構如村莊、前哨站） |
| `"underground_structures"` | 於地下階段生成（如要塞、廢棄礦坑、遠古城市） |

### 條件依賴 (Conditional Fields)

| 條件 | 生效欄位 | 失效 / 忽略欄位 |
| --- | --- | --- |
| `type` = `"minecraft:jigsaw"` 時 | `start_pool`、`size`、`max_distance_from_center` 轉為必填 | — |
| `type` 為非 jigsaw 之硬編碼結構時 | 僅依賴 `biomes` 與 `spawn_overrides` | Jigsaw 相關之 `size` 與 `start_pool` 皆無效 |