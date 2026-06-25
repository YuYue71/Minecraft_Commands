# loot_tables (戰利品表)

> **分類:** `物品產出` | **檔案格式:** `json` | **適用版本:** `JE ≤ 1.20.4` | **熱重載:** `/reload`

---

## 目錄

* [1. 目錄路徑 (Directory & Path)](#1-目錄路徑-directory--path)
* [2. 核心結構範本 (Core Structure Skeleton)](#2-核心結構範本-core-structure-skeleton)
* [3. 根節點屬性表 (Root Properties)](#3-根節點屬性表-root-properties)
* [4. 子對象詳解 (Sub-object Details)](#4-子對象詳解-sub-object-details)
    * [4.1 pools (隨機池項目)](#41-pools-隨機池項目)
    * [4.2 entries (產出條目細節)](#42-entries-產出條目細節)
    * [4.3 rolls (抽取次數配置)](#43-rolls-抽取次數配置)
* [5. 參數枚舉與可用值全清單 (Value Enumerations)](#5-參數枚舉與可用值全清單-value-enumerations)
    * [5.1 戰利品表類型 (Loot Table Types)](#51-戰利品表類型-loot-table-types)
    * [5.2 條目類型 (Entry Types)](#52-條目類型-entry-types)
* [6. 數據約束與邊界條件 (Data Constraints)](#6-數據約束與邊界條件-data-constraints)
* [7. 資料包結構參考 (Datapack Structure)](#7-資料包結構參考-datapack-structure)
* [8. 外部連結 (References)](#8-外部連結-references)

---

## 1. 目錄路徑 (Directory & Path)

> 定義生物掉落、容器內容、方塊採掘或釣魚結果的產出邏輯.

```file
data/<namespace>/loot_tables/[子資料夾]/<檔案名稱>.json
```

* `<namespace>`: 命名空間 (如 `minecraft`, `example`).
* `<registry>`: `loot_tables`.
* 調用標識符: `<namespace>:[子資料夾]/<檔案名稱>`.

---

## 2. 核心結構範本 (Core Structure Skeleton)

> 包含池定義、隨機權重條目與條件函數的完整骨架.

```json
{
  "type": "minecraft:chest",
  "pools": [
    {
      "rolls": 1,
      "bonus_rolls": 0,
      "entries": [
        {
          "type": "minecraft:item",
          "name": "minecraft:diamond",
          "weight": 10,
          "functions": [
            {
              "function": "minecraft:set_count",
              "count": { "min": 1, "max": 3 }
            }
          ]
        },
        {
          "type": "minecraft:empty",
          "weight": 90
        }
      ],
      "conditions": [
        {
          "condition": "minecraft:random_chance",
          "chance": 0.5
        }
      ]
    }
  ]
}
```

---

## 3. 根節點屬性表 (Root Properties)

> 檔案第一層級的鍵值定義.

| 鍵值 (Key) | 類型 | 必填 | 簡述 | 說明、預設值與可用值索引 |
| --- | --- | --- | --- | --- |
| `"type"` | `enum` | 否 | 內容分類 | 決定戰利品表的用途. 可用值詳見 [5.1](#51-戰利品表類型-loot-table-types). |
| `"pools"` | `array` | 否 | 隨機池列表 | 包含多個獨立抽取的池對象. 連結至 [4.1](#41-pools-隨機池項目). |
| `"functions"` | `array` | 否 | 全域函數 | 套用於此表產出之所有物品的修改函數. |
| `"random_sequence"` | `string` | 否 | 隨機序列 | (1.20+) 指定隨機數種子序列 ID. |

---

## 4. 子對象詳解 (Sub-object Details)

### 4.1 pools (隨機池項目)

> 每個池代表一次獨立的隨機抽取過程.

| 子鍵值 (Sub-key) | 類型 | 必填 | 簡述 | 說明 |
| --- | --- | --- | --- | --- |
| `"rolls"` | `float \| object` | 是 | 抽取次數 | 定義此池被執行的次數. 詳見 [4.3](#43-rolls-抽取次數配置). |
| `"bonus_rolls"` | `float \| object` | 否 | 幸運加成 | 根據玩家幸運值 (Luck) 額外增加的次數. |
| `"entries"` | `array` | 是 | 候選條目 | 此池中可能產出的內容清單. 連結至 [4.2](#42-entries-產出條目細節). |
| `"conditions"` | `array` | 否 | 執行條件 | 決定此池是否生效的判定條件列表. |
| `"functions"` | `array` | 否 | 池函數 | 僅套用於此池產出物品的修改函數. |

### 4.2 entries (產出條目細節)

> 定義具體的產出內容、權重與規則 (Misode: Entry).

| 子鍵值 (Sub-key) | 類型 | 必填 | 簡述 | 說明 |
| --- | --- | --- | --- | --- |
| `"type"` | `enum` | 是 | 條目類型 | 指定產出類別. 可用值詳見 [5.2](#52-條目類型-entry-types). |
| `"name"` | `string` | 否 | 資源路徑 | 根據類型填入物品 ID、標籤 ID 或另一張表的路徑. |
| `"weight"` | `int` | 否 | 隨機權重 | 數值越高, 被抽中的機率越大 (預設 `1`). |
| `"quality"` | `int` | 否 | 品質修飾 | 隨玩家幸運值改變權重的係數 (預設 `0`). |
| `"children"` | `array` | 否 | 子條目 | 用於複合類型 (如 `group`, `alternatives`) 的內容. |
| `"functions"` | `array` | 否 | 條目函數 | 僅套用於此條目產出物品的修改函數. |
| `"conditions"` | `array` | 否 | 條目條件 | 決定此條目是否參與隨機抽取的條件. |

### 4.3 rolls (抽取次數配置)

> 控制隨機抽取的次數邏輯 (Number Providers).

| 格式類型 | 範例結構 | 簡述 | 說明 |
| --- | --- | --- | --- |
| `Constant` | `1` | 固定值 | 每次必定執行固定次數. |
| `Uniform` | `{"min": 1, "max": 5}` | 均勻分佈 | 在指定範圍內隨機選取一個整數. |
| `Binomial` | `{"n": 3, "p": 0.5}` | 二項分佈 | 進行 `n` 次機率為 `p` 的嘗試, 成功次數為抽取數. |

---

## 5. 參數枚舉與可用值全清單 (Value Enumerations)

### 5.1 戰利品表類型 (Loot Table Types)

| 參數值 (Value) | 簡述 | 完整遊戲行為說明與影響範圍 |
| --- | --- | --- |
| `minecraft:empty` | 空表 | 不具備任何預設邏輯的佔位符. |
| `minecraft:chest` | 容器內容 | 適用於寶箱、漏斗、發射器等容器. |
| `minecraft:entity` | 實體掉落 | 適用於生物死亡後的掉落物 (包含經驗球). |
| `minecraft:block` | 方塊掉落 | 適用於方塊被破壞後的產出. |
| `minecraft:fishing` | 釣魚產物 | 適用於玩家釣魚時釣起的物品. |
| `minecraft:gift` | 禮物 | 適用於貓、村民給予玩家的禮物. |
| `minecraft:barter` | 以物易物 | 適用於豬布林金錠交易. |
| `minecraft:advancement_reward` | 進度獎勵 | 適用於完成進度後自動給予玩家的獎勵. |

### 5.2 條目類型 (Entry Types)

| 參數值 (Value) | 簡述 | 完整遊戲行為說明與影響範圍 |
| --- | --- | --- |
| `minecraft:item` | 物品 | 產出指定的單一物品. |
| `minecraft:tag` | 標籤內容 | 從指定的物品標籤 (`tags/items`) 中隨機選取一項或多項. |
| `minecraft:loot_table` | 嵌套表 | 遞迴調用另一張戰利品表的結果. |
| `minecraft:empty` | 沒中獎 | 代表此次抽取沒有產出任何物品. |
| `minecraft:dynamic` | 動態內容 | 用於特殊方塊內容 (如 `minecraft:contents` 對應箱子內的物品). |
| `minecraft:group` | 群組條目 | 若條件達成, 執行該群組內的所有子條目. |
| `minecraft:alternatives` | 多選一 | 按順序檢查子條目條件, 僅執行第一個條件成立的條目. |
| `minecraft:sequence` | 序列執行 | 按順序執行子條目, 直到其中一個條件不成立為止. |

---

## 6. 數據約束與邊界條件 (Data Constraints)

* **權重限制**: `weight` 必須為非負整數, 建議最小值為 `1`. 權重為 `0` 的條目除非有 `quality` 加成否則永不被選中.
* **抽取次數**: `rolls` 的數值必須為非負數. 若為 `0`, 則該池不會產出任何東西.
* **遞迴深度**: 避免 `loot_table` 類型產生循環引用, 這會導致伺服器崩潰.

---

## 7. 資料包結構參考 (Datapack Structure)

### 戰利品表調用與位置
檔案必須存放於正確路徑以供遊戲識別.
`data/<namespace>/loot_tables/<path>.json`

**範例:**
欲修改殭屍掉落, 應建立:
`data/minecraft/loot_tables/entities/zombie.json`

---

## 8. 外部連結 (References)

* [Misode Data Pack Generators - Loot Table](https://misode.github.io/loot-table/)
* [Minecraft Wiki - Loot Table](https://zh.minecraft.wiki/)
* [資源位置與命名空間規範 (Resource Locations)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/ResourceLocations.md)
* [方塊狀態與標籤 (Block States & Tags)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/BlockStates_or_Tags.md)
* [物品 NBT 矩陣 (Items)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.NBT/list.md)
* [相關指令: /loot](https://github.com/YuYue71/Minecraft_Commands/blob/main/.commands/loot.md)