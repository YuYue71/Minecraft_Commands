# item_modifiers (物品修飾器)

> **分類:** `物品操作` | **檔案格式:** `json` | **適用版本:** `JE ≤ 1.20.4` | **熱重載:** `/reload`

---

## 目錄

* [1. 目錄路徑 (Directory & Path)](#1-目錄路徑-directory--path)
* [2. 核心結構範本 (Core Structure Skeleton)](#2-核心結構範本-core-structure-skeleton)
* [3. 根節點屬性表 (Root Properties)](#3-根節點屬性表-root-properties)
* [4. 子對象詳解 (Sub-object Details)](#4-子對象詳解-sub-object-details)
    * [4.1 conditions (判定條件)](#41-conditions-判定條件)
    * [4.2 常用函數參數: set_attributes](#42-常用函數參數-set_attributes)
    * [4.3 常用函數參數: copy_nbt](#43-常用函數參數-copy_nbt)
* [5. 參數枚舉與可用值全清單 (Value Enumerations)](#5-參數枚舉與可用值全清單-value-enumerations)
    * [5.1 修改函數類型 (Functions)](#51-修改函數類型-functions)
* [6. 數據約束與邊界條件 (Data Constraints)](#6-數據約束與邊界條件-data-constraints)
* [7. 外部連結 (References)](#7-外部連結-references)

---

## 1. 目錄路徑 (Directory & Path)

> 定義如何動態修改物品的屬性、NBT 或狀態, 常與 `/item modify` 指令配合調用.

```file
data/<namespace>/item_modifiers/[子資料夾]/<檔案名稱>.json
```

* `<namespace>`: 命名空間 (如 `minecraft`, `example`).
* `<registry>`: `item_modifiers`.
* 調用標識符: `<namespace>:[子資料夾]/<檔案名稱>`.

---

## 2. 核心結構範本 (Core Structure Skeleton)

> 物品修飾器可以是一個單一函數物件, 也可以是一個函數對象陣列.

```json
// 單一函數範例
{
  "function": "minecraft:set_name",
  "name": {"text": "傳奇之劍", "color": "gold"},
  "conditions": [
    {
      "condition": "minecraft:random_chance",
      "chance": 0.5
    }
  ]
}

// 函數陣列範例 (按順序執行)
[
  { "function": "minecraft:set_count", "count": 64 },
  { "function": "minecraft:set_nbt", "tag": "{CustomTag:1b}" }
]
```

---

## 3. 根節點屬性表 (Root Properties)

> 檔案第一層級的鍵值定義. 若為陣列格式, 則每個元素皆遵循此表.

| 鍵值 (Key) | 類型 | 必填 | 簡述 | 說明、預設值與可用值索引 |
| --- | --- | --- | --- | --- |
| `"function"` | `string` | 是 | 修改行為 | 指定要執行的修改函數類型. 詳見 [5.1](#51-修改函數類型-functions). |
| `"conditions"` | `array` | 否 | 執行門檻 | 只有當所有條件皆成立時, 修改才會生效. 連結至 [4.1](#41-conditions-判定條件). |
| `...` | `mixed` | 否 | 函數參數 | 根據 `"function"` 的類型, 填入對應的專屬參數. |

---

## 4. 子對象詳解 (Sub-object Details)

### 4.1 conditions (判定條件)

> 用於過濾修飾器的生效時機. (與 Predicates 結構相同).

| 子鍵值 (Sub-key) | 類型 | 必填 | 簡述 | 說明 |
| --- | --- | --- | --- | --- |
| `"condition"` | `string` | 是 | 條件類型 | 引用如 `minecraft:entity_properties` 等條件 ID. |
| `...` | `mixed` | 否 | 條件參數 | 依據條件類型填入相應的判定內容. |

### 4.2 常用函數參數: set_attributes

> 用於修改物品的屬性修飾符 (Attribute Modifiers).

| 子鍵值 (Sub-key) | 類型 | 必填 | 簡述 | 說明 |
| --- | --- | --- | --- | --- |
| `"attribute"` | `string` | 是 | 屬性 ID | 如 `minecraft:generic.attack_damage`. |
| `"name"` | `string` | 是 | 修飾符名稱 | 內部的識別名稱. |
| `"amount"` | `float \| [float, float]` | 是 | 增減數值 | 增加或減少的數值大小. |
| `"operation"` | `enum` | 是 | 運算方式 | `addition`, `multiply_base`, 或 `multiply_total`. |
| `"slot"` | `enum \| array` | 是 | 裝備槽位 | 該屬性生效的部位 (如 `mainhand`, `head`). |

### 4.3 常用函數參數: copy_nbt

> 從來源 (實體或方塊) 複製 NBT 資料至物品.

| 子鍵值 (Sub-key) | 類型 | 必填 | 簡述 | 說明 |
| --- | --- | --- | --- | --- |
| `"source"` | `string \| object` | 是 | 數據來源 | 可為 `this`, `killer`, `block_entity` 或 `storage`. |
| `"ops"` | `array` | 是 | 操作清單 | 包含 `"source"` (來源路徑), `"target"` (目標路徑) 與 `"op"` (如 `replace`). |

---

## 5. 參數枚舉與可用值全清單 (Value Enumerations)

### 5.1 修改函數類型 (Functions)

| 參數值 (Value) | 簡述 | 完整遊戲行為說明與影響範圍 |
| --- | --- | --- |
| `minecraft:set_nbt` | 設置 NBT | 直接覆寫或新增物品的 NBT 標籤 (支援 SNBT 格式). |
| `minecraft:set_name` | 設置名稱 | 修改物品的顯示名稱, 支援 JSON 文本組件. |
| `minecraft:set_lore` | 設置敘述 | 修改或追加物品的說明文字 (Lore). |
| `minecraft:set_count` | 設置數量 | 更改物品堆疊的數量 (1-64). |
| `minecraft:set_damage` | 設置損壞 | 修改工具或盔甲的損壞值 (耐久度). |
| `minecraft:copy_nbt` | 複製 NBT | 從外部對象動態獲取 NBT 並寫入物品. |
| `minecraft:set_attributes` | 設置屬性 | 動態賦予物品屬性加成 (如攻擊速度、最大生命). |
| `minecraft:enchant_randomly` | 隨機附魔 | 為物品施加一項該物品適用的隨機附魔. |
| `minecraft:enchant_with_levels` | 等級附魔 | 模擬附魔台在指定等級範圍下進行附魔. |
| `minecraft:furnace_smelt` | 熔爐燒煉 | 將物品轉換為其在熔爐中燒煉後的結果. |
| `minecraft:set_potion` | 設置藥水 | 為藥水瓶、噴濺藥水或藥水箭設置特定效果類型. |

---

## 6. 數據約束與邊界條件 (Data Constraints)

* **數量限制**: `set_count` 的數值若超過該物品的最大堆疊數 (通常為 64), 可能導致在某些容器中顯示異常.
* **NBT 格式**: `set_nbt` 必須使用標準 SNBT 格式字串, 且須符合目標版本的標籤命名規範.
* **遞迴深度**: 若修飾器陣列嵌套過深, 可能導致執行效能下降.
* **指令權限**: `/item modify` 需要權限等級 2.

---

## 7. 外部連結 (References)

* [Misode Data Pack Generators - Item Modifier](https://misode.github.io/item-modifier/)
* [Minecraft Wiki - Loot Function](https://zh.minecraft.wiki/)
* [物品 NBT 矩陣 (Items)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.NBT/list.md)
* [JSON 文本元件 (Raw JSON Text Components)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/json_text.md)
* [物品欄位編號 (Slot IDs)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/Slot_IDs.md)
* [相關指令: /item](https://github.com/YuYue71/Minecraft_Commands/blob/main/.commands/item.md)