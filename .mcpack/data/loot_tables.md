# 戰利品表 (`loot_tables/`)

> **分類:** `資料包` | **適用版本:** `JE 1.20.4` | **路徑:** `data/<namespace>/loot_tables/<名稱>.json`

* 引用格式: `namespace:名稱` (不含副檔名)

---

## 概覽 (Overview)

定義方塊破壞, 生物死亡, 寶箱生成, 考古或釣魚等行為所產生的掉落物與抽取規則.

---

## JSON 結構

```json
{
    "type": "minecraft:block",
    "random_sequence": "minecraft:blocks/stone",
    "pools": [
        {
            "rolls": 1,
            "bonus_rolls": 0.0,
            "entries": [
                {
                    "type": "minecraft:item",
                    "name": "minecraft:stone",
                    "weight": 1,
                    "functions": [],
                    "conditions": []
                }
            ],
            "conditions": []
        }
    ],
    "functions": []
}

```

---

## 欄位說明 (Fields)

### 根層欄位

| 欄位 | 類型 | 必填 | 預設 | 說明 |
| --- | --- | --- | --- | --- |
| `type` | `string` |  | - | 定義此戰利品表的執行上下文(Context),限制可用的條件與函數 |
| `random_sequence` | `string` |  | - | 指定隨機數序列的路徑,確保固定種子碼下的掉落一致性 `[1.20.2+]` |
| `pools` | `list` |  | `[]` | 戰利品抽取池陣列,每個池為獨立的抽取計算單元 |
| `functions` | `list` |  | `[]` | 作用於此戰利品表所有產出物品的修飾函數陣列 |

### `pools` 子欄位

| 欄位 | 類型 | 必填 | 預設 | 說明 |
| --- | --- | --- | --- | --- |
| `rolls` | `int` / `object` | ✓ | - | 此池的基礎抽取次數,可為固定整數或數字提供者(Number Provider) |
| `bonus_rolls` | `float` / `object` |  | `0.0` | 每點幸運值(Luck)增加的額外抽取次數 |
| `entries` | `list` | ✓ | - | 此池中可抽取的項目陣列(見下方說明) |
| `conditions` | `list` |  | `[]` | 決定此池是否執行的條件陣列 |
| `functions` | `list` |  | `[]` | 作用於此池產出物品的修飾函數陣列 |

### `entries` 子欄位

| 欄位 | 類型 | 必填 | 預設 | 說明 |
| --- | --- | --- | --- | --- |
| `type` | `string` | ✓ | - | 定義此項目的類型(如物品,標籤,群組) |
| `name` | `string` |  | - | 指定對應的物品ID,標籤ID或另一個戰利品表路徑 |
| `children` | `list` |  | `[]` | 當類型為群組或分支時,包含的子項目陣列 |
| `weight` | `int` |  | `1` | 抽中此項目的相對權重,與池中其他項目相比較 |
| `quality` | `int` |  | `0` | 幸運值影響權重的參數(實際權重 = weight + quality * luck) |
| `conditions` | `list` |  | `[]` | 決定此項目是否被納入抽取清單的條件陣列 |
| `functions` | `list` |  | `[]` | 作用於此單一項目產出物品的修飾函數陣列 |

---

## 條件依賴 (Conditional Fields)

| 條件 | 生效欄位 | 失效 / 忽略欄位 |
| --- | --- | --- |
| `entries` 的 `type` 為 `"minecraft:item"`, `"minecraft:tag"` 或 `"minecraft:loot_table"` 時 | `name` 必填 | `children` 被忽略 |
| `entries` 的 `type` 為 `"minecraft:group"`, `"minecraft:alternatives"` 或 `"minecraft:sequence"` 時 | `children` 必填 | `name` 被忽略 |

---

## 枚舉值速查

### `type` (根層欄位) 可填值

| 值 | 分類 | 說明 |
| --- | --- | --- |
| `"minecraft:empty"` | 上下文 | 不提供任何額外參數(適用於 `/loot` 指令) |
| `"minecraft:chest"` | 上下文 | 寶箱戰利品(需要 `this` 實體與 `origin` 位置) |
| `"minecraft:command"` | 上下文 | 指令產生(需要 `origin` 位置) |
| `"minecraft:selector"` | 上下文 | 選項產生 |
| `"minecraft:fishing"` | 上下文 | 釣魚(需要 `this` 實體, `origin` 位置與 `tool` 工具) |
| `"minecraft:entity"` | 上下文 | 生物掉落(需要 `this` 實體, `damage_source` 來源與 `origin` 位置) |
| `"minecraft:archaeology"` | 上下文 | 考古可疑方塊清刷產出 `[1.20+]` |
| `"minecraft:gift"` | 上下文 | 貓或村民的贈禮 |
| `"minecraft:barter"` | 上下文 | 豬布林以物易物 |
| `"minecraft:advancement_reward"` | 上下文 | 成就獎勵 |
| `"minecraft:block"` | 上下文 | 方塊挖掘(需要 `block_state` 狀態, `origin` 位置與 `tool` 工具) |

### `type` (`entries` 子欄位) 可填值

| 值 | 分類 | 說明 |
| --- | --- | --- |
| `"minecraft:item"` | 基礎項目 | 直接掉落 `name` 指定的單一物品 |
| `"minecraft:tag"` | 基礎項目 | 從 `name` 指定的物品標籤中隨機挑選物品 |
| `"minecraft:loot_table"` | 基礎項目 | 呼叫並執行另一個 `name` 指定的戰利品表 |
| `"minecraft:empty"` | 基礎項目 | 不產生任何物品(用於稀釋池的機率) |
| `"minecraft:dynamic"` | 動態項目 | 產生由伺服器硬編碼邏輯決定的掉落物(如潛影盒內容物) |
| `"minecraft:group"` | 結構項目 | 執行 `children` 陣列中的所有項目 |
| `"minecraft:alternatives"` | 結構項目 | 依序測試 `children`,僅執行第一個條件通過的項目 |
| `"minecraft:sequence"` | 結構項目 | 依序執行 `children`,直到某個項目條件不通過為止 |

---

## 注意事項 (Notes)

* 權重(`weight`)並非絕對機率,而是該項目在同一 `pool` 中相對總權重的佔比.
* `[1.20.2+]` 新增了 `random_sequence` 機制. 若未填寫,原版方塊會自動推斷與其方塊 ID 相同的序列,以確保同一座標的相同方塊在相同世界種子下會掉落一樣的物品.
* 當 `entries` 為 `minecraft:tag` 且未使用 `expand` 選項時,會從標籤中隨機抽取一種物品;若要產生標籤內所有物品,需搭配特殊修飾函數使用.

---

## 外部連結 (References)

* [Minecraft Wiki](https://minecraft.fandom.com/zh/wiki/%E6%88%98%E5%88%A9%E5%93%81%E8%A1%A8)

---

*最後更新: 2026-06-22*