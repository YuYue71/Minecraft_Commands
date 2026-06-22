## 密度函數 (`density_function/`)

> 提供底層數學算式以精確控制地形之形變、侵蝕度、大陸性（Continentalness）以及各類地形網格強度。

**路徑：** `data/<namespace>/worldgen/density_function/<名稱>.json`

### JSON 結構

Density Function (密度函數) 支援高度 Recursive (遞迴巢狀) 之結構，任何需填入 Density Function 之欄位（如 `argument`）皆可傳入以下三種型態之一：

1. **純量數字**（如 `0.5`）
2. **字串參照**（引用其他已註冊之函數，如 `"minecraft:erosion"`）
3. **物件結構**（行內宣告之新密度函數，如下方範例）

#### type = `"minecraft:noise"` 時 (基礎雜訊取樣)

```json
{
    "type": "minecraft:noise",
    "noise": "minecraft:temperature",
    "xz_scale": 1.0,
    "y_scale": 1.0
}

```

#### type = `"minecraft:add"` / `"minecraft:mul"` 等時 (數學運算)

```json
{
    "type": "minecraft:add",
    "argument1": "minecraft:continents",
    "argument2": {
        "type": "minecraft:noise",
        "noise": "minecraft:erosion",
        "xz_scale": 2.0,
        "y_scale": 1.0
    }
}

```

#### type = `"minecraft:spline"` 時 (樣條曲線映射)

```json
{
    "type": "minecraft:spline",
    "spline": {
        "coordinate": "minecraft:continents",
        "points": [
            {
                "location": -1.0,
                "value": -0.5,
                "derivative": 0.0
            },
            {
                "location": 1.0,
                "value": 1.5,
                "derivative": 0.0
            }
        ]
    }
}

```

### 欄位說明

#### 根層欄位

| 欄位 | 類型 | 必填 | 預設 | 說明 |
| --- | --- | --- | --- | --- |
| `type` | `string` | ✓ | — | 目標 Density Function (密度函數) 類型之 Registry ID (註冊識別碼) |

#### 子欄位 (`type` = `"minecraft:noise"` 時)

| 欄位 | 類型 | 必填 | 預設 | 說明 |
| --- | --- | --- | --- | --- |
| `noise` | `string` | ✓ | — | 目標 Noise (雜訊) 參數之識別碼，對應 `worldgen/noise/` 內之資源 |
| `xz_scale` | `double` | ✓ | — | Horizontal Scale (水平縮放乘數)，影響 X 與 Z 軸之雜訊採樣頻率 |
| `y_scale` | `double` | ✓ | — | Vertical Scale (垂直縮放乘數)，影響 Y 軸之雜訊採樣頻率 |

#### 子欄位 (`type` 為二元數學運算子時)

| 欄位 | 類型 | 必填 | 預設 | 說明 |
| --- | --- | --- | --- | --- |
| `argument1` | `number`/`string`/`object` | ✓ | — | 第一引數（可為常數、識別碼字串或行內物件） |
| `argument2` | `number`/`string`/`object` | ✓ | — | 第二引數（可為常數、識別碼字串或行內物件） |

#### 子欄位 (`type` = `"minecraft:spline"` 時)

| 欄位 | 類型 | 必填 | 預設 | 說明 |
| --- | --- | --- | --- | --- |
| `spline` | `object` | ✓ | — | Cubic Spline (三次樣條) 結構，包含座標軸與控制點陣列 |

##### 複合結構：`spline`

| 欄位 | 類型 | 必填 | 預設 | 說明 |
| --- | --- | --- | --- | --- |
| `coordinate` | `string`/`object` | ✓ | — | 作為 X 軸輸入變數之 Density Function (密度函數) 參照或物件 |
| `points` | `array[]` | ✓ | — | Control Points (控制點) 陣列，定義曲線形狀，內部欄位見下方 |

##### 複合結構：`points` 陣列元素

| 欄位 | 類型 | 必填 | 預設 | 說明 |
| --- | --- | --- | --- | --- |
| `location` | `double` | ✓ | — | 輸入值（X 座標），所有控制點必須依此數值**由小到大**嚴格遞增排序 |
| `value` | `double` | ✓ | — | 映射後之輸出值（Y 座標），可傳入數值或另一個 Cubic Spline |
| `derivative` | `double` | ✓ | — | Derivative (導數/斜率)，控制曲線經過此點時之切線傾斜度 |

### 枚舉值速查

#### `type` 可填值 (核心邏輯類)

| 值 | 分類 | 說明 |
| --- | --- | --- |
| `minecraft:noise` | 採樣 | 從指定的 Perlin Noise (柏林雜訊) 提取三維空間數值 |
| `minecraft:shifted_noise` | 採樣 | 提取雜訊，並依據特定偏移量對 XYZ 座標進行 Shift (平移) |
| `minecraft:y_clamped_gradient` | 採樣 | 產生依 Y 軸高度變化之 Gradient (線性梯度) 數值 |
| `minecraft:add` | 數學 | 將 `argument1` 與 `argument2` 相加 |
| `minecraft:mul` | 數學 | 將 `argument1` 與 `argument2` 相乘 |
| `minecraft:min` | 數學 | 取 `argument1` 與 `argument2` 兩者中之最小值 |
| `minecraft:max` | 數學 | 取 `argument1` 與 `argument2` 兩者中之最大值 |
| `minecraft:abs` | 數學 | 取得單一 `argument` 之 Absolute Value (絕對值) |
| `minecraft:clamp` | 數學 | 將單一 `argument` 數值限制於 `min` 與 `max` 之間 |
| `minecraft:square` | 數學 | 將 `argument` 進行平方運算 |
| `minecraft:cube` | 數學 | 將 `argument` 進行立方運算 |
| `minecraft:spline` | 路由 | 利用 Cubic Spline (三次樣條) 將輸入值非線性映射至新輸出值 |
| `minecraft:range_choice` | 路由 | 若 `input` 落在指定區間，則回傳 `when_in_range`，否則回傳 `when_out_of_range` |
| `minecraft:cache_2d` | 最佳化 | 於 2D 網格面上 Cache (快取) 函數結果，避免同一直行（Column）重複運算 |
| `minecraft:cache_once` | 最佳化 | 對單一方塊座標僅運算一次並快取，適用於被多次呼叫之高耗能函數 |
| `minecraft:interpolated` | 最佳化 | 每 8x8x8 網格僅計算角點，內部方塊使用 Trilinear Interpolation (三線性插值) |

### 條件依賴 (Conditional Fields)

| 條件 | 生效欄位 | 失效 / 忽略欄位 |
| --- | --- | --- |
| `type` 為一元運算（如 `minecraft:abs`、`minecraft:square`）時 | 必須包含單一 `argument` 欄位 | `argument1`、`argument2` 等雙引數欄位被忽略 |
| `type` = `"minecraft:range_choice"` 時 | 必須包含 `input`、`min_inclusive`、`max_exclusive` 等邏輯判定欄位 | — |
| `points` 陣列內 `value` 傳入非數字之 Spline 物件時 | 自動啟用 2D Spline (二維樣條) 表面映射 | — |
