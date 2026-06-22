## 模板池 (`template_pool/`)

> 提供 Jigsaw System (拼圖系統) 動態生成複雜非線性構造時之骨架單元與權重清單。

**路徑：** `data/<namespace>/worldgen/template_pool/<名稱>.json`

### JSON 結構

Template Pool (模板池) 定義了結構延伸時可被隨機抽取之 Structure Piece (結構部件) 陣列。

```json
{
    "name": "minecraft:village/plains/houses",
    "fallback": "minecraft:empty",
    "elements": [
        {
            "weight": 1,
            "element": {
                "element_type": "minecraft:single_pool_element",
                "location": "minecraft:village/plains/houses/plains_small_house_1",
                "processors": "minecraft:empty",
                "projection": "rigid"
            }
        },
        {
            "weight": 2,
            "element": {
                "element_type": "minecraft:empty_pool_element"
            }
        }
    ]
}

```

### 欄位說明

#### 根層欄位

| 欄位 | 類型 | 必填 | 預設 | 說明 |
| --- | --- | --- | --- | --- |
| `name` | `string` | ✓ | — | 目標 Template Pool (模板池) 之 Registry ID (註冊識別碼) |
| `fallback` | `string` | ✓ | — | Fallback Pool (備用池) 識別碼。當此池因空間不足或高度限制無法生成任何部件時之替代方案 |
| `elements` | `array[]` | ✓ | — | Pool Elements (池元素) 陣列，定義可供抽取之結構單元清單與權重分佈 |

#### 子欄位：`elements` 陣列元素

| 欄位 | 類型 | 必填 | 預設 | 說明 |
| --- | --- | --- | --- | --- |
| `weight` | `int` | ✓ | — | 隨機抽取此部件之 Random Weight (隨機權重) |
| `element` | `object` | ✓ | — | Structure Element (結構元素) 定義物件，內部鍵值嚴格依據 `element_type` 變動 |

#### 子欄位：`element` (`element_type` = `"minecraft:single_pool_element"` 時)

此為 90% 以上自訂結構所使用之核心單元結構：

| 欄位 | 類型 | 必填 | 預設 | 說明 |
| --- | --- | --- | --- | --- |
| `element_type` | `string` | ✓ | — | Element Type (元素類型) 註冊識別碼，決定此物件之後續解析邏輯 |
| `location` | `string` | ✓ | — | 目標 NBT 結構檔案之識別碼，對應 `data/<namespace>/structures/` 目錄下之資源 |
| `processors` | `string` | ✓ | — | 指向 Processor List (處理器組) 之識別碼，若不需方塊置換則填 `"minecraft:empty"` |
| `projection` | `string` | ✓ | — | Terrain Projection (地形投影) 模式，決定結構如何與底層地貌融合，枚舉值見下方 |

### 枚舉值速查

#### `element_type` 可填值

| 值 | 分類 | 說明 |
| --- | --- | --- |
| `minecraft:single_pool_element` | 基礎單位 | 最常用之單一 NBT 結構部件，支援透過處理器組動態置換方塊 |
| `minecraft:list_pool_element` | 複合單位 | 循序生成內部陣列之所有子結構（無視權重，包裹群體全部生成） |
| `minecraft:feature_pool_element` | 特徵引用 | 於拼圖系統中直接生成一個已註冊之 Placed Feature (放置特徵，如樹木或礦脈) |
| `minecraft:empty_pool_element` | 邏輯控制 | 空白結構。用於提早終止拼圖路徑的延伸，避免無止盡的遞迴擴展 |
| `minecraft:legacy_single_pool_element` | 傳統相容 | 原版舊格式，邊界與流體相交之處理邏輯與現代版不同，建議避免使用 |

#### `projection` 可填值

| 值 | 分類 | 說明 |
| --- | --- | --- |
| `"rigid"` | 剛性幾何 | 結構保持其原始 NBT 內部 Y 軸幾何，無視下方地形起伏（適用於房屋、要塞核心） |
| `"terrain_matching"` | 地形貼合 | 結構 Y 軸高度會被壓縮或拉伸以完美貼合下方之 Terrain Heightmap (地形高度圖，專用於村莊道路) |

### 條件依賴 (Conditional Fields)

| 條件 | 生效欄位 | 失效 / 忽略欄位 |
| --- | --- | --- |
| `element_type` = `"minecraft:empty_pool_element"` 時 | 無額外欄位，直接宣告完畢 | `location`、`processors`、`projection` 皆被忽略 |
| `element_type` = `"minecraft:list_pool_element"` 時 | 必須包含內部的 `elements` 陣列（不帶 weight） | `location` 與 `projection` 失效 |