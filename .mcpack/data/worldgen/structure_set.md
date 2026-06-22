## 結構集 (`structure_set/`)

> 管理結構於巨觀世界地圖中之 Chunk Grid (區塊網格) 隨機散佈演算法與生成頻率。

**路徑：** `data/<namespace>/worldgen/structure_set/<名稱>.json`

### JSON 結構

結構集 (Structure Set) 定義了結構在巨觀地圖上的分佈拓撲，支援兩種主要的 Placement (放置) 演算法。以下展示最常用之 `random_spread` (隨機散佈) 網格結構：

```json
{
    "structures": [
        {
            "structure": "minecraft:village_plains",
            "weight": 1
        },
        {
            "structure": "minecraft:village_desert",
            "weight": 1
        }
    ],
    "placement": {
        "type": "minecraft:random_spread",
        "spacing": 32,
        "separation": 8,
        "salt": 10387312
    }
}

```

若 `placement` 的 `type` 為 `"minecraft:concentric_rings"` (同心圓，如要塞分佈)，其結構如下：

```json
{
    "placement": {
        "type": "minecraft:concentric_rings",
        "distance": 32,
        "spread": 3,
        "count": 128,
        "preferred_biomes": "#minecraft:is_overworld"
    }
}

```

### 欄位說明

#### 根層欄位

| 欄位 | 類型 | 必填 | 預設 | 說明 |
| --- | --- | --- | --- | --- |
| `structures` | `array[]` | ✓ | — | 指定屬於此集合之 Structure (結構) 陣列，同一網格點生成時將依權重從中抽取其一 |
| `placement` | `object` | ✓ | — | Placement Algorithm (放置演算法) 組態，控制結構於世界中之宏觀座標映射 |

#### 子欄位：`structures` 陣列元素

| 欄位 | 類型 | 必填 | 預設 | 說明 |
| --- | --- | --- | --- | --- |
| `structure` | `string` | ✓ | — | 目標 Structure (結構) 之 Registry ID (註冊識別碼)，對應 `worldgen/structure/` 資源 |
| `weight` | `int` | ✓ | — | 隨機權重。當同一個網格區域決定要生成此集合時，各結構被選中之機率比例 |

#### 子欄位：`placement` (`type` = `"minecraft:random_spread"` 時)

此演算法將世界劃分為 `spacing` x `spacing` 的大型網格，並確保同一網格內僅生成一個集合內的結構。

| 欄位 | 類型 | 必填 | 預設 | 說明 |
| --- | --- | --- | --- | --- |
| `spacing` | `int` | ✓ | — | Grid Spacing (網格間距)，單位為 Chunk (區塊，1 區塊 = 16 方塊)。定義宏觀網格的尺寸 |
| `separation` | `int` | ✓ | — | Minimum Separation (最小分離度)，單位為 Chunk。相鄰結構間的最小強制留白距離 |
| `salt` | `int` | ✓ | — | Seed Modifier (種子修飾常數)。改變特定結構集的隨機分佈起點，避免所有結構生成位置重疊 |
| `spread_type` | `string` |  | `"linear"` | 網格內散佈偏移模式。`"linear"` (均勻線性) 或 `"triangular"` (三角分佈，向網格中心靠攏) |

#### 子欄位：`placement` (`type` = `"minecraft:concentric_rings"` 時)

此演算法強制結構以世界原點 `(0, 0)` 為圓心，呈環狀向外擴散生成（原版專用於 `stronghold` 要塞）。

| 欄位 | 類型 | 必填 | 預設 | 說明 |
| --- | --- | --- | --- | --- |
| `distance` | `int` | ✓ | — | Ring Distance (環距)。原點至第一個環狀帶之半徑距離（單位為 Chunk） |
| `spread` | `int` | ✓ | — | Ring Spread (環距增量)。後續每一個擴張環之額外半徑增量 |
| `count` | `int` | ✓ | — | 該結構於整個維度中的 Maximum Total Count (總生成數量上限，原版要塞為 128) |
| `preferred_biomes` | `string` | ✓ | — | 限定生成之 Biome Tag (生物群系標籤)。系統會在此環狀帶上優先尋找符合此標籤的地形 |

### 枚舉值速查

#### `placement` 陣列內之 `type` 可填值

| 值 | 分類 | 說明 |
| --- | --- | --- |
| `minecraft:random_spread` | 網格散佈 | 泛用結構演算法，將世界切分為方格並隨機擺放，適用於村莊、沉船、神殿等 99% 的結構 |
| `minecraft:concentric_rings` | 環狀分佈 | 圍繞 `X=0, Z=0` 以多重同心圓軌道依序分佈，專門用於確保要塞數量固定且有跡可循 |

### 條件依賴 (Conditional Fields)

| 條件 | 生效欄位 | 失效 / 忽略欄位 |
| --- | --- | --- |
| `placement.type` = `"minecraft:random_spread"` 時 | `spacing`、`separation`、`salt` 轉為強制必填 | 忽略所有環狀（Ring）相關引數 |
| `placement.type` = `"minecraft:concentric_rings"` 時 | `distance`、`spread`、`count` 轉為強制必填 | 忽略 `spacing` 與 `salt` 等網格引數 |
| `separation` 之數值 | 絕對限制：必須嚴格小於 `spacing` | 若 `separation` ≥ `spacing` 將導致資料包解析崩潰 |