# /loot

> **分類:** `指令` | **權限等級:** `2` | **適用版本:** `JE ≤ 1.20.4` | **命令方塊:** `true`

---

## 目錄

* [語法](#語法-syntax)
* [參數說明](#參數說明-parameters)
    * [目標操作模式 (Target Modes)](#目標操作模式-target-modes)
    * [來源操作模式 (Source Modes)](#來源操作模式-source-modes)
    * [工具參數 (Tool Parameters)](#工具參數-tool-parameters)
* [資料包結構參考 (Datapack Structure)](#資料包結構參考-datapack-structure)
* [外部連結](#外部連結-references)

---

## 語法 (Syntax)

```commands
/loot spawn <pos> <source>
/loot replace block <pos> <slot> [count] <source>
/loot replace entity <entities> <slot> [count] <source>
/loot give <players> <source>
/loot insert <pos> <source>

```

* `<>` = 必填, `[]` = 選填
* `<source>` 為獨立的語法分支, 負責定義掉落物的產生方式, 詳見下方參數說明.

| 參數 / 欄位 | 類型 | 預設 | 說明 |
| --- | --- | --- | --- |
| `spawn` / `replace` / `give` / `insert` | `enum` | - | 決定物品產出後的發放與處理方式 |
| `<pos>` | `vec3` | - | 目標方塊或掉落的絕對 / 相對座標 |
| `<slot>` | `string` | - | 欲替換物品的起始欄位代碼 |
| `[count]` | `int` | - | 限制連續替換的最大欄位數量 |
| `<entities>` / `<players>` | `entity` | - | 欲發放或替換物品的目標實體 |
| `<source>` | `string` | - | 決定產生物品的來源邏輯 |

---

## 參數說明 (Parameters)

### `目標操作模式 (Target Modes)`

> 決定系統生成物品後, 要將這些物品放置到何處.

| 值 | 說明 |
| --- | --- |
| `spawn` | 將產生的物品以「實體掉落物 (Item Entity)」的形式生成於指定的 `<pos>` 座標上. |
| `replace block` | 清除方塊容器 (如箱子, 漏斗) 內 `<slot>` 欄位原有的物品, 並將新物品放入. 若指定了 `[count]`, 則最多只會連續覆蓋指定數量的欄位. 若未指定, 則會依序填滿後續可用欄位. |
| `replace entity` | 清除目標實體身上 `<slot>` 欄位 (如主手, 頭盔等) 原有的物品, 並將新物品放入. 處理邏輯與方塊容器相同. |
| `give` | 將產生的物品直接放入 `<players>` 的背包中. 若玩家背包已滿, 多餘的物品將自動掉落在玩家腳下. |
| `insert` | 將產生的物品以類似漏斗灌入的邏輯, 依序填入指定座標 `<pos>` 方塊容器內的空位. 若容器已滿, 多出來的物品將會直接消失. |

---

### `來源操作模式 (Source Modes)`

> 銜接在目標操作後方的 `<source>` 參數, 用於決定這些物品究竟是如何產生的.

| 值 | 說明 |
| --- | --- |
| `loot <loot_table>` | 根據指定的資源位置生成物品. **需透過資料包定義** (如 `minecraft:chests/village/village_weaponsmith`). |
| `kill <entity>` | 模擬玩家殺死指定的目標實體 `<entity>`, 獲取該實體預設的死亡掉落物. |
| `mine <pos> [tool]` | 模擬玩家破壞指定座標 `<pos>` 上的方塊, 獲取其對應的方塊掉落物. 支援附加工具參數. |
| `fish <loot_table> <pos> [tool]` | 模擬在指定座標 `<pos>` 進行釣魚, 並使用指定的釣魚戰利品表產生結果. **需透過資料包定義**. 支援附加工具參數. |

---

### `工具參數 (Tool Parameters)`

> 僅適用於 `<source>` 為 `mine` 或 `fish` 時, 用於模擬使用特定工具進行操作 (會自動結算精準採集, 掠奪, 海之眷顧等附魔效果). 若不填寫, 預設為空手.

| 值 | 說明 |
| --- | --- |
| `mainhand` | (預設值) 模擬使用執行指令者「主手 (Main Hand)」目前持有的物品進行操作. |
| `offhand` | 模擬使用執行指令者「副手 (Offhand)」目前持有的物品進行操作. |
| `tool <item>` | 強制模擬使用特定的 `<item>` (支援附魔與 NBT 標籤) 進行操作. 例如 `minecraft:diamond_pickaxe{Enchantments:[{id:"minecraft:silk_touch",lvl:1s}]}`. |

---

## 資料包結構參考 (Datapack Structure)

當使用 `loot <loot_table>` 或 `fish <loot_table> <pos>` 時, 系統會調用資料包中的戰利品表 (Loot Tables).

* **標準目錄路徑:** `data/<namespace>/loot_tables/<path>.json`
* **調用資源位置:** `<namespace>:<path>` (例如 `data/mypack/loot_tables/magic_sword.json` 的 ID 為 `mypack:magic_sword`)

**JSON 核心結構範例:**

```json
{
  "type": "minecraft:generic",
  "pools": [
    {
      "rolls": 1,
      "entries": [
        {
          "type": "minecraft:item",
          "name": "minecraft:diamond_sword",
          "functions": [
            {
              "function": "minecraft:set_enchantments",
              "enchantments": {
                "minecraft:sharpness": 5
              }
            }
          ]
        }
      ]
    }
  ]
}

```

---

## 外部連結 (References)

* [Minecraft Wiki - /loot](https://zh.minecraft.wiki/w/%E5%91%BD%E4%BB%A4/loot)
* [目標選擇器 (Target Selectors)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/TargetSelectors.md)
* [座標系統 (Coordinate Systems)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/coordinates.md)
* [資源位置與命名空間規範 (Resource Locations)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/ResourceLocations.md)
* [物品欄位編號 (Slot IDs)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/Slot_IDs.md)
* [物品 NBT 矩陣 (Items)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.NBT/list.md)