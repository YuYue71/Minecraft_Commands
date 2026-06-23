# /enchant

> **分類:** `指令` | **權限等級:** `2` | **適用版本:** `JE ≤ 1.20.4` | **命令方塊:** `true`

---

## 目錄

* [語法](#語法-syntax)
* [參數說明](#參數說明-parameters)
    * [targets](#targets)
    * [enchantment](#enchantment)
    * [level](#level)
* [外部連結](#外部連結-references)

---

## 語法 (Syntax)

```commands
/enchant <targets> <enchantment> [level]

```

* `<>` = 必填, `[]` = 選填

| 參數 / 欄位 | 類型 | 預設 | 說明 |
| --- | --- | --- | --- |
| `<targets>` | `entity` | - | 欲進行附魔的目標玩家或實體 |
| `<enchantment>` | `string` | - | 欲賦予的附魔類型 ID |
| `[level]` | `int` | `1` | 欲賦予的附魔等級 |

---

## 參數說明 (Parameters)

### `targets`

> 決定要為誰手持的物品加上附魔.

* 目標實體 (通常為玩家) 必須在主手 (Main Hand) 持有可接受該附魔的物品.
* 支援使用目標選擇器 (如 `@p`, `@a`, `@e`).
* 若目標未手持任何物品, 或手持的物品與該附魔類型不相容 (例如嘗試將鋒利附魔在鎬上), 則指令將會執行失敗.

---

### `enchantment`

> 指定欲賦予的附魔種類.

* 必須輸入標準的附魔資源位置 (如 `minecraft:sharpness`).
* 與 `/give` 搭配 NBT 直接給予超規格裝備的狀況不同, `/enchant` 會嚴格檢查並遵守遊戲常規生存模式的附魔規則.
* 包含附魔衝突機制 (如無限與修補無法共存) 與物品適用性皆無法透過此指令強制繞過. 若目標物品已有互相衝突的附魔, 指令會直接報錯失敗.

---

### `level`

> 設定該附魔的等級數值.

* 允許輸入一個大於 `0` 的有效整數.
* 設定的數值不能超過該附魔在常規生存模式下允許的最高等級上限 (例如鋒利最高限制為 `5`, 掠奪最高限制為 `3`).
* 若不填寫此參數, 系統預設會給予等級 `1` 的附魔.
* 若有特殊需求想突破原版等級上限 (如產生鋒利 `1000` 的鑽石劍), 必須改用 `/give` 配合 NBT 標籤生成物品, 或是使用 `/data` 修改實體的背包數據, 無法單靠 `/enchant` 達成.

---

## 外部連結 (References)

* [Minecraft Wiki - /enchant](https://zh.minecraft.wiki/w/%E5%91%BD%E4%BB%A4/enchant)
* [目標選擇器 (Target Selectors)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/TargetSelectors.md)
* [資源位置與命名空間規範 (Resource Locations)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/ResourceLocations.md)
* [附魔類型 ID (Enchantments)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/Enchantments.md)