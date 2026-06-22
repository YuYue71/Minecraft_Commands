# NBT 數據矩陣主目錄 (NBT Data Matrix Index)

> **分類:** `目錄` | **適用版本:** `JE ≤ 1.20.4`

---

## 實體 NBT 矩陣 (Entities)

> 遊戲內所有活動物件與生物的數據. 適用於 `/summon`, `/data modify entity`.

| 類別 | 說明 |
| --- | --- |
| [`通用實體與活體生物 (Base & Living Entities)`](entities/base_living.md) | 所有實體共用的底層參數與生命, 屬性狀態 |
| [`特定生物與物件專屬 (Specific Mobs & Objects)`](entities/specific_mobs.md) | 各別生物與非生物物件獨有的特殊邏輯 (如村民交易, 苦力怕爆炸, 盔甲座姿勢) |

---

## 方塊實體 NBT 矩陣 (Block Entities)

> 具備額外數據儲存能力的特殊方塊. 適用於 `/setblock`, `/data modify block`.

| 類別 | 說明 |
| --- | --- |
| [`容器與庫存 (Containers)`](blocks/containers.md) | 具備多格庫存或戰利品機制的容器 (如箱子, 熔爐, 漏斗, 講台) |
| [`邏輯與機制 (Logic & Mechanics)`](blocks/logic.md) | 處理遊戲底層邏輯與自動化運作的方塊 (如指令方塊, 生怪磚, 結構方塊) |
| [`視覺與裝飾 (Visual & Decor)`](blocks/visual.md) | 用於儲存外觀, 圖案與文字資料的方塊 (如告示牌, 旗幟, 玩家頭顱, 飾紋陶罐) |

---

## 物品 NBT 矩陣 (Items)

> 物品欄位中單一物品堆疊的數據. 適用於 `/give`, `/item`, `/clear` 或容器的 `Items` 陣列.

| 類別 | 說明 |
| --- | --- |
| [`通用物品標籤 (Base Item Tags)`](items/base_tags.md) | 物品堆疊基礎屬性, 顯示名稱, 敘述, 附魔與屬性修改器 |
| [`特定物品專屬 (Specific Items)`](items/specific_items.md) | 特殊物品內部結構 (如藥水, 書本, 煙火, 地圖, 弩, 裝備紋飾, 方塊資料包裝) |

---

## 外部連結 (References)

* [Minecraft Wiki - NBT格式](https://minecraft.fandom.com/zh/wiki/NBT%E6%A0%BC%E5%BC%8F?variant=zh-tw)