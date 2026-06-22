## 生物群系 (`biome/`)

> 定義生物群系之環境參數、地表方塊覆蓋層、背景音效與生物生成機率。

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
        "sky_color": 8103167,
        "foliage_color": 10300216,
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
            "sound": "minecraft:ambient.cave.addition",
            "tick_chance": 0.0118
        },
        "music": {
            "sound": "minecraft:music.game",
            "min_delay": 12000,
            "max_delay": 24000,
            "replace_current_music": false
        }
    },
    "carvers": {
        "air": [
            "minecraft:cave"
        ]
    },
    "features": [
        [],
        [],
        [],
        [],
        [],
        [],
        [],
        [],
        [],
        [],
        []
    ],
    "spawners": {
        "monster": [
            {
                "type": "minecraft:zombie",
                "weight": 100,
                "minCount": 4,
                "maxCount": 4
            }
        ],
        "creature": [],
        "ambient": [],
        "water_creature": [],
        "water_ambient": [],
        "underground_water_creature": [],
        "axolotls": []
    },
    "spawn_costs": {
        "minecraft:zombie": {
            "energy_budget": 0.12,
            "charge": 1.0
        }
    }
}

```

### 欄位說明

#### 根層欄位

| 欄位 | 類型 | 必填 | 預設 | 說明 |
| --- | --- | --- | --- | --- |
| `has_precipitation` | `boolean` | ✓ | — | 指定此生物群系是否具備降水現象（天候系統開啟時會引發下雨或落雪） |
| `temperature` | `float` | ✓ | — | 生態域基礎 Temperature (溫度) 係數，影響植被底色與高海拔氣溫 |
| `temperature_modifier` | `string` |  | `"none"` | 溫度修飾算子，用於強制覆蓋氣溫衰減邏輯，枚舉值見下方 |
| `downfall` | `float` | ✓ | — | 空氣 Humidity/Downfall (濕度/降水量) 係數（`0.0` 至 `1.0`） |
| `effects` | `object` | ✓ | — | 管轄色彩渲染、顆粒特效與多軌音訊配置之複合資料結構 |
| `carvers` | `object` | ✓ | — | 註冊用於此區域之峽谷與洞穴 World Carvers (世界雕刻器) 識別碼 |
| `features` | `array[]` | ✓ | — | 包含 11 個固定步驟階段之 Placed Feature (放置特徵) 二維陣列 |
| `spawners` | `object` | ✓ | — | 定義各分類 Entity (實體) 自然生成之機率權重與群聚數量邊界 |
| `spawn_costs` | `object` |  | — | 針對特定實體 ID 設定生成能量消耗，抑制高密度積壓 |

#### 子欄位：`effects`

| 欄位 | 類型 | 必填 | 預設 | 說明 |
| --- | --- | --- | --- | --- |
| `fog_color` | `int` | ✓ | — | 大氣遠景迷霧之 RGB 十進位色彩編碼 |
| `water_color` | `int` | ✓ | — | 水體方塊表面與靜止水源渲染之 RGB 十進位色彩編碼 |
| `water_fog_color` | `int` | ✓ | — | 玩家潛入水下時之水體迷霧 RGB 十進位色彩編碼 |
| `sky_color` | `int` | ✓ | — | 該區域天空頂層著色之 RGB 十進位色彩編碼 |
| `foliage_color` | `int` |  | — | 顯式覆蓋原版溫度曲線之樹葉專屬 RGB 十進位色彩編碼 |
| `grass_color` | `int` |  | — | 顯式覆蓋原版濕度曲線之草地專屬 RGB 十進位色彩編碼 |
| `grass_color_modifier` | `string` |  | `"none"` | 指定區域性草地著色之硬編碼特殊演算法，枚舉值見下方 |
| `ambient_sound` | `string` |  | — | 常態無間斷循環播放之 Ambient Sound (環境音效) 事件 ID |
| `mood_sound` | `object` |  | — | 低洞穴亮度時隨機觸發之 Mood Sound (氛圍陰森聲響) 配置參數 |
| `additions_sound` | `object` |  | — | 高隨機間隔觸發之 Additions Sound (附加點綴音效) 配置參數 |
| `music` | `object` |  | — | 該生態域專屬 Background Music (背景音樂) 配置參數 |

#### 子欄位：`features` (生成階段索引)

`features` 為嚴格長度之二維陣列，內部索引 `[0]` 至 `[10]` 分別對應 11 個世界生成 Pipeline (管線) 階段：

| 索引 | 類型 | 必填 | 預設 | 說明 |
| --- | --- | --- | --- | --- |
| `[0]` | `array` | ✓ | `[]` | `RAW_GENERATION` (原始地形修飾，如基岩層變更) |
| `[1]` | `array` | ✓ | `[]` | `LAKES` (湖泊與地表積水) |
| `[2]` | `array` | ✓ | `[]` | `LOCAL_MODIFICATIONS` (區域地形形變，如冰刺、玄武岩柱) |
| `[3]` | `array` | ✓ | `[]` | `UNDERGROUND_STRUCTURES` (地下結構物裝飾，如化石) |
| `[4]` | `array` | ✓ | `[]` | `SURFACE_STRUCTURES` (地表構造物，如沙漠水井) |
| `[5]` | `array` | ✓ | `[]` | `STRONGHOLDS` (要塞主體定位步) |
| `[6]` | `array` | ✓ | `[]` | `UNDERGROUND_DECORATION` (地下裝飾，如紫水晶洞) |
| `[7]` | `array` | ✓ | `[]` | `FLUID_SPRINGS` (水源與岩漿湧泉點) |
| `[8]` | `array` | ✓ | `[]` | `VEGETAL_DECORATION` (植被裝飾，如樹木、高草、苔蘚層) |
| `[9]` | `array` | ✓ | `[]` | `TOP_LAYER_MODIFICATION` (頂層地表修飾，如凍原積雪覆蓋) |
| `[10]` | `array` | ✓ | `[]` | `UNDERGROUND_ORES` (地下礦脈，如鐵、鑽石生成) |

#### 子欄位：`spawners` (以 `monster` 陣列元素為例)

| 欄位 | 類型 | 必填 | 預設 | 說明 |
| --- | --- | --- | --- | --- |
| `type` | `string` | ✓ | — | 目標 Entity (實體) 之 Registry ID (註冊識別碼，如 `"minecraft:zombie"`) |
| `weight` | `int` | ✓ | — | 隨機權重。相對於同分類下其他實體，數值越高越容易被選中 |
| `minCount` | `int` | ✓ | — | 單次 Pack Spawning (群聚生成) 成功時之數量下限邊界 |
| `maxCount` | `int` | ✓ | — | 單次 Pack Spawning (群聚生成) 成功時之數量上限邊界 |

#### 子欄位：`spawn_costs` (以實體 ID 為鍵值之內部物件)

| 欄位 | 類型 | 必填 | 預設 | 說明 |
| --- | --- | --- | --- | --- |
| `energy_budget` | `double` | ✓ | — | 區域分配給此實體的總能量預算上限，超出則暫停該類實體自然生成 |
| `charge` | `double` | ✓ | — | 單一實體成功初始化時扣減之能量值（消耗完畢則阻止後續生成） |

### 枚舉值速查

#### `temperature_modifier` 可填值

| 值 | 分類 | 說明 |
| --- | --- | --- |
| `"none"` | 標準 | 無修正，氣溫依據預設海拔公式進行線性衰減 |
| `"frozen"` | 氣候 | 強制套用冰凍修飾，高海拔水面自動結冰，降雨強制轉為落雪 |

#### `grass_color_modifier` 可填值

| 值 | 分類 | 說明 |
| --- | --- | --- |
| `"none"` | 標準 | 無修正，套用濕度與溫度對應之環境點陣色圖 |
| `"dark_forest"` | 植被 | 黑森林專屬著色模式，草地顏色注入暗綠色調濾鏡 |
| `"swamp"` | 植被 | 沼澤專屬著色模式，依據雜訊函數動態混合混濁草色 |

### 條件依賴

| 條件 | 生效欄位 | 失效 / 忽略欄位 |
| --- | --- | --- |
| `temperature` < `0.15` 且 `has_precipitation` = `true` | 自動觸發實體結冰與落雪物理機制 | 忽略常態雨滴粒子與天候效果 |
| 未顯式宣告 `foliage_color` 與 `grass_color` | 系統依 `temperature` 與 `downfall` 尋址預設色圖 | 專屬色彩常數失效 |