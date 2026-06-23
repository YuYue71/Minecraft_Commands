# structures (結構)

> **分類:** `資料包元素` | **檔案格式:** `nbt` | **命名空間支援:** `true` | **熱重載:** `false`

---

## 目錄

* [目錄路徑](#目錄路徑-directory--path)
* [核心結構](#核心結構-core-structure)
* [節點說明](#節點說明-node-explanations)
    * [size (尺寸)](#size)
    * [blocks (方塊列表)](#blocks-list)
    * [palette (調色盤)](#palette-list)
    * [entities (實體)](#entities-list)
* [外部連結](#外部連結-references)

---

## 目錄路徑 (Directory & Path)

> 結構檔案以二進位 NBT 格式儲存, 通常透過遊戲內的「結構方塊 (Structure Block)」生成.

```file
data/<namespace>/structures/[子資料夾]/<檔案名稱>.nbt
```

* `<namespace>` = 命名空間 (如 `minecraft`, `example`)
* `[子資料夾]` = 開發者自訂的分類目錄 (選填)
* `<檔案名稱>` = 決定遊戲內調用該結構的 ID 名稱
* 遊戲內調用格式為: `<namespace>:[子資料夾/]<檔案名稱>` (例如 `example:houses/small_shack`)

---

## 核心結構 (Core Structure)

> NBT 檔案為樹狀二進位結構. 以下為邏輯上的資料骨架 (非 JSON 文本).

```nbt
{
    "size": [int, int, int],
    "blocks": [
        {
            "pos": [int, int, int],
            "state": int
        }
    ],
    "palette": [
        {
            "Name": "minecraft:block_id",
            "Properties": { ... }
        }
    ],
    "entities": [
        {
            "pos": [double, double, double],
            "blockPos": [int, int, int],
            "nbt": { ... }
        }
    ],
    "DataVersion": int
}
```

| 鍵值 / 節點 (Key) | 類型 | 必填 | 說明 |
| --- | --- | --- | --- |
| `"size"` | `list (int)` | 是 | 結構的長、寬、高尺寸 |
| `"blocks"` | `list (compound)` | 是 | 結構內所有方塊的座標與狀態索引 |
| `"palette"` | `list (compound)` | 是 | 方塊狀態調色盤, 定義索引對應的方塊屬性 |
| `"entities"` | `list (compound)` | 否 | 結構內包含的實體資料及其座標 |
| `"DataVersion"` | `int` | 是 | 該 NBT 檔案的資料版本號 |

---

## 節點說明 (Node Explanations)

### `size`

> 定義結構所佔用的三維空間體積.

| 索引 | 說明 |
| --- | --- |
| `0` | X 軸長度 (寬度) |
| `1` | Y 軸長度 (高度) |
| `2` | Z 軸長度 (深度) |

---

### `blocks (List)`

> 儲存結構中每一個方塊的具體位置與狀態.

| 子節點 (Sub-key) | 類型 | 必填 | 說明 |
| --- | --- | --- | --- |
| `"pos"` | `list (int)` | 是 | 相對於結構原點 (0,0,0) 的局部座標 |
| `"state"` | `int` | 是 | 對應 `"palette"` 列表中的索引編號 |
| `"nbt"` | `compound` | 否 | 該位置方塊實體 (Block Entity) 的詳細資料 |

---

### `palette (List)`

> 為了節省空間, 結構使用調色盤機制映射方塊類型.

| 子節點 (Sub-key) | 類型 | 必填 | 說明 |
| --- | --- | --- | --- |
| `"Name"` | `string` | 是 | 方塊的資源位置 ID (例如 `minecraft:stone_bricks`) |
| `"Properties"` | `compound` | 否 | 方塊狀態屬性 (例如 `facing`, `lit`, `half`) |

---

### `entities (List)`

> 儲存結構保存時位於其範圍內的實體.

| 子節點 (Sub-key) | 類型 | 必填 | 說明 |
| --- | --- | --- | --- |
| `"pos"` | `list (double)` | 是 | 實體在結構中的精確局部座標 |
| `"blockPos"` | `list (int)` | 是 | 實體所在位置最接近的整數方塊座標 |
| `"nbt"` | `compound` | 是 | 實體的所有 NBT 資料 (包含 UUID, 血量等) |

---

## 外部連結 (References)
* [Minecraft Wiki - Structure Block](https://minecraft.fandom.com/zh/wiki/%E7%BB%93%E6%9E%84%E6%96%B9%E5%9D%97?variant=zh-tw)
* [Minecraft Wiki - Structure](https://minecraft.fandom.com/zh/wiki/%E7%94%9F%E6%88%90%E7%BB%93%E6%9E%84?variant=zh-tw)
* [Misode Data Pack Generators - Structure (Worldgen)](https://misode.github.io/worldgen/structure/)
* [資源位置與命名空間規範 (Resource Locations)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/ResourceLocations.md)
* [座標系統 (Coordinate Systems)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/coordinates.md)
* [方塊狀態與標籤 (Block States & Tags)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/BlockStates_or_Tags.md)
* [實體 NBT 矩陣 (Entities)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.NBT/list.md)
* [方塊實體 NBT 矩陣 (Block Entities)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.NBT/list.md)
* [放置結構指令 (place)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.commands/place.md)