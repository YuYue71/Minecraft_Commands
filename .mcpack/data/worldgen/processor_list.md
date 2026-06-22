## 處理器組 (`processor_list/`)

> 控制 Structure Block (結構方塊) 或 Jigsaw System (拼圖系統) 將 NBT 檔案實體化至世界時之動態 Block Replacement (方塊置換) 與條件過濾機制。

**路徑：** `data/<namespace>/worldgen/processor_list/<名稱>.json`

### JSON 結構

Processor List (處理器組) 檔案根目錄為一陣列物件，內部包含多個按順序執行之處理器：

```json
{
    "processors": [
        {
            "processor_type": "minecraft:rule",
            "rules": [
                {
                    "input_predicate": {
                        "predicate_type": "minecraft:random_block_match",
                        "block": "minecraft:stone_bricks",
                        "probability": 0.2
                    },
                    "location_predicate": {
                        "predicate_type": "minecraft:always_true"
                    },
                    "position_predicate": {
                        "predicate_type": "minecraft:always_true"
                    },
                    "output_state": {
                        "Name": "minecraft:cracked_stone_bricks"
                    }
                }
            ]
        },
        {
            "processor_type": "minecraft:block_ignore",
            "blocks": [
                {
                    "Name": "minecraft:structure_void"
                }
            ]
        }
    ]
}

```

### 欄位說明

#### 根層欄位

| 欄位 | 類型 | 必填 | 預設 | 說明 |
| --- | --- | --- | --- | --- |
| `processors` | `array[]` | ✓ | — | Processor Objects (處理器物件) 陣列，引擎將嚴格依據陣列由上至下（Index 0 開始）之順序疊加處理方塊 |

#### 子欄位：`processors` 陣列元素

| 欄位 | 類型 | 必填 | 預設 | 說明 |
| --- | --- | --- | --- | --- |
| `processor_type` | `string` | ✓ | — | 目標處理器之 Registry ID (註冊識別碼)。枚舉值見下方 |

#### 子欄位：當 `processor_type` = `"minecraft:rule"` 時之額外引數

此類型為最核心之置換邏輯，需定義 `rules` 陣列：

| 欄位 | 類型 | 必填 | 預設 | 說明 |
| --- | --- | --- | --- | --- |
| `rules` | `array[]` | ✓ | — | Rule Objects (規則物件) 陣列。針對 NBT 結構內之單一方塊，依序匹配規則，一旦命中即套用 `output_state` 並中斷後續規則判定 |

##### 複合結構：`rules` 陣列元素

| 欄位 | 類型 | 必填 | 預設 | 說明 |
| --- | --- | --- | --- | --- |
| `input_predicate` | `object` | ✓ | — | Rule Test (規則測試)。驗證**結構檔內部（NBT）**即將被放置的方塊是否符合條件 |
| `location_predicate` | `object` | ✓ | — | Rule Test (規則測試)。驗證**目標世界絕對座標**上原有的方塊是否符合條件 |
| `position_predicate` | `object` |  | `"always_true"` | Positional Rule Test (位置規則測試)。基於相對或絕對 Y 軸座標進行條件判定 |
| `output_state` | `object` | ✓ | — | Target Block State (目標方塊狀態)。若上述三項 Predicate (判定條件) 皆為 `true`，則將此狀態寫入世界 |
| `block_entity_modifier` | `object` |  | — | Block Entity Modifier (方塊實體修飾符)。用於動態修改產生後方塊（如寶箱、告示牌）之內部 NBT 資料 |

### 枚舉值速查

#### `processor_type` 可填值

| 值 | 分類 | 說明 |
| --- | --- | --- |
| `minecraft:rule` | 核心轉換 | 依據 `rules` 陣列內之 Predicate (判定條件) 置換方塊 |
| `minecraft:block_ignore` | 系統過濾 | 忽略 `blocks` 陣列中所指定的 Block State (方塊狀態)，不將其寫入世界（如：保留原有地形而不被空氣覆蓋） |
| `minecraft:block_rot` | 系統過濾 | 模擬廢墟化。依據特定的 Probability (機率) 隨機將結構方塊轉化為空氣 |
| `minecraft:gravity` | 高度對齊 | 強制將結構內特定方塊的高度（Y 軸）向下拉扯，直到碰撞 Terrain Heightmap (地形高度圖) |
| `minecraft:protected_blocks` | 系統過濾 | 防止結構覆蓋指定的 Tag (標籤) 方塊群（例如防止村莊生成時切斷要塞傳送門） |
| `minecraft:capped` | 流程控制 | 限制內部處理器之 Maximum Operations (最大執行次數)，超過次數則終止該層級處理 |

#### Rule Test (`predicate_type`) 可填值

可用於 `input_predicate` 與 `location_predicate`：

| 值 | 說明 |
| --- | --- |
| `minecraft:always_true` | 無條件通過判定（機率 100%） |
| `minecraft:block_match` | 精確匹配單一 Block ID (方塊識別碼) |
| `minecraft:blockstate_match` | 精確匹配 Block ID 與其內部 Properties (屬性，如朝向、含水狀態) |
| `minecraft:tag_match` | 匹配 Block Tag (方塊標籤，如 `#minecraft:logs`) |
| `minecraft:random_block_match` | 給予單一方塊特定的 Probability (通過機率，`0.0` ~ `1.0`) |
| `minecraft:random_blockstate_match` | 給予特定方塊狀態特定的 Probability (通過機率) |

### 條件依賴 (Conditional Fields)

| 條件 | 生效欄位 | 失效 / 忽略欄位 |
| --- | --- | --- |
| `processor_type` = `"minecraft:rule"` 時 | 必須包含 `rules` 欄位 | 忽略 `blocks` 等其他陣列引數 |
| `processor_type` = `"minecraft:block_ignore"` 時 | 必須包含 `blocks` 陣列欄位 | 忽略 `rules` 引數 |
| `processor_type` = `"minecraft:capped"` 時 | 必須包含 `delegate` (代理處理器物件) 與 `limit` (整數上限) | — |