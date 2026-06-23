# /place

> **分類:** `指令` | **權限等級:** `2` | **適用版本:** `JE ≤ 1.20.4` | **命令方塊:** `true`

---

## 目錄

* [語法](#語法-syntax)
* [參數說明](#參數說明-parameters)
    * [元素類型 (Element Types)](#元素類型-element-types)
    * [旋轉模式 (Rotation)](#旋轉模式-rotation)
    * [鏡像模式 (Mirror)](#鏡像模式-mirror)
    * [完整度與種子碼 (Integrity & Seed)](#完整度與種子碼-integrity--seed)
* [資料包結構參考 (Datapack Structure)](#資料包結構參考-datapack-structure)
* [外部連結](#外部連結-references)

---

## 語法 (Syntax)

```commands
/place feature <feature> [pos]
/place jigsaw <pool> <target> <max_depth> <pos>
/place structure <structure> [pos]
/place template <template> [pos] [rotation] [mirror] [integrity] [seed]

```

* `<>` = 必填, `[]` = 選填

| 參數 / 欄位 | 類型 | 預設 | 說明 |
| --- | --- | --- | --- |
| `feature` / `jigsaw` / `structure` / `template` | `enum` | - | 決定要放置的地圖元素類型 |
| `<feature>` | `string` | - | 欲放置的已配置地物 (Configured Feature) ID |
| `<pool>` | `string` | - | 欲放置的拼圖池 (Template Pool) ID |
| `<target>` | `string` | - | 拼圖塊對接的目標名稱 (Target Name) |
| `<max_depth>` | `int` | - | 拼圖生成的最大延伸深度 (1..7) |
| `<structure>` | `string` | - | 欲放置的世界結構 (Structure) ID |
| `<template>` | `string` | - | 欲放置的自訂結構檔 (Structure Template / NBT) ID |
| `[pos]` | `vec3` | 執行者當前位置 | 欲放置的目標基準座標 |
| `[rotation]` | `enum` | `none` | 結構檔放置時的水平旋轉角度 |
| `[mirror]` | `enum` | `none` | 結構檔放置時的鏡像翻轉模式 |
| `[integrity]` | `float` | `1.0` | 結構檔放置時的方塊保留比例 (0.0..1.0) |
| `[seed]` | `int` | `0` | 決定受損結構或隨機生成的隨機種子碼 |

---

## 參數說明 (Parameters)

### `元素類型 (Element Types)`

> 決定系統要在目標座標生成何種類型的世界生成物. 其中絕大部分選項皆**需透過資料包定義**或直接調用原版內建資源.

| 值 | 說明 |
| --- | --- |
| `feature` | 放置一個「地物」 (如單棵樹, 礦脈, 湖泊, 尖刺). 地物通常是構成生態域的基本組件. |
| `jigsaw` | 根據「拼圖池」動態生成由多個組件隨機拼接而成的大型結構 (如村莊, 掠奪者前哨站). 此模式允許設定拼圖的最大延伸次數 `<max_depth>`. |
| `structure` | 放置一個完整的「世界結構」 (如林地府邸, 沙漠神殿). 此模式會包含對應的生成生物 (如要塞內的生怪磚) 與自訂戰利品箱. |
| `template` | 直接放置一個實體的 `.nbt` 結構檔案 (通常由結構方塊 Structure Block 匯出). 允許進階設定旋轉與鏡像. |

---

### `旋轉模式 (Rotation)`

> 僅適用於 `template` 模式, 決定結構檔案在放置時的水平旋轉角度.

| 值 | 說明 |
| --- | --- |
| `none` | (預設值) 不進行任何旋轉. |
| `clockwise_90` | 順時針旋轉 90 度. |
| `180` | 旋轉 180 度. |
| `counterclockwise_90` | 逆時針旋轉 90 度. |

---

### `鏡像模式 (Mirror)`

> 僅適用於 `template` 模式, 決定結構檔案在放置時的對稱翻轉方式.

| 值 | 說明 |
| --- | --- |
| `none` | (預設值) 不進行任何鏡像翻轉. |
| `front_back` | 前後鏡像翻轉 (沿著 X 軸對稱). |
| `left_right` | 左右鏡像翻轉 (沿著 Z 軸對稱). |

---

### `完整度與種子碼 (Integrity & Seed)`

> 僅適用於 `template` 模式, 用於創造結構的隨機破損感或廢墟外觀.

* `integrity`: 決定放置時方塊的保留機率. 輸入 `1.0` 表示 100% 完整生成, 輸入 `0.5` 表示每個方塊只有 50% 的機率會被放置, 其餘方塊會維持當前世界的原貌.
* `seed`: 當 `integrity` 小於 `1.0` 時, 此整數種子碼會決定哪些方塊被保留, 哪些被剔除. 輸入相同的種子碼將產生完全相同的破損形狀.

---

## 資料包結構參考 (Datapack Structure)

`/place` 指令高度依賴資料包內的 `worldgen` (世界生成) 與 `structures` (結構實體) 目錄. 若要呼叫自訂元素, 請將檔案放置於以下標準目錄路徑:

* **Feature (地物):**
路徑: `data/<namespace>/worldgen/configured_feature/<path>.json`
呼叫: `/place feature <namespace>:<path>`
* **Jigsaw Pool (拼圖池):**
路徑: `data/<namespace>/worldgen/template_pool/<path>.json`
呼叫: `/place jigsaw <namespace>:<path>`
* **Structure (世界結構):**
路徑: `data/<namespace>/worldgen/structure/<path>.json`
呼叫: `/place structure <namespace>:<path>`
* **Template (實體結構檔):**
路徑: `data/<namespace>/structures/<path>.nbt`
呼叫: `/place template <namespace>:<path>` (注意: 系統會自動讀取 `.nbt` 副檔名, 指令中不需輸入副檔名)

---

## 外部連結 (References)

* [Minecraft Wiki - /place](https://zh.minecraft.wiki/w/%E5%91%BD%E4%BB%A4/place)
* [座標系統 (Coordinate Systems)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/coordinates.md)
* [資源位置與命名空間規範 (Resource Locations)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/ResourceLocations.md)
* [世界結構 ID (Structure IDs)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/Structure_IDs.md)