# /spreadplayers

> **分類:** `指令` | **權限等級:** `2` | **適用版本:** `JE ≤ 1.20.4` | **命令方塊:** `true`

---

## 目錄

* [語法](#語法-syntax)
* [參數說明](#參數說明-parameters)
    * [center, spreadDistance 與 maxRange](#center-spreaddistance-與-maxrange)
    * [under 與 maxHeight](#under-與-maxheight)
    * [respectTeams](#respectteams)
    * [targets](#targets)
* [外部連結](#外部連結-references)

---

## 語法 (Syntax)

```commands
/spreadplayers <center> <spreadDistance> <maxRange> <respectTeams> <targets>
/spreadplayers <center> <spreadDistance> <maxRange> under <maxHeight> <respectTeams> <targets>
```

* `<>` = 必填

| 參數 / 欄位 | 類型 | 預設 | 說明 |
| --- | --- | --- | --- |
| `<center>` | `vec2` | - | 擴散範圍的中心點二維座標 |
| `<spreadDistance>` | `float` | - | 實體之間必須保持的最小間距 |
| `<maxRange>` | `float` | - | 距離中心點的最大允許擴散半徑 |
| `under` | `enum` | - | 啟用最大高度限制的宣告字元 |
| `<maxHeight>` | `int` | - | 限制實體可被傳送的最高 Y 座標 |
| `<respectTeams>` | `boolean` | - | 是否將同隊伍的實體保持在一起 |
| `<targets>` | `entity` | - | 欲進行擴散的目標實體 |

---

## 參數說明 (Parameters)

### `center`, `spreadDistance` 與 `maxRange`

> 決定擴散傳送的水平二維幾何範圍.

* `<center>`: 僅需輸入 X 與 Z 兩個軸向的數值. 支援絕對座標與相對座標 (`~`).
* `<maxRange>`: 儘管名稱帶有「半徑」的意味, 但實際產生的擴散範圍是一個以 `<center>` 為中心, 邊長為 `maxRange * 2` 的**正方形**區域, 而非圓形. 此數值必須大於 `<spreadDistance>` 加上 `1.0`.
* `<spreadDistance>`: 系統會盡可能確保所有被傳送的實體之間, 皆保持大於此數值的距離. 若區域過小或實體過多導致無法滿足此最小間距, 指令將會執行失敗並報錯.

---

### `under` 與 `maxHeight`

> (選填) 用於限制實體落點的垂直高度.

* 預設情況下 (不使用 `under` 時), 系統會在指定的水平隨機座標上, 從天空向下尋找最高的非空氣「固體方塊」, 並將實體安全地放置在該方塊表面.
* 加入 `under <maxHeight>` 後, 系統的向下尋找起點將會被限制在這個特定的 Y 座標以下.
* 常用於幽冥 (The Nether) 或地底洞穴. 例如在幽冥若不加上高度限制, 實體可能會被傳送並卡在基岩層頂部上方; 透過設定 `under 120`, 即可確保實體生成於基岩層下方的洞穴空間內.

---

### `respectTeams`

> 決定計分板隊伍 (Scoreboard Teams) 是否會影響實體的打散邏輯.

| 值 | 說明 |
| --- | --- |
| `true` | 同一個計分板隊伍的實體會被視為單一單位, 集中傳送至同一個隨機地點, 彼此不會被拆散. |
| `false` | 無視任何隊伍關聯, 所有的實體皆會被單獨分配並打散到獨立的隨機地點. |

---

### `targets`

> 指定要執行擴散傳送的對象.

* 支援使用目標選擇器 (如 `@a`, `@e`).
* 若只選擇單一實體, 系統仍會將其傳送到範圍內的隨機地點, 此時 `<spreadDistance>` 將無實質作用.
* 目標實體在傳送落地時, 系統會自動計算並給予安全的高度與位置, 不會因為掉落或卡在方塊中而受到窒息傷害. 不過若落點剛好在岩漿湖正上方, 實體仍會掉入岩漿中.

---

## 外部連結 (References)

* [Minecraft Wiki - /spreadplayers](https://zh.minecraft.wiki/w/%E5%91%BD%E4%BB%A4/spreadplayers)
* [目標選擇器 (Target Selectors)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/TargetSelectors.md)
* [座標系統 (Coordinate Systems)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/Coordinates.md)