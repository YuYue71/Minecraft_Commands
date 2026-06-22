# 成就進度 (`advancements/`)

> **分類:** `資料包` ｜ **適用版本:** `JE ≤ 1.20.4`
> **路徑:** `data/<namespace>/advancements/<名稱>.json` ｜ **引用格式:** `namespace:<名稱>`

---

## 目錄

* [概覽](#概覽-overview)
* [JSON 結構](#json-結構)
* [欄位說明](#欄位說明-fields)
    * [根層欄位](#根層欄位)
    * [子欄位：display (顯示設定)](#子欄位display-顯示設定)
    * [子欄位：criteria (達成條件)](#子欄位criteria-達成條件)
    * [子欄位：rewards (獎勵)](#子欄位rewards-獎勵)
* [條件依賴](#條件依賴-conditional-fields)
* [注意事項](#注意事項-notes)
* [外部連結](#外部連結-references)

---

## 概覽 (Overview)

成就進度 (Advancements) 控制遊戲內引導玩家探索之任務系統，包含解鎖條件 (Criteria)、UI 顯示狀態 (Display) 與達成獎勵 (Rewards)，並支援透過 Requirements (邏輯要求閘道) 組合成複雜之 Advancement Tree (進度樹狀圖)。

---

## JSON 結構

### 單一結構 (標準進度節點)

```json
{
    "parent": "minecraft:story/root",
    "display": {
        "icon": {
            "item": "minecraft:stone"
        },
        "title": "石器時代",
        "description": "用你新的鎬開採石頭",
        "frame": "task",
        "show_toast": true,
        "announce_to_chat": true,
        "hidden": false
    },
    "criteria": {
        "mine_stone": {
            "trigger": "minecraft:inventory_changed",
            "conditions": {
                "items": [
                    {
                        "items": ["minecraft:cobblestone"]
                    }
                ]
            }
        }
    },
    "requirements": [
        [
            "mine_stone"
        ]
    ],
    "rewards": {
        "experience": 5,
        "recipes": [
            "minecraft:stone_pickaxe"
        ]
    },
    "sends_telemetry_event": false
}

```

---

## 欄位說明 (Fields)

### 根層欄位

| 欄位 | 類型 | 必填 | 預設 | 說明 |
| --- | --- | --- | --- | --- |
| `parent` | `string` |  | — | Parent Node (父節點) 之 Registry ID (註冊識別碼)。若未填寫，此進度將成為新的 Root Node (根節點) 建立獨立的標籤頁 |
| `display` | `object` |  | — | UI Display (介面顯示) 設定。控制成就彈出視窗與進度選單中的視覺呈現 |
| `criteria` | `object` | ✓ | — | Criteria (達成條件) 集合。包含一或多個以自訂字串為鍵值的 Trigger (觸發器) 物件 |
| `requirements` | `array[][]` |  | — | Requirements (要求邏輯閘道) 二維字串陣列。定義如何組合 `criteria` 內部條件以完成進度 |
| `rewards` | `object` |  | — | Rewards (獎勵) 參數。當進度完成時給予玩家經驗、物品、配方或執行指令 |
| `sends_telemetry_event` | `boolean` |  | `false` | 是否將此進度之完成狀態作為 Telemetry Event (遙測事件) 發送至 Mojang 伺服器 |

### 子欄位：`display` (顯示設定)

| 欄位 | 類型 | 必填 | 預設 | 說明 |
| --- | --- | --- | --- | --- |
| `icon` | `object` | ✓ | — | Icon (圖示) 定義。需包含 `item` (字串，物品 ID) 與可選的 `nbt` (字串，SNBT 資料) |
| `title` | `string`/`object` | ✓ | — | Title (標題) 文字。支援純文字字串或 Raw JSON Text (原始 JSON 文本) 結構 |
| `description` | `string`/`object` | ✓ | — | Description (描述) 文字。支援純文字字串或 Raw JSON Text |
| `frame` | `string` |  | `"task"` | Frame Type (邊框類型)。決定圖示外框形狀與完成時之音效。枚舉值包含 `"task"` (任務/圓形)、`"goal"` (目標/橢圓)、`"challenge"` (挑戰/尖銳外框並帶有特殊音效) |
| `background` | `string` |  | — | Background Texture (背景材質) 圖片路徑。**僅當該進度為 Root Node (根節點) 時必填** |
| `show_toast` | `boolean` |  | `true` | 完成時是否於畫面右上角顯示 Toast (彈出提示) |
| `announce_to_chat` | `boolean` |  | `true` | 完成時是否於 Chat (聊天欄) 廣播提示訊息 |
| `hidden` | `boolean` |  | `false` | 是否 Hidden (隱藏)。若為 `true`，該進度在玩家完成前（或其父節點解鎖前）不會顯示於進度選單中 |

### 子欄位：`criteria` (達成條件)

此物件內部為一組以 Developer-defined Name (開發者自訂名稱，如 `"mine_stone"`) 為鍵值的物件：

| 欄位 | 類型 | 必填 | 預設 | 說明 |
| --- | --- | --- | --- | --- |
| `trigger` | `string` | ✓ | — | Trigger Type (觸發器類型) 之識別碼（如 `minecraft:inventory_changed`）。決定遊戲何時進行條件檢測 |
| `conditions` | `object` |  | — | Conditions (條件參數)。依據 `trigger` 的不同，提供特定的過濾器（如物品數量、實體狀態） |

### 達成條件與觸發器 (Criteria Triggers)

> 決定成就進度何時進行狀態驗證之核心事件偵測器 (Event Detectors)。每一個 Criterion (條件節點) 皆必須宣告一種 Trigger (觸發器) 並搭配其專屬之 Conditions (條件參數)。

#### JSON 結構

由於 `trigger` 高達 50 種以上，以下展示最泛用之 `inventory_changed` (物品欄變更) 與 `location` (座標位置) 兩種複合結構範本：

**範例一：偵測物品獲得 (`inventory_changed`)**

```json
{
    "criteria": {
        "get_diamond": {
            "trigger": "minecraft:inventory_changed",
            "conditions": {
                "items": [
                    {
                        "items": ["minecraft:diamond"],
                        "count": {
                            "min": 1
                        }
                    }
                ]
            }
        }
    }
}

```

**範例二：偵測進入特定環境 (`location`)**

```json
{
    "criteria": {
        "enter_nether": {
            "trigger": "minecraft:location",
            "conditions": {
                "player": [
                    {
                        "condition": "minecraft:entity_properties",
                        "entity": "this",
                        "predicate": {
                            "location": {
                                "dimension": "minecraft:the_nether"
                            }
                        }
                    }
                ]
            }
        }
    }
}

```

#### 枚舉值速查 (`trigger` 可填值)

此清單收錄佔據自訂成就進度 80% 邏輯之核心觸發器：

| 值 | 分類 | 說明 |
| --- | --- | --- |
| `minecraft:tick` | 系統迴圈 | Every Tick (每遊戲刻) 觸發。無特定事件，只要玩家符合內部 `player` 條件即解鎖（常用於無條件給予配方或後台常駐檢測）。 |
| `minecraft:inventory_changed` | 物品與容器 | 當玩家 Inventory (物品欄) 發生任何變動（獲得、丟棄、消耗）時觸發。核心參數為 `items` 陣列。 |
| `minecraft:consume_item` | 物品與容器 | 當玩家成功 Consume (消耗/食用) 物品（如吃食物、喝藥水）時觸發。核心參數為 `item`。 |
| `minecraft:recipe_unlocked` | 物品與容器 | 當玩家解鎖特定 Recipe (配方) 時觸發。需配合 `recipe` 參數傳入配方識別碼。 |
| `minecraft:location` | 空間與移動 | 每 20 Ticks (1 秒) 檢測一次玩家 Location (位置)。用於判定玩家是否身處特定生物群系、結構或維度。 |
| `minecraft:enter_block` | 空間與移動 | 當玩家 Hitbox (碰撞箱) 進入特定 Block (方塊，如水、地獄門、細雪) 內部時觸發。核心參數為 `block` 與 `state`。 |
| `minecraft:slept_in_bed` | 空間與移動 | 當玩家成功 Sleep (躺入床中) 時觸發。 |
| `minecraft:player_killed_entity` | 戰鬥與傷害 | 當玩家 Kill (擊殺) 任何實體時觸發。核心參數為 `entity` (目標條件) 與 `killing_blow` (致命擊條件)。 |
| `minecraft:entity_killed_player` | 戰鬥與傷害 | 當玩家被實體擊殺時觸發。 |
| `minecraft:player_hurt_entity` | 戰鬥與傷害 | 當玩家對實體造成 Damage (傷害) 時觸發。核心參數為 `damage`。 |
| `minecraft:entity_hurt_player` | 戰鬥與傷害 | 當玩家承受傷害時觸發。 |
| `minecraft:placed_block` | 建築與互動 | 當玩家 Place (放置) 方塊時觸發。核心參數為 `block` 與 `location`。 |
| `minecraft:item_used_on_block` | 建築與互動 | 當玩家對著方塊 Use Item (點擊右鍵使用物品，如打火匣點火、斧頭剝皮) 時觸發。 |
| `minecraft:tame_animal` | 實體互動 | 當玩家成功 Tame (馴服) 動物時觸發。核心參數為 `entity`。 |
| `minecraft:villager_trade` | 實體互動 | 當玩家與村民或流浪商人成功完成一次 Trade (交易) 時觸發。核心參數為 `villager` 與 `item`。 |
| `minecraft:summoned_entity` | 實體互動 | 當玩家 Summon (召喚，包含鐵魔像、凋零怪或丟出終界影眼) 實體時觸發。 |
| `minecraft:impossible` | 邏輯控制 | Impossible (不可自發達成)。玩家無法透過任何遊戲內行為解鎖，只能透過 `/advancement grant` 指令強制給予（常用於管理員權限控制或程式碼後門）。 |

#### 條件依賴 (Conditional Fields)

| 條件 | 生效欄位 | 失效 / 忽略欄位 |
| --- | --- | --- |
| `trigger` = `"minecraft:inventory_changed"` 時 | `conditions.items` 轉為可用 | 忽略 `entity` 等非物品欄檢測條件 |
| `trigger` = `"minecraft:tick"` 時 | 僅依賴 `conditions.player` 進行屬性驗證 | 忽略所有事件型條件引數 |
| `trigger` = `"minecraft:impossible"` 時 | **禁止**包含任何 `conditions` | 若包含 `conditions` 會導致資料包解析崩潰 |

---

### 子欄位：`rewards` (獎勵)

| 欄位 | 類型 | 必填 | 預設 | 說明 |
| --- | --- | --- | --- | --- |
| `recipes` | `array[]` |  | `[]` | Recipe IDs (配方識別碼) 陣列。進度完成時自動解鎖對應的合成配方 |
| `loot` | `array[]` |  | `[]` | Loot Table IDs (掉落物表識別碼) 陣列。進度完成時直接給予玩家該 Loot Table 抽取的物品 |
| `experience` | `int` |  | `0` | Experience Points (經驗值) 數量。給予玩家指定數量的經驗球點數（非等級） |
| `function` | `string` |  | — | Function ID (函式識別碼)。進度完成時，以該玩家作為 `@s` (執行者) 執行指定的 `.mcfunction` 巨集 |

---

## 條件依賴 (Conditional Fields)

| 條件 | 生效欄位 | 失效 / 忽略欄位 |
| --- | --- | --- |
| 未定義 `parent` 欄位 | 該進度被視為 Root (根節點)，`display.background` 轉為強制必填 | 若未填寫 `background` 將導致背景材質丟失（顯示黑紫方塊） |
| 未顯式宣告 `requirements` | 系統自動將 `criteria` 內部所有條件包裹為一個陣列（Logical AND 邏輯及） | — |

> **`requirements` 邏輯閘補充說明：**
> `requirements` 為一個「包含字串陣列的陣列」（`String[][]`）。
> * **外層陣列 (Outer Array):** 代表 Logical AND (邏輯及)。所有的內部陣列都必須滿足。
> * **內層陣列 (Inner Array):** 代表 Logical OR (邏輯或)。只要該陣列內有任一 `criteria` 鍵值被滿足即算通過。
> 
> 

---

## 注意事項 (Notes)

* 進度檔案一旦被載入，即使使用 `/advancement revoke` 撤銷進度，該進度給予的 `recipes` (配方) 與 `rewards` (獎勵物品/經驗) 不會自動被沒收，需另外撰寫函式處理。
* `hidden` 屬性極適合用於「隱藏成就」或「後台控制用進度（不包含 `display` 的純邏輯節點）」。

---

## 外部連結 (References)

* [Minecraft Wiki - 進度](https://minecraft.fandom.com/zh/wiki/%E8%BF%9B%E5%BA%A6/JSON%E6%A0%BC%E5%BC%8F)

---

*最後更新：2026-06-22*