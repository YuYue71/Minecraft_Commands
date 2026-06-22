# 通用物品標籤 (Base Item Tags)

> **分類:** `NBT` | **適用版本:** `JE ≤ 1.20.4`

---

## 目錄

* [SNBT 結構](#snbt-結構-structure)
* [基本物品結構](#基本物品結構-item-stack-structure)
* [通用資料標籤](#通用資料標籤-common-data-tags)
  * [display 結構](#display-結構)
  * [Enchantments 結構](#enchantments-結構)
  * [AttributeModifiers 結構](#attributemodifiers-結構)
* [外部連結](#外部連結-references)

---

## SNBT 結構 (Structure)

```snbt
{
    id: "minecraft:diamond_sword",
    Count: 1b,
    tag: {
        Damage: 0,
        Unbreakable: 1b,
        CustomModelData: 100,
        display: {
            Name: '{"text":"傳說之劍","color":"gold","italic":false}',
            Lore: ['{"text":"攻擊力極高","color":"gray"}']
        },
        Enchantments: [
            {id: "minecraft:sharpness", lvl: 5s}
        ],
        AttributeModifiers: [
            {AttributeName: "generic.attack_damage", Name: "generic.attack_damage", Amount: 10.0, Operation: 0, UUID: [I; 1, 2, 3, 4], Slot: "mainhand"}
        ],
        HideFlags: 7,
        CanDestroy: ["minecraft:stone", "minecraft:cobblestone"]
    }
}

```

* SNBT 格式, 適用於 `/give`, `/item`, `/clear` 指令, 或作為實體/方塊實體內的 `Items` 陣列元素.
* 1.20.4 及之前版本中, 物品的自訂數據全數包覆於 `tag:{}` 複合標籤內 (1.20.5 起已重構為組件系統).

---

## 基本物品結構 (Item Stack Structure)

> 定義一個物品堆疊的最外層基礎屬性.

| 標籤 (Tag) | 類型 | 預設 | 說明 |
| --- | --- | --- | --- |
| `id` | `string` | - | 必填. 物品的資源位置 (如 `minecraft:apple`) |
| `Count` | `byte` | `1b` | 必填. 物品的堆疊數量 (通常上限為 64) |
| `tag` | `compound` | `{}` | 選填. 儲存該物品所有額外屬性與自訂資料的複合標籤 (見下方說明) |

---

## 通用資料標籤 (Common Data Tags)

> 存在於 `tag:{}` 內部, 適用於遊戲中絕大多數物品的通用修飾標籤.

| 標籤 (Tag) | 類型 | 預設 | 說明 |
| --- | --- | --- | --- |
| `Damage` | `int` | `0` | 物品已消耗的耐久度. 數值越高, 耐久度條越短. 僅對具備耐久度的工具或裝備有效 |
| `Unbreakable` | `byte` | `0b` | 是否無法破壞 (`1b`=是). 開啟後物品將不會消耗耐久度 |
| `CustomModelData` | `int` | - | 自訂模型數據. 用於配合資源包 (Resource Pack) 替換特定數值物品的材質與模型 |
| `RepairCost` | `int` | `0` | 在鐵砧中進行修補或附魔的累積懲罰經驗等級. 每次操作會倍增, 超過 39 級會顯示「過於昂貴!」 |
| `HideFlags` | `int` | `0` | 使用位元遮罩 (Bitmask) 隱藏物品提示框 (Tooltip) 上的特定資訊. (1=附魔, 2=屬性, 4=無法破壞, 8=可破壞方塊, 16=可放置在, 32=其他如藥水效果, 64=皮革染色, 128=盔甲紋飾). 若要隱藏多個, 將數值相加即可 (如填 `7` 可隱藏附魔, 屬性與無法破壞字樣) |
| `CanDestroy` | `list` | `[]` | 冒險模式 (Adventure) 下, 此物品允許挖掘的方塊清單. 內部為字串陣列 (如 `["minecraft:stone"]`) |
| `CanPlaceOn` | `list` | `[]` | 冒險模式下, 此方塊物品允許放置在其上方的方塊清單 |
| `display` | `compound` | - | 處理物品名稱, 描述與顏色的複合結構 (見下方) |
| `Enchantments` | `list` | `[]` | 物品所擁有的附魔陣列 (見下方) |
| `AttributeModifiers` | `list` | `[]` | 覆寫物品基礎屬性的修改器陣列 (見下方) |

---

### `display` 結構

> 覆寫物品的顯示名稱與敘述文字.

| 子標籤 | 類型 | 預設 | 說明 |
| --- | --- | --- | --- |
| `Name` | `string` | - | 物品自訂名稱. 必須為 JSON 文本格式 (如 `'{"text":"自訂名稱"}'`). 建議加上 `"italic":false` 消除預設的斜體 |
| `Lore` | `list` | `[]` | 物品的敘述文字(傳說). 包含多個字串的陣列, 每一個字串代表一行, 皆須為 JSON 文本格式 |
| `color` | `int` | - | 僅限皮革防具: 染色的十進位 RGB 顏色代碼 |

---

### `Enchantments` 結構

> 用於工具, 武器與防具的常規附魔 (若為附魔書, 則使用 `StoredEnchantments` 標籤).

| 子標籤 | 類型 | 預設 | 說明 |
| --- | --- | --- | --- |
| `id` | `string` | - | 必填. 附魔類型的資源位置 (如 `minecraft:sharpness`) |
| `lvl` | `short` | `1s` | 必填. 附魔等級 (最高支援至 255s) |

---

### `AttributeModifiers` 結構

> 修改玩家手持或裝備該物品時所獲得的屬性加成 (如增加血量, 跑速, 攻擊力).

| 子標籤 | 類型 | 預設 | 說明 |
| --- | --- | --- | --- |
| `AttributeName` | `string` | - | 必填. 要修改的屬性 ID (如 `generic.max_health`) |
| `Name` | `string` | - | 必填. 此修改器的自訂名稱 (常規下填寫與 AttributeName 相同即可) |
| `Slot` | `string` | `"any"` | 裝備於哪個欄位時生效 (可選: `mainhand`, `offhand`, `head`, `chest`, `legs`, `feet`. 省略則代表任何欄位) |
| `Operation` | `int` | `0` | 必填. 運算模式. `0`=直接加減數值, `1`=依據基礎值做乘法(累加), `2`=依據總值做乘法(疊乘) |
| `Amount` | `double` | - | 必填. 要修改的數值量 |
| `UUID` | `int_array` | - | 必填. 此修改器的唯一識別碼. 陣列內需包含 4 個隨機整數 (如 `[I; 1, 2, 3, 4]`). 若玩家同時裝備多個相同 UUID 的修改器, 只有一個會生效 |

---

## 外部連結 (References)

* [Minecraft Wiki - 物品格式](https://zh.minecraft.wiki/w/%E7%89%A9%E5%93%81%E6%A0%BC%E5%BC%8F?variant=zh-tw)
* [JSON 文本元件 (Raw JSON Text Components)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/json_text.md)
* [資源位置與命名空間規範 (Resource Locations)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/ResourceLocations.md)
* [方塊狀態與標籤 (Block States & Tags)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/BlockStates_or_Tags.md)
* [附魔類型 ID (Enchantments)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/Enchantments.md)