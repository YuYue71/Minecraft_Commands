## 生物群系來源 (`biome_source/`)

> 選填組態。顯式指定特殊維度之 Biome (生物群系) 生成演算法路由與空間映射規則。

**路徑：** `data/<namespace>/worldgen/biome_source/<名稱>.json`

### JSON 結構

Biome Source (生物群系來源) 依據 `type` (類型) 之不同，具備截然不同的參數拓撲。以下展示兩種最核心之結構：

#### type = `"minecraft:multi_noise"` 時 (多噪點映射)

```json
{
    "type": "minecraft:multi_noise",
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

> **開發者備註**：若使用原版預設佈局，可省略 `biomes` 陣列，直接改用 Preset (預設集) 宣告：
> `{"type": "minecraft:multi_noise", "preset": "minecraft:overworld"}`

#### type = `"minecraft:fixed"` 時 (單一固定)

```json
{
    "type": "minecraft:fixed",
    "biome": "minecraft:desert"
}

```

### 欄位說明

#### 根層欄位

| 欄位 | 類型 | 必填 | 預設 | 說明 |
| --- | --- | --- | --- | --- |
| `type` | `string` | ✓ | — | Generator Type (生成器類型) 之 Registry ID (註冊識別碼)，枚舉值見下方 |

#### 子欄位 (`type` = `"minecraft:multi_noise"` 時)

| 欄位 | 類型 | 必填 | 預設 | 說明 |
| --- | --- | --- | --- | --- |
| `preset` | `string` |  | — | Preset ID (預設集識別碼)。若填寫此欄位（如 `"minecraft:overworld"`），則系統會自動帶入原版之氣候控制點，忽略下方的 `biomes` |
| `biomes` | `array[]` |  | — | Custom Biome Array (自訂生物群系陣列)。定義各個生態域在多噪點 6D 空間中的目標座標 |

#### 複合結構：`biomes` 陣列元素

| 欄位 | 類型 | 必填 | 預設 | 說明 |
| --- | --- | --- | --- | --- |
| `biome` | `string` | ✓ | — | 目標 Biome (生物群系) 之識別碼 |
| `parameters` | `object` | ✓ | — | Climate Parameters (氣候參數) 物件，定義該群系於 6D 雜訊空間中之理想中心點 |

#### 複合結構：`parameters` 控制點 (取值範圍皆為 `-2.0` 至 `2.0`)

| 欄位 | 類型 | 必填 | 預設 | 說明 |
| --- | --- | --- | --- | --- |
| `temperature` | `float`/`array` | ✓ | — | Temperature (溫度) 雜訊軸座標 |
| `humidity` | `float`/`array` | ✓ | — | Humidity (濕度) 雜訊軸座標 |
| `continentalness` | `float`/`array` | ✓ | — | Continentalness (大陸性) 雜訊軸座標 |
| `erosion` | `float`/`array` | ✓ | — | Erosion (侵蝕度) 雜訊軸座標 |
| `depth` | `float`/`array` | ✓ | — | Depth (深度) 雜訊軸座標 |
| `weirdness` | `float`/`array` | ✓ | — | Weirdness (怪異度) 雜訊軸座標 |
| `offset` | `float` | ✓ | — | Weight Offset (權重偏移量)。數值越低，該生物群系在交界處的競爭力越弱 |

> 註：上述 6 個氣候控制點亦可傳入範圍陣列（如 `[-1.0, 0.5]`）以擴大該群系之生成相容區間。

#### 子欄位 (`type` = `"minecraft:fixed"` 時)

| 欄位 | 類型 | 必填 | 預設 | 說明 |
| --- | --- | --- | --- | --- |
| `biome` | `string` | ✓ | — | 全域套用之單一 Biome (生物群系) 識別碼 |

### 枚舉值速查

#### `type` 可填值

| 值 | 分類 | 說明 |
| --- | --- | --- |
| `minecraft:multi_noise` | 雜訊映射 | 現代世界生成標準。透過 6 條獨立雜訊通道（溫度、濕度等）交集計算最符合的生物群系 |
| `minecraft:fixed` | 單一環境 | 強制整個維度或區域僅生成唯一指定的生物群系（如虛空世界或自訂單一環境生存地圖） |
| `minecraft:the_end` | 硬編碼 | 專用於 End Dimension (終界) 之硬編碼雜訊分佈（包含中心主島與外圍浮島環邏輯） |
| ~~`minecraft:checkerboard`~~ | 已棄用 | **Deprecated** — 傳統棋盤格分佈，`[1.19+]` 已從原版生成中移除，建議改用多噪點微調 |

### 條件依賴 (Conditional Fields)

| 條件 | 生效欄位 | 失效 / 忽略欄位 |
| --- | --- | --- |
| `type` = `"minecraft:multi_noise"` 且宣告 `preset` 時 | 系統直接套用預設集 | `biomes` 陣列將被徹底忽略 |
| `type` = `"minecraft:multi_noise"` 且未宣告 `preset` 時 | `biomes` 陣列轉為強制必填 | — |
| `type` = `"minecraft:fixed"` 時 | `biome` 字串轉為強制必填 | `parameters` 等所有氣候控制引數皆無效 |