# worldgen/template_pool (模板池)

> **分類:** `世界生成` | **檔案格式:** `json` | **適用版本:** `JE ≤ 1.20.4` | **熱重載:** `/reload`

---

## 目錄

* [1. 目錄路徑 (Directory & Path)](#1-目錄路徑-directory--path)
* [2. 核心結構範本 (Core Structure Skeleton)](#2-核心結構範本-core-structure-skeleton)
* [3. 根節點屬性表 (Root Properties)](#3-根節點屬性表-root-properties)
* [4. 子對象詳解 (Sub-object Details)](#4-子對象詳解-sub-object-details)
    * [4.1 elements 陣列項目](#41-elements-陣列項目)
    * [4.2 element 屬性細節](#42-element-屬性細節)
* [5. 參數枚舉與可用值全清單 (Value Enumerations)](#5-參數枚舉與可用值全清單-value-enumerations)
    * [5.1 元素類型 (Element Types)](#51-元素類型-element-types)
    * [5.2 投影方式 (Projection Types)](#52-投影方式-projection-types)
* [6. 數據約束與邊界條件 (Data Constraints)](#6-數據約束與邊界條件-data-constraints)
* [7. 外部連結 (References)](#7-外部連結-references)

---

## 1. 目錄路徑 (Directory & Path)

> 定義拼圖式結構 (Jigsaw Structure) 的零件清單, 決定結構如何拼接與延伸.

```file
data/<namespace>/worldgen/template_pool/[子資料夾]/<檔案名稱>.json
```

* `<namespace>`: 命名空間 (如 `minecraft`, `example`).
* `<registry>`: `worldgen/template_pool`.
* 調用標識符: `<namespace>:[子資料夾]/<檔案名稱>`.

---

## 2. 核心結構範本 (Core Structure Skeleton)

> 定義一個包含多個 NBT 零件及其權重的模板池.

```json
{
  "name": "example:village/houses",
  "fallback": "minecraft:empty",
  "elements": [
    {
      "weight": 1,
      "element": {
        "element_type": "minecraft:single_pool_element",
        "location": "example:village/small_house_1",
        "projection": "rigid",
        "processors": "minecraft:empty"
      }
    },
    {
      "weight": 2,
      "element": {
        "element_type": "minecraft:single_pool_element",
        "location": "example:village/small_house_2",
        "projection": "terrain_matching",
        "processors": "example:mossy_cobble_replacer"
      }
    }
  ]
}
```

---

## 3. 根節點屬性表 (Root Properties)

> 檔案第一層級的鍵值定義.

| 鍵值 (Key) | 類型 | 必填 | 簡述 | 說明、預設值與可用值索引 |
| --- | --- | --- | --- | --- |
| `"name"` | `string` | 是 | 池 ID | 該模板池的資源標識符 (通常與檔案路徑一致). |
| `"fallback"` | `string` | 是 | 回退模板 | 當剩餘空間不足以放置任何零件時, 放置的保底模板 ID (通常為 `minecraft:empty`). |
| `"elements"` | `array` | 是 | 零件清單 | 此池中包含的所有建築零件及其出現機率. 連結至 [4.1](#41-elements-陣列項目). |

---

## 4. 子對象詳解 (Sub-object Details)

### 4.1 elements 陣列項目

> 定義池中的單個候選零件.

| 子鍵值 (Sub-key) | 類型 | 必填 | 簡述 | 說明 |
| --- | --- | --- | --- | --- |
| `"weight"` | `int` | 是 | 隨機權重 | 該零件在池中被選中的機率權重. |
| `"element"` | `object` | 是 | 元素配置 | 具體描述該零件的內容與渲染規則. 連結至 [4.2](#42-element-屬性細節). |

### 4.2 element 屬性細節

> 定義零件的實際數據來源與處理邏輯.

| 子鍵值 (Sub-key) | 類型 | 必填 | 簡述 | 說明 |
| --- | --- | --- | --- | --- |
| `"element_type"` | `enum` | 是 | 元素類別 | 決定如何讀取數據. 可用值詳見 [5.1](#51-元素類型-element-types). |
| `"location"` | `string` | 否 | NBT 路徑 | **僅限 single_pool_element**: 引用 `structures` 目錄下的 `.nbt` 檔案路徑. |
| `"projection"` | `enum` | 是 | 投影模式 | 決定零件是否隨地形起伏而形變. 可用值詳見 [5.2](#52-投影方式-projection-types). |
| `"processors"` | `string` | 是 | 處理器列表 | 引用 `worldgen/processor_list` 定義方塊替換規則. |
| `"features"` | `string` | 否 | 特徵引用 | **僅限 feature_pool_element**: 引用 `worldgen/placed_feature` ID. |
| `"elements"` | `array` | 否 | 嵌套列表 | **僅限 list_pool_element**: 同時放置多個子元素. |

---

## 5. 參數枚舉與可用值全清單 (Value Enumerations)

### 5.1 元素類型 (Element Types)

| 參數值 (Value) | 簡述 | 完整遊戲行為說明 |
| --- | --- | --- |
| `minecraft:single_pool_element` | 單一 NBT | 載入單個 `.nbt` 結構檔案 (最常用). |
| `minecraft:feature_pool_element` | 放置特徵 | 將一個 `placed_feature` (如一棵樹) 作為拼圖零件放置. |
| `minecraft:list_pool_element` | 組合清單 | 將一組元素視為單一組件同時放置. |
| `minecraft:empty_pool_element` | 空元素 | 佔位符, 執行後不產生任何方塊. |

### 5.2 投影方式 (Projection Types)

| 參數值 (Value) | 簡述 | 完整遊戲行為說明 |
| --- | --- | --- |
| `rigid` | 硬性固定 | 零件保持原始 NBT 的形狀, 不隨地面起伏改變 (適用於地底、室內). |
| `terrain_matching` | 地形匹配 | 零件的方塊會隨地形高度動態調整, 確保緊貼地面 (適用於村莊道路). |

---

## 6. 數據約束與邊界條件 (Data Constraints)

*   **權重總和**: 建議 `weight` 總和不要過大以維持效能. 權重為 `0` 的項目將永不生成.
*   **回退邏輯**: 若 `fallback` 設為非空 ID, 則會導致結構在受限空間內無限嘗試生成, 可能造成死循環或效能崩潰.
*   **NBT 連接口**: 使用 `single_pool_element` 時, NBT 檔案內必須包含 `jigsaw` 方塊, 否則零件無法與其他零件對接.
*   **處理器關聯**: 若無特殊需求, `processors` 應填入 `"minecraft:empty"`.

---

## 7. 外部連結 (References)

* [Misode Template Pool Generator](https://misode.github.io/worldgen/template-pool/)
* [Minecraft Wiki - Template Pool](https://zh.minecraft.wiki/w/%E6%A0%BC%E5%BC%8F%E6%B1%A0)
* [結構配置速查表 (Structure)](https://github.com/YuYue71/Minecraft_Commands/blob/main/pack_template/data/example/worldgen/structure/structure.md)
* [處理器列表速查表 (Processor List)](https://github.com/YuYue71/Minecraft_Commands/blob/main/pack_template/data/example/worldgen/processor_list/processor_list.md)
* [資源位置與命名空間規範 (Resource Locations)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/ResourceLocations.md)