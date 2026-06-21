# 進度 (`advancements/`)

> **分類:** `資料包` ｜ **適用版本:** `JE 1.20.4` ｜ **路徑:** `data/<namespace>/advancements/<名稱>.json`

* 引用格式：`namespace:名稱`（不含副檔名）

---

## 概覽 (Overview)

用於追蹤玩家在遊戲內達成的各項成就、解鎖自訂獎勵、引導遊戲主線流程，或作為資料包底層邏輯觸發器（透過事件監聽器異步呼叫命令）的 JSON 設定檔。

---

## JSON 結構

```json
{
    "display": {
        "icon": {
            "item": "minecraft:diamond"
        },
        "title": {
            "text": "進度標題"
        },
        "description": {
            "text": "進度詳細敘述"
        },
        "frame": "task",
        "show_toast": true,
        "announce_to_chat": true,
        "hidden": false
    },
    "parent": "namespace:parent_advancement",
    "criteria": {
        "custom_trigger_name": {
            "trigger": "minecraft:inventory_changed",
            "conditions": {
                "items": [
                    {
                        "items": [
                            "minecraft:diamond"
                        ]
                    }
                ]
            }
        }
    },
    "requirements": [
        [
            "custom_trigger_name"
        ]
    ],
    "rewards": {
        "recipes": [
            "minecraft:diamond_pickaxe"
        ],
        "loot": [
            "minecraft:chests/abandoned_mineshaft"
        ],
        "experience": 100,
        "function": "namespace:reward_function"
    }
}

```

---

## 欄位說明 (Fields)

### 根層欄位

| 欄位 | 類型 | 必填 | 預設 | 說明 |
| --- | --- | --- | --- | --- |
| `display` | `object` |  | — | 定義進度在遊戲中進度分頁（L鍵）的視覺外觀與圖示，省略此欄位則該進度會變為隱含進度（用於後台邏輯）。 |
| `parent` | `string` |  | — | 父進度的命名空間 ID。未指定此欄位時，該進度會自動被判定為根進度（Root），並建立一個全新的進度分頁。 |
| `criteria` | `object` | ✓ | — | 達成該進度所需的觸發條件映射表。內含至少一個自訂識別名稱的觸發器物件。 |
| `requirements` | `array` |  | — | 定義多個條件之間的邏輯組合（AND / OR 矩陣）。若不填，則預設必須達成 `criteria` 內的所有條件（AND 邏輯）。 |
| `rewards` | `object` |  | — | 當玩家完全達成此進度時，系統自動發放的獎勵內容。 |

### `display` 子欄位

| 欄位 | 類型 | 必填 | 預設 | 說明 |
| --- | --- | --- | --- | --- |
| `icon` | `object` | ✓ | — | 指定進度在分頁上顯示的物品圖示，內部包含一個 `item` 欄位（字串，方塊或物品 ID）。 |
| `title` | `object` / `string` | ✓ | — | 進度的標題名稱。支援 JSON 原始文本組件格式。 |
| `description` | `object` / `string` | ✓ | — | 進度的詳細描述文本。支援 JSON 原始文本組件格式。 |
| `frame` | `enum` |  | `task` | 外框與彈出視窗的邊框視覺設計。可填值：`task`（普通任務）、`goal`（目標進階）、`challenge`（特級挑戰）。 |
| `show_toast` | `boolean` |  | `true` | 是否在玩家達成此進度時，於遊戲畫面右上角彈出提示通知。 |
| `announce_to_chat` | `boolean` |  | `true` | 是否在玩家達成此進度時，於公眾聊天室向全伺服器廣播訊息。 |
| `hidden` | `boolean` |  | `false` | 是否在玩家達成其所有直接子進度之前，於進度樹狀圖中完全隱藏此進度圖示。 |

### `criteria` 子欄位結構

> 鍵名（如範例中的 `custom_trigger_name`）可自由命名，用於 `requirements` 陣列內部檢索。

| 欄位 | 類型 | 必填 | 預設 | 說明 |
| --- | --- | --- | --- | --- |
| `trigger` | `string` | ✓ | — | 指定 Minecraft 原版內建的觸發條件識別碼（例如：`minecraft:inventory_changed` 監聽背包改變、`minecraft:tick` 每刻執行、`minecraft:impossible` 僅能透過指令手動賦予）。 |
| `conditions` | `object` |  | — | 搭配 `trigger` 使用的細項過濾條件。其結構依據不同的觸發器而有極大差異（例如檢查特定物品 NBT、傷害數值或生物屬性）。 |

### `rewards` 子欄位

| 欄位 | 類型 | 必填 | 預設 | 說明 |
| --- | --- | --- | --- | --- |
| `recipes` | `array` |  | — | 自動解鎖的配方命名空間 ID 清單。 |
| `loot` | `array` |  | — | 自動發放並掉落至玩家腳下的戰利品表（Loot Table）ID 清單。 |
| `experience` | `int` |  | — | 直接賦予玩家的基礎經驗值點數（Points，非等級）。 |
| `function` | `string` |  | — | 達成進度時立即可執行的資料包函式（`.mcfunction`）路徑。此函式的執行主體（`@s`）會自動鎖定為達成該進度的玩家。 |

---

## 條件依賴 (Conditional Fields)

| 條件 | 生效欄位 | 失效 / 忽略欄位 |
| --- | --- | --- |
| 未定義 `display` 欄位（後台邏輯進度） | — | `parent` 欄位指定的父進度必須也存在，否則會報錯；且其本身不會在任何 GUI 介面中渲染。 |
| `trigger` 設為 `minecraft:impossible` | — | `conditions` 欄位將失去作用，無法被遊戲事件自動觸發，僅能透過 `/advancement grant` 觸發。 |

---

## 注意事項 (Notes)

* 當進度被用作後台邏輯循環或條件觸發器（透過 `rewards.function` 執行代碼）時，強烈建議在函式底層的第一行立即執行 `/advancement revoke @s only <當前進度ID>`，藉此重置進度狀態，否則該進度只能觸發一次。
* `requirements` 的矩陣排列結構為：外層陣列中的各元素為「AND」關係，內層陣列中的各元素為「OR」關係。
* 自訂根進度（即無 `parent`）時，必須在 `display` 物件中額外宣告一個 `background` 欄位（字串，填寫紋理圖片路徑，如 `minecraft:textures/block/stone.png`），用以渲染整個進度面板的底圖。

---

## 外部連結 (References)

* [Minecraft Wiki - 進度](https://minecraft.fandom.com/zh/wiki/%E8%BF%9B%E5%BA%A6/JSON%E6%A0%BC%E5%BC%8F)

---

*最後更新: 2026-06-22*