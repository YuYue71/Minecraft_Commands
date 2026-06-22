# 容器與庫存方塊實體 NBT (Container Block Entities NBT)

> **分類:** `NBT` | **適用版本:** `JE ≤ 1.20.4`

---

## 目錄

* [SNBT 結構](#snbt-結構-structure)
* [通用方塊實體標籤](#通用方塊實體標籤-base-block-entity-tags)
* [通用容器標籤](#通用容器標籤-common-container-tags)
    * [Items 結構](#items-結構)
* [特定容器專屬標籤](#特定容器專屬標籤-specific-container-tags)
* [外部連結](#外部連結-references)

---

## SNBT 結構 (Structure)

```snbt
{
    id: "minecraft:chest",
    x: 10,
    y: 64,
    z: -20,
    CustomName: '{"text":"寶藏箱","color":"gold"}',
    Lock: "Key123",
    Items: [
        {Slot: 13b, id: "minecraft:diamond", Count: 64b, tag: {}}
    ]
}

```

* SNBT 格式, 適用於 `/setblock`, `/data get/merge/modify block` 指令.
* 涵蓋具備物品儲存能力的方塊: 箱子, 陷阱箱, 終界箱 (僅對應方塊本身, 內容物綁定玩家), 潛影盒, 漏斗, 投擲器, 發射器, 桶子, 熔爐類, 釀造台, 營火, 講台, 唱片機.

---

## 通用方塊實體標籤 (Base Block Entity Tags)

> 所有方塊實體 (Block Entity) 皆具備的最底層基礎屬性.

| 標籤 (Tag) | 類型 | 預設 | 說明 |
| --- | --- | --- | --- |
| `id` | `string` | - | 方塊實體識別碼 (如 `minecraft:chest`). 在已放置的方塊上無法修改 |
| `x` | `int` | - | 方塊實體所在的絕對 X 座標 |
| `y` | `int` | - | 方塊實體所在的絕對 Y 座標 |
| `z` | `int` | - | 方塊實體所在的絕對 Z 座標 |
| `KeepPacked` | `byte` | `0b` | 設為 `1b` 時, 該方塊實體在未被玩家看見或互動前不會被打包或丟棄 (通常用於結構方塊生成時) |

---

## 通用容器標籤 (Common Container Tags)

> 具備多格庫存或戰利品機制的容器共用標籤.

| 標籤 (Tag) | 類型 | 預設 | 說明 |
| --- | --- | --- | --- |
| `Items` | `list` | `[]` | 儲存容器內所有物品的陣列, 內部為 Compound 結構 (見下方) |
| `CustomName` | `string` | - | 自訂名稱, 必須使用 JSON 文本元件的字串格式. 會顯示在開啟容器的 UI 介面頂部 |
| `Lock` | `string` | - | 上鎖密碼. 若設定此標籤 (如 `"Key123"`), 玩家手持物品名稱必須完全符合該字串才能開啟容器 |
| `LootTable` | `string` | - | 資源位置格式, 指定該容器首次開啟時生成的戰利品表 (如 `minecraft:chests/village/village_toolsmith`) |
| `LootTableSeed` | `long` | `0L` | 戰利品表的隨機種子碼. 若填 `0L` 則隨機生成. 只要存在 `LootTable` 標籤, `Items` 陣列將被忽略直到玩家開啟 |

---

### `Items` 結構

> 定義容器內特定欄位的物品數據.

| 子標籤 | 類型 | 預設 | 說明 |
| --- | --- | --- | --- |
| `Slot` | `byte` | - | 必填. 物品所在的欄位編號 (索引範圍依容器大小而異, 如漏斗 0-4, 箱子 0-26) |
| `id` | `string` | - | 必填. 物品的資源位置 (如 `minecraft:stone`) |
| `Count` | `byte` | `1b` | 必填. 物品堆疊數量 |
| `tag` | `compound` | `{}` | 選填. 物品本身的額外 NBT 數據 (即物品 NBT 矩陣的內容) |

---

## 特定容器專屬標籤 (Specific Container Tags)

| 容器類型 | 標籤 (Tag) | 類型 | 說明 |
| --- | --- | --- | --- |
| **熔爐 / 高爐 / 煙燻爐** | `BurnTime` | `short` | 當前燃料剩餘的燃燒刻數 |
|  | `CookTime` | `short` | 當前物品已燒煉的進度刻數 |
|  | `CookTimeTotal` | `short` | 燒煉當前物品所需的總刻數 (依配方而定) |
|  | `RecipesUsed` | `compound` | 記錄該熔爐燒煉過的配方識別碼與次數 (用於玩家拿取經驗值計算) |
| **釀造台** | `BrewTime` | `short` | 當前釀造進度的剩餘刻數 (400 到 0) |
|  | `Fuel` | `byte` | 剩餘的烈焰粉燃料次數 (0 到 20) |
| **營火 / 靈魂營火** | `CookingTimes` | `int_array` | 陣列包含 4 個整數, 記錄營火上 4 個位置物品的已烤製刻數 |
|  | `CookingTotalTimes` | `int_array` | 陣列包含 4 個整數, 記錄營火上 4 個位置物品所需的總烤製刻數 |
| **講台** | `Book` | `compound` | 放置於講台上的書本物品 NBT (必須為書本或成書) |
|  | `Page` | `int` | 當前翻閱的頁碼 (從 0 開始計算) |
| **唱片機** | `RecordItem` | `compound` | 放置於唱片機內的音樂唱片物品 NBT |
|  | `IsPlaying` | `byte` | 唱片是否正在播放 (`1b`=是) |

---

## 外部連結 (References)

* [Minecraft Wiki - 區塊格式](https://minecraft.fandom.com/zh/wiki/%E5%8C%BA%E5%9D%97%E6%A0%BC%E5%BC%8F?variant=zh-tw)
* [JSON 文本元件 (Raw JSON Text Components)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/json_text.md)
* [物品欄位編號 (Slot IDs)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/Slot_IDs.md)
* [資源位置與命名空間規範 (Resource Locations)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/ResourceLocations.md)