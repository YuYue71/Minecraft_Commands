# 世界生成核心 (`worldgen/`)

> **分類:** `資料包` ｜ **適用版本:** `JE ≤ 1.20.4`
> **路徑:** `data/<namespace>/worldgen/<子分類>/<名稱>.json` ｜ **引用格式:** `namespace:<名稱>`

---

## 目錄

* [概覽](#概覽-overview)
* [目錄結構](#目錄結構)
* [子分類索引](#子分類索引)
    * [生物群系 (biome)](#生物群系-biome)
    * [配置特徵 (configured_feature)](#配置特徵-configured_feature)
    * [放置特徵 (placed_feature)](#放置特徵-placed_feature)
    * [雜訊設定 (noise_settings)](#雜訊設定-noise_settings)
    * [密度函數 (density_function)](#密度函數-density_function)
    * [雜訊通道 (noise)](#雜訊通道-noise)
    * [處理器組 (processor_list)](#處理器組-processor_list)
    * [結構 (structure)](#結構-structure)
    * [結構集 (structure_set)](#結構集-structure_set)
    * [模板池 (template_pool)](#模板池-template_pool)
    * [生物群系來源 (biome_source)](#生物群系來源-biome_source)
    * [多噪點參數列表 (multi_noise_biome_source_parameter_list)](#多噪點參數列表-multi_noise_biome_source_parameter_list)
* [跨子分類引用規則](#跨子分類引用規則)
* [注意事項](#注意事項-notes)
* [外部連結](#外部連結-references)

---

## 概覽 (Overview)

`worldgen/`（世界生成）為 Java Edition（Java 版）自訂世界生成機制之核心 Data Structure（資料結構）容器，管轄從 Macro-scale Biome 分佈（巨觀生物群系分佈）、Terrain Shape 塑形（地形形狀塑形）至 Micro-scale Local Feature 擺放（微觀區域特徵擺放）與 Structure Generation Pipeline（結構生成管線）之全方位維度演算法行為。

---

## 目錄結構

```
worldgen/
├── biome/
├── configured_feature/
├── placed_feature/
├── noise_settings/
├── density_function/
├── noise/
├── processor_list/
├── structure/
├── structure_set/
├── template_pool/
├── biome_source/
└── multi_noise_biome_source_parameter_list/

```

---

## 子分類索引

| 子分類資料夾 | 功能說明 |
| --- | --- |
| [`biome/`](#生物群系-biome) | 定義生態系之氣候參數、地表方塊覆蓋層、背景音效與生物生成機率 |
| [`configured_feature/`](#配置特徵-configured_feature) | 定義特徵之基本幾何型態、組成方塊與生成屬性（如單棵樹木、礦脈大小） |
| [`placed_feature/`](#放置特徵-placed_feature) | 定義特徵於空間中之 Placement Modifiers（放置修飾符），含橫向密度與縱向高度分佈限制 |
| [`noise_settings/`](#雜訊設定-noise_settings) | 定義地形生成之雜訊取樣參數、高度邊界、世界表面形狀與預設流體 |
| [`density_function/`](#密度函數-density_function) | 定義 3D 空間中之數學運算子，用以精密調控地形之浮凸、陸塊邊緣與洞穴生成 |
| [`noise/`](#雜訊通道-noise) | 定義原始雜訊參數（如 Perlin Noise 頻率與振幅），供世界生成演算進行映射 |
| [`processor_list/`](#處理器組-processor_list) | 定義 Structure Block（結構方塊）或 NBT 加載時之 Block Rotation（方塊旋轉）與方塊替換規則 |
| [`structure/`](#結構-structure) | 定義複合構造之生成核心，指定結構類型、生物適應性與組裝拼接起點 |
| [`structure_set/`](#結構集-structure_set) | 定義結構於世界網格（Grid）中之 Spacing（間距）與 Separation（分離度）分佈演算法 |
| [`template_pool/`](#模板池-template_pool) | 定義 Jigsaw Block（拼圖方塊）之拼接池，包含結構元件清單與權重比例 |
| [`biome_source/`](#生物群系來源-biome_source) | 自訂維度專用之生物群系生成器演算法配置（選填） |
| [`multi_noise_biome_source_parameter_list/`](#多噪點參數列表-multi_noise_biome_source_parameter_list) | 預設或自訂之多噪點生物群系映射控制點參數集合 |

---

## 生物群系 (`biome/`)

> 定義生物群系之環境參數與地表材質覆蓋層。

**路徑：** `data/<namespace>/worldgen/biome/<名稱>.json`
[詳細內容](worldgen/biome.md)

---

## 配置特徵 (`configured_feature/`)

> 定義個別特徵（如植物、地下礦物、地表裝飾）之核心方塊組成與基礎幾何。

**路徑：** `data/<namespace>/worldgen/configured_feature/<名稱>.json`
[詳細內容](worldgen/configured_feature.md)

---

## 放置特徵 (`placed_feature/`)

> 調控配置特徵於區塊（Chunk）內之水平分佈頻率、縱向垂直高度以及環境判定。

**路徑：** `data/<namespace>/worldgen/placed_feature/<名稱>.json`
[詳細內容](worldgen/placed_feature.md)

---

## 雜訊設定 (`noise_settings/`)

> 決定整個維度之地形高度範圍、巨觀浮凸型態以及雜訊基礎底層結構。

**路徑：** `data/<namespace>/worldgen/noise_settings/<名稱>.json`
[詳細內容](worldgen/noise_settings.md)

---

## 密度函數 (`density_function/`)

> 提供底層數學算式以精確控制地形之形變、侵蝕度、大陸性（Continentalness）以及各類地形網格強度。

**路徑：** `data/<namespace>/worldgen/density_function/<名稱>.json`
[詳細內容](worldgen/density_function.md)

---

## 雜訊通道 (`noise/`)

> 註冊世界生成所使用之基礎 3D 雜訊配置引數。

**路徑：** `data/<namespace>/worldgen/noise/<名稱>.json`
[詳細內容](worldgen/noise.md)

---

## 處理器組 (`processor_list/`)

> 控制方塊 NBT 結構結構實體化時之動態置換機制（如隨機將完整磚牆替換為裂磚）。

**路徑：** `data/<namespace>/worldgen/processor_list/<名稱>.json`
[詳細內容](worldgen/processor_list.md)

---

## 結構 (`structure/`)

> 定義大型建構物（如地牢、村莊、要塞）之生成邏輯與類型參數。

**路徑：** `data/<namespace>/worldgen/structure/<名稱>.json`
[詳細內容](worldgen/structure.md)

---

## 結構集 (`structure_set/`)

> 管理結構於巨觀世界地圖中之區塊網格隨機散佈演算法。

**路徑：** `data/<namespace>/worldgen/structure_set/<名稱>.json`
[詳細內容](worldgen/structure_set.md)

---

## 模板池 (`template_pool/`)

> 提供 Jigsaw System（拼圖系統）動態生成複雜非線性構造時之骨架單元與權重清單。

**路徑：** `data/<namespace>/worldgen/template_pool/<名稱>.json`
[詳細內容](worldgen/template_pool.md)

---

## 生物群系來源 (`biome_source/`)

> 選填組態。顯式指定特殊維度之生物群系生成演算法路由。

**路徑：** `data/<namespace>/worldgen/biome_source/<名稱>.json`
[詳細內容](worldgen/biome_source.md)

---

## 多噪點參數列表 (`multi_noise_biome_source_parameter_list/`)

> 管理大範圍生物群系多噪點模型控制點（溫度、濕度、大陸性、侵蝕度等）之資料對應表。

**路徑：** `data/<namespace>/worldgen/multi_noise_biome_source_parameter_list/<名稱>.json`
[詳細內容](worldgen/multi_noise_biome_source_parameter_list.md)

---

## 跨子分類引用規則

| 引用來源 | 引用目標 | 引用格式 |
| --- | --- | --- |
| `placed_feature` 根節點 | `configured_feature` 的資源名稱 | `namespace:名稱` |
| `biome` 之 `features` 列表 | `placed_feature` 的資源名稱 | `namespace:名稱` |
| `structure` 之 `start_pool` | `template_pool` 的資源名稱 | `namespace:名稱` |
| `structure_set` 之 `structures` | `structure` 的資源名稱 | `namespace:名稱` |
| `template_pool` 之 `processors` | `processor_list` 的資源名稱 | `namespace:名稱` |

---

## 注意事項 (Notes)

* 所有子分類中之 JSON 命名空間（Namespace）路徑與對象檔名僅接受小寫字母、底線、數字及小數點。
* 特徵生成管線具備嚴格的 Dependency Sequence（相依順序）：`configured_feature` 必須優先於 `placed_feature` 完成建構，否則將於執行階段觸發 Null Pointer Exception（空指標異常）。
* 修改原版維度世界生成時，若於 `noise_settings/` 內引用錯誤之 `density_function` ID（識別碼），會導致遊戲於伺服器啟動或載入單人世界時直接崩潰（Crash）。

---

## 外部連結 (References)

* [Minecraft Wiki - 自訂世界生成](https://minecraft.fandom.com/zh/wiki/%E8%87%AA%E5%AE%9A%E4%B9%89%E4%B8%96%E7%95%8C%E7%94%9F%E6%88%90?variant=zh-tw)

---

*最後更新：2026-06-22*