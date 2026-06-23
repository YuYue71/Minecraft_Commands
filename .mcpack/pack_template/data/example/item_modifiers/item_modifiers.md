# item_modifiers (物品修飾器)

> **分類:** `資料包元素` | **檔案格式:** `json` | **命名空間支援:** `true` | **熱重載:** `/reload`

---

## 目錄

* [目錄路徑](#目錄路徑-directory--path)
* [核心結構](#核心結構-core-structure)
* [節點說明](#節點說明-node-explanations)
    * [function (修改函數)](#function)
    * [conditions (判斷條件)](#conditions-array)
* [原版修飾函數 (Functions) 窮舉清單](#原版修飾函數-functions-窮舉清單)
* [外部連結](#外部連結-references)

---

## 目錄路徑 (Directory & Path)

> 物品修飾器檔案用於定義如何變更物品的屬性 (如 NBT, 數量, 附魔), 常與 `/item modify` 指令配合使用.

```file
data/<namespace>/item_modifiers/[子資料夾]/<檔案名稱>.json
```

* `<namespace>` = 命名空間 (如 `minecraft`, `example`)
* `[子資料夾]` = 開發者自訂的分類目錄 (選填)
* `<檔案名稱>` = 決定該修飾器的 ID 名稱
* 遊戲內調用格式為: `<namespace>:[子資料夾]/<檔案名稱>` (例如 `example:sharpen_blade`)

---

## 核心結構 (Core Structure)

> 修飾器可以是單一函數物件, 也可以是多個函數組成的陣列.

```json
{
    "function": "minecraft:set_name",
    "entity": "this",
    "name": {"text": "傳奇之劍", "color": "gold"},
    "conditions": [
        {
            "condition": "minecraft:random_chance",
            "chance": 0.5
        }
    ]
}
```

| 鍵值 / 節點 (Key) | 類型 | 必填 | 說明 |
| --- | --- | --- | --- |
| `"function"` | `string` | 是 | 指定物品修改函數的類型 ID |
| `"conditions"` | `array` | 否 | 決定此修飾器是否執行的條件列表 |

---

## 節點說明 (Node Explanations)

### `function`

> 定義對物品進行何種操作. 具體參數視函數類型而定.

| 屬性 | 說明 |
| --- | --- |
| `類型` | 必須為有效的原版戰利品函數 ID (詳見下表). |
| `參數` | 根據不同的 `"function"` 類型, 需填入對應的控制節點. |

---

### `conditions (Array)`

> 用於過濾此修飾器的生效時機.

| 子節點 (Sub-key) | 類型 | 必填 | 說明 |
| --- | --- | --- | --- |
| `"condition"` | `string` | 是 | 條件類型 ID (如 `minecraft:entity_properties`) |
| `...` | `mixed` | 否 | 該條件所需的特定參數 |

---

## 原版修飾函數 (Functions) 窮舉清單

### NBT 與屬性類

| ID | 說明 |
| --- | --- |
| `minecraft:set_nbt` | 直接設置物品的 NBT 標籤. |
| `minecraft:copy_nbt` | 從實體或區塊複製 NBT 到物品. |
| `minecraft:set_name` | 設置物品的顯示名稱. |
| `minecraft:set_lore` | 設置或添加物品的說明文字 (Lore). |
| `minecraft:set_attributes` | 設置物品的屬性修飾符 (如攻擊力, 速度). |
| `minecraft:set_components` | (1.20.5+) 修改物品組件資料. |

### 狀態與數值類

| ID | 說明 |
| --- | --- |
| `minecraft:set_count` | 設置物品的堆疊數量. |
| `minecraft:set_damage` | 設置物品的損壞值 (耐久度). |
| `minecraft:set_enchantments` | 設置物品的附魔列表. |
| `minecraft:enchant_randomly` | 為物品施加隨機附魔. |
| `minecraft:enchant_with_levels` | 根據等級範圍為物品施加隨機附魔. |
| `minecraft:furnace_smelt` | 將物品轉化為其燒煉後的結果. |

### 複合與特殊類

| ID | 說明 |
| --- | --- |
| `minecraft:sequence` | 按順序執行多個子函數. |
| `minecraft:filtered` | 僅當符合條件時才執行子函數. |
| `minecraft:set_stew_effect` | 為謎樣燉湯設置狀態效果. |
| `minecraft:set_potion` | 為藥水設置類型. |

---

## 外部連結 (References)

* [Minecraft Wiki - Item Modifier](https://minecraft.fandom.com/zh/wiki/%E7%89%A9%E5%93%81%E4%BF%AE%E9%A5%B0%E5%99%A8?variant=zh-hk)
* [Misode Data Pack Generators - Item Modifier](https://misode.github.io/item-modifier/)
* [資源位置與命名空間規範 (Resource Locations)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/ResourceLocations.md)
* [物品 NBT 矩陣 (Items)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.NBT/list.md)
* [JSON 文本元件 (Raw JSON Text Components)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/json_text.md)
* [物品修改指令 (item)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.commands/item.md)