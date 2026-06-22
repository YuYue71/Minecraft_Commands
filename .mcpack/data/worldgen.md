# 世界生成 (`worldgen/`)

> **分類:** `資料包` ｜ **適用版本:** `JE ≤ 1.20.4`
> **路徑:** `data/<namespace>/worldgen/<子分類>/<名稱>.json` ｜ **引用格式:** `namespace:<名稱>`

---

## 目錄

* [概覽](#概覽-overview)
* [目錄結構](#目錄結構)
* [子分類索引](#子分類索引)
    * [生物群系 (biome)](#生物群系-biome)
    * [已配置雕刻器 (configured_carver)](#已配置雕刻器-configured_carver)
    * [已配置特徵 (configured_feature)](#已配置特徵-configured_feature)
    * [密度函數 (density_function)](#密度函數-density_function)
    * [超平坦預設 (flat_level_generator_preset)](#超平坦預設-flat_level_generator_preset)
    * [多重雜訊生物群系來源參數列表 (multi_noise_biome_source_parameter_list)](#多重雜訊生物群系來源參數列表-multi_noise_biome_source_parameter_list)
    * [雜訊 (noise)](#雜訊-noise)
    * [雜訊設定 (noise_settings)](#雜訊設定-noise_settings)
    * [已放置特徵 (placed_feature)](#已放置特徵-placed_feature)
    * [處理器列表 (processor_list)](#處理器列表-processor_list)
    * [結構 (structure)](#結構-structure)
    * [結構集 (structure_set)](#結構集-structure_set)
    * [模板池 (template_pool)](#模板池-template_pool)
    * [世界預設 (world_preset)](#世界預設-world_preset)
* [跨子分類引用規則](#跨子分類引用規則)
* [注意事項](#注意事項-notes)
* [外部連結](#外部連結-references)

---

## 概覽 (Overview)

定義 Minecraft 世界生成的核心邏輯與架構，包含地形運算、生物群系分佈、結構生成與地表特徵配置。

---

## 目錄結構

```text
worldgen/
├── biome/
├── configured_carver/
├── configured_feature/
├── density_function/
├── flat_level_generator_preset/
├── multi_noise_biome_source_parameter_list/
├── noise/
├── noise_settings/
├── placed_feature/
├── processor_list/
├── structure/
├── structure_set/
├── template_pool/
└── world_preset/

```

---

## 子分類索引

| 子分類資料夾 | 功能說明 |
| --- | --- |
| [`biome/`](https://www.google.com/search?q=%23biome) | 定義生物群系的環境屬性、生成生物列表與視覺音效特徵 |
| [`configured_carver/`](https://www.google.com/search?q=%23configured-carver) | 定義地表雕刻器，用於生成地底洞穴與峽谷結構 |
| [`configured_feature/`](https://www.google.com/search?q=%23configured-feature) | 定義地表特徵的具體參數（如：樹木種類、礦石生成分佈） |
| [`density_function/`](https://www.google.com/search?q=%23density-function) | 定義密度函數，以數學運算處理地形高度與形狀雜訊 |
| [`flat_level_generator_preset/`](https://www.google.com/search?q=%23flat-level-generator-preset) | 定義超平坦世界的預設生成規則，包含方塊層數與結構限制 |
| [`multi_noise_biome_source_parameter_list/`](https://www.google.com/search?q=%23multi-noise-biome-source-parameter-list) | 定義多重雜訊環境下，生物群系的分佈參數矩陣 |
| [`noise/`](https://www.google.com/search?q=%23noise) | 定義單一雜訊演算法之參數，影響地形生成的基底波動 |
| [`noise_settings/`](https://www.google.com/search?q=%23noise-settings) | 定義整體地形生成器設定，包含海平面、地形極值與方塊映射 |
| [`placed_feature/`](https://www.google.com/search?q=%23placed-feature) | 定義已配置特徵在世界空間中的具體放置規則（如：高度限制、生成次數） |
| [`processor_list/`](https://www.google.com/search?q=%23processor-list) | 定義結構生成時的處理器陣列，負責方塊替換與隨機化邏輯 |
| [`structure/`](https://www.google.com/search?q=%23structure) | 定義獨立結構的生成起點、適用生物群系與生成邊界限制 |
| [`structure_set/`](https://www.google.com/search?q=%23structure-set) | 定義結構集，規範特定結構在世界中的分佈頻率與間距 |
| [`template_pool/`](https://www.google.com/search?q=%23template-pool) | 定義結構模板池，用於拼湊與連接 Jigsaw (拼圖) 系統的多個 NBT 結構部件 |
| [`world_preset/`](https://www.google.com/search?q=%23world-preset) | 定義世界預設，提供創立世界選單中的可選全域生成模式 |

---

## 生物群系 (biome)
> 定義生物群系 (Biome) 的環境屬性 (Environmental Properties)、生成實體列表 (Spawn Lists) 與視覺音效特徵 (Visual & Audio Effects)。

**路徑：** `data/<namespace>/worldgen/biome/<名稱>.json`

### JSON 結構

```json
{
    "has_precipitation": true,
    "temperature": 0.8,
    "temperature_modifier": "none",
    "downfall": 0.4,
    "effects": {
        "fog_color": 12638463,
        "water_color": 4159204,
        "water_fog_color": 329011,
        "sky_color": 7907327,
        "foliage_color": 10387789,
        "grass_color": 9470285,
        "grass_color_modifier": "none",
        "ambient_sound": "minecraft:ambient.cave",
        "mood_sound": {
            "sound": "minecraft:ambient.cave",
            "tick_delay": 6000,
            "block_search_extent": 8,
            "offset": 2.0
        },
        "additions_sound": {
            "sound": "minecraft:ambient.underwater.loop.additions",
            "tick_chance": 0.0111
        },
        "music": {
            "sound": "minecraft:music.overworld.plains",
            "min_delay": 12000,
            "max_delay": 24000,
            "replace_current_music": false
        },
        "particle": {
            "options": {
                "type": "minecraft:white_ash"
            },
            "probability": 0.118093334
        }
    },
    "spawners": {
        "monster": [
            {
                "type": "minecraft:zombie",
                "weight": 95,
                "minCount": 4,
                "maxCount": 4
            }
        ]
    },
    "spawn_costs": {
        "minecraft:zombie": {
            "energy_budget": 0.12,
            "charge": 1.0
        }
    },
    "carvers": {
        "air": [
            "minecraft:cave"
        ]
    },
    "features": [
        [
            "minecraft:monster_room"
        ],
        [
            "minecraft:ore_dirt"
        ]
    ]
}

```

### 欄位說明

#### 根層欄位

| 欄位 | 類型 | 必填 | 預設 | 說明 |
| --- | --- | --- | --- | --- |
| `has_precipitation` | `boolean` | ✓ | — | 決定此生物群系是否有降水 (Precipitation) 狀態，影響天氣渲染 |
| `temperature` | `float` | ✓ | — | 生物群系的基礎溫度 (Base Temperature)，數值影響水是否結冰與降水類型（雪或雨） |
| `temperature_modifier` | `string` |  | `"none"` | 溫度修飾器 (Temperature Modifier)，套用特定演算法改變垂直高度的溫度漸變 |
| `downfall` | `float` | ✓ | — | 降雨量 (Downfall)，數值會與溫度共同決定預設的草地與樹葉色調，並影響火勢蔓延速度 |
| `effects` | `object` | ✓ | — | 環境效果 (Environmental Effects)，定義視覺色彩渲染與環境音效。子欄位見下方 |
| `spawners` | `object` |  | `{}` | 生成器 (Spawners)，定義各分類生物的生成權重與數量邊界。子欄位見下方 |
| `spawn_costs` | `object` |  | `{}` | 生成消耗 (Spawn Costs)，覆寫特定實體生成時的能量消耗乘數。子欄位見下方 |
| `carvers` | `object` |  | `{}` | 雕刻器 (Carvers)，定義地形生成時切割地表或地底的算法資源。子欄位見下方 |
| `features` | `list` |  | `[]` | 特徵矩陣 (Features Matrix)，依序定義地表植被、礦脈與小型結構的生成資源。子欄位見下方 |

#### 子欄位：`effects`

| 欄位 | 類型 | 必填 | 預設 | 說明 |
| --- | --- | --- | --- | --- |
| `fog_color` | `int` | ✓ | — | 遠景霧氣 (Fog) 的十進位 RGB 顏色代碼 |
| `water_color` | `int` | ✓ | — | 水方塊 (Water Block) 靜態渲染的十進位 RGB 顏色代碼 |
| `water_fog_color` | `int` | ✓ | — | 水下視覺霧氣 (Underwater Fog) 的十進位 RGB 顏色代碼 |
| `sky_color` | `int` | ✓ | — | 頂部天空 (Sky) 的十進位 RGB 顏色代碼 |
| `foliage_color` | `int` |  | — | 樹葉 (Leaves) 與藤蔓 (Vines) 的十進位 RGB 顏色。若未定義則由硬編碼氣候圖計算 |
| `grass_color` | `int` |  | — | 草地 (Grass) 相關方塊的十進位 RGB 顏色。若未定義則由硬編碼氣候圖計算 |
| `grass_color_modifier` | `string` |  | `"none"` | 內建草地顏色修飾器 (Grass Color Modifier)，使用特定演算法混色。枚舉值見下方 |
| `ambient_sound` | `string` |  | — | 持續播放的環境底噪 (Ambient Loop) 音效 ID |
| `mood_sound` | `object` |  | — | 情境音效 (Mood Sound)，定義隨機觸發的環境音響參數（如洞穴深處回音） |
| `additions_sound` | `object` |  | — | 附加音效 (Additions Sound)，定義隨機抽樣播放的環境點綴音效 |
| `music` | `object` |  | — | 背景音樂 (Background Music)，定義此群系專屬的音樂軌道與播放延遲區間 |
| `particle` | `object` |  | — | 環境粒子 (Environmental Particles)，定義空氣中漂浮粒子的種類與生成機率 |

#### 子欄位：`spawners`

> 將實體依類別（`monster`, `creature`, `ambient`, `water_creature`, `water_ambient`, `underground_water_creature`, `axolotls`, `misc`）作為鍵值，內部為包含以下物件結構的陣列：

| 欄位 | 類型 | 必填 | 預設 | 說明 |
| --- | --- | --- | --- | --- |
| `type` | `string` | ✓ | — | 目標實體 ID (Entity ID) |
| `weight` | `int` | ✓ | — | 生成權重 (Spawn Weight)，同一類別中相互競爭生成機率的基準值 |
| `minCount` | `int` | ✓ | — | 單次群集生成 (Pack Spawn) 容許的最小數量 |
| `maxCount` | `int` | ✓ | — | 單次群集生成 (Pack Spawn) 容許的最大數量 |

#### 子欄位：`spawn_costs`

> 將目標實體 ID 作為鍵值，內部為包含以下物件結構：

| 欄位 | 類型 | 必填 | 預設 | 說明 |
| --- | --- | --- | --- | --- |
| `energy_budget` | `float` | ✓ | — | 基礎能量預算 (Energy Budget)，限制單位區塊內該實體最大生成密度的消耗值 |
| `charge` | `float` | ✓ | — | 能量負載 (Charge)，每次生成扣除的能量額度乘數 |

#### 子欄位：`carvers`

> 將雕刻執行階段（`air` 或 `liquid`）作為鍵值，內部為字串陣列：

| 欄位 | 類型 | 必填 | 預設 | 說明 |
| --- | --- | --- | --- | --- |
| `(階段陣列)` | `list` | ✓ | — | 填入已配置雕刻器 (Configured Carver) 的命名空間 ID |

#### 子欄位：`features`

> 二維矩陣結構。外層陣列代表世界生成的 11 個標準階段 (Generation Steps)，內層陣列代表在該階段中執行的特徵：

| 欄位 | 類型 | 必填 | 預設 | 說明 |
| --- | --- | --- | --- | --- |
| `(階段陣列)` | `list` | ✓ | — | 依序填入已放置特徵 (Placed Feature) 的命名空間 ID。階段順序為硬編碼執行（如 `raw_generation`, `lakes`, `vegetal_decoration` 等） |

### 枚舉值速查

#### `temperature_modifier` 可填值

| 值 | 分類 | 說明 |
| --- | --- | --- |
| `"none"` | 溫度演算法 | 預設線性梯度計算 (Linear Gradient Calculation) |
| `"frozen"` | 溫度演算法 | 強制於 Y 軸高處執行降溫，確保高地結構必定觸發降雪 (Snowfall) 邏輯 |

#### `grass_color_modifier` 可填值

| 值 | 分類 | 說明 |
| --- | --- | --- |
| `"none"` | 色彩映射 | 無額外數學運算介入 |
| `"dark_forest"` | 色彩映射 | 疊加特定 Alpha 通道降階，產生黑森林的深色植被渲染效果 |
| `"swamp"` | 色彩映射 | 整合 Perlin Noise (柏林雜訊) 取樣，產生沼澤群系斑駁、不均勻的地表色彩過渡 |

---

## 已配置雕刻器 (configured_carver)

---

## 已配置特徵 (configured_feature)

---

## 密度函數 (density_function)

---

## 超平坦預設 (flat_level_generator_preset)

---

## 多重雜訊生物群系來源參數列表 (multi_noise_biome_source_parameter_list)

---

## 雜訊 (noise)

---

## 雜訊設定 (noise_settings)

---

## 已放置特徵 (placed_feature)

---

## 處理器列表 (processor_list)

---

## 結構 (structure)

---

## 結構集 (structure_set)

---

## 模板池 (template_pool)

---

## 世界預設 (world_preset)

---

## 跨子分類引用規則

| 引用來源 | 引用目標 | 引用格式 |
| --- | --- | --- |
| `placed_feature` 內的 `feature` | `configured_feature` 的資源 | `namespace:名稱` |
| `structure` 內的 `biomes` | `biome` 或其標籤 (Tags) 資源 | `#namespace:名稱` 或 `namespace:名稱` |
| `structure_set` 內的 `structures` | `structure` 的資源 | `namespace:名稱` |
| `structure` 內的 `start_pool` | `template_pool` 的資源 | `namespace:名稱` |
| `world_preset` 內的維度設定 | `noise_settings` 與 `multi_noise_biome_source_parameter_list` | `namespace:名稱` |

---

## 注意事項 (Notes)

* 所有 Identifier (字串 ID) 必須嚴格使用小寫字母、數字、底線 (`_`)、連字號 (`-`) 或句點 (`.`)。
* 高度與地形生成運算具備嚴格的記憶體邊界限制，設定時須避免超出 `noise_settings` 內定義之極端高度閾值。

---

## 外部連結 (References)

* [Minecraft Wiki - 資料包/worldgen](https://www.google.com/search?q=%23)