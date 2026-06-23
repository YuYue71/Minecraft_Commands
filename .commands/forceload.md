# /forceload

> **分類:** `指令` | **權限等級:** `2` | **適用版本:** `JE ≤ 1.20.4` | **命令方塊:** `true`

---

## 目錄

* [語法](#語法-syntax)
* [參數說明](#參數說明-parameters)
    * [動作類型 (add, remove, query)](#動作類型-add-remove-query)
    * [from, to 與 pos](#from-to-與-pos)
* [外部連結](#外部連結-references)

---

## 語法 (Syntax)

```commands
/forceload add <from> [to]
/forceload remove <from> [to]
/forceload remove all
/forceload query
/forceload query <pos>
```

* `<>` = 必填, `[]` = 選填

| 參數 / 欄位 | 類型 | 預設 | 說明 |
| --- | --- | --- | --- |
| `add` / `remove` / `query` | `enum` | - | 決定對強制載入區塊執行的動作類型 |
| `all` | `enum` | - | 移除當前維度所有的強制載入區塊 |
| `<from>` | `vec2` | - | 欲操作的目標區塊起始二維座標 |
| `[to]` | `vec2` | `<from>` | 欲操作的目標區塊結束二維座標 |
| `<pos>` | `vec2` | 執行者當前位置 | 欲查詢的特定二維座標 |

---

## 參數說明 (Parameters)

### `動作類型 (add, remove, query)`

> 決定指令要如何操作或檢視區塊的強制載入狀態.

| 值 | 說明 |
| --- | --- |
| `add` | 將指定範圍內的區塊標記為「強制載入」 (Force-loaded). 即使沒有玩家在附近, 這些區塊也永遠不會被卸載, 內部的實體活動, 紅石機械與熔爐運算等皆會持續進行. |
| `remove` | 解除指定範圍內區塊的強制載入標記, 恢復為遊戲預設的動態載入與卸載機制. 若配合 `all` 參數, 則一併清除當前維度所有的強制載入標記. |
| `query` | 查詢特定的區塊是否處於強制載入狀態. 若不附加座標參數, 則會列出當前維度內所有被標記為強制載入的區塊座標. |

---

### `from`, `to` 與 `pos`

> 指定欲操作的二維水平空間範圍.

* 這些參數僅接受 `X` 與 `Z` 兩個水平維度的數值 (無視高度 `Y` 軸). 支援絕對座標與相對座標 (`~`).
* 系統會自動將輸入的精確座標點轉換並對齊為包含該點的完整「區塊 (Chunk)」 (16x16 範圍).
* 若僅輸入 `<from>`, 指令只會對該單一區塊執行操作.
* 若同時輸入 `<from>` 與 `[to]`, 系統會框選以這兩個座標為對角線的二維矩形範圍. 注意: 單次指令最多只能新增或移除 256 個區塊 (即 16x16 個區塊的面積). 若超出此範圍則會執行失敗.
* `forceload` 的標記是與「維度 (Dimension)」綁定的. 在主世界強制載入的區塊不會影響幽冥或終界, 且必須在對應的維度內執行才能查詢或解除.
* 伺服器管理者需謹慎使用此指令. 過多強制載入的區塊會嚴重消耗伺服器的記憶體與 CPU 運算資源, 導致整體效能下降 (Lag).

---

## 外部連結 (References)

* [Minecraft Wiki - /forceload](https://zh.minecraft.wiki/w/%E5%91%BD%E4%BB%A4/forceload)
* [座標系統 (Coordinate Systems)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/coordinates.md)