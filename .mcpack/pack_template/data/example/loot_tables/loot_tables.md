# loot_tables (戰利品表)

> **分類:** `資料包元素` | **檔案格式:** `json` | **命名空間支援:** `true` | **熱重載:** `/reload`

---

## 目錄

* [目錄路徑](#目錄路徑-directory--path)
* [核心結構](#核心結構-core-structure)
* [節點說明](#節點說明-node-explanations)
    * [pools (池)](#pools-object)
    * [entries (條目)](#entries-object)
    * [conditions (條件判斷器)](#conditions-array)
    * [functions (函數修改器)](#functions-array)
* [外部連結](#外部連結-references)

---

## 目錄路徑 (Directory & Path)

> 說明該元素檔案在資料包內部的標準存放位置.

```file
data/<namespace>/loot_tables/[子資料夾]/<檔案名稱>.json
```

* `<namespace>` = 命名空間 (如 `minecraft`, `example`)
* `[子資料夾]` = 開發者自訂的分類目錄 (選填)
* `<檔案名稱>` = 決定遊戲內調用該元素的 ID 名稱
* 遊戲內調用格式為: `<namespace>:[子資料夾/]<檔案名稱>` (例如 `example:chests/dungeon_loot`)

---

## 核心結構 (Core Structure)

> 戰利品表由多個「池 (Pools)」組成, 每個池包含多個「條目 (Entries)」, 並可附加「條件 (Conditions)」與「函數 (Functions)」.

```json
{
    "type": "minecraft:chest",
    "pools": [
        {
            "rolls": 1,
            "entries": [
                {
                    "type": "minecraft:item",
                    "name": "minecraft:diamond"
                }
            ]
        }
    ]
}
```

| 鍵值 / 節點 (Key) | 類型 | 必填 | 說明 |
| --- | --- | --- | --- |
| `"type"` | `string` | 否 | 指定戰利品表的類型 (例如 `chest`, `entity`, `block`) |
| `"pools"` | `array` | 否 | 定義多個隨機抽取池 |
| `"functions"` | `array` | 否 | 應用於整個戰利品表的修改函數 |

---

## 節點說明 (Node Explanations)

### 原版戰利品類型 (Types) 清單

| 值 | 說明 |
| --- | --- |
| `minecraft:empty` | 空表 |
| `minecraft:chest` | 箱子戰利品 |
| `minecraft:entity` | 實體死亡掉落物 |
| `minecraft:block` | 方塊破壞掉落物 |
| `minecraft:fishing` | 釣魚產物 |
| `minecraft:advancement_reward` | 進度獎勵 |

---

### `pools (Object)`

> 定義抽取次數與可選取的條目集合.

| 子節點 (Sub-key) | 類型 | 必填 | 說明 |
| --- | --- | --- | --- |
| `"rolls"` | `int\|object` | 是 | 抽取的次數 (支援常數或範圍) |
| `"bonus_rolls"` | `float\|object` | 否 | 根據幸運值 (Luck) 增加的額外次數 |
| `"entries"` | `array` | 是 | 可被隨機選取的內容列表 |
| `"conditions"` | `array` | 否 | 決定此池是否啟動的條件 |
| `"functions"` | `array` | 否 | 應用於此池產出物品的函數 |

---

### `entries (Object)`

> 具體的產出內容及其屬性.

| 子節點 (Sub-key) | 類型 | 必填 | 說明 |
| --- | --- | --- | --- |
| `"type"` | `string` | 是 | 條目類型 (`item`, `loot_table`, `tag`, `empty`, `dynamic`, `alternatives`, `sequence`, `group`) |
| `"name"` | `string` | 否 | 物品 ID 或引用 ID |
| `"weight"` | `int` | 否 | 權重 (預設 `1`) |
| `"quality"` | `int` | 否 | 品質修飾 (預設 `0`) |
| `"children"` | `array` | 否 | 用於複合類型的子條目 |
| `"expand"` | `boolean` | 否 | 若為標籤 (tag), 是否展開為所有物品 (預設 `false`) |

---

### `conditions (Array)`

> 用於過濾或判斷是否執行特定邏輯. 詳細條件請參考外部連結.

| 鍵值 / 節點 (Key) | 類型 | 必填 | 說明 |
| --- | --- | --- | --- |
| `"condition"` | `string` | 是 | 條件類型 ID (如 `minecraft:killed_by_player`) |

---

### `functions (Array)`

> 用於修改產出的物品 NBT 或數量. 詳細功能請參考外部連結.

| 鍵值 / 節點 (Key) | 類型 | 必填 | 說明 |
| --- | --- | --- | --- |
| `"function"` | `string` | 是 | 函數類型 ID (如 `minecraft:set_count`, `minecraft:enchant_randomly`) |

---

## 外部連結 (References)

* [Minecraft Wiki - Loot Table](https://minecraft.fandom.com/zh/wiki/%E6%88%98%E5%88%A9%E5%93%81%E8%A1%A8)
* [Misode Data Pack Generators - Loot Table](https://misode.github.io/loot-table/)
* [資源位置與命名空間規範 (Resource Locations)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/ResourceLocations.md)
* [物品 NBT 矩陣 (Items)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.NBT/list.md)
* [目標選擇器 (Target Selectors)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/TargetSelectors.md)
* [座標系統 (Coordinate Systems)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/coordinates.md)
* [方塊狀態與標籤 (Block States & Tags)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/BlockStates_or_Tags.md)
* [函式指令 (function)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.commands/function.md)
* [戰利品池指令 (loop)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.commands/loop.md)