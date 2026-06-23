# /fill

> **分類:** `指令` | **權限等級:** `2` | **適用版本:** `JE ≤ 1.20.4` | **命令方塊:** `true`

---

## 目錄

* [語法](#語法-syntax)
* [參數說明](#參數說明-parameters)
    * [from 與 to](#from-與-to)
    * [block](#block)
    * [填充模式 (Fill Modes)](#填充模式-fill-modes)
    * [filter](#filter)
* [外部連結](#外部連結-references)

---

## 語法 (Syntax)

```commands
/fill <from> <to> <block>
/fill <from> <to> <block> <destroy|hollow|keep|outline|replace>
/fill <from> <to> <block> replace <filter>

```

* `<>` = 必填, `|` = 二擇一

| 參數 / 欄位 | 類型 | 預設 | 說明 |
| --- | --- | --- | --- |
| `<from>` | `vec3` | - | 欲填充區域的起始對角座標 |
| `<to>` | `vec3` | - | 欲填充區域的結束對角座標 |
| `<block>` | `block_state` | - | 欲填入的目標方塊 ID (可包含狀態與 NBT) |
| `<destroy|hollow|keep|outline|replace>` | `enum` | `replace` | 處理區域內原有方塊的運作模式 |
| `<filter>` | `block_predicate` | 所有方塊 | 在 replace 模式下, 欲被替換的特定方塊條件 |

---

## 參數說明 (Parameters)

### `from` 與 `to`

> 定義要進行填充操作的三維空間範圍.

* `<from>` 與 `<to>` 定義了一個長方體區域. 這兩個座標為長方體的對角線頂點, 誰先誰後不影響實際框選的體積.
* 預設情況下, 單次指令框選的最大體積上限為 32768 個方塊 (可透過遊戲規則 `commandModificationBlockLimit` 進行更改).
* 支援絕對座標與相對座標 (`~`, `^`).

---

### `block`

> 指定欲用來填滿該區域的方塊種類.

* 必須輸入標準的方塊資源位置 (如 `minecraft:stone`).
* 支援附加方塊狀態 (Block States) 來精確控制方塊外觀與朝向, 例如 `minecraft:oak_stairs[facing=east,half=top]`.
* 支援附加方塊實體 NBT 標籤 (Block Entity Data), 允許直接生成內部裝有特定物品的容器, 例如 `minecraft:chest{Items:[{Slot:0b,id:"minecraft:diamond",Count:64b}]}`.

---

### `填充模式 (Fill Modes)`

> 決定新方塊填入時, 如何處理區域內原本就存在的方塊.

| 值 | 說明 |
| --- | --- |
| `replace` | (預設值) 強制替換區域內的所有方塊. 若後方未接續 `<filter>` 參數, 則無差別覆蓋所有東西. |
| `keep` | 僅替換區域內的「空氣」方塊. 原本存在的任何實體方塊 (如石頭, 樹木, 建築) 都會被保留而不受破壞. |
| `destroy` | 替換所有方塊, 且原有的方塊會如同被玩家挖掘一般「掉落為實體物品」與經驗值, 同時觸發方塊破壞的音效與粒子效果. |
| `hollow` | 將區域的最外層邊框替換為目標方塊, 並將區域內部的所有方塊強制清空為「空氣」, 形成一個空心外殼. 內部原有的方塊會直接消失, 不會掉落. |
| `outline` | 將區域的最外層邊框替換為目標方塊, 但完全保留區域內部原有的方塊狀態不變. |

---

### `filter`

> 僅在 `replace` 模式下可用, 用於精準過濾要被替換的對象.

* 允許指定一個特定的方塊 (如 `minecraft:water`) 或方塊標籤 (如 `#minecraft:logs`).
* 執行時, 系統只會挑選區域內符合此 `<filter>` 條件的方塊進行替換, 其餘方塊原封不動. 常用於將某種特定的礦石或地形批量替換成另一種材質 (例如 `/fill ~-10 ~-10 ~-10 ~10 ~10 ~10 minecraft:air replace minecraft:water` 將附近的水全部抽乾).

---

## 外部連結 (References)

* [Minecraft Wiki - /fill](https://zh.minecraft.wiki/w/%E5%91%BD%E4%BB%A4/fill)
* [座標系統 (Coordinate Systems)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/coordinates.md)
* [方塊狀態與標籤 (Block States & Tags)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/BlockStates_or_Tags.md)
* [資源位置與命名空間規範 (Resource Locations)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/ResourceLocations.md)
* [方塊實體 NBT 矩陣 (Block Entities)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.NBT/list.md)