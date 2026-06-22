好的, 這是 `block_entities` (方塊實體矩陣) 的最後一項: **視覺與裝飾 (Visual & Decor)**.

---

# 視覺與裝飾方塊實體 NBT (Visual & Decor Block Entities NBT)

> **分類:** `NBT` | **適用版本:** `JE ≤ 1.20.4`

---

## 目錄

* [SNBT 結構](#snbt-結構-structure)
* [告示牌標籤](#告示牌標籤-signs)
    * [Text 資料結構](#text-資料結構)
* [旗幟標籤](#旗幟標籤-banners)
    * [Patterns 結構](#patterns-結構)
* [玩家頭顱標籤](#玩家頭顱標籤-skulls)
* [飾紋陶罐標籤](#飾紋陶罐標籤-decorated-pots)
* [外部連結](#外部連結-references)

---

## SNBT 結構 (Structure)

```snbt
{
    id: "minecraft:sign",
    x: 0,
    y: 64,
    z: 0,
    is_waxed: 1b,
    front_text: {
        messages: ['{"text":"Line 1"}', '{"text":"Line 2"}', '{"text":""}', '{"text":""}'],
        color: "black",
        has_glowing_text: 0b
    },
    back_text: {
        messages: ['{"text":""}', '{"text":""}', '{"text":""}', '{"text":""}'],
        color: "black",
        has_glowing_text: 0b
    }
}

```

* SNBT 格式, 適用於 `/setblock`, `/data get/merge/modify block` 指令.
* 涵蓋主要用於儲存外觀, 圖案與文字資料的方塊: 告示牌 (包含懸掛式), 旗幟, 玩家頭顱, 飾紋陶罐, 床.

---

## 告示牌標籤 (Signs)

> 適用於所有木材種類的立式, 牆上告示牌與懸掛式告示牌. (注意: 1.20 版本起, 舊版的 Text1~Text4 已被重構為前後兩面的獨立結構).

| 標籤 (Tag) | 類型 | 預設 | 說明 |
| --- | --- | --- | --- |
| `is_waxed` | `byte` | `0b` | 是否已使用蜜蜂塗蠟 (`1b`=是). 塗蠟後玩家無法再透過右鍵點擊修改文字 |
| `front_text` | `compound` | - | 告示牌正面的文字與樣式資料 (結構見下方說明) |
| `back_text` | `compound` | - | 告示牌背面的文字與樣式資料 (結構見下方說明) |

---

### `Text` 資料結構

> 應用於 `front_text` 與 `back_text` 內部的複合標籤.

| 子標籤 | 類型 | 預設 | 說明 |
| --- | --- | --- | --- |
| `messages` | `list` | `['""','""','""','""']` | 必填. 包含 4 個字串的陣列, 分別代表告示牌的第 1 到 4 行. 字串必須為 JSON 文本格式 (如 `'{"text":"Hello"}'`) |
| `color` | `string` | `"black"` | 文字的基礎顏色. 使用染料點擊時會修改此標籤. 填寫標準顏色英文 (如 `"red"`, `"blue"`) |
| `has_glowing_text` | `byte` | `0b` | 文字是否發光. 玩家使用螢光墨囊點擊時會設為 `1b` |

---

## 旗幟標籤 (Banners)

> 適用於 `minecraft:banner` (立式) 與 `minecraft:wall_banner` (牆上). 基礎底色由方塊本身的 ID 決定 (如 `red_banner`), NBT 僅儲存疊加的圖案.

| 標籤 (Tag) | 類型 | 預設 | 說明 |
| --- | --- | --- | --- |
| `Patterns` | `list` | `[]` | 儲存旗幟上所有疊加圖案的陣列, 內部為 Compound 結構 (見下方). 陣列順序即為圖案疊加順序 (由底層到表層) |

---

### `Patterns` 結構

> 定義旗幟上的單一圖案與其顏色.

| 子標籤 | 類型 | 預設 | 說明 |
| --- | --- | --- | --- |
| `Color` | `int` | - | 必填. 染料的顏色代碼 (0=白色, 1=橘色, 2=洋紅色, 3=淺藍色, 4=黃色, 5=黃綠色, 6=粉紅色, 7=灰色, 8=淺灰色, 9=青色, 10=紫色, 11=藍色, 12=棕色, 13=綠色, 14=紅色, 15=黑色) |
| `Pattern` | `string` | - | 必填. 圖案形狀的專用縮寫代碼 (如 `"cre"`=苦力怕, `"sku"`=骷髏, `"flo"`=花朵, `"moj"`=Mojang徽標, `"glb"`=地球) |

---

## 玩家頭顱標籤 (Skulls)

> 適用於 `minecraft:player_head` 與 `minecraft:player_wall_head`. 用於儲存特定玩家的皮膚材質.

| 標籤 (Tag) | 類型 | 預設 | 說明 |
| --- | --- | --- | --- |
| `SkullOwner` | `string` 或 `compound` | - | 定義頭顱的擁有者. 若填寫純字串 (如 `"Steve"`), 遊戲會自動連線並解析為包含 `Id` (UUID陣列) 與 `Properties` (Base64材質字串) 的複合標籤 |
| `note_block_sound` | `string` | - | 當此頭顱放置在音符盒上方時, 音符盒被觸發時所播放的自訂音效資源位置 (如 `minecraft:entity.ender_dragon.ambient`) |

---

## 飾紋陶罐標籤 (Decorated Pots)

> 適用於 `minecraft:decorated_pot`. 儲存陶罐四個面的陶片種類.

| 標籤 (Tag) | 類型 | 預設 | 說明 |
| --- | --- | --- | --- |
| `sherds` | `list` | `[...]` | 包含精確 4 個字串元素的陣列, 代表陶罐的四面 (順序為: 背, 左, 右, 前). 未裝飾的面填寫 `"minecraft:brick"`. 若有圖案則填寫對應陶片的資源位置 (如 `"minecraft:heart_pottery_sherd"`) |

---

## 床標籤 (Beds)

> 適用於各色床方塊. 由於 1.12 後床已拆分為不同方塊 ID (如 `red_bed`), 此標籤主要作為相容與內部邏輯存留.

| 標籤 (Tag) | 類型 | 預設 | 說明 |
| --- | --- | --- | --- |
| `color` | `int` | - | 決定床的顏色. 顏色代碼與旗幟的 `Color` 代碼對應相同 (0 到 15) |

---

## 外部連結 (References)

* [Minecraft Wiki - 區塊格式](https://minecraft.fandom.com/zh/wiki/%E5%8C%BA%E5%9D%97%E6%A0%BC%E5%BC%8F?variant=zh-tw)
* [JSON 文本元件 (Raw JSON Text Components)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/json_text.md)
* [資源位置與命名空間規範 (Resource Locations)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/ResourceLocations.md)
* [音效 ID (Sound effects)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/SoundEffects.md)