# 方塊狀態與標籤 (Block States & Tags)

> **分類:** `全域系統` | **適用版本:** `JE ≤ 1.20.4`

---

## 目錄

* [核心結構](#核心結構-core-structure)
* [屬性說明](#屬性說明-attributes)
    * [常見方塊狀態](#常見方塊狀態)
    * [標籤與集合](#標籤與集合)
* [外部連結](#外部連結-references)

---

## 核心結構 (Core Structure)

```text
<namespace>:<block_id>[state1=value1,state2=value2]
#<namespace>:<tag_id>[state1=value1]

```

* 用於 `/setblock`, `/fill`, `/clone`, `/execute if block` 等指令中精確指定方塊的物理狀態或類型集合.

| 屬性 / 欄位 | 類型 | 預設 | 說明 |
| --- | --- | --- | --- |
| `<namespace>` | `string` | `minecraft` | 命名空間, 原版方塊可省略 `minecraft:` |
| `<block_id>` | `string` | - | 單一方塊的明確識別碼 (如 `stone`, `oak_stairs`) |
| `#<tag_id>` | `string` | - | 方塊標籤識別碼, 代表一組方塊的集合 (如 `#planks`) |
| `[state=value]` | `arguments` | - | 附加的方塊狀態條件, 以逗號分隔. 未指定的狀態將採用該方塊的預設值 |

---

## 屬性說明 (Attributes)

### `常見方塊狀態`

> 不同方塊擁有的狀態鍵值各不相同, 以下列出跨方塊最常共用的基礎狀態參數.

| 值 / 範圍 | 說明 |
| --- | --- |
| `facing=<方向>` | 方塊朝向. 可填值: `north`, `south`, `east`, `west`, `up`, `down` (適用於樓梯, 活塞, 觀察者等) |
| `axis=<軸向>` | 方塊擺放軸向. 可填值: `x`, `y`, `z` (適用於原木, 柱子, 玄武岩等) |
| `waterlogged=<布林值>` | 是否含水. 可填值: `true`, `false` (適用於半磚, 樓梯, 柵欄, 告示牌等) |
| `lit=<布林值>` | 是否點燃/發光. 可填值: `true`, `false` (適用於熔爐, 紅石燈, 營火等) |
| `powered=<布林值>` | 是否被紅石充能. 可填值: `true`, `false` (適用於多數紅石元件) |
| `open=<布林值>` | 是否處於開啟狀態. 可填值: `true`, `false` (適用於門, 活板門, 柵欄門) |
| `half=<部位>` | 上下半部判定. 樓梯/活板門為 `top`, `bottom`; 門/高草叢為 `upper`, `lower` |
| `shape=<形狀>` | 連接形狀. 樓梯可為 `straight`, `inner_left`, `inner_right`, `outer_left`, `outer_right`; 鐵軌可為 `north_south`, `east_west`, `ascending_east` 等 |
| `age=<整數>` | 生長或衰退階段. 依方塊不同範圍不同 (如小麥為 `0..7`, 可可豆為 `0..2`, 火焰為 `0..15`, 海帶為 `0..25`) |

---

### `標籤與集合`

> 使用 `#` 開頭呼叫的群組定義, 可用於一次性篩選或替換多種同質性方塊. 以下列出常見的原版方塊標籤.

| 值 | 說明 |
| --- | --- |
| `#minecraft:planks` | 所有木材半磚, 樓梯, 柵欄的基礎材質 (包含所有樹種) |
| `#minecraft:logs` | 所有原木與去皮原木 |
| `#minecraft:leaves` | 所有樹葉 |
| `#minecraft:buttons` | 所有按鈕 (含木製與石製) |
| `#minecraft:doors` | 所有門 (含木製與鐵製) |
| `#minecraft:trapdoors` | 所有活板門 |
| `#minecraft:fences` | 所有木柵欄與地獄磚柵欄 |
| `#minecraft:walls` | 所有石牆, 磚牆, 泥磚牆 |
| `#minecraft:slabs` | 所有半磚 |
| `#minecraft:stairs` | 所有樓梯 |
| `#minecraft:beds` | 所有顏色的床 |
| `#minecraft:anvil` | 所有鐵砧 (包含損壞的鐵砧) |
| `#minecraft:campfires` | 所有營火 (含靈魂營火) |
| `#minecraft:signs` | 所有立式告示牌 |
| `#minecraft:wall_signs` | 所有牆上告示牌 |

---

## 外部連結 (References)

* [Minecraft Wiki - 方塊狀態](https://minecraft.fandom.com/zh/wiki/Java%E7%89%88%E6%95%B0%E6%8D%AE%E5%80%BC#%E6%96%B9%E5%9D%97%E7%8A%B6%E6%80%81)
* [Minecraft Wiki - 標籤](#)