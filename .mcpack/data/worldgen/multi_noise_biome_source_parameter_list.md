## 多噪點參數列表 (`multi_noise_biome_source_parameter_list/`)

> 管理大範圍生物群系多噪點模型控制點（溫度、濕度、大陸性、侵蝕度等）之資料對應表，允許將氣候參數集獨立註冊為可複用之 Preset (預設集)。

**路徑：** `data/<namespace>/worldgen/multi_noise_biome_source_parameter_list/<名稱>.json`

### JSON 結構

此檔案之內部 Topology (拓撲) 結構與 `biome_source` (多噪點類型) 完全一致，用於將龐大的氣候對應表從維度設定中解耦（Decoupling）。

#### 使用既有預設集時

```json
{
    "preset": "minecraft:overworld"
}

```

#### 顯式宣告參數陣列時

```json
{
    "biomes": [
        {
            "biome": "minecraft:plains",
            "parameters": {
                "temperature": 0.0,
                "humidity": 0.0,
                "continentalness": 0.0,
                "erosion": 0.0,
                "depth": 0.0,
                "weirdness": 0.0,
                "offset": 0.0
            }
        },
        {
            "biome": "minecraft:desert",
            "parameters": {
                "temperature": 1.0,
                "humidity": -1.0,
                "continentalness": 0.0,
                "erosion": 0.0,
                "depth": 0.0,
                "weirdness": 0.0,
                "offset": 0.0
            }
        }
    ]
}

```

### 欄位說明

#### 根層欄位

| 欄位 | 類型 | 必填 | 預設 | 說明 |
| --- | --- | --- | --- | --- |
| `preset` | `string` |  | — | Preset ID (預設集識別碼)。若填入已註冊之參數列表 ID，將直接繼承其所有氣候映射 |
| `biomes` | `array[]` |  | — | Custom Biome Array (自訂生物群系陣列)，用於宣告該預設集內包含的所有生態域與其對應氣候點 |

#### 複合結構：`biomes` 陣列元素

| 欄位 | 類型 | 必填 | 預設 | 說明 |
| --- | --- | --- | --- | --- |
| `biome` | `string` | ✓ | — | 目標 Biome (生物群系) 之識別碼 |
| `parameters` | `object` | ✓ | — | Climate Parameters (氣候參數) 物件，定義該群系於 6D 雜訊空間中之理想座標 |

#### 複合結構：`parameters` 氣候控制點

> 所有數值範圍皆限制於 `-2.0` 至 `2.0` 之間，且支援傳入範圍陣列（如 `[-1.0, 0.5]`）。

| 欄位 | 類型 | 必填 | 預設 | 說明 |
| --- | --- | --- | --- | --- |
| `temperature` | `float`/`array` | ✓ | — | Temperature (溫度) 取樣軸 |
| `humidity` | `float`/`array` | ✓ | — | Humidity (濕度) 取樣軸 |
| `continentalness` | `float`/`array` | ✓ | — | Continentalness (大陸性) 取樣軸，區分海洋與陸地 |
| `erosion` | `float`/`array` | ✓ | — | Erosion (侵蝕度) 取樣軸，控制地形平緩或陡峭破碎 |
| `depth` | `float`/`array` | ✓ | — | Depth (深度) 取樣軸，控制地表與地底之垂直分層 |
| `weirdness` | `float`/`array` | ✓ | — | Weirdness (怪異度) 取樣軸，影響特化地形（如碎石山峰） |
| `offset` | `float` | ✓ | — | Weight Offset (權重偏移量)，數值越低則該群系在空間交界處的競爭邊界越弱 |

### 條件依賴 (Conditional Fields)

| 條件 | 生效欄位 | 失效 / 忽略欄位 |
| --- | --- | --- |
| 宣告 `preset` 時 | 系統強制綁定目標預設集之映射結構 | `biomes` 陣列將被徹底忽略 |
| 未宣告 `preset` 時 | `biomes` 陣列轉為強制必填 | — |