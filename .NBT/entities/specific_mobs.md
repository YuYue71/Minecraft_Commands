# 特定生物與物件實體 NBT (Specific Mobs & Objects NBT)

> **分類:** `NBT` | **適用版本:** `JE ≤ 1.20.4`

---

## 目錄

* [SNBT 結構](#snbt-結構-structure)
* [被動與中立生物標籤](#被動與中立生物標籤-passive--neutral-mobs)
    * [VillagerData 與 Offers 結構](#villagerdata-與-offers-結構)
* [敵對生物標籤](#敵對生物標籤-hostile-mobs)
* [載具與非生物物件標籤](#載具與非生物物件標籤-vehicles--objects)
    * [盔甲座 Pose 結構](#盔甲座-pose-結構)
* [外部連結](#外部連結-references)

---

## SNBT 結構 (Structure)

```snbt
{
    id: "minecraft:villager",
    VillagerData: {
        level: 2,
        profession: "minecraft:cleric",
        type: "minecraft:plains"
    },
    Offers: {
        Recipes: [
            {
                buy: {id: "minecraft:rotten_flesh", Count: 32b},
                sell: {id: "minecraft:emerald", Count: 1b},
                maxUses: 16,
                uses: 0,
                rewardExp: 1b
            }
        ]
    }
}

```

* SNBT 格式, 適用於 `/summon`, `/data get/merge/modify entity` 指令.
* 僅列出該實體獨有的標籤. 基礎的血量, 位置, 狀態效果等請參考 `base_living.md`.

---

## 被動與中立生物標籤 (Passive & Neutral Mobs)

> 包含可繁殖動物, 村民, 以及具備特殊狀態的友好生物.

| 生物類型 | 標籤 (Tag) | 類型 | 說明 |
| --- | --- | --- | --- |
| **所有可繁殖動物** | `Age` | `int` | 生長階段. 負值代表幼年體 (通常剛出生為 -24000), 0 或正值代表成年體且可繁殖的冷卻刻數 |
|  | `InLove` | `int` | 發情狀態的剩餘刻數. 大於 0 時會尋找同類交配 |
| **村民 / 殭屍村民** | `VillagerData` | `compound` | 定義村民的職業, 等級與群系外觀 (見下方結構說明) |
|  | `Offers` | `compound` | 交易選項清單與價格資料 (見下方結構說明) |
|  | `Gossips` | `list` | 記錄村民對特定玩家的好感度 (影響交易折扣與鐵魔像敵意) |
| **馬 / 驢 / 羊駝** | `Tame` | `byte` | 是否已被馴服 (`1b`=是) |
|  | `Owner` | `int_array` | 馴服者的 UUID 陣列 (1.16+ 格式) |
|  | `Temper` | `int` | 脾氣值 (0 到 100), 數值越高被玩家騎乘馴服的成功率越大 |
|  | `Variant` | `int` | 馬的毛色與花紋代碼 / 羊駝的毛色代碼 |
|  | `ArmorItem` | `compound` | 裝備的馬鎧物品 NBT |
|  | `SaddleItem` | `compound` | 裝備的鞍物品 NBT |
| **羊** | `Color` | `byte` | 羊毛顏色代碼 (0=白色 到 15=黑色, 順序同染料) |
|  | `Sheared` | `byte` | 是否已被剪毛 (`1b`=是) |
| **史萊姆 / 熔岩史萊姆** | `Size` | `int` | 體型大小 (0=小型, 1=中型, 2=大型. 數值影響血量與攻擊力) |
| **六角恐龍 / 青蛙** | `variant` | `int/string` | 外觀變種 (六角恐龍為 0~4 整數, 青蛙為字串如 `minecraft:temperate`) |

---

### `VillagerData` 與 `Offers` 結構

> 處理村民的職業與交易邏輯.

| 子標籤 | 類型 | 預設 | 說明 |
| --- | --- | --- | --- |
| `VillagerData.level` | `int` | `1` | 交易等級 (1=新手 到 5=大師) |
| `VillagerData.profession` | `string` | `"none"` | 職業 (如 `"minecraft:weaponsmith"`, `"none"` 為無業, `"nitwit"` 為傻子) |
| `VillagerData.type` | `string` | `"plains"` | 群系外觀 (如 `"taiga"`, `"desert"`) |
| `Offers.Recipes[].buy` | `compound` | - | 玩家需要支付的第一項物品 (標準物品 NBT 結構) |
| `Offers.Recipes[].buyB` | `compound` | `{}` | 玩家需要支付的第二項物品 (選填) |
| `Offers.Recipes[].sell` | `compound` | - | 村民給予玩家的物品 |
| `Offers.Recipes[].uses` | `int` | `0` | 此交易已被使用的次數 |
| `Offers.Recipes[].maxUses` | `int` | - | 達到此使用次數後, 該交易將被鎖定 (顯示打叉圖示) |
| `Offers.Recipes[].rewardExp` | `byte` | `1b` | 交易成功時是否給予玩家經驗值 (`1b`=是) |

---

## 敵對生物標籤 (Hostile Mobs)

> 包含怪物與特殊首領的專屬機制.

| 生物類型 | 標籤 (Tag) | 類型 | 說明 |
| --- | --- | --- | --- |
| **苦力怕 (Creeper)** | `ExplosionRadius` | `byte` | `3b` |
|  | `Fuse` | `short` | `30s` |
|  | `ignited` | `byte` | `0b` |
|  | `powered` | `byte` | `0b` |
| **殭屍 (Zombie 家族)** | `IsBaby` | `byte` | `0b` |
|  | `CanBreakDoors` | `byte` | `0b` |
|  | `DrownedConversionTime` | `int` | `-1` |
| **終界使者 (Enderman)** | `carriedBlockState` | `compound` | 手中搬運的方塊狀態 (包含 `Name` 與 `Properties` 屬性) |
| **伏守者 (Warden)** | `anger` | `compound` | 記錄對各個實體 UUID 的憤怒值 (超過 80 會鎖定目標並咆哮) |
| **幻術師 (Illusioner)** | `SpellTicks` | `int` | `0` |

---

## 載具與非生物物件標籤 (Vehicles & Objects)

> 不具備常規生命值與 AI 的物理實體, 如掉落物, 盔甲座, 礦車.

| 實體類型 | 標籤 (Tag) | 類型 | 說明 |
| --- | --- | --- | --- |
| **掉落物 (item)** | `Item` | `compound` | 掉落物本身的物品數據 (包含 `id`, `Count`, `tag`) |
|  | `Age` | `short` | 掉落物存在的刻數 (達到 6000s, 即 5 分鐘時會消失) |
|  | `PickupDelay` | `short` | 玩家無法拾取的冷卻刻數 (玩家按 Q 丟出時預設為 40s) |
| **盔甲座 (armor_stand)** | `Invisible` | `byte` | 是否隱形 (`1b`=是. 隱形時穿戴的裝備依然可見) |
|  | `NoBasePlate` | `byte` | 是否隱藏底盤 (`1b`=是) |
|  | `ShowArms` | `byte` | 是否顯示手臂 (`1b`=是. 原版生存的盔甲座預設無手臂) |
|  | `Small` | `byte` | 是否為小型盔甲座 (`1b`=是) |
|  | `Pose` | `compound` | 身體各部位的旋轉角度 (見下方結構說明) |
| **物品展示框 / 發光** | `Item` | `compound` | 放置在框內的物品 NBT |
|  | `ItemRotation` | `byte` | 物品的旋轉角度 (0 到 7, 每次點擊增加 1, 每次旋轉 45 度) |
|  | `Fixed` | `byte` | 是否固定 (`1b`=是. 玩家無法破壞框或拿走物品) |
|  | `Invisible` | `byte` | 展示框本身是否隱形 (`1b`=是) |
| **礦車 (minecart 家族)** | `CustomDisplayTile` | `byte` | 是否在礦車內部顯示自訂方塊 (`1b`=是) |
|  | `DisplayState` | `compound` | 礦車內部顯示的方塊狀態 (包含 `Name` 與 `Properties`) |
|  | `DisplayOffset` | `int` | 內部方塊的垂直位移量 (像素為單位) |
| **箭矢 / 三叉戟** | `damage` | `double` | 基礎物理傷害乘數 |
|  | `pickup` | `byte` | 玩家是否可拔起拾取 (`0b`=不可, `1b`=生存模式可, `2b`=僅創造模式可) |
|  | `inGround` | `byte` | 是否已插在方塊上 (`1b`=是) |
|  | `Trident` | `compound` | 僅限三叉戟: 擲出三叉戟的原始物品 NBT 數據 |
| **掉落的方塊** | `BlockState` | `compound` | 此掉落方塊的種類 (包含 `Name` 與 `Properties`) |
| `(falling_block)` | `Time` | `int` | 掉落已持續的刻數 (必須大於 0 方塊才會正常顯示並掉落) |
|  | `DropItem` | `byte` | 落地被破壞時是否會掉落為物品實體 (`1b`=是) |

---

### `盔甲座 Pose` 結構

> 控制盔甲座的姿勢. 每個部位皆為包含 3 個 Float 元素的陣列 `[X軸, Y軸, Z軸]`.

| 子標籤 | 類型 | 預設 | 說明 |
| --- | --- | --- | --- |
| `Head` | `list` | `[0f,0f,0f]` | 頭部旋轉角度 |
| `Body` | `list` | `[0f,0f,0f]` | 身體主幹旋轉角度 |
| `LeftArm` / `RightArm` | `list` | `[...]` | 左右手臂旋轉角度 (預設左手為 `[-10f,0f,-10f]`, 右手為 `[-15f,0f,10f]`) |
| `LeftLeg` / `RightLeg` | `list` | `[...]` | 左右腿部旋轉角度 (預設左腿為 `[-1f,0f,-1f]`, 右腿為 `[1f,0f,1f]`) |

---

## 外部連結 (References)

* [Minecraft Wiki - 實體格式](https://minecraft.fandom.com/zh/wiki/%E5%AE%9E%E4%BD%93%E6%A0%BC%E5%BC%8F?variant=zh-tw)
* [座標系統 (Coordinate Systems)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/Coordinates.md)
* [JSON 文本元件 (Raw JSON Text Components)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/json_text.md)
* [方塊狀態與標籤 (Block States & Tags)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/BlockStates_or_Tags.md)
* [資源位置與命名空間規範 (Resource Locations)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/ResourceLocations.md)