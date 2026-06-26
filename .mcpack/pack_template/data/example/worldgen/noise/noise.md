# worldgen/noise (噪音參數)

> **分類:** `世界生成` | **檔案格式:** `json` | **適用版本:** `JE ≤ 1.20.4` | **熱重載:** `/reload`

---

## 目錄

* [1. 目錄路徑 (Directory & Path)](#1-目錄路徑-directory--path)
* [2. 核心結構範本 (Core Structure Skeleton)](#2-核心結構範本-core-structure-skeleton)
* [3. 根節點屬性表 (Root Properties)](#3-根節點屬性表-root-properties)
* [4. 數據約束與邊界條件 (Data Constraints)](#4-數據約束與邊界條件-data-constraints)
* [5. 外部連結 (References)](#5-外部連結-references)

---

## 1. 目錄路徑 (Directory & Path)

> 定義地形生成中所使用的基礎噪音波形 (八度音階與振幅).

```file
data/<namespace>/worldgen/noise/[子資料夾]/<檔案名稱>.json
```

* `<namespace>`: 命名空間 (如 `minecraft`, `example`).
* `<registry>`: `worldgen/noise`.
* 調用標識符: `<namespace>:[子資料夾/]<檔案名稱>`.

---

## 2. 核心結構範本 (Core Structure Skeleton)

> 噪音參數檔案結構極為扁平, 由起始頻率與振幅陣列組成.

```json
{
  "firstOctave": -7,
  "amplitudes": [
    1.0,
    1.0,
    1.0,
    1.0,
    1.0,
    0.0,
    0.0,
    0.0
  ]
}
```

---

## 3. 根節點屬性表 (Root Properties)

> 檔案第一層級的鍵值定義.

| 鍵值 (Key) | 類型 | 必填 | 簡述 | 說明、預設值與 Misode 對應項 |
| --- | --- | --- | --- | --- |
| `"firstOctave"` | `int` | 是 | 起始八度 | 噪音生成的起始頻率指數 (通常為負整數). 數值越小頻率越低. |
| `"amplitudes"` | `array (double)` | 是 | 振幅清單 | 每個元素的數值代表該八度音階的權重 (振幅). |

---

## 4. 數據約束與邊界條件 (Data Constraints)

* **頻率邏輯 (firstOctave)**: 
    * 設起始八度為 $n$, 則第 $i$ 個振幅對應的頻率為 $2^{n+i}$. 
    * 較小的 `firstOctave` 數值會產生較大規模的地形起伏 (低頻); 較大的數值則產生細碎的變化 (高頻).
* **振幅陣列 (amplitudes)**:
    * 陣列中的第一個元素對應 `firstOctave` 指定的層級, 後續元素依序對應更高的八度.
    * 振幅通常設定在 `0.0` 到 `1.0` 之間. 若某層級設為 `0.0`, 則該頻率的噪音不會對最終結果產生貢獻.
* **效能影響**: `amplitudes` 陣列的長度越長, 計算該噪音所需的 CPU 開銷越高.
* **重複性**: 噪音是根據世界種子與此配置檔案共同生成的偽隨機函數, 相同種子下結果恆定.

---

## 5. 外部連結 (References)

* [Misode Noise Generator](https://misode.github.io/worldgen/noise/)
* [Minecraft Wiki - Noise](https://zh.minecraft.wiki/w/%E5%99%AA%E9%9F%B3)
* [噪音設定速查表 (Noise Settings)](https://github.com/YuYue71/Minecraft_Commands/blob/main/pack_template/data/example/worldgen/noise_settings/noise_settings.md)
* [資源位置與命名空間規範 (Resource Locations)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/ResourceLocations.md)