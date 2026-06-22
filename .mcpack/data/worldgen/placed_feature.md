## 放置特徵 (`placed_feature/`)

> 調控配置特徵於區塊（Chunk）內之水平分佈頻率、縱向垂直高度以及環境判定。

**路徑：** `data/<namespace>/worldgen/placed_feature/<名稱>.json`

### JSON 結構

```json
{
    "feature": "minecraft:iron_ore",
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
                "type": "minecraft:trapezoid",
                "min_inclusive": {
                    "absolute": -24
                },
                "max_inclusive": {
                    "absolute": 56
                }
            }
        },
        {
            "type": "minecraft:biome"
        }
    ]
}

```

### 欄位說明

#### 根層欄位

| 欄位 | 類型 | 必填 | 預設 | 說明 |
| --- | --- | --- | --- | --- |
| `feature` | `string` | ✓ | — | 目標 Configured Feature (配置特徵) 之 Registry ID (註冊識別碼) |
| `placement` | `array[]` | ✓ | — | Placement Modifiers (放置修飾符) 陣列，嚴格依序由上至下執行運算 |

#### 子欄位：`placement`

| 欄位 | 類型 | 必填 | 預設 | 說明 |
| --- | --- | --- | --- | --- |
| `type` | `string` | ✓ | — | 修飾符演算法之註冊識別碼，決定特徵在三維空間中的偏移或剔除規則 |

### 枚舉值速查

#### `placement` 陣列內之 `type` 可填值

| 值 | 分類 | 說明 |
| --- | --- | --- |
| `minecraft:biome` | 環境過濾 | 驗證當前座標是否屬於允許生成該特徵之 Biome (生物群系)，通常為陣列最後一個步驟 |
| `minecraft:block_predicate_filter` | 環境過濾 | 驗證當前座標是否符合特定 Block Predicate (方塊條件判定，如：需為空氣或特定方塊) |
| `minecraft:carving_mask` | 環境過濾 | 依據 Chunk Carving Mask (區塊雕刻遮罩，如峽谷或洞穴) 限制生成範圍 |
| `minecraft:rarity_filter` | 數量控制 | 賦予 `1/N` 的機率讓該次生成流程通過，失敗則直接中斷後續修飾符 |
| `minecraft:count` | 數量控制 | 將特徵嘗試生成 N 次，支援常數或 Uniform Int (均勻分佈隨機整數) |
| `minecraft:count_on_every_layer` | 數量控制 | 於地表至天空之每一層可行高度皆嘗試生成 N 次（常用於竹子、甘蔗） |
| `minecraft:noise_based_count` | 數量控制 | 依據當前座標之 Biome Noise (生物群系雜訊) 決定生成數量 |
| `minecraft:noise_threshold_count` | 數量控制 | 當雜訊超越特定閾值時，給予額外的生成數量加成 |
| `minecraft:in_square` | 空間偏移 | 將 X 與 Z 座標於當前區塊內部隨機平移 `0~15` 格 |
| `minecraft:random_offset` | 空間偏移 | 給予 X、Y、Z 三軸獨立的均勻隨機偏移量 |
| `minecraft:heightmap` | 高度映射 | 將 Y 座標自動貼齊至指定的 Heightmap (高度圖，如 `OCEAN_FLOOR_WG` 或 `MOTION_BLOCKING`) |
| `minecraft:height_range` | 高度映射 | 依據 Height Provider (高度提供者，如梯形分佈或均勻分佈) 於指定 Y 軸範圍內隨機取樣 |
| `minecraft:environment_scan` | 高度映射 | 於 Y 軸向上或向下掃描，直到尋找到符合條件的方塊（如尋找洞穴頂部或底部） |
| `minecraft:surface_relative_threshold_filter` | 高度映射 | 驗證當前高度與地表高度圖的相對差距是否落在指定閾值內 |
| `minecraft:surface_water_depth_filter` | 高度映射 | 驗證當前位置之海洋或湖泊最大水深，超過設定則剔除生成 |

### 條件依賴

| 條件 | 生效欄位 | 失效 / 忽略欄位 |
| --- | --- | --- |
| `type` = `"minecraft:count"` 時 | 必須包含 `count` 欄位 | — |
| `type` = `"minecraft:height_range"` 時 | 必須包含 `height` 欄位 | — |
| `type` = `"minecraft:rarity_filter"` 時 | 必須包含 `chance` 欄位 | — |
