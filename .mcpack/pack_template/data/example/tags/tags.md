# tags (標籤)

> **分類:** `資料包元素` | **檔案格式:** `json` | **命名空間支援:** `true` | **熱重載:** `/reload`

---

## 目錄

* [目錄路徑](#目錄路徑-directory--path)
* [核心結構](#核心結構-core-structure)
* [節點說明](#節點說明-node-explanations)
    * [replace](#replace)
    * [values](#values)
* [常用登錄類型 (Registry Types) 窮舉清單](#常用登錄類型-registry-types-窮舉清單)
* [外部連結](#外部連結-references)

---

## 目錄路徑 (Directory & Path)

> 標籤檔案必須根據其分類 (Registry) 存放於對應的子目錄中.

```file
data/<namespace>/tags/<registry>/[子資料夾]/<檔案名稱>.json
```

* `<namespace>` = 命名空間 (如 `minecraft`, `example`)
* `<registry>` = 標籤分類 (如 `blocks`, `items`, `entity_types`)
* `[子資料夾]` = 開發者自訂的分類目錄 (選填)
* `<檔案名稱>` = 決定標籤的 ID 名稱
* 遊戲內調用格式為: `#<namespace>:[子資料夾/]<檔案名稱>` (例如 `#minecraft:skeletons`)

---

## 核心結構 (Core Structure)

> 標籤用於將多個方塊, 物品或實體歸類為同一個組, 方便在指令或資料包中調用.

```json
{
    "replace": false,
    "values": [
        "minecraft:diamond",
        "minecraft:iron_ingot",
        "#example:other_tag",
        {
            "id": "minecraft:gold_ingot",
            "required": false
        }
    ]
}
```

| 鍵值 / 節點 (Key) | 類型 | 必填 | 說明 |
| --- | --- | --- | --- |
| `"replace"` | `boolean` | 否 | 是否替換先前載入的同名標籤內容 |
| `"values"` | `array` | 是 | 包含在此標籤中的 ID 列表 |

---

## 節點說明 (Node Explanations)

### `replace`

> 決定與先前的標籤定義 (如原版或其他資料包) 的合併邏輯.

| 值 | 說明 |
| --- | --- |
| `false` | 將此檔案中的內容合併 (Append) 到已有的同名標籤中 (預設值). |
| `true` | 清除該標籤先前所有的紀錄, 僅保留此檔案定義的內容. |

---

### `values`

> 定義包含的具體項目 ID 或引用其他標籤.

| 數值格式 | 說明 |
| --- | --- |
| `"minecraft:id"` | 直接指定單一項目 ID. |
| `"#namespace:tag_id"` | 引用另一個標籤. 開頭必須帶有 `#` 符號. |
| `Object` | 使用物件格式可設置特殊屬性 (如下表). |

**Value Object 屬性:**

| 子節點 (Sub-key) | 類型 | 必填 | 說明 |
| --- | --- | --- | --- |
| `"id"` | `string` | 是 | 項目或標籤的 ID. |
| `"required"` | `boolean` | 否 | 若為 `false`, 當該 ID 不存在時不會報錯並自動跳過 (預設 `true`). |

---

## 常用登錄類型 (Registry Types) 窮舉清單

| 分類目錄 (Registry) | 說明 | 應用範例 |
| --- | --- | --- |
| `blocks` | 方塊標籤 | 用於 `/execute if block #tag` 或戰利品表. |
| `items` | 物品標籤 | 用於合成表輸入或 `/clear` 指令. |
| `entity_types` | 實體類型標籤 | 用於 `@e[type=#tag]` 目標選擇器. |
| `fluids` | 流體標籤 | 用於判斷液體類型 (如 `minecraft:lava`). |
| `game_events` | 遊戲事件標籤 | 用於震動感應器 (Sculk Sensor) 等級. |
| `functions` | 函式標籤 | 用於 `minecraft:load` 與 `minecraft:tick`. |
| `worldgen/biome` | 生態域標籤 | 用於定位結構或生成設置. |

---

## 外部連結 (References)

* [Minecraft Wiki - Tag](https://zh.minecraft.wiki/w/Java%E7%89%88%E6%A0%87%E7%AD%BE)
* [Misode Data Pack Generators - Tag](https://misode.github.io/tags/)
* [資源位置與命名空間規範 (Resource Locations)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/ResourceLocations.md)
* [方塊狀態與標籤 (Block States & Tags)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/BlockStates_or_Tags.md)
* [實體 ID (Entity IDs)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/Entity_IDs.md)
* [標籤指令 (tag)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.commands/tag.md)