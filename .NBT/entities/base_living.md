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
    UUID: [I; 1234, 5678, 9012, 3456],
    Pos: [0.0d, 64.0d, 0.0d],
    Tags: ["custom_mob"],
    CustomName: '{"text":"精英怪","color":"gold"}',
    Health: 40.0f,
    NoAI: 1b,
    ActiveEffects: [
        {Id: "minecraft:strength", Amplifier: 1b, Duration: 1200}
    ]
}
```

---

## 通用實體標籤 (Base Entity Tags)

| 標籤 (Tag) | 類型 | 預設 | 說明 |
| --- | --- | --- | --- |
| `id` | `string` | - | 實體識別碼 (僅存檔或召喚時有效) |
| `UUID` | `int_array` | - | 實體唯一的通用唯一識別碼 (Universally Unique Identifier) |
| `Pos` | `list` | `[0d,0d,0d]` | 絕對座標 `[X, Y, Z]` (Double 類型) |
| `Motion` | `list` | `[0d,0d,0d]` | 物理向量 `[dX, dY, dZ]` (Double 類型) |
| `Rotation` | `list` | `[0f,0f]` | 視角朝向 `[水平偏航角, 垂直俯仰角]` (Float 類型) |
| `FallDistance` | `float` | `0.0f` | 已下落距離 (計算掉落傷害用) |
| `Fire` | `short` | `-20s` | 剩餘燃燒刻數 (Tick). 負值表示免疫時間 |
| `Air` | `short` | `300s` | 剩餘氧氣刻數 |
| `OnGround` | `byte` | `0b` | 是否接觸地面 (`1b`=是) |
| `NoGravity` | `byte` | `0b` | 設為 `1b` 時不受重力影響 |
| `Invulnerable` | `byte` | `0b` | 是否無敵 (免疫大部分傷害) |
| `Silent` | `byte` | `0b` | 設為 `1b` 時該實體不發出聲音 |
| `CustomName` | `string` | - | JSON 格式的自訂名稱 (如 `'{"text":"NPC"}'`) |
| `CustomNameVisible` | `byte` | `0b` | 是否強制顯示名稱標籤 |
| `Tags` | `list` | `[]` | 字串列表, 儲存實體的計分板標籤 |
| `Passengers` | `list` | `[]` | 騎乘在此實體上的子實體列表 (見下方結構) |
| `PortalCooldown` | `int` | `0` | 傳送門冷卻刻數 |
| `TicksFrozen` | `int` | `0` | 在細雪中凍結的刻數 (達 140 開始凍傷) |

### `Passengers` 結構

| 子標籤 | 類型 | 說明 |
| --- | --- | --- |
| `id` | `string` | 子實體的 ID |
| `...` | `mixed` | 子實體的所有 NBT 資料 |

---

## 活體生物專屬標籤 (Living Entity Tags)

| 標籤 (Tag) | 類型 | 預設 | 說明 |
| --- | --- | --- | --- |
| `Health` | `float` | - | 當前生命值 |
| `AbsorptionAmount` | `float` | `0.0f` | 傷害吸收量 (黃金心) |
| `HurtTime` | `short` | `0s` | 受傷冷卻時間 |
| `DeathTime` | `short` | `0s` | 死亡動畫進度 (達 20 移除實體) |
| `CanPickUpLoot` | `byte` | `0b` | 是否可撿起地上物品 |
| `PersistenceRequired` | `byte` | `0b` | 是否防止自然消失 (Despawn) |
| `NoAI` | `byte` | `0b` | 是否關閉人工智慧 (AI) |
| `LeftHanded` | `byte` | `0b` | 是否為左撇子 |
| `Team` | `string` | - | 所屬隊伍名稱 |
| `HandItems` | `list` | `[{},{}]` | `[主手, 副手]` 物品資料 |
| `ArmorItems` | `list` | `[{},{},{},{}]` | `[腳, 腿, 胸, 頭]` 裝備資料 |
| `HandDropChances` | `list` | `[0.085f,0.085f]` | 手持物掉落率 (1.0f 為 100%) |
| `ArmorDropChances` | `list` | `[...]` | 防具掉落率 |
| `Attributes` | `list` | `[]` | 實體屬性列表 (見下方結構) |
| `ActiveEffects` | `list` | `[]` | 狀態效果列表 (見下方結構) |

### `Attributes` 結構

| 子標籤 | 類型 | 說明 |
| --- | --- | --- |
| `Name` | `string` | 屬性名稱 (如 `generic.max_health`) |
| `Base` | `double` | 基礎數值 |
| `Modifiers` | `list` | 屬性修改器列表 |

### `ActiveEffects` 結構

| 子標籤 | 類型 | 說明 |
| --- | --- | --- |
| `Id` | `string/int` | 效果 ID (1.20.4 建議使用字串如 `"minecraft:speed"`) |
| `Amplifier` | `byte` | 效果等級 (0 代表等級 I) |
| `Duration` | `int` | 持續刻數 |
| `ShowParticles` | `byte` | 是否顯示粒子 |
| `ShowIcon` | `byte` | 是否顯示圖示 |

---

## 外部連結 (References)

* [Minecraft Wiki - 實體格式](https://minecraft.fandom.com/zh/wiki/%E5%AE%9E%E4%BD%93%E6%A0%BC%E5%BC%8F?variant=zh-tw)
* [座標系統 (Coordinate Systems)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/coordinates.md)
* [狀態效果 ID (Status Effects)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/StatusEffects.md)