# dimension_type (維度類型)

> **分類:** `世界生成` | **檔案格式:** `json` | **適用版本:** `JE ≤ 1.20.4` | **熱重載:** `/reload`

---

## 目錄

* [1. 目錄路徑 (Directory & Path)](#1-目錄路徑-directory--path)
* [2. 核心結構範本 (Core Structure Skeleton)](#2-核心結構範本-core-structure-skeleton)
* [3. 根節點屬性表 (Root Properties)](#3-根節點屬性表-root-properties)
* [4. 子對象詳解 (Sub-object Details)](#4-子對象詳解-sub-object-details)
    * [4.1 monster_spawn_light_level 屬性細節](#41-monster_spawn_light_level-屬性細節)
* [5. 參數枚舉與可用值全清單 (Value Enumerations)](#5-參數枚舉與可用值全清單-value-enumerations)
    * [5.1 渲染效果 (Effects)](#51-渲染效果-effects)
* [6. 數據約束與邊界條件 (Data Constraints)](#6-數據約束與邊界條件-data-constraints)
* [7. 外部連結 (References)](#7-外部連結-references)

---

## 1. 目錄路徑 (Directory & Path)

> 定義維度的物理法則、高度限制與光照行為規範.

```file
data/<namespace>/dimension_type/[子資料夾]/<檔案名稱>.json
```

* `<namespace>`: 命名空間 (如 `minecraft`, `example`).
* `<registry>`: `dimension_type`.
* 調用標識符: `<namespace>:[子資料夾]/<檔案名稱>`.

---

## 2. 核心結構範本 (Core Structure Skeleton)

> 包含所有物理特性與機制開關的完整編寫骨架.

```json
{
  "ultrawarm": false,
  "natural": true,
  "coordinate_scale": 1.0,
  "has_skylight": true,
  "has_ceiling": false,
  "ambient_light": 0.0,
  "fixed_time": 6000,
  "monster_spawn_light_level": 0,
  "monster_spawn_block_light_limit": 0,
  "min_y": -64,
  "height": 384,
  "logical_height": 384,
  "infiniburn": "#minecraft:infiniburn_overworld",
  "effects": "minecraft:overworld",
  "bed_works": true,
  "respawn_anchor_works": false,
  "has_raids": true,
  "piglin_safe": false
}
```

---

## 3. 根節點屬性表 (Root Properties)

> 檔案第一層級的鍵值定義與約束.

| 鍵值 (Key) | 類型 | 必填 | 簡述 | 說明、預設值與可用值索引 |
| --- | --- | --- | --- | --- |
| `"ultrawarm"` | `boolean` | 是 | 超熱環境 | 若為 `true`, 水會蒸發, 火蔓延速度加快 (如地獄). |
| `"natural"` | `boolean` | 是 | 自然屬性 | 若為 `true`, 指北針運作正常, 且床與重生錨行為受此標籤聯動. |
| `"coordinate_scale"` | `double` | 是 | 座標比例 | 地獄與主世界的座標換算比例 (地獄為 `8.0`). |
| `"has_skylight"` | `boolean` | 是 | 天空光照 | 決定該維度是否具備來自上方的自然光照. |
| `"has_ceiling"` | `boolean` | 是 | 天頂覆蓋 | 決定維度頂部是否被方塊層覆蓋 (如地獄天頂). |
| `"ambient_light"` | `float` | 是 | 環境基礎亮度 | 範圍 `0.0` - `1.0`. 決定全黑環境下的基礎視覺亮度. |
| `"fixed_time"` | `long` | 否 | 固定時間 | 若設定, 時間將鎖定於此數值且日夜循環停止. |
| `"monster_spawn_light_level"` | `int \| object` | 是 | 生物生成光照 | 定義怪物生成時所需的光照強度限制. 詳見 [4.1](#41-monster_spawn_light_level-屬性細節). |
| `"monster_spawn_block_light_limit"` | `int` | 是 | 方塊光照限制 | 怪物生成時允許的最大方塊光照值 (0-15). |
| `"min_y"` | `int` | 是 | 最低高度 | 維度方塊座標的 Y 軸起點. |
| `"height"` | `int` | 是 | 總高度 | 維度的總可建築高度, 必須為 `16` 的倍數. |
| `"logical_height"` | `int` | 是 | 邏輯高度 | 傳送門、終界影歌果與地圖顯示的最大高度上限. |
| `"infiniburn"` | `string` | 是 | 永不熄滅標籤 | 引用 `tags/blocks` ID, 定義在此維度永不熄滅的方塊. |
| `"effects"` | `string` | 是 | 渲染效果集 | 決定天空與霧氣的視覺渲染模式. 詳見 [5.1](#51-渲染效果-effects). |
| `"bed_works"` | `boolean` | 是 | 床功能 | 若為 `false`, 在此維度睡覺會導致床爆炸. |
| `"respawn_anchor_works"` | `boolean` | 是 | 重生錨功能 | 若為 `false`, 在此維度使用重生錨會爆炸. |
| `"has_raids"` | `boolean` | 是 | 襲擊事件 | 決定該維度是否允許觸發襲擊 (Raid) 事件. |
| `"piglin_safe"` | `boolean` | 是 | 豬布林安全 | 若為 `true`, 豬布林在此維度不會轉化為殭屍豬布林. |

---

## 4. 子對象詳解 (Sub-object Details)

### 4.1 monster_spawn_light_level 屬性細節

> 定義生物生成的動態光照判斷條件 (Int Provider 格式).

| 子鍵值 (Sub-key) | 類型 | 必填 | 簡述 | 說明 |
| --- | --- | --- | --- | --- |
| `"type"` | `string` | 是 | 數值分配器 | 常用 `minecraft:uniform` 或 `minecraft:constant`. |
| `"value"` | `int` | 否 | 固定數值 | 當 type 為 constant 時的具體數值 (0-15). |
| `"min_inclusive"` | `int` | 否 | 最小值 | 當使用範圍分配器時的下限. |
| `"max_inclusive"` | `int` | 否 | 最大值 | 當使用範圍分配器時的上限. |

---

## 5. 參數枚舉與可用值全清單 (Value Enumerations)

### 5.1 渲染效果 (Effects)

| 參數值 (Value) | 簡述 | 完整遊戲行為說明與影響範圍 |
| --- | --- | --- |
| `minecraft:overworld` | 主世界模式 | 具備藍天、白雲、日夜交替的霧氣與光照渲染. |
| `minecraft:the_nether` | 地獄模式 | 具備濃霧、橘紅色調、無視天空高度的環境光渲染. |
| `minecraft:the_end` | 終界模式 | 具備深紫色色調、無雲層、帶有靜態背景雜訊的渲染. |

---

## 6. 數據約束與邊界條件 (Data Constraints)

* **高度與起點**: `min_y` 與 `height` 之和不可超過 `2016`, 且最低高度 `min_y` 不可低於 `-2032`.
* **高度對齊**: `height` 必須為 `16` 的倍數, 否則會導致資料包載入失敗.
* **環境光照**: `ambient_light` 數值若設為負值或超出 `1.0`, 可能導致客戶端渲染異常.
* **邏輯高度**: `logical_height` 建議小於或等於 `height`.

---

## 7. 外部連結 (References)

* [Misode Data Pack Generators - Dimension Type](https://misode.github.io/dimension-type/)
* [Minecraft Wiki - Dimension Type Definition](https://zh.minecraft.wiki/)
* [資源位置與命名空間規範 (Resource Locations)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/ResourceLocations.md)
* [方塊狀態與標籤 (Block States & Tags)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/BlockStates_or_Tags.md)
* [相關指令: /execute](https://github.com/YuYue71/Minecraft_Commands/blob/main/.commands/execute.md)
* [相關指令: /teleport](https://github.com/YuYue71/Minecraft_Commands/blob/main/.commands/teleport.md)