# predicates (謂詞 / 判定條件)

> **分類:** `邏輯判定` | **檔案格式:** `json` | **適用版本:** `JE ≤ 1.20.4` | **熱重載:** `/reload`

---

## 目錄

* [1. 目錄路徑 (Directory & Path)](#1-目錄路徑-directory--path)
* [2. 核心結構範本 (Core Structure Skeleton)](#2-核心結構範本-core-structure-skeleton)
* [3. 根節點屬性表 (Root Properties)](#3-根節點屬性表-root-properties)
* [4. 子對象詳解 (Sub-object Details)](#4-子對象詳解-sub-object-details)
    * [4.1 entity_properties 屬性細節](#41-entity_properties-屬性細節)
    * [4.2 location_check 屬性細節](#42-location_check-屬性細節)
    * [4.3 複合條件項目 (terms)](#43-複合條件項目-terms)
* [5. 參數枚舉與可用值全清單 (Value Enumerations)](#5-參數枚舉與可用值全清單-value-enumerations)
    * [5.1 條件類型 (Condition IDs)](#51-條件類型-condition-ids)
    * [5.2 實體類型 (Entity Targets)](#52-實體類型-entity-targets)
* [6. 數據約束與邊界條件 (Data Constraints)](#6-數據約束與邊界條件-data-constraints)
* [7. 外部連結 (References)](#7-外部連結-references)

---

## 1. 目錄路徑 (Directory & Path)

> 定義可重複調用的邏輯判斷單元, 用於指令篩選或戰利品表執行門檻.

```file
data/<namespace>/predicates/[子資料夾]/<檔案名稱>.json
```

* `<namespace>`: 命名空間 (如 `minecraft`, `example`).
* `<registry>`: `predicates`.
* 調用標識符: `<namespace>:[子資料夾]/<檔案名稱>` (用於 `execute if predicate`).

---

## 2. 核心結構範本 (Core Structure Skeleton)

> 包含單一判定與複合邏輯判定的編寫骨架.

```json
// 單一判定範例 (檢查玩家是否正在潛行)
{
  "condition": "minecraft:entity_properties",
  "entity": "this",
  "predicate": {
    "flags": {
      "is_sneaking": true
    }
  }
}

// 複合判定範例 (AND 邏輯)
{
  "condition": "minecraft:all_of",
  "terms": [
    { "condition": "minecraft:weather_check", "is_raining": true },
    { "condition": "minecraft:location_check", "location": { "dimension": "minecraft:overworld" } }
  ]
}
```

---

## 3. 根節點屬性表 (Root Properties)

> 檔案第一層級的鍵值定義.

| 鍵值 (Key) | 類型 | 必填 | 簡述 | 說明、預設值與可用值索引 |
| --- | --- | --- | --- | --- |
| `"condition"` | `string` | 是 | 條件類型 | 指定要執行的判定邏輯. 可用值詳見 [5.1](#51-條件類型-condition-ids). |
| `"terms"` | `array` | 否 | 子條件清單 | 僅用於複合條件 (如 `all_of`). 連結至 [4.3](#43-複合條件項目-terms). |
| `...` | `mixed` | 否 | 條件參數 | 依據 `"condition"` 的類型填入對應參數. 詳見 [4.1](#41-entity_properties-屬性細節) - [4.2](#42-location_check-屬性細節). |

---

## 4. 子對象詳解 (Sub-object Details)

### 4.1 entity_properties 屬性細節

> 檢查特定實體的屬性狀態 (Misode: Entity Properties).

| 子鍵值 (Sub-key) | 類型 | 必填 | 簡述 | 說明 |
| --- | --- | --- | --- | --- |
| `"entity"` | `enum` | 是 | 目標實體 | 指定要檢查哪一個實體. 可用值詳見 [5.2](#52-實體類型-entity-targets). |
| `"predicate"` | `object` | 是 | 屬性詳情 | 包含 `flags`, `equipment`, `nbt` 等詳細判定. |

### 4.2 location_check 屬性細節

> 檢查特定位置的環境狀態 (Misode: Location Check).

| 子鍵值 (Sub-key) | 類型 | 必填 | 簡述 | 說明 |
| --- | --- | --- | --- | --- |
| `"offsetX"` | `int` | 否 | X 軸偏移 | 相對於基準點的水平偏移量. |
| `"location"` | `object` | 是 | 位置詳情 | 包含 `biome`, `dimension`, `structure` 等判定. |

### 4.3 複合條件項目 (terms)

> `all_of`, `any_of` 等陣列中的元素結構.

| 子鍵值 (Sub-key) | 類型 | 必填 | 簡述 | 說明 |
| --- | --- | --- | --- | --- |
| `"condition"` | `string` | 是 | 子條件類型 | 遞迴調用任何合法的條件 ID. |
| `...` | `mixed` | 否 | 子條件參數 | 填入該子條件所需的對應屬性. |

---

## 5. 參數枚舉與可用值全清單 (Value Enumerations)

### 5.1 條件類型 (Condition IDs)

| 參數值 (Value) | 簡述 | 完整遊戲行為說明與影響範圍 |
| --- | --- | --- |
| `minecraft:all_of` | 邏輯 AND | 當所有 `terms` 內條件皆成立時返回 true. |
| `minecraft:any_of` | 邏輯 OR | 當 `terms` 內任一條件成立時返回 true. |
| `minecraft:inverted` | 邏輯 NOT | 反轉 `term` 節點內條件的判定結果. |
| `minecraft:entity_properties` | 實體屬性 | 檢查實體的 NBT、效果、裝備或狀態旗標. |
| `minecraft:location_check` | 位置環境 | 檢查座標處的群系、維度、結構或光照. |
| `minecraft:weather_check` | 天氣狀態 | 檢查當前世界是否正在下雨或雷雨. |
| `minecraft:time_check` | 時間檢查 | 檢查世界時間是否在指定區間內. |
| `minecraft:random_chance` | 隨機機率 | 基於固定機率進行判定 (0.0 - 1.0). |
| `minecraft:match_tool` | 工具檢查 | 檢查使用的物品/工具之 ID、標籤、附魔或耐久. |
| `minecraft:reference` | 引用謂詞 | 調用另一個已定義的 `.json` 謂詞檔案. |

### 5.2 實體類型 (Entity Targets)

| 參數值 (Value) | 簡述 | 完整遊戲行為說明與影響範圍 |
| --- | --- | --- |
| `this` | 執行者 | 當前執行指令或觸發事件的實體. |
| `killer` | 擊殺者 | 造成死亡事件的直接來源實體. |
| `killer_player` | 擊殺玩家 | 造成死亡事件且必須為玩家身份的實體. |

---

## 6. 數據約束與邊界條件 (Data Constraints)

* **隨機機率 (chance)**: 必須介於 `0.0` 與 `1.0` 之間. `0.0` 永不成立, `1.0` 必定成立.
* **數值範圍 (range)**: 許多欄位支援 `{"min": x, "max": y}` 格式, 必須確保 `min ≤ max`.
* **引用深度**: `reference` 類型避免循環引用, 否則會導致資料包載入時堆疊溢位 (StackOverflow).

---

## 7. 外部連結 (References)

* [Misode Data Pack Generators - Predicate](https://misode.github.io/predicate/)
* [Minecraft Wiki - Predicate Definition](https://zh.minecraft.wiki/)
* [目標選擇器 (Target Selectors)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/TargetSelectors.md)
* [座標系統 (Coordinate Systems)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/coordinates.md)
* [相關指令: /execute if predicate](https://github.com/YuYue71/Minecraft_Commands/blob/main/.commands/execute.md)