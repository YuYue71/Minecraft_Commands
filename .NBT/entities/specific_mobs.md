# 特定生物與物件實體 NBT (Specific Mobs & Objects NBT)

> **分類:** `NBT` | **適用版本:** `JE ≤ 1.20.4`

---

## 目錄

* [SNBT 結構](#snbt-結構-structure)
* [被動與中立生物標籤](#被動與中立生物標籤-passive--neutral-mobs)
* [敵對生物標籤](#敵對生物標籤-hostile-mobs)
* [載具與非生物物件標籤](#載具與非生物物件標籤-vehicles--objects)
  * [展示實體 (Display Entities) 結構](#展示實體-display-entities-結構)
* [技術與特殊實體標籤](#技術與特殊實體標籤-technical--misc)
* [外部連結](#外部連結-references)

---

## SNBT 結構 (Structure)

```snbt
{
    id: "minecraft:villager",
    VillagerData: {profession: "minecraft:librarian", level: 2},
    Offers: {
        Recipes: [
            {buy: {id: "minecraft:emerald", Count: 1b}, sell: {id: "minecraft:book", Count: 1b}, maxUses: 12}
        ]
    }
}
```

---

## 被動與中立生物標籤 (Passive & Neutral Mobs)

| 生物類型 | 標籤 (Tag) | 類型 | 說明 |
| --- | --- | --- | --- |
| **可繁殖動物** | `Age` | `int` | 負值為幼年, 0 為成年, 正值為繁殖冷卻 |
| **村民** | `VillagerData` | `compound` | 包含 `profession` (職業), `level` (等級), `type` (群系) |
|  | `Offers` | `compound` | 交易清單 (包含 `Recipes` 陣列) |
| **馬 / 駱駝** | `Tame` | `byte` | 是否已馴服 |
|  | `Variant` | `int` | 外觀變種代碼 |
| **羊** | `Color` | `byte` | 羊毛顏色 (0-15) |
| **史萊姆** | `Size` | `int` | 體型大小 (0 為最小) |
| **蜜蜂** | `HasNectar` | `byte` | 是否攜帶花粉 |
|  | `HasStung` | `byte` | 是否已攻擊過 (蜇人後會死亡) |
| **青蛙** | `variant` | `string` | 變種 (如 `"minecraft:warm"`) |

---

## 敵對生物標籤 (Hostile Mobs)

| 生物類型 | 標籤 (Tag) | 類型 | 說明 |
| --- | --- | --- | --- |
| **苦力怕** | `ExplosionRadius` | `byte` | 爆炸半徑 |
|  | `powered` | `byte` | 是否為閃電苦力怕 |
| **殭屍** | `IsBaby` | `byte` | 是否為幼年體 |
| **終界使者** | `carriedBlockState` | `compound` | 手中搬運的方塊 |
| **伏守者** | `anger` | `compound` | 憤怒值管理系統 |
| **界伏殼** | `Peek` | `byte` | 貝殼開啟程度 (0-100) |
|  | `AttachFace` | `byte` | 附著表面方向 |

---

## 載具與非生物物件標籤 (Vehicles & Objects)

| 實體類型 | 標籤 (Tag) | 類型 | 說明 |
| --- | --- | --- | --- |
| **展示實體** | `transformation` | `compound` | 平移、縮放與旋轉矩陣 (見下表) |
| `(display)` | `interpolation_duration` | `int` | 動畫插值刻數 |
|  | `block_state` | `compound` | **block_display 專用**: 定義顯示的方塊 |
|  | `item` | `compound` | **item_display 專用**: 定義顯示的物品 |
|  | `text` | `string` | **text_display 專用**: 定義 JSON 文本 |
| **掉落物 (item)** | `Item` | `compound` | 物品 NBT 資料 |
| **盔甲座** | `Pose` | `compound` | 各部位旋轉角度 |
|  | `ShowArms` | `byte` | 是否顯示手臂 |
| **展示框** | `Fixed` | `byte` | 是否無法被破壞或轉動 |

### 展示實體 (Display Entities) 結構

| 子標籤 | 類型 | 說明 |
| --- | --- | --- |
| `translation` | `list (float)` | 平移位移 `[X, Y, Z]` |
| `scale` | `list (float)` | 縮放比例 `[X, Y, Z]` |
| `left_rotation` | `list (float)` | 左旋轉四元數 `[x, y, z, w]` |
| `billboard` | `string` | 看板模式 (如 `"center"`, `"fixed"`) |

---

## 技術與特殊實體標籤 (Technical & Misc)

| 實體類型 | 標籤 (Tag) | 類型 | 說明 |
| --- | --- | --- | --- |
| **互動實體** | `width` | `float` | 互動箱的寬度 |
| `(interaction)` | `height` | `float` | 互動箱的高度 |
|  | `response` | `byte` | 是否阻擋點擊攻擊 (`1b` 為會產生受傷動畫) |
| **標記實體** | `data` | `compound` | 玩家自訂的任何 NBT 資料 (伺服器不處理) |
| `(marker)` | | | |
| **區域效果雲** | `Radius` | `float` | 雲霧半徑 |
| `(area_effect_cloud)` | `Duration` | `int` | 持續刻數 |
|  | `Particle` | `string` | 顯示的粒子效果名稱 |

---

## 外部連結 (References)

* [實體 ID 清單 (Entity IDs)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/Entity_IDs.md)
* [方塊狀態與標籤 (Block States & Tags)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/BlockStates_or_Tags.md)
* [物品 NBT 矩陣 (Items)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.NBT/list.md)