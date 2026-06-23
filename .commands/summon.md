# `/summon`

> **分類:** `指令` | **權限等級:** `2` | **適用版本:** `JE ≤ 1.20.4` | **命令方塊:** `true`

---

## 目錄

* [語法](#語法-syntax)
* [參數說明](#參數說明-parameters)
    * [entity](#entity)
    * [pos](#pos)
    * [nbt](#nbt)
* [外部連結](#外部連結-references)

---

## 語法 (Syntax)

```commands
/summon <entity>
/summon <entity> [pos]
/summon <entity> [pos] [nbt]

```

* `<>` = 必填, `[]` = 選填

| 參數 / 欄位 | 類型 | 預設 | 說明 |
| --- | --- | --- | --- |
| `<entity>` | `string` | - | 欲生成的實體 ID |
| `[pos]` | `vec3` | 執行者當前位置 | 欲生成實體的三維座標 |
| `[nbt]` | `nbt` | - | 欲賦予新實體的自訂 NBT 標籤資料 |

---

## 參數說明 (Parameters)

### `entity`

> 指定要生成的具體實體種類.

* 必須輸入標準的實體資源位置 (如 `minecraft:zombie`, `minecraft:creeper`).
* 可以生成絕大多數的活動生物, 掉落物, 投擲物, 載具與特殊實體 (如閃電 `minecraft:lightning_bolt`).
* 無法透過此指令生成玩家 (`minecraft:player`), 因為玩家實體僅能透過真實玩家連線登入來產生.

---

### `pos`

> 指定實體生成的空間位置.

* 包含三個軸向 (X, Y, Z) 的座標數值.
* 支援絕對座標與相對座標 (`~`, `^`).
* 若未填寫此參數, 實體預設會直接重疊生成於執行此指令的玩家, 實體或命令方塊的當前中心座標上.
* 系統會盡可能將實體安全地放置, 但若指定的座標直接位於實體方塊內部, 生物實體生成後可能會立刻受到窒息傷害.

---

### `nbt`

> 允許在實體生成時, 直接賦予其特定的屬性或狀態資料.

* 必須為標準的 NBT 複合標籤格式 (Compound Tag), 也就是由大括號 `{}` 包覆的鍵值對 (例如 `{NoAI:1b, Glowing:1b}`).
* 透過此參數, 可以製作出極具客製化的實體. 例如: 裝備全套鑽石甲的骷髏, 預先被點燃的 TNT, 騎著蜘蛛的苦力怕 (透過 `Passengers` 標籤), 或是永不消失的掉落物.
* 若 NBT 格式錯誤或包含了該實體不支援的標籤, 指令仍可能會成功執行並生成實體, 但無效的標籤將會被系統自動忽略.

---

## 外部連結 (References)

* [Minecraft Wiki - /summon](https://zh.minecraft.wiki/w/%E5%91%BD%E4%BB%A4/summon)
* [實體 ID (Entity IDs)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/Entity_IDs.md)
* [座標系統 (Coordinate Systems)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/Coordinates.md)
* [資源位置與命名空間規範 (Resource Locations)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/ResourceLocations.md)
* [實體 NBT 矩陣 (Entities)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.NBT/list.md)