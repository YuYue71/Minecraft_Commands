# dimension_type (維度類型)

> **分類:** `資料包元素` | **檔案格式:** `json` | **命名空間支援:** `true` | **熱重載:** `/reload`

---

## 目錄

* [目錄路徑](#目錄路徑-directory--path)
* [核心結構](#核心結構-core-structure)
* [節點說明](#節點說明-node-explanations)
    * [環境屬性 (Environment)](#環境屬性-environment)
    * [高度與座標 (Height & Coordinates)](#高度與座標-height--coordinates)
    * [機制與限制 (Mechanics & Limits)](#機制與限制-mechanics--limits)
* [外部連結](#外部連結-references)

---

## 目錄路徑 (Directory & Path)

> 維度類型定義了維度的物理法則、光照行為以及生存限制.

```file
data/<namespace>/dimension_type/[子資料夾]/<檔案名稱>.json
```

* `<namespace>` = 命名空間 (如 `minecraft`, `example`)
* `[子資料夾]` = 開發者自訂的分類目錄 (選填)
* `<檔案名稱>` = 決定該維度類型的 ID 名稱
* 遊戲內調用格式為: `<namespace>:[子資料夾]/<檔案名稱>` (例如 `example:space_type`)

---

## 核心結構 (Core Structure)

> 每個維度類型包含對高度、光照、地獄座標比例及床/重生錨功能的定義.

```json
{
    "ultrawarm": false,
    "natural": true,
    "coordinate_scale": 1.0,
    "has_skylight": true,
    "has_ceiling": false,
    "ambient_light": 0.0,
    "min_y": -64,
    "height": 384,
    "logical_height": 384,
    "infiniburn": "minecraft:infiniburn_overworld",
    "effects": "minecraft:overworld",
    "bed_works": true,
    "respawn_anchor_works": false,
    "has_raids": true,
    "monster_spawn_light_level": 0,
    "monster_spawn_block_light_limit": 0
}
```

| 鍵值 / 節點 (Key) | 類型 | 必填 | 說明 |
| --- | --- | --- | --- |
| `"ultrawarm"` | `boolean` | 是 | 是否為超熱環境 (如水會蒸發、火蔓延加速) |
| `"natural"` | `boolean` | 是 | 是否為自然環境 (如指北針運作正常) |
| `"coordinate_scale"` | `double` | 是 | 座標比例 (地獄為 `8.0`, 主世界為 `1.0`) |
| `"effects"` | `string` | 是 | 渲染效果 (天空與霧氣類型) |
| `"min_y"` | `int` | 是 | 維度最低高度 (Y 軸起點) |
| `"height"` | `int` | 是 | 維度總高度 (需為 16 的倍數) |

---

## 節點說明 (Node Explanations)

### 環境屬性 (Environment)

| 子節點 (Sub-key) | 類型 | 必填 | 說明 |
| --- | --- | --- | --- |
| `"has_skylight"` | `boolean` | 是 | 是否具備天空光照. |
| `"has_ceiling"` | `boolean` | 是 | 維度頂部是否被方塊覆蓋 (如地獄的天頂). |
| `"ambient_light"` | `float` | 是 | 環境基礎亮度 (範圍 `0.0` 到 `1.0`). |
| `"fixed_time"` | `long` | 否 | 若存在, 時間將固定於此數值且日夜循環停止. |
| `"effects"` | `enum` | 是 | `minecraft:overworld`, `minecraft:the_nether`, `minecraft:the_end`. |

---

### 高度與座標 (Height & Coordinates)

| 子節點 (Sub-key) | 類型 | 必填 | 說明 |
| --- | --- | --- | --- |
| `"min_y"` | `int` | 是 | 最低方塊高度. 範圍 `-2032` 到 `2016`. |
| `"height"` | `int` | 是 | 可建築總高度. `min_y + height` 不可超過 `2016`. |
| `"logical_height"` | `int` | 是 | 傳送門生成的最大高度限制. |
| `"infiniburn"` | `string` | 是 | 引用標籤 (Tag), 定義在此維度永不熄滅的方塊. |

---

### 機制與限制 (Mechanics & Limits)

| 子節點 (Sub-key) | 類型 | 必填 | 說明 |
| --- | --- | --- | --- |
| `"bed_works"` | `boolean` | 是 | 睡覺是否能跳過夜晚 (若為 `false` 則床會爆炸). |
| `"respawn_anchor_works"` | `boolean` | 是 | 重生錨是否能正常運作 (若為 `false` 則會爆炸). |
| `"piglin_safe"` | `boolean` | 是 | 豬布林是否不會轉化為殭屍豬布林. |
| `"has_raids"` | `boolean` | 是 | 該維度是否能觸發襲擊 (Raid) 事件. |
| `"monster_spawn_light_level"` | `int\|object` | 是 | 生物生成所需的光照等級. |

---

## 外部連結 (References)

* [Minecraft Wiki - Dimension Type](https://zh.minecraft.wiki/w/%E7%BB%B4%E5%BA%A6%E5%AE%9A%E4%B9%89%E6%A0%BC%E5%BC%8F?variant=zh-tw)
* [Misode Data Pack Generators - Dimension Type](https://misode.github.io/dimension-type/)
* [資源位置與命名空間規範 (Resource Locations)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/ResourceLocations.md)
* [方塊狀態與標籤 (Block States & Tags)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/BlockStates_or_Tags.md)
* [維度切換指令 (execute)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.commands/execute.md)
* [傳送指令 (teleport)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.commands/teleport.md)