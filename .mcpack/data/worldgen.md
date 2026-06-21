# 生物群系 (`worldgen/biome/`)

> **分類:** `資料包` ｜ **適用版本:** `JE 1.19.4+`
> **路徑:** `data/<namespace>/worldgen/biome/<名稱>.json` ｜ **引用格式:** `namespace:名稱`

---

## 目錄

* [概覽](https://www.google.com/search?q=%23overview)
* [JSON 結構](https://www.google.com/search?q=%23json-structure)
* [欄位說明](https://www.google.com/search?q=%23fields)
    * [根層欄位](https://www.google.com/search?q=%23root-fields)
    * [子欄位：effects](https://www.google.com/search?q=%23fields-effects)
    * [子欄位：spawners](https://www.google.com/search?q=%23fields-spawners)


* [枚舉值速查](https://www.google.com/search?q=%23enums)
    * [temperature_modifier 可填值](https://www.google.com/search?q=%23enum-temperature-modifier)
    * [effects.grass_color_modifier 可填值](https://www.google.com/search?q=%23enum-grass-color-modifier)
    * [spawners 類別名稱 可填值](https://www.google.com/search?q=%23enum-spawners-category)


* [注意事項](https://www.google.com/search?q=%23notes)
* [外部連結](https://www.google.com/search?q=%23references)

---

## 概覽 (Overview) {#overview}

定義自訂的生物群系 (Biome)，設定該區域的地表方塊、氣候條件、環境視覺/聽覺效果以及實體 (Entity) 的生成規則。

---

## JSON 結構 {#json-structure}

```json
{
    "has_precipitation": true,
    "temperature": 0.8,
    "temperature_modifier": "none",
    "downfall": 0.4,
    "effects": {
        "fog_color": 12638463,
        "water_color": 4159204,
        "water_fog_color": 329011,
        "sky_color": 7907327
    },
    "carvers": {
        "air": [
            "minecraft:cave"
        ]
    },
    "features": [
        [],
        [
            "minecraft:lake_lava"
        ]
    ],
    "spawners": {
        "monster": [
            {
                "type": "minecraft:zombie",
                "weight": 100,
                "minCount": 4,
                "maxCount": 4
            }
        ]
    },
    "spawn_costs": {}
}

```

---

## 欄位說明 (Fields) {#fields}

### 根層欄位 {#root-fields}

| 欄位 | 類型 | 必填 | 預設 | 說明 |
| --- | --- | --- | --- | --- |
| `has_precipitation` | `boolean` | ✓ | — | 決定此生物群系是否有天氣降水現象（雨或雪）。 |
| `temperature` | `float` | ✓ | — | 群系基礎溫度。數值 `< 0.15` 時，降水將轉換為降雪並使水結冰。 |
| `temperature_modifier` | `string` |  | `"none"` | 溫度修飾符 (Temperature Modifier)，改變高度對溫度的影響模式，枚舉值見下方。 |
| `downfall` | `float` | ✓ | — | 降水量參數，結合溫度用於計算預設的草地 (Grass) 與樹葉 (Foliage) 顏色。 |
| `effects` | `object` | ✓ | — | 定義環境視覺與聽覺效果 (Effects)，子欄位見下方。 |
| `carvers` | `object` | ✓ | — | 可生成的雕刻器 (Carvers) 清單，多用於生成洞穴 (Caves) 或峽谷 (Ravines)。 |
| `features` | `array` | ✓ | — | 二維陣列，依據世界生成階段 (Generation Step) 排序的已配置特徵 (Configured Features) 清單。 |
| `spawners` | `object` | ✓ | — | 定義各類別生物群體在此群系的生成權重與數量條件，子欄位見下方。 |
| `spawn_costs` | `object` | ✓ | — | 設定特定生物生成的額外生成機率限制與能量成本 (Spawn Costs)。 |

### 子欄位：`effects` {#fields-effects}

| 欄位 | 類型 | 必填 | 預設 | 說明 |
| --- | --- | --- | --- | --- |
| `fog_color` | `int` | ✓ | — | 環境霧氣的 RGB 十進位顏色值。 |
| `water_color` | `int` | ✓ | — | 水方塊 (Water) 的 RGB 十進位顏色值。 |
| `water_fog_color` | `int` | ✓ | — | 玩家處於水下時的霧氣 RGB 十進位顏色值。 |
| `sky_color` | `int` | ✓ | — | 天空 (Sky) 的 RGB 十進位顏色值。 |
| `foliage_color` | `int` |  | — | 強制指定樹葉顏色，若設定將覆蓋基於溫度與降水量的預設引擎計算。 |
| `grass_color` | `int` |  | — | 強制指定草方塊顏色，若設定將覆蓋預設引擎計算。 |
| `grass_color_modifier` | `string` |  | `"none"` | 草地顏色修飾符，可套用特定的環境濾鏡，枚舉值見下方。 |
| `ambient_sound` | `string` |  | — | 處於此群系時持續播放的環境音效 (Ambient Sound) ID。 |
| `mood_sound` | `object` |  | — | 於黑暗環境隨機播放的氛圍音效 (Mood Sound) 參數與延遲設定。 |
| `additions_sound` | `object` |  | — | 偶爾觸發的附加音效 (Additions Sound) 參數設定。 |
| `music` | `object` |  | — | 進入該群系時播放的背景音樂 (Background Music) 參數設定。 |

### 子欄位：`spawners` {#fields-spawners}

| 欄位 | 類型 | 必填 | 預設 | 說明 |
| --- | --- | --- | --- | --- |
| `類別名稱` | `object[]` |  | `[]` | 以實體分類 (如 `monster`) 為鍵名，值為包含 `type`、`weight`、`minCount`、`maxCount` 的陣列。枚舉值見下方。 |

---

## 枚舉值速查 {#enums}

### `temperature_modifier` 可填值 {#enum-temperature-modifier}

| 值 | 分類 | 說明 |
| --- | --- | --- |
| `"none"` | 標準 | 無任何溫度修飾，溫度隨高度正常變化。 |
| `"frozen"` | 修飾 | 使高海拔區域的溫度被強制降低，產生漸進式降雪。 |

### `effects.grass_color_modifier` 可填值 {#enum-grass-color-modifier}

| 值 | 分類 | 說明 |
| --- | --- | --- |
| `"none"` | 標準 | 依照引擎原生的溫度與降水算法計算標準草地顏色。 |
| `"dark_forest"` | 修飾 | 覆蓋原值並套用黑森林 (Dark Forest) 特有的深綠色濾鏡。 |
| `"swamp"` | 修飾 | 套用沼澤 (Swamp) 的暗棕綠色濾鏡，並由引擎隨機渲染雜色噪點。 |

### `spawners 類別名稱` 可填值 {#enum-spawners-category}

| 值 | 分類 | 說明 |
| --- | --- | --- |
| `monster` | 敵對生物 | 於低光照環境生成的怪物群體，如殭屍 (Zombie)、骷髏 (Skeleton)。 |
| `creature` | 被動生物 | 生成於草地及高光照區的動物群體，如牛 (Cow)、羊 (Sheep)。 |
| `ambient` | 環境實體 | 無實際互動功能的環境點綴生物，如蝙蝠 (Bat)。 |
| `axolotls` | 水生生物 | 專門用於生成六角恐龍 (Axolotl) 的獨立類別。 |
| `underground_water_creature` | 水生生物 | 於地下水域生成的生物，如發光魷魚 (Glow Squid)。 |
| `water_creature` | 水生生物 | 於海洋或地表水域生成的動物，如魷魚 (Squid)、海豚 (Dolphin)。 |
| `water_ambient` | 水生生物 | 無互動功能的水生環境點綴生物，如各類魚 (Fish)。 |
| `misc` | 雜項實體 | 不會自然生成或歸屬其他特殊條件的實體。 |

---

## 注意事項 (Notes) {#notes}

* 所有定義顏色的欄位 (Color Fields) 必須使用十進位整數 (Decimal Integer)，需預先將十六進位 RGB (Hex RGB) 轉換為十進位制。
* 陣列內的 `features` 必須嚴格遵守世界生成的固定執行順序（如先生成流體再生成地表結構），錯誤的排序可能導致地貌渲染異常或效能衰減。
* `[1.19.4+]` 降水參數由舊版的 `precipitation` 字串（`"none"`、`"rain"`、`"snow"`）全面重構並變更為 `has_precipitation` 布林值 (Boolean)。實際降水類型（雨或雪）統一交由 `temperature` 決定。

---

## 外部連結 (References) {#references}

* [Minecraft Wiki - 生物群系 (Biome)](https://www.google.com/search?q=%23)
* [Minecraft Wiki - 自訂世界生成 (Custom World Generation)](https://www.google.com/search?q=%23)

---

*最後更新：2026-06-22*