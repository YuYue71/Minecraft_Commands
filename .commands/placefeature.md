# /placefeature

> **分類:** `指令` | **權限等級:** `2` | **適用版本:** `JE ≤ 1.19.2` | **命令方塊:** `true`
> **[!] 棄用警告 (Deprecation Notice):** 此指令已於 Java Edition 1.19.3 被完全移除, 並整併入全新的 `/place` 指令中. 若您的伺服器或製圖環境為 1.19.3 或更高版本, 請改為使用 `/place feature <feature> [pos]`.

---

## 目錄

* [語法](#語法-syntax)
* [參數說明](#參數說明-parameters)
    * [feature](#feature)
    * [pos](#pos)
* [資料包結構參考 (Datapack Structure)](#資料包結構參考-datapack-structure)
* [外部連結](#外部連結-references)

---

## 語法 (Syntax)

```commands
/placefeature <feature>
/placefeature <feature> [pos]

```

* `<>` = 必填, `[]` = 選填

| 參數 / 欄位 | 類型 | 預設 | 說明 |
| --- | --- | --- | --- |
| `<feature>` | `string` | - | 欲放置的已配置地物 (Configured Feature) ID. **需透過資料包定義**. |
| `[pos]` | `vec3` | 執行者當前位置 | 欲放置的目標基準座標 |

---

## 參數說明 (Parameters)

### `feature`

> 指定要生成的具體地圖元素類型與名稱.

* 必須輸入標準的資源位置 (如 `minecraft:tree_pine`, `minecraft:monster_room`).
* 遊戲底層的地物 (Feature) 包含了樹木, 礦脈, 湖泊, 終界柱等構成生態域的基本物理組件.
* 當執行此指令時, 系統會嘗試在目標座標強制生成該地物. 但若目標座標的地形條件 (如方塊類型, 空間高度) 不符合該地物的內部生成規則 (Placement Modifiers), 則可能生成失敗或無法完整顯示 (例如嘗試在半空中生成需要依附於石頭的礦脈).

---

### `pos`

> 指定地物生成的基準中心點.

* 包含三個軸向 (X, Y, Z) 的座標數值.
* 支援絕對座標與相對座標 (`~`, `^`).
* 若未填寫此參數, 系統預設會以執行此指令的實體或命令方塊的當前座標作為生成起點.

---

## 資料包結構參考 (Datapack Structure)

`/placefeature` 高度依賴資料包內的 `worldgen` (世界生成) 目錄來調用自訂的地物配置.

* **標準目錄路徑:** `data/<namespace>/worldgen/configured_feature/<path>.json`
* **調用資源位置:** `<namespace>:<path>`

**JSON 核心結構範例 (自訂生成一個圓形方塊陣列):**

```json
{
  "type": "minecraft:disk",
  "config": {
    "state_provider": {
      "type": "minecraft:simple_state_provider",
      "state": {
        "Name": "minecraft:diamond_block"
      }
    },
    "target": {
      "type": "minecraft:matching_blocks",
      "blocks": [
        "minecraft:dirt",
        "minecraft:grass_block"
      ]
    },
    "radius": {
      "type": "minecraft:uniform",
      "value": {
        "min_inclusive": 2,
        "max_inclusive": 4
      }
    },
    "half_height": 1
  }
}

```

---

## 外部連結 (References)

* [Minecraft Wiki - /placefeature](https://zh.minecraft.wiki/w/%E5%91%BD%E4%BB%A4/placefeature)
* [座標系統 (Coordinate Systems)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/coordinates.md)
* [資源位置與命名空間規範 (Resource Locations)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/ResourceLocations.md)