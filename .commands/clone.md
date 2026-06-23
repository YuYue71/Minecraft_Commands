# /clone

> **分類:** `指令` | **權限等級:** `2` | **適用版本:** `JE ≤ 1.20.4` | **命令方塊:** `true`

---

## 目錄

* [語法](#語法-syntax)
* [參數說明](#參數說明-parameters)
    * [begin, end 與 destination](#begin-end-與-destination)
    * [遮罩模式 (Mask Modes)](#遮罩模式-mask-modes)
    * [filter](#filter)
    * [複製模式 (Clone Modes)](#複製模式-clone-modes)
* [外部連結](#外部連結-references)

---

## 語法 (Syntax)

```commands
/clone <begin> <end> <destination>
/clone <begin> <end> <destination> <masked\|replace> [cloneMode]
/clone <begin> <end> <destination> filtered <filter> [cloneMode]

```

* `<>` = 必填, `[]` = 選填, `\|` = 二擇一

| 參數 / 欄位 | 類型 | 預設 | 說明 |
| --- | --- | --- | --- |
| `<begin>` | `vec3` | - | 來源區域的起始對角座標 |
| `<end>` | `vec3` | - | 來源區域的結束對角座標 |
| `<destination>` | `vec3` | - | 目標區域的西北下角 (座標最小點) |
| `<masked|replace>` | `enum` | `replace` | 決定處理空氣與覆蓋邏輯的遮罩模式 |
| `filtered` | `enum` | - | 啟用指定方塊過濾的特殊遮罩模式 |
| `<filter>` | `block_predicate` | - | 欲過濾 (僅複製) 的方塊類型或標籤 |
| `[cloneMode]` | `enum` | `normal` | 處理區域重疊與來源清理的複製模式 |

---

## 參數說明 (Parameters)

### `begin`, `end` 與 `destination`

> 定義要複製的三維空間範圍與貼上的目標位置.

* `<begin>` 與 `<end>` 定義了一個長方體區域 (來源區). 這兩個座標為長方體的對角線頂點, 輸入順序不影響結果.
* `<destination>` 定義了目標區域的位置. 該座標會精確對齊目標長方體的**西北下角** (即 X, Y, Z 三個軸向數值皆為最小的頂點位置).
* 預設情況下, 來源區域的最大體積限制為 32768 個方塊 (可透過遊戲規則 `commandModificationBlockLimit` 進行更改).

---

### `遮罩模式 (Mask Modes)`

> 決定複製過程中如何處理空氣方塊與覆蓋邏輯.

| 值 | 說明 |
| --- | --- |
| `replace` | (預設值) 複製來源區域內的所有方塊 (包含空氣), 並完全覆蓋目標區域對應位置的所有方塊. |
| `masked` | 僅複製來源區域內的非空氣方塊. 若來源區域的某位置是空氣, 則目標區域對應位置的原有方塊將被保留, 不會遭到破壞. |
| `filtered` | 必須搭配後方的 `<filter>` 參數使用. 僅單獨抽出並複製來源區域內符合條件的特定方塊, 其餘方塊皆會被忽略不處理. |

---

### `filter`

> 在 `filtered` 遮罩模式下, 決定哪些方塊被允許複製.

* 必須輸入標準的方塊資源位置 (如 `minecraft:stone`) 或方塊標籤 (如 `#minecraft:logs`).
* 支援附加方塊狀態 (Block States) 以進行更精準的篩選, 例如 `minecraft:chest[facing=east]` 僅會複製面朝正東方的箱子.
* 此參數僅過濾方塊類型與狀態, 不支援透過 NBT 標籤進行內容物比對.

---

### `複製模式 (Clone Modes)`

> 決定複製行為本身如何處理來源與空間重疊問題.

| 值 | 說明 |
| --- | --- |
| `normal` | (預設值) 正常複製. 若系統偵測到來源區域與目標區域發生空間重疊, 為避免無限遞迴, 指令將會直接報錯並終止執行. |
| `force` | 強制複製. 即使來源區域與目標區域發生重疊, 依然強制執行覆蓋與複製操作. |
| `move` | 移動模式. 將來源區域的方塊複製至目標區域後, 會自動將原本來源區域的所有方塊清空替換為空氣 (等同於剪下並貼上). |

---

## 外部連結 (References)

* [Minecraft Wiki - /clone](https://zh.minecraft.wiki/w/%E5%91%BD%E4%BB%A4/clone)
* [座標系統 (Coordinate Systems)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/Coordinates.md)
* [方塊狀態與標籤 (Block States & Tags)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/BlockStates_or_Tags.md)
* [資源位置與命名空間規範 (Resource Locations)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/ResourceLocations.md)