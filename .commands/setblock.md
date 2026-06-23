# `/setblock`

> **分類:** `指令` | **權限等級:** `2` | **適用版本:** `JE ≤ 1.20.4` | **命令方塊:** `true`

---

## 目錄

* [語法](#語法-syntax)
* [參數說明](#參數說明-parameters)
    * [pos](#pos)
    * [block](#block)
    * [放置模式 (Placement Modes)](#放置模式-placement-modes)
* [外部連結](#外部連結-references)

---

## 語法 (Syntax)

```commands
/setblock <pos> <block>
/setblock <pos> <block> <destroy|keep|replace>

```

* `<>` = 必填

| 參數 / 欄位 | 類型 | 預設 | 說明 |
| --- | --- | --- | --- |
| `<pos>` | `vec3` | - | 欲放置方塊的三維座標 |
| `<block>` | `block_state` | - | 欲放置的目標方塊 ID (可包含狀態與 NBT) |
| `<destroy|keep|replace>` | `enum` | `replace` | 處理目標座標上原有方塊的運作模式 |

---

## 參數說明 (Parameters)

### `pos`

> 指定要更改為新方塊的確切位置.

* 包含三個軸向 (X, Y, Z) 的座標數值.
* 支援絕對座標與相對座標 (`~`, `^`). 系統會自動將座標對齊至該點所在的方塊網格 (整數座標).

---

### `block`

> 指定欲放置的方塊種類.

* 必須輸入標準的方塊資源位置 (如 `minecraft:stone`).
* 支援附加方塊狀態 (Block States) 來精確控制方塊外觀與朝向, 例如 `minecraft:chest[facing=east]`.
* 支援附加方塊實體 NBT 標籤 (Block Entity Data), 允許直接生成內部裝有特定物品或帶有特殊設定的容器, 例如 `minecraft:chest{Items:[{Slot:0b,id:"minecraft:diamond",Count:64b}]}`.

---

### `放置模式 (Placement Modes)`

> 決定新方塊放置時, 要如何處理該座標上原本就存在的方塊.

| 值 | 說明 |
| --- | --- |
| `replace` | (預設值) 強制替換該座標上的原有方塊. 原有方塊會直接消失, 不會掉落任何物品. |
| `keep` | 僅替換「空氣」方塊. 若該座標上已經存在任何實體方塊 (包含水或岩漿等流體), 指令將會執行失敗並保留原有方塊不變. |
| `destroy` | 強制替換該座標上的原有方塊. 原有方塊會如同被玩家空手破壞一般「掉落為實體物品」與經驗值 (若符合掉落條件), 同時觸發方塊碎裂的音效與粒子效果. |

---

## 外部連結 (References)

* [Minecraft Wiki - /setblock](https://www.google.com/search?q=%23)
* [座標系統 (Coordinate Systems)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/coordinates.md)
* [方塊狀態與標籤 (Block States & Tags)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/BlockStates_or_Tags.md)
* [資源位置與命名空間規範 (Resource Locations)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/ResourceLocations.md)
* [方塊實體 NBT 矩陣 (Block Entities)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.NBT/list.md)