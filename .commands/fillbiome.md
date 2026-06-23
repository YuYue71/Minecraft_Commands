# /fillbiome

> **分類:** `指令` | **權限等級:** `2` | **適用版本:** `JE ≤ 1.20.4` | **命令方塊:** `true`

---

## 目錄

* [語法](#語法-syntax)
* [參數說明](#參數說明-parameters)
    * [from 與 to](#from-與-to)
    * [biome](#biome)
    * [replace 與 filter](#replace-與-filter)
* [外部連結](#外部連結-references)

---

## 語法 (Syntax)

```commands
/fillbiome <from> <to> <biome>
/fillbiome <from> <to> <biome> replace <filter>
```

* `<>` = 必填

| 參數 / 欄位 | 類型 | 預設 | 說明 |
| --- | --- | --- | --- |
| `<from>` | `vec3` | - | 欲更改生態域的起始對角座標 |
| `<to>` | `vec3` | - | 欲更改生態域的結束對角座標 |
| `<biome>` | `string` | - | 欲填入的新生態域 ID |
| `replace` | `enum` | - | 啟用特定生態域替換模式 |
| `<filter>` | `string` | - | 欲被替換掉的特定生態域 ID 或標籤 |

---

## 參數說明 (Parameters)

### `from` 與 `to`

> 定義要進行生態域變更的三維空間範圍.

* `<from>` 與 `<to>` 定義了一個長方體區域. 這兩個座標為長方體的對角線頂點, 輸入順序不影響實際框選的體積.
* 支援絕對座標與相對座標 (`~`, `^`).
* 注意: 遊戲底層的生態域資料是依據 `4x4x4` 的方塊區塊 (Biome 3D Array) 來進行儲存與運算的, 而非單一獨立方塊. 因此實際發生變更的邊界會自動對齊至最接近該座標的 4 倍數網格, 不一定會完美貼合輸入的精確邊緣方塊.
* 預設情況下, 單次指令框選的最大體積上限為 32768 個方塊 (可透過遊戲規則 `commandModificationBlockLimit` 進行更改).

---

### `biome`

> 指定欲用來覆蓋該區域的新生態域種類.

* 必須輸入標準的生態域資源位置 (如 `minecraft:plains`, `minecraft:badlands`).
* 執行成功後, 該區域內與生態域相關的環境特徵 (如草地與樹葉的顏色, 水的顏色, 降雨或降雪狀態, 以及生物自然生成的種類) 將會立即改變為新生態域的設定.
* 此指令僅改變環境屬性數據, 不會憑空生成或替換任何實體方塊 (例如將平原改為沙漠, 原本的泥土與草徑並不會變成沙子).

---

### `replace` 與 `filter`

> 用於精準過濾要被替換的目標生態域.

* `replace`: 動作宣告字元, 代表進入條件替換模式.
* `<filter>`: 允許指定單一的生態域 (如 `minecraft:ocean`) 或生態域標籤 (如 `#minecraft:is_forest`).
* 執行時, 系統只會挑選區域內符合此 `<filter>` 條件的網格進行替換, 其餘不符合的生態域將原封不動. 常用於將大範圍內的一種特定地貌轉化為另一種, 而不干擾周遭的其他環境.

---

## 外部連結 (References)

* [Minecraft Wiki - /fillbiome](https://zh.minecraft.wiki/w/%E5%91%BD%E4%BB%A4/fillbiome?variant=zh-tw)
* [座標系統 (Coordinate Systems)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/coordinates.md)
* [資源位置與命名空間規範 (Resource Locations)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/ResourceLocations.md)
* [生態域 ID (Biome IDs)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/Biome_IDs.md)