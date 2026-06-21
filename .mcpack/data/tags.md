# 標籤 (`tags/`)

> **分類:** `資料包` | **適用版本:** `JE 1.20.4` | **路徑:** `data/<namespace>/tags/<註冊表類型>/<名稱>.json`

* 引用格式: `#namespace:名稱` (指令或系統中呼叫標籤時, 開頭必須加上 `#` 符號)

---

## 概覽 (Overview)

用於將多個同類型的方塊, 物品, 實體或函式等元素歸類為單一群組, 以便在指令, 合成配方或進度中統一呼叫與集中管理.

---

## JSON 結構

```json
{
    "replace": false,
    "values": [
        "minecraft:stone",
        "#minecraft:dirt",
        {
            "id": "minecraft:diamond",
            "required": false
        }
    ]
}

```

---

## 欄位說明 (Fields)

### 根層欄位

| 欄位 | 類型 | 必填 | 預設 | 說明 |
| --- | --- | --- | --- | --- |
| `replace` | `boolean` |  | `false` | 若設為 `true`, 將完全覆寫較低優先級資料包中同名的標籤內容; 若為 `false`, 則將當前陣列合併入原有標籤內容中. |
| `values` | `array` | ✓ | - | 包含該標籤所群組的所有元素清單, 陣列內可混用純字串與物件格式. |

### `values` 子欄位 (物件格式)

> 陣列內的元素若使用物件格式 `{}` 而非純字串, 可額外定義該元素的嚴格依賴性.

| 欄位 | 類型 | 必填 | 預設 | 說明 |
| --- | --- | --- | --- | --- |
| `id` | `string` | ✓ | - | 目標元素的命名空間 ID 或其他標籤的名稱 (引用其他標籤需加 `#`). |
| `required` | `boolean` |  | `true` | 若設為 `false`, 當該 ID 在遊戲內不存在 (如缺少特定模組) 時, 遊戲將靜默略過該元素而不會拋出解析錯誤. |

---

## 註冊表類型速查 (Registry Types)

> 標籤必須放置於對應其類型的專屬資料夾下, 常見的資料夾名稱如下.

| 資料夾名稱 | 分類 | 說明 |
| --- | --- | --- |
| `blocks` | 方塊資源 | 用於歸類方塊, 可應用於 `/execute if block`, 採集工具判定等. |
| `items` | 物品資源 | 用於歸類物品, 可應用於合成配方, 玩家背包檢查 (`/clear`), 掉落物等. |
| `entity_types` | 實體資源 | 用於歸類實體類型, 可應用於目標選擇器的 `type=#...` 參數. |
| `functions` | 邏輯控制 | 用於歸類函式腳本 (`.mcfunction`), 特別是 `#minecraft:tick` 與 `#minecraft:load`. |
| `damage_type` | 戰鬥系統 | 用於歸類傷害來源與類型, 影響裝甲附魔減傷或實體免疫判定. |
| `fluids` | 流體系統 | 用於歸類流體 (如水, 熔岩), 影響流體物理或互動行為. |
| `game_events` | 聲學系統 | 用於歸類遊戲事件, 影響幽匿感測體 (Sculk Sensor) 的偵測與共振頻率. |
| `worldgen/...` | 世界生成 | 包含生物群系 (`biomes`), 結構 (`structures`) 等多種子分類標籤. |

---

## 注意事項 (Notes)

* 標籤內部可以嵌套呼叫其他標籤 (例如在 `blocks/stone_types.json` 內寫入 `#minecraft:base_stone_overworld`), 但嚴禁循環依賴 (A 呼叫 B, B 呼叫 A), 否則會導致遊戲崩潰或載入失敗.
* `minecraft` 命名空間內建兩個特殊的函式標籤: `minecraft:tags/functions/load.json` (資料包載入時執行一次) 與 `minecraft:tags/functions/tick.json` (每個遊戲刻執行一次).
* 即使是單一元素的標籤, `values` 也必須使用陣列 `[]` 包裝.

---

## 外部連結 (References)

* [Minecraft Wiki - 標籤](https://#)

---

*最後更新: 2026-06-21*