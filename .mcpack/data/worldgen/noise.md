## 雜訊通道 (`noise/`)

> 註冊世界生成所使用之基礎 3D 雜訊配置引數，定義雜訊之頻率尺度與多重倍頻疊加邏輯。

**路徑：** `data/<namespace>/worldgen/noise/<名稱>.json`

### JSON 結構

此元素對應單一結構定義，用於配置 Normal Noise（常態柏林雜訊）之 Octave（倍頻）參數：

```json
{
    "firstOctave": -7,
    "amplitudes": [
        1.0,
        1.0,
        1.0,
        0.0,
        0.0,
        0.0,
        0.0,
        0.0,
        0.0
    ]
}

```

### 欄位說明

#### 根層欄位

| 欄位 | 類型 | 必填 | 預設 | 說明 |
| --- | --- | --- | --- | --- |
| `firstOctave` | `int` | ✓ | — | 第一個 Octave（倍頻）的整數索引值。決定雜訊之基底 Wavelength（波長）尺度。數值越小（如 `-9`），波長越長，地形起伏越宏觀；接近 `0` 則波長極短，呈現微觀細碎雜訊 |
| `amplitudes` | `array[double]` | ✓ | — | 連續倍頻之 Amplitude（振幅）權重陣列。陣列索引 `[0]` 對應 `firstOctave`，索引 `[1]` 對應 `firstOctave + 1`，以此類推。支援浮點數 |

### 注意事項 (Notes)

* 若陣列內部特定倍頻不需權重，必須顯式填入 `0.0`，不可跳過索引或中斷陣列長度。
* 若 `amplitudes` 陣列長度過長且權重過高，將導致該 Density Function（密度函數）取樣時產生極大之效能開銷（Performance Overhead），建議維持在 4 至 8 個倍頻。