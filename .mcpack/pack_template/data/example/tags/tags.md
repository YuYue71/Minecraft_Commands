# tags (標籤)

> **分類:** `群組定義` | **檔案格式:** `json` | **適用版本:** `JE ≤ 1.20.4` | **熱重載:** `/reload`

---

## 目錄

* [1. 目錄路徑 (Directory & Path)](#1-目錄路徑-directory--path)
* [2. 核心結構範本 (Core Structure Skeleton)](#2-核心結構範本-core-structure-skeleton)
* [3. 根節點屬性表 (Root Properties)](#3-根節點屬性表-root-properties)
* [4. 子對象詳解 (Sub-object Details)](#4-子對象詳解-sub-object-details)
    * [4.1 values 陣列項目屬性](#41-values-陣列項目屬性)
* [5. 參數枚舉與可用值全清單 (Value Enumerations)](#5-參數枚舉與可用值全清單-value-enumerations)
    * [5.1 標籤登錄類別 (Registry Types)](#51-標籤登錄類別-registry-types)
* [6. 數據約束與邊界條件 (Data Constraints)](#6-數據約束與邊界條件-data-constraints)
* [7. 外部連結 (References)](#7-外部連結-references)

---

## 1. 目錄路徑 (Directory & Path)

> 定義資源群組的物理位置, 遊戲會根據存放的資料夾類別 (Registry) 來判斷標籤用途.

```file
data/<namespace>/tags/<registry>/[子資料夾]/<檔案名稱>.json
```

* `<namespace>`: 命名空間 (如 `minecraft`, `example`).
* `<registry>`: 登錄分類 (如 `blocks`, `items`, `entity_types`). 詳見 [5.1](#51-標籤登錄類別-registry-types).
* 調用標識符: `#<namespace>:[子資料夾]/<檔案名稱>`.

---

## 2. 核心結構範本 (Core Structure Skeleton)

> 標籤檔案支援直接引用 ID、引用其他標籤以及選填對象格式.

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

---

## 3. 根節點屬性表 (Root Properties)

> 檔案第一層級的鍵值定義.

| 鍵值 (Key) | 類型 | 必填 | 簡述 | 說明、預設值與可用值索引 |
| --- | --- | --- | --- | --- |
| `"replace"` | `boolean` | 否 | 覆寫行為 | 設為 `true` 時將忽視先前載入的同名標籤內容 (預設 `false`). |
| `"values"` | `array` | 是 | 成員清單 | 包含在此標籤中的項目 ID、標籤引用或物件. 連結至 [4.1](#41-values-陣列項目屬性). |

---

## 4. 子對象詳解 (Sub-object Details)

### 4.1 values 陣列項目屬性

> 當標籤成員需要額外定義 (如選填項目) 時使用的物件格式.

| 子鍵值 (Sub-key) | 類型 | 必填 | 簡述 | 說明 |
| --- | --- | --- | --- | --- |
| `"id"` | `string` | 是 | 目標 ID | 指定物品、方塊或實體的資源位置, 或另一個標籤 (需加 `#`). |
| `"required"` | `boolean` | 否 | 必要性檢查 | 設為 `false` 時, 若該 ID 未被註冊則自動跳過而不報錯 (預設 `true`). |

---

## 5. 參數枚舉與可用值全清單 (Value Enumerations)

### 5.1 標籤登錄類別 (Registry Types)

> 決定標籤存放在哪個目錄下, 賦予其不同的邏輯語義 (Misode: Registry).

| 參數值 (Value) | 簡述 | 完整遊戲行為說明與影響範圍 |
| --- | --- | --- |
| `blocks` | 方塊標籤 | 用於指令篩選、戰利品表條件或決定方塊物理特性. |
| `items` | 物品標籤 | 用於合成表輸入材料、指令清空物品或實體過濾. |
| `entity_types` | 實體標籤 | 用於 `@e[type=#tag]` 選擇器或傷害類型過濾. |
| `functions` | 函式標籤 | 用於 `/function #tag` 調用, 或掛載至系統事件 (`load`, `tick`). |
| `fluids` | 流體標籤 | 定義水、岩漿等流體的行為分類. |
| `game_events` | 遊戲事件 | 定義震動感應器 (Sculk Sensor) 能接收的動作頻率. |
| `worldgen/biome` | 生態域標籤 | 用於結構生成條件、氣候分佈或指令定位. |
| `worldgen/structure` | 結構標籤 | 用於過濾特定類別的遺跡或建築. |

---

## 6. 數據約束與邊界條件 (Data Constraints)

* **標籤引用**: `values` 中引用另一個標籤必須以 `#` 開頭. 嚴禁產生循環引用, 否則會導致載入報錯.
* **非法 ID**: 若 `required` 為 `true` (預設), 陣列中任何一個 ID 若不存在 (如拼錯或缺少對應資料包), 整份標籤檔案將載入失敗.
* **replace 邏輯**: 在 `minecraft` 命名空間下使用 `replace: true` 會徹底清除原版對應標籤的所有定義, 請謹慎使用.

---

## 7. 外部連結 (References)

* [Misode Data Pack Generators - Tag](https://misode.github.io/tags/)
* [Minecraft Wiki - Tag Definition](https://zh.minecraft.wiki/)
* [資源位置與命名空間規範 (Resource Locations)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/ResourceLocations.md)
* [方塊狀態與標籤 (Block States & Tags)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/BlockStates_or_Tags.md)
* [實體 ID (Entity IDs)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/Entity_IDs.md)
* [相關指令: /tag](https://github.com/YuYue71/Minecraft_Commands/blob/main/.commands/tag.md)