## 雜訊設定 (`noise_settings/`)

> 決定整個維度之地形高度範圍、巨觀浮凸型態以及雜訊基礎底層結構。

**路徑：** `data/<namespace>/worldgen/noise_settings/<名稱>.json`

### JSON 結構

```json
{
    "sea_level": 63,
    "disable_mob_generation": false,
    "aquifers_enabled": true,
    "ore_veins_enabled": true,
    "legacy_random_source": false,
    "default_block": {
        "Name": "minecraft:stone"
    },
    "default_fluid": {
        "Name": "minecraft:water",
        "Properties": {
            "level": "0"
        }
    },
    "noise": {
        "min_y": -64,
        "height": 384,
        "size_horizontal": 1,
        "size_vertical": 2
    },
    "noise_router": {
        "barrier": 0,
        "fluid_level_floodedness": 0,
        "fluid_level_spread": 0,
        "lava": 0,
        "temperature": "minecraft:temperature",
        "vegetation": "minecraft:vegetation",
        "continents": "minecraft:continents",
        "erosion": "minecraft:erosion",
        "depth": "minecraft:depth",
        "ridges": "minecraft:ridges",
        "initial_density_without_jaggedness": 0,
        "final_density": "minecraft:overworld/final_density",
        "vein_toggle": 0,
        "vein_ridged": 0,
        "vein_gap": 0
    },
    "surface_rule": {
        "type": "minecraft:sequence",
        "sequence": []
    },
    "spawn_target": []
}

```

### 欄位說明

#### 根層欄位

| 欄位 | 類型 | 必填 | 預設 | 說明 |
| --- | --- | --- | --- | --- |
| `sea_level` | `int` | ✓ | — | 全局 Sea Level (海平面) 高度座標（如主世界預設為 `63`） |
| `disable_mob_generation` | `boolean` | ✓ | — | 關閉該維度所有自然 Creature Spawning (生物生成) 邏輯 |
| `aquifers_enabled` | `boolean` | ✓ | — | 啟用 Aquifers (含水層) 演算法，允許生成局部不同水位的地下水體 |
| `ore_veins_enabled` | `boolean` | ✓ | — | 啟用巨型 Ore Veins (礦脈) 演算法（如主世界的巨型鐵/銅礦脈） |
| `legacy_random_source` | `boolean` | ✓ | — | 啟用 Legacy Random Source (傳統隨機源)，影響礦物分佈雜湊邏輯 |
| `default_block` | `object` | ✓ | — | Terrain Baseline (地形基底) 之 Default Block State (預設方塊狀態，通常為石頭或地獄石) |
| `default_fluid` | `object` | ✓ | — | Ocean & Fluid Baseline (海洋與流體基底) 之 Default Fluid State (預設流體狀態) |
| `noise` | `object` | ✓ | — | 定義世界生成之 3D Noise Space (雜訊空間) 幾何邊界與網格尺度 |
| `noise_router` | `object` | ✓ | — | Noise Router (雜訊路由器)，將地形特徵綁定至特定 Density Function (密度函數) 或純量常數 |
| `surface_rule` | `object` | ✓ | — | Surface Rule (地表規則) 根節點，決定基底地形表面如何被草地、沙子或雪塊覆蓋 |
| `spawn_target` | `array[]` | ✓ | — | Spawn Target (生成目標)，定義玩家進入維度時，初始重生點所優先搜尋之 Climate Parameter (氣候參數) 陣列 |

#### 子欄位：`noise`

| 欄位 | 類型 | 必填 | 預設 | 說明 |
| --- | --- | --- | --- | --- |
| `min_y` | `int` | ✓ | — | 該維度之 Minimum Y (最小 Y 軸高度)，必須為 `16` 的倍數（如 `-64`） |
| `height` | `int` | ✓ | — | 該維度之 Total Height (總生成高度)，必須為 `16` 的倍數（如 `384`） |
| `size_horizontal` | `int` | ✓ | — | Horizontal Cell Size (水平網格大小) 乘數。值域限制 `1` 或 `2`，數值越大地形水平變化越平緩 |
| `size_vertical` | `int` | ✓ | — | Vertical Cell Size (垂直網格大小) 乘數。值大導致垂直向的地形拉伸變形更平緩 |

#### 子欄位：`noise_router`

Noise Router (雜訊路由器) 內之所有鍵值皆用於定義各類地形特徵的取樣來源。可填入 `int`/`float` 數值（表示純量常數）或是 Density Function (密度函數) 之 Registry ID (註冊識別碼)。

| 欄位 | 類型 | 必填 | 預設 | 說明 |
| --- | --- | --- | --- | --- |
| `temperature` | `string` / `float` | ✓ | — | 控制 Biome (生物群系) 分佈之 Temperature (溫度) 雜訊映射 |
| `vegetation` | `string` / `float` | ✓ | — | 控制 Biome (生物群系) 分佈之 Humidity/Vegetation (濕度/植被) 雜訊映射 |
| `continents` | `string` / `float` | ✓ | — | 控制巨觀陸塊分佈之 Continentalness (大陸性) 雜訊映射 |
| `erosion` | `string` / `float` | ✓ | — | 控制地形起伏與破碎程度之 Erosion (侵蝕度) 雜訊映射 |
| `depth` | `string` / `float` | ✓ | — | 控制地形基底高度之 Depth (深度) 雜訊映射 |
| `ridges` | `string` / `float` | ✓ | — | 控制山脊與山脈陡峭度之 Weirdness/Ridges (怪異度/山脊) 雜訊映射 |
| `final_density` | `string` / `float` | ✓ | — | 決定方塊最終是否實體化之核心 Final Density (最終密度) 函數 |

### 條件依賴 (Conditional Fields)

| 條件 | 生效欄位 | 失效 / 忽略欄位 |
| --- | --- | --- |
| `height` 與 `min_y` 之設定值 | 絕對限制該維度內所有 Chunk (區塊) 可建造之有效高度 | 任何超出此範圍的 Placed Feature (放置特徵) 高度設定皆無效並報錯 |
| `surface_rule` 指定為 `minecraft:condition` 時 | 啟用特定的 Rule Test (規則測試) 取代單一方面材質 | — |
