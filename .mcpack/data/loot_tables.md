## 修改數據 (`loot_tables/`)

> **分類:** `資料包` ｜ **適用版本:** `JE ≤ 1.20.4`
> **路徑:** `data/<namespace>/loot_tables/<子分類>/<名稱>.json` ｜ **引用格式:** `namespace:<名稱>`

---

## 目錄

* [概覽](#概覽-overview)
* [JSON 結構](#json-結構)
* [欄位說明](#欄位說明-fields)
    * [根層欄位](#根層欄位)
    * [子欄位：pools (抽取池)](#子欄位pools-抽取池)
    * [子欄位：entries (條目)](#子欄位entries-條目)
* [枚舉值與複合結構擴展](#枚舉值與複合結構擴展)
    * [條目類型 (Entry Types)](#條目類型-entry-types)
    * [執行條件 (Conditions)](#執行條件-conditions)
    * [物品修飾函數 (Functions)](#物品修飾函數-functions)
* [條件依賴](#條件依賴-conditional-fields)
* [注意事項](#注意事項-notes)
* [外部連結](#外部連結-references)

---

## 概覽 (Overview)

掉落物表（Loot Table）控制遊戲內所有隨機物品之生成邏輯，涵蓋 Block Drops（方塊掉落）、Entity Loot（實體死亡掉落）、Chest Generation（寶箱戰利品）、Fishing（釣魚）、Archaeology（考古刷除）與 Hero of the Village（村莊英雄贈禮）等系統。

---

## JSON 結構

### 單一結構 (標準抽取池模型)

```json
{
    "type": "minecraft:block",
    "pools": [
        {
            "rolls": 1,
            "bonus_rolls": 0.0,
            "entries": [
                {
                    "type": "minecraft:item",
                    "name": "minecraft:diamond",
                    "weight": 1,
                    "functions": [
                        {
                            "function": "minecraft:set_count",
                            "count": {
                                "type": "minecraft:uniform",
                                "min": 1.0,
                                "max": 3.0
                            }
                        }
                    ]
                }
            ],
            "conditions": [
                {
                    "condition": "minecraft:survives_explosion"
                }
            ]
        }
    ],
    "random_sequence": "minecraft:blocks/diamond_ore"
}

```

---

## 欄位說明 (Fields)

### 根層欄位

| 欄位 | 類型 | 必填 | 預設 | 說明 |
| --- | --- | --- | --- | --- |
| `type` | `string` |  | `"minecraft:generic"` | 掉落物表之 Context Type (上下文類型)。限制可傳入之特定參數（如破壞方塊的工具、殺死實體的兇手）。枚舉值如 `minecraft:block`、`minecraft:entity`、`minecraft:chest` |
| `pools` | `array[]` |  | `[]` | Loot Pools (抽取池) 陣列。每個池子獨立運算抽取次數與條件，最後將所有池子的產出物合併 |
| `random_sequence` | `string` |  | — | `[1.20.2+]` 指定獨立的 Random Sequence (隨機序列) 識別碼，確保相同的 Seed (種子碼) 能產生確定性掉落結果 |

### 子欄位：`pools` (抽取池)

| 欄位 | 類型 | 必填 | 預設 | 說明 |
| --- | --- | --- | --- | --- |
| `rolls` | `number`/`object` | ✓ | — | Base Rolls (基礎抽取次數)。支援精確數值或 Number Provider (數值提供者，如均勻分佈隨機數) |
| `bonus_rolls` | `number`/`object` |  | `0.0` | Bonus Rolls (額外抽取次數)。依賴玩家的 Luck (幸運屬性) 增加額外抽取次數：`總次數 = rolls + (幸運值 * bonus_rolls)` |
| `entries` | `array[]` | ✓ | — | Entries (條目) 陣列。該池子被觸發時，供系統抽取之物品或子掉落物表清單 |
| `conditions` | `array[]` |  | `[]` | Conditions (執行條件) 陣列。必須陣列內**所有**條件皆回傳 `true`，該抽取池才會啟動運算 |
| `functions` | `array[]` |  | `[]` | Functions (物品修飾函數) 陣列。修改該池子產出之**所有**物品數量、NBT 或附魔屬性 |

### 子欄位：`entries` (條目)

| 欄位 | 類型 | 必填 | 預設 | 說明 |
| --- | --- | --- | --- | --- |
| `type` | `string` | ✓ | — | Entry Type (條目類型)。決定此條目是具體物品、空值，或另一個掉落物表。見後續枚舉表 |
| `weight` | `int` |  | `1` | Random Weight (隨機權重)。僅當此條目與其他條目處於同一層級時有效，數值越高越容易被抽中 |
| `quality` | `int` |  | `0` | Quality (品質修飾)。受玩家幸運屬性影響，動態改變權重：`最終權重 = weight + (幸運值 * quality)` |
| `conditions` | `array[]` |  | `[]` | 專屬於此單一條目之過濾條件 |
| `functions` | `array[]` |  | `[]` | 專屬於此單一條目產出物品之修飾函數 |

*(註：依據 `type` 的不同，`entries` 內部會衍生出如 `name`、`children` 等專屬必填欄位，將於下一階段展開。)*

---

## 枚舉值與複合結構擴展
### 條目類型 (Entry Types)
> Entry (條目) 位於 Loot Pool (抽取池) 之內部陣列中，負責宣告單次抽取運算所對應之實際 Item (物品)、標籤集合，或是控制流程之邏輯節點。

#### type = `"minecraft:item"` 時 (單一物品)

```json
{
    "type": "minecraft:item",
    "name": "minecraft:diamond_sword",
    "weight": 1,
    "quality": 0,
    "functions": [],
    "conditions": []
}

```

#### type = `"minecraft:alternatives"` 時 (條件分支)

```json
{
    "type": "minecraft:alternatives",
    "children": [
        {
            "type": "minecraft:item",
            "name": "minecraft:golden_apple",
            "conditions": [
                {
                    "condition": "minecraft:random_chance",
                    "chance": 0.1
                }
            ]
        },
        {
            "type": "minecraft:item",
            "name": "minecraft:apple"
        }
    ]
}

```

#### 條目專屬子欄位
> 依據 `type` (條目類型) 之不同，Entry (條目) 物件內需補齊對應之目標引數：

| 欄位 | 類型 | 必填 | 預設 | 說明 |
| --- | --- | --- | --- | --- |
| `name` | `string` |  | — | Target ID (目標識別碼)。當類型為物品、標籤、動態資料或掉落物表時，指定目標的 Registry ID (註冊識別碼) |
| `children` | `array[]` |  | — | Child Entries (子條目) 陣列。當類型為控制節點（如 `alternatives`）時，於此陣列內嵌套下一層級的條目結構 |
| `expand` | `boolean` |  | `false` | Tag Expansion (標籤展開)。僅用於 `minecraft:tag`。若設為 `true`，標籤內所有物品將被拆解為獨立條目參與權重抽取；若為 `false`，則將標籤內的所有物品全部一併掉落 |

#### `type` 可填值 (核心分流)

| 值 | 分類 | 說明 |
| --- | --- | --- |
| `minecraft:item` | 實體產出 | 生成由 `name` 所指定之單一 Item (物品) |
| `minecraft:tag` | 實體產出 | 生成由 `name` 所指定之 Item Tag (物品標籤) 集合，行為受 `expand` 欄位控制 |
| `minecraft:loot_table` | 模組化 | 觸發並執行由 `name` 所指定之另一個 Loot Table (掉落物表)，實現資料解耦 |
| `minecraft:dynamic` | 特殊產出 | 產生依附於特定事件之 Dynamic Drops (動態掉落物)，如潛影盒內物品或方塊內部儲存之 NBT 資料 |
| `minecraft:empty` | 邏輯控制 | 空產出。不掉落任何物品，常搭配高權重用於「銘謝惠顧」的空包彈抽取 |
| `minecraft:alternatives` | 邏輯控制 | 條件分支 (IF-ELSE)。由上而下依序評估 `children` 陣列，只要其中一個子條目的 `conditions` 成立並執行，即立刻終止，**不再評估後續子條目** |
| `minecraft:sequence` | 邏輯控制 | 序列執行 (AND)。依序評估 `children` 陣列，若某一個子條目的條件失敗，則立刻中斷，**後續子條目全數失效** |
| `minecraft:group` | 邏輯控制 | 群體打包 (GROUP)。無視子條目間的關係，各自獨立判定條件並執行所有符合的 `children` 子條目 |

#### 條件依賴 (Conditional Fields)

| 條件 | 生效欄位 | 失效 / 忽略欄位 |
| --- | --- | --- |
| `type` 為 `item`、`tag`、`loot_table`、`dynamic` 時 | `name` 轉為強制必填 | `children` 被忽略 |
| `type` 為 `alternatives`、`sequence`、`group` 時 | `children` 陣列轉為強制必填 | `name` 被忽略 |
| `type` = `"minecraft:tag"` 時 | `expand` 引數有效 | — |

---

### 執行條件 (Conditions)
> 定義 Loot Pool (抽取池) 或單一 Entry (條目) 成功執行之 Prerequisites (先決條件)。陣列內所有條件皆必須回傳 `true` 才會觸發掉落 (即 Logical AND 邏輯及)。

#### JSON 結構
> Condition (執行條件) 物件之內部結構嚴格依賴 `condition` 宣告之類型。以下展示涵蓋機率判定與工具判定之複合結構範本：

```json
{
    "conditions": [
        {
            "condition": "minecraft:random_chance",
            "chance": 0.5
        },
        {
            "condition": "minecraft:match_tool",
            "predicate": {
                "enchantments": [
                    {
                        "enchantment": "minecraft:silk_touch",
                        "levels": {
                            "min": 1
                        }
                    }
                ]
            }
        }
    ]
}

```

#### 欄位說明

| 欄位 | 類型 | 必填 | 預設 | 說明 |
| --- | --- | --- | --- | --- |
| `condition` | `string` | ✓ | — | 目標 Condition Type (條件類型) 之 Registry ID (註冊識別碼)。枚舉值見下方 |

*(註：其餘子欄位完全由 `condition` 之值決定，例如 `chance`、`predicate` 等。)*

#### 枚舉值速查 (`condition` 可填值)
> 此清單收錄佔據掉落物表 90% 邏輯運算之核心條件：

| 值 | 分類 | 說明 |
| --- | --- | --- |
| `minecraft:survives_explosion` | 核心防護 | 依據爆炸半徑動態衰減掉落機率。所有一般 Block Drops (方塊掉落) 必須包含此條件，否則被 TNT 炸毀時將 100% 掉落造成伺服器卡頓 |
| `minecraft:random_chance` | 機率控制 | 基礎固定機率判定，需配合 `chance` (浮點數，`0.0` ~ `1.0`) 使用 |
| `minecraft:random_chance_with_looting` | 機率控制 | 受 Looting (掠奪) 附魔等級加成之機率判定。需配合 `chance` 與 `looting_multiplier` (掠奪乘數) 使用 |
| `minecraft:killed_by_player` | 實體判定 | 驗證殺死該實體之 Damage Source (傷害來源) 是否為 Player (玩家) |
| `minecraft:entity_properties` | 實體判定 | 驗證特定 Target (目標實體，如 `this`、`killer`、`killer_player`) 是否符合指定之 Entity Predicate (實體條件判定，如著火狀態、NBT 標籤) |
| `minecraft:match_tool` | 工具判定 | 驗證挖掘方塊或擊殺實體所使用之 Item (物品) 是否符合 Item Predicate (物品條件判定，如特定材質或附魔) |
| `minecraft:table_bonus` | 工具判定 | 依據工具之 Enchantment Level (附魔等級，通常為 Fortune 幸運) 從陣列中讀取對應之掉落機率 |
| `minecraft:block_state_property` | 環境判定 | 驗證 Block State (方塊狀態) 是否符合要求 (如：農作物 `age` 屬性是否達到最大值) |
| `minecraft:weather_check` | 環境判定 | 驗證當前維度之天候狀態 (如 `raining`、`thundering`) |
| `minecraft:time_check` | 環境判定 | 驗證當前 Day/Night Cycle (日夜迴圈) 之時間範圍 (`value` 介於 0 至 24000) |
| `minecraft:alternative` | 邏輯路由 | 內部包含一個 `terms` 條件陣列。只要其中**任意一個**條件成立即回傳 `true` (即 Logical OR 邏輯或) |
| `minecraft:inverted` | 邏輯路由 | 將內部包裝之單一 `term` 條件結果反轉 (即 Logical NOT 邏輯非) |

#### 條件依賴 (Conditional Fields)

| 條件 | 生效欄位 | 失效 / 忽略欄位 |
| --- | --- | --- |
| `condition` = `"minecraft:random_chance"` 時 | `chance` 欄位轉為必填 | `predicate` 等物件條件被忽略 |
| `condition` = `"minecraft:match_tool"` 時 | `predicate` 欄位轉為必填 | `chance` 等純量機率被忽略 |
| `condition` = `"minecraft:entity_properties"` 時 | `entity` (目標) 與 `predicate` (條件) 轉為必填 | — |

---

### 物品修飾函數 (Functions)

> 定義該抽取池或條目產出物品後之 Modification (修飾) 邏輯，如動態調整堆疊數量、附加附魔、寫入自訂 NBT 標籤或執行環境熔煉。陣列內之函數將依序由上至下對物品進行管線加工。

#### JSON 結構
> Function (修飾函數) 之內部結構高度依賴 `function` 宣告之識別碼。以下展示涵蓋數量控制與 NBT 寫入之複合範本：

```json
{
    "functions": [
        {
            "function": "minecraft:set_count",
            "count": {
                "type": "minecraft:uniform",
                "min": 1.0,
                "max": 3.0
            }
        },
        {
            "function": "minecraft:apply_bonus",
            "enchantment": "minecraft:fortune",
            "formula": "minecraft:ore_drops"
        },
        {
            "function": "minecraft:set_nbt",
            "tag": "{CustomModelData:1, display:{Name:'{\"text\":\"Custom Sword\",\"color\":\"gold\"}'}}"
        }
    ]
}

```

#### 欄位說明

| 欄位 | 類型 | 必填 | 預設 | 說明 |
| --- | --- | --- | --- | --- |
| `function` | `string` | ✓ | — | 目標 Function Type (函數類型) 之 Registry ID (註冊識別碼)。枚舉值見下方 |
| `conditions` | `array[]` |  | `[]` | 專屬於此單一函數之執行條件（如：僅當玩家處於潛行時才觸發此修飾） |

*(註：其餘子欄位完全由 `function` 之值決定，如 `count`、`tag`、`formula` 等。)*

#### 枚舉值速查 (`function` 可填值)
> 此清單收錄最常使用之核心物品加工函數：

| 值 | 分類 | 說明 |
| --- | --- | --- |
| `minecraft:set_count` | 數量控制 | 覆寫物品之 Stack Size (堆疊數量)，支援固定常數或均勻分佈之 Number Provider (數值提供者) |
| `minecraft:apply_bonus` | 數量控制 | 讀取工具之特定 Enchantment Level (附魔等級，如幸運)，套用指定之 Formula (數學公式) 增加掉落物數量 |
| `minecraft:looting_enchant` | 數量控制 | 專用於實體掉落。依據擊殺者武器之 Looting (掠奪) 等級，透過 `count` 參數動態增加掉落數量 |
| `minecraft:explosion_decay` | 數量控制 | 依據方塊與爆炸中心之距離，動態按比例銷毀掉落物堆疊數量（防爆卡頓必備） |
| `minecraft:set_nbt` | 數據修改 | 將指定之 SNBT 字串寫入該物品之 `tag` 節點中，可用於賦予 CustomModelData 或自訂屬性 `[JE ≤ 1.20.4]` |
| `minecraft:set_name` | 數據修改 | 覆寫物品之 Display Name (顯示名稱)，支援 Raw JSON Text (原始 JSON 文本) 解析 |
| `minecraft:set_lore` | 數據修改 | 追加或覆寫物品之 Lore (傳說/說明文字) 陣列 |
| `minecraft:set_damage` | 狀態修改 | 設定具備耐久度物品之 Damage Value (損壞值)。`0.0` 為全新，`1.0` 為即將損壞 |
| `minecraft:furnace_smelt` | 狀態修改 | 將產出物品透過 Smelting Recipe (熔爐配方) 自動轉化為其燒煉後的結果（如同自帶火元附魔） |
| `minecraft:enchant_with_levels` | 附魔加工 | 模擬 Enchanting Table (附魔台) 行為，依據 `levels` 參數為物品附加對應強度之隨機附魔 |
| `minecraft:enchant_randomly` | 附魔加工 | 無視附魔等級限制，直接從指定的附魔清單中隨機抽取並賦予至物品上 |

#### 條件依賴 (Conditional Fields)

| 條件 | 生效欄位 | 失效 / 忽略欄位 |
| --- | --- | --- |
| `function` = `"minecraft:set_count"` 時 | `count` 欄位轉為必填 | — |
| `function` = `"minecraft:set_nbt"` 時 | `tag` 欄位 (SNBT 字串) 轉為必填 | 忽略所有與附魔或數量相關之引數 |
| `function` = `"minecraft:apply_bonus"` 時 | `enchantment` 與 `formula` 轉為必填 | — |

---

## 條件依賴 (Conditional Fields)

| 條件 | 生效欄位 | 失效 / 忽略欄位 |
| --- | --- | --- |
| `type` = `"minecraft:block"` 時 | 可於條件中呼叫 `match_tool` 等破壞工具參數 | 無法呼叫 `killer_entity` 實體參數 |
| `type` = `"minecraft:entity"` 時 | 可於條件中呼叫 `entity_properties` 與 `killer_entity` | 無法呼叫方塊狀態或破壞工具參數 |

---

## 注意事項 (Notes)

* 掉落物表內部之 `weight` (權重) 演算法為**相對機率**。若池內有兩個條目權重皆為 `1`，則機率各為 50%；若權重分別為 `10` 與 `90`，則機率為 10% 與 90%。
* 若掉落物表解析失敗（如 JSON 語法錯誤或引用不存在的物品 ID），遊戲內預設會掉落**空無一物**，並於伺服器控制台拋出錯誤警告。

---

## 外部連結 (References)

* [Minecraft Wiki - 掉落物表](https://minecraft.fandom.com/zh/wiki/%E6%88%98%E5%88%A9%E5%93%81%E8%A1%A8)

---

*最後更新：2026-06-22*