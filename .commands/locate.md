# /locate

> **分類:** `指令` | **權限等級:** `2` | **適用版本:** `JE ≤ 1.20.4` | **命令方塊:** `true`

---

## 目錄

* [語法](#語法-syntax)
* [參數說明](#參數說明-parameters)
    * [目標類型 (structure, biome, poi)](#目標類型-structure-biome-poi)
    * [structure](#structure)
    * [biome](#biome)
    * [poi](#poi)
* [原版興趣點 (POI) 清單](#原版興趣點-poi-清單)
* [外部連結](#外部連結-references)

---

## 語法 (Syntax)

```commands
/locate structure <structure>
/locate biome <biome>
/locate poi <poi>
```

* `<>` = 必填

| 參數 / 欄位 | 類型 | 預設 | 說明 |
| --- | --- | --- | --- |
| `structure` / `biome` / `poi` | `enum` | - | 欲尋找的目標類型 |
| `<structure>` | `string` | - | 欲尋找的特定世界結構 ID 或標籤 |
| `<biome>` | `string` | - | 欲尋找的特定生態域 ID 或標籤 |
| `<poi>` | `string` | - | 欲尋找的特定興趣點 (Point of Interest) ID 或標籤 |

---

## 參數說明 (Parameters)

### `目標類型 (structure, biome, poi)`

> 決定系統要搜尋的地圖元素種類.

| 值 | 說明 |
| --- | --- |
| `structure` | 尋找世界生成的特定大型建築或遺跡. |
| `biome` | 尋找特定的自然生態區域. |
| `poi` | 尋找特定的興趣點 (Points of Interest), 通常與村民工作站, 傳送門或特定方塊相關. |

---

### `structure`

> 指定要定位的結構名稱.

* 必須輸入標準的結構資源位置 (如 `minecraft:village_plains`).
* 支援使用結構標籤 (如 `#minecraft:village` 會尋找距離最近的任何類型村莊).
* 系統會在三維空間中尋找距離執行者最近的該結構, 並在聊天框回傳該結構的絕對座標. 點擊該座標可自動將 `/tp` 指令輸入至聊天框中.

---

### `biome`

> 指定要定位的生態域名稱.

* 必須輸入標準的生態域資源位置 (如 `minecraft:desert`).
* 支援使用生態域標籤 (如 `#minecraft:is_forest` 會尋找最近的任何森林).
* 指令會在垂直與水平方向上進行立體搜尋, 找出最近的該生態域邊界座標.

---

### `poi`

> 指定要定位的興趣點名稱.

* 必須輸入標準的 POI 資源位置 (如 `minecraft:nether_portal`).
* 興趣點通常是單一方塊, 但在遊戲底層機制中具有特殊意義 (例如村民綁定的床位或工作台).
* 同樣支援使用標籤 (如 `#minecraft:villager_jobs` 可尋找最近的任何村民工作站).

---

## 原版興趣點 (POI) 清單

> 適用於 `/locate poi` 的參數. (不包含於外部連結清單, 屬此指令專用資源).

### 村民工作站與聚落 (Villager Jobs & Settlements)

| POI ID | 對應方塊 / 說明 | POI ID | 對應方塊 / 說明 |
| --- | --- | --- | --- |
| `armorer` | 高爐 (盔甲匠) | `butcher` | 煙燻爐 (屠夫) |
| `cartographer` | 製圖台 (製圖師) | `cleric` | 釀造台 (牧師) |
| `farmer` | 堆肥桶 (農夫) | `fisherman` | 木桶 (漁夫) |
| `fletcher` | 製箭台 (製箭師) | `leatherworker` | 煉藥鍋 (皮匠) |
| `librarian` | 講台 (圖書管理員) | `mason` | 切石機 (石匠) |
| `shepherd` | 織布機 (牧羊人) | `toolsmith` | 鍛造台 (工具匠) |
| `weaponsmith` | 砂輪 (武器匠) | `home` | 床 (村民居住地) |
| `meeting` | 鐘 (村民集合點) |  |  |

### 其他特殊方塊 (Misc Special Blocks)

| POI ID | 說明 | POI ID | 說明 |
| --- | --- | --- | --- |
| `bee_nest` | 蜂巢 (自然生成) | `beehive` | 蜂箱 (玩家合成) |
| `nether_portal` | 地獄傳送門方塊 | `lodestone` | 磁石 |
| `lightning_rod` | 避雷針 |  |  |

---

## 外部連結 (References)

* [Minecraft Wiki - /locate](https://zh.minecraft.wiki/w/%E5%91%BD%E4%BB%A4/locate?variant=zh-tw)
* [世界結構 ID (Structure IDs)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/Structure_IDs.md)
* [生態域 ID (Biome IDs)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/Biome_IDs.md)