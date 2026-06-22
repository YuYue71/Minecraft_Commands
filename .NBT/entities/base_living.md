# 通用實體與活體生物 NBT (Base & Living Entity NBT)

> **分類:** `NBT` | **適用版本:** `JE ≤ 1.20.4`

---

## 目錄

* [SNBT 結構](#snbt-結構-structure)
* [通用實體標籤](#通用實體標籤-base-entity-tags)
  * [Passengers 結構](#passengers-結構)
* [活體生物專屬標籤](#活體生物專屬標籤-living-entity-tags)
  * [Attributes 結構](#attributes-結構)
  * [ActiveEffects 結構](#activeeffects-結構)
* [外部連結](#外部連結-references)

---

## SNBT 結構 (Structure)

```snbt
{
    id: "minecraft:zombie",
    Pos: [0.0d, 64.0d, 0.0d],
    Tags: ["boss_mob"],
    CustomName: '{"text":"Boss","color":"red"}',
    Health: 100.0f,
    NoAI: 1b,
    HandItems: [
        {id: "minecraft:iron_sword", Count: 1b, tag: {Damage: 0}},
        {}
    ],
    ActiveEffects: [
        {Id: 1, Amplifier: 1b, Duration: 9999, ShowParticles: 0b}
    ]
}

```

* SNBT 格式, 適用於 `/summon`, `/data get/merge/modify entity` 指令.
* 注意: 玩家實體 (Player) 繼承此處多數標籤, 但無法使用 `/data modify` 進行修改, 僅供讀取.

---

## 通用實體標籤 (Base Entity Tags)

| 標籤 (Tag) | 類型 | 預設 | 說明 |
| --- | --- | --- | --- |
| `id` | `string` | - | 實體識別碼 (僅在 `/summon` 或儲存於方塊內時有效, 已經存在的實體無法修改) |
| `Pos` | `list` | `[0d,0d,0d]` | 包含 3 個 double 元素的陣列, 代表絕對座標 `[X, Y, Z]` |
| `Motion` | `list` | `[0d,0d,0d]` | 包含 3 個 double 元素的陣列, 代表當前移動的物理向量 `[dX, dY, dZ]` |
| `Rotation` | `list` | `[0f,0f]` | 包含 2 個 float 元素的陣列, 代表視角朝向 `[偏航角(水平), 俯仰角(垂直)]` |
| `FallDistance` | `float` | `0.0f` | 實體目前已下落的距離, 用於計算觸地時的掉落傷害 |
| `Fire` | `short` | `-20s` | 實體燃燒的剩餘刻數. 負值代表免疫火焰的時間 |
| `Air` | `short` | `300s` | 實體在水中的剩餘氧氣刻數 (300s = 15秒) |
| `OnGround` | `byte` | `0b` | 實體是否接觸到地面 (`1b`=是, `0b`=否) |
| `NoGravity` | `byte` | `0b` | 是否不受重力影響. 設為 `1b` 時實體將懸浮於空中 |
| `Invulnerable` | `byte` | `0b` | 是否無敵. 設為 `1b` 時免疫多數傷害 (但仍會被 `/kill` 或掉出虛空死亡) |
| `Silent` | `byte` | `0b` | 是否靜音. 設為 `1b` 時該實體不會發出任何聲音 |
| `CustomName` | `string` | - | 自訂名稱, 必須使用 JSON 文本元件的字串格式 (如 `'{"text":"Name"}'`) |
| `CustomNameVisible` | `byte` | `0b` | 設為 `1b` 時, 即使游標未懸停於實體上方, 依然會顯示自訂名稱 |
| `Tags` | `list` | `[]` | 字串陣列, 儲存賦予該實體的所有計分板標籤 (如 `["tag1","tag2"]`) |
| `Passengers` | `list` | `[]` | 騎乘在此實體上的所有子實體資料, 內部為 Compound 結構 (見下方) |

---

### `Passengers` 結構

> 定義堆疊實體 (如蜘蛛騎士, 殭屍雞騎士). 陣列內可包含多個實體 Compound.

| 子標籤 | 類型 | 預設 | 說明 |
| --- | --- | --- | --- |
| `id` | `string` | - | 必填. 子實體的識別碼 (如 `minecraft:skeleton`) |
| `...` | `...` | - | 任何通用或專屬的實體 NBT 標籤皆可寫入此處 |

---

## 活體生物專屬標籤 (Living Entity Tags)

> 繼承自通用實體, 僅適用於具備生命值的實體 (如殭屍, 豬, 玩家, 護甲座).

| 標籤 (Tag) | 類型 | 預設 | 說明 |
| --- | --- | --- | --- |
| `Health` | `float` | - | 當前生命值. 不能超過最大生命值上限 |
| `AbsorptionAmount` | `float` | `0.0f` | 額外的傷害吸收量 (黃金心) |
| `HurtTime` | `short` | `0s` | 受傷無敵冷卻時間, 剛受傷時為 10, 每刻遞減 |
| `DeathTime` | `short` | `0s` | 死亡動畫的播放進度. 達到 20 時實體會消失 |
| `CanPickUpLoot` | `byte` | `0b` | 設為 `1b` 時, 該生物可撿起地上的裝備與物品 |
| `PersistenceRequired` | `byte` | `0b` | 設為 `1b` 時, 該生物不會因為玩家遠離而自然消失 (使用命名牌會自動設為 1b) |
| `NoAI` | `byte` | `0b` | 設為 `1b` 時, 徹底關閉該生物的人工智慧 (無法移動, 攻擊, 轉頭, 但仍會受重力與碰撞影響) |
| `LeftHanded` | `byte` | `0b` | 是否為左撇子 (`1b`=是). 影響武器顯示的左右手位置 |
| `Team` | `string` | - | 該實體所屬的隊伍名稱 |
| `HandItems` | `list` | `[{},{}]` | 包含 2 個物品 Compound 的陣列: `[主手, 副手]` |
| `ArmorItems` | `list` | `[{},{},{},{}]` | 包含 4 個物品 Compound 的陣列: `[腳, 腿, 胸, 頭]` |
| `HandDropChances` | `list` | `[0.085f,0.085f]` | 包含 2 個 float 的陣列, 決定手持物品的掉落率. 設為 `1.0f` 為 100% 掉落 |
| `ArmorDropChances` | `list` | `[0.085f,0.085f,0.085f,0.085f]` | 包含 4 個 float 的陣列, 決定各部位防具的掉落率 |
| `Attributes` | `list` | `[]` | 覆寫實體基礎屬性的陣列, 內部為 Compound 結構 (見下方) |
| `ActiveEffects` | `list` | `[]` | 賦予實體的狀態效果陣列, 內部為 Compound 結構 (見下方) |

---

### `Attributes` 結構

> 讀取或覆寫實體的屬性數值.

| 子標籤 | 類型 | 預設 | 說明 |
| --- | --- | --- | --- |
| `Name` | `string` | - | 必填. 屬性識別碼 (如 `generic.max_health`) |
| `Base` | `double` | - | 必填. 該屬性的基礎數值 |
| `Modifiers` | `list` | `[]` | 可選. 額外的屬性修改器陣列 (與物品 NBT 的 AttributeModifiers 結構相同) |

---

### `ActiveEffects` 結構

> 定義實體目前擁有的狀態效果 (如藥水效果).

| 子標籤 | 類型 | 預設 | 說明 |
| --- | --- | --- | --- |
| `Id` | `byte/int` | - | 必填. 狀態效果的數字 ID (1.20.4 及之前版本使用數字 ID) |
| `Amplifier` | `byte` | `0b` | 效果等級. 實際顯示等級為 `Amplifier + 1` (如填 `0b` 為等級 I) |
| `Duration` | `int` | - | 剩餘持續時間 (以遊戲刻為單位) |
| `Ambient` | `byte` | `0b` | 是否為信標產生的環境效果 (`1b` 時粒子更透明) |
| `ShowParticles` | `byte` | `1b` | 是否顯示效果的粒子微粒 (`0b` 為隱藏) |
| `ShowIcon` | `byte` | `1b` | 是否在玩家 UI 右上角顯示效果圖示 |

---

## 外部連結 (References)

* [Minecraft Wiki - 實體格式](https://minecraft.fandom.com/zh/wiki/%E5%AE%9E%E4%BD%93%E6%A0%BC%E5%BC%8F?variant=zh-tw)
* [座標系統 (Coordinate Systems)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/coordinates.md)
* [JSON 文本元件 (Raw JSON Text Components)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/json_text.md)
* [時間與時間單位 (Time & Duration Formats)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/TimeFormats.md)
* [狀態效果 ID (Status Effects)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/StatusEffects.md)