# 粒子特殊參數 (Particle Extra Arguments)

> **分類:** `全域系統` | **適用版本:** `JE ≤ 1.20.4`

---

## 目錄

* [核心結構](#核心結構-core-structure)
* [屬性說明](#屬性說明-attributes)
    * [方塊與物品類參數](#方塊與物品類參數)
    * [色彩與灰塵類參數](#色彩與灰塵類參數)
    * [幽匿與震動類參數](#幽匿與震動類參數)
* [外部連結](#外部連結-references)

---

## 核心結構 (Core Structure)

```text
/particle <particle_id> <extra_arguments> ...

```

* 用於 `/particle` 指令中. 多數粒子不需要額外引數 (Extra Arguments), 但部分特殊粒子強制要求在粒子 ID 後方立刻接續專屬參數, 否則指令將無法執行.

| 屬性 / 欄位 | 類型 | 預設 | 說明 |
| --- | --- | --- | --- |
| `<particle_id>` | `string` | - | 粒子的命名空間識別碼 (如 `minecraft:dust`) |
| `<extra_arguments>` | `arguments` | - | 依據粒子不同而變化的專屬必填參數 (見下方列表) |

---

## 屬性說明 (Attributes)

### `方塊與物品類參數`

> 需要指定具體方塊狀態或物品資料的粒子. 格式比照 `/setblock` 或 `/give`.

| 粒子 ID | 附加參數格式 | 說明與範例 |
| --- | --- | --- |
| `block` | `<block_state>` | 方塊破壞時產生的碎屑. 範例: `block minecraft:stone[facing=north]` |
| `block_marker` | `<block_state>` | 標記方塊的懸浮圖示 (如屏障方塊, 光明方塊顯示的圖案). 範例: `block_marker minecraft:barrier` |
| `falling_dust` | `<block_state>` | 類似受重力掉落的方塊粉塵 (如沙子掉落時的底層粉塵). 範例: `falling_dust minecraft:sand` |
| `item` | `<item_stack>` | 物品破壞或進食時產生的碎屑. 支援 NBT 標籤. 範例: `item minecraft:apple{CustomModelData:1}` |

---

### `色彩與灰塵類參數`

> 允許完全自訂 RGB 顏色與尺寸的粉塵粒子. RGB 值必須在 0.0 到 1.0 之間.

| 粒子 ID | 附加參數格式 | 說明與範例 |
| --- | --- | --- |
| `dust` | `<r> <g> <b> <size>` | 靜態顏色的紅石粉塵. `<size>` 預設紅石大小為 1.0. 範例: `dust 1.0 0.0 0.0 1.5` (紅色, 放大 1.5 倍) |
| `dust_color_transition` | `<r> <g> <b> <size> <to_r> <to_g> <to_b>` | 會隨時間漸變為另一種顏色的粉塵. 範例: `dust_color_transition 1.0 0.0 0.0 1.0 0.0 0.0 1.0` (由紅色漸變為藍色) |

---

### `幽匿與震動類參數`

> 1.19 版本新增的幽匿 (Sculk) 相關機制粒子, 具備延遲或目的地屬性.

| 粒子 ID | 附加參數格式 | 說明與範例 |
| --- | --- | --- |
| `vibration` | `<x> <y> <z> <ticks>` | 震動波向目的地傳遞的粒子. 需指定目標座標與到達時間 (遊戲刻). 範例: `vibration 10 20 30 20` (花費 20 刻飛向座標) |
| `shriek` | `<delay>` | 幽匿尖嘯體發出的環狀音波粒子. 指定產生前的延遲刻數. 範例: `shriek 10` (延遲 10 刻後顯示) |
| `sculk_charge` | `<roll>` | 幽匿充能粒子的滾動角度 (以弧度 Radians 為單位). 範例: `sculk_charge 1.57` (旋轉約 90 度) |

---

## 外部連結 (References)

* [Minecraft Wiki - 粒子](https://minecraft.fandom.com/zh/wiki/%E7%B2%92%E5%AD%90?variant=zh-tw)