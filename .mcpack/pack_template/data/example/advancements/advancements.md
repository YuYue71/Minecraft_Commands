# advancements (進度)

> **分類:** `資料包元素` | **檔案格式:** `json` | **命名空間支援:** `true` | **熱重載:** `/reload`

---

## 目錄

* [目錄路徑](#)
* [核心結構](#)
* [節點說明](#)
    * [display (顯示屬性)](#)
    * [criteria (達成條件)](#)
    * [rewards (獎勵項目)](#)
* [原版觸發器 (Triggers) 窮舉清單](#)
* [外部連結](#)

---

## 目錄路徑 (Directory & Path)

> 說明該元素檔案在資料包內部的標準存放位置.

```file
data/<namespace>/advancements/[子資料夾/]<檔案名稱>.json
```

* `<namespace>` = 命名空間 (如 `minecraft`, `example`)
* `[子資料夾/]` = 開發者自訂的分類目錄 (選填)
* `<檔案名稱>` = 決定遊戲內調用該進度的 ID 名稱
* 遊戲內調用格式為: `<namespace>:[子資料夾/]<檔案名稱>` (例如 `example:story/root`)

---

## 核心結構 (Core Structure)

> 進度檔案定義了達成條件、視覺顯示以及完成後的獎勵.

```json
{
    "display": {
        "icon": {
            "item": "minecraft:diamond"
        },
        "title": {"text": "進度標題"},
        "description": {"text": "進度描述"},
        "frame": "task",
        "show_toast": true,
        "announce_to_chat": true,
        "hidden": false
    },
    "parent": "minecraft:story/root",
    "criteria": {
        "criterion_name": {
            "trigger": "minecraft:inventory_changed",
            "conditions": {
                "items": [
                    {
                        "items": ["minecraft:diamond"]
                    }
                ]
            }
        }
    },
    "requirements": [
        ["criterion_name"]
    ],
    "rewards": {
        "experience": 100
    }
}
```

| 鍵值 / 節點 (Key) | 類型 | 必填 | 說明 |
| --- | --- | --- | --- |
| `"display"` | `object` | 否 | 定義在進度選單中的顯示資訊 |
| `"parent"` | `string` | 否 | 父進度的 ID. 若無此項則視為根進度 |
| `"criteria"` | `object` | 是 | 達成進度所需的一個或多個條件 (鍵值自訂) |
| `"requirements"` | `array` | 否 | 條件的邏輯組合 (AND/OR). 預設為全需達成 (AND) |
| `"rewards"` | `object` | 否 | 完成進度後給予的獎勵 |

---

## 節點說明 (Node Explanations)

### `display (Object)`

> 設置進度在 GUI 介面中的外觀.

| 子節點 (Sub-key) | 類型 | 必填 | 說明 |
| --- | --- | --- | --- |
| `"icon"` | `object` | 是 | 顯示的物品圖示. 需包含 `"item"` 鍵值 |
| `"title"` | `JSON` | 是 | 進度名稱 |
| `"description"` | `JSON` | 是 | 進度詳情描述 |
| `"frame"` | `enum` | 否 | 邊框類型: `task` (普通), `goal` (目標), `challenge` (挑戰) |
| `"background"` | `string` | 否 | 僅根進度有效. 設置背景貼圖路徑 (如 `minecraft:textures/block/stone.png`) |
| `"show_toast"` | `boolean` | 否 | 是否在右上角彈出提示 (預設 `true`) |
| `"announce_to_chat"` | `boolean` | 否 | 是否在聊天欄公告 (預設 `true`) |
| `"hidden"` | `boolean` | 否 | 是否在達成前隱藏 (預設 `false`) |

---

### `criteria (Object)`

> 定義觸發進度的具體行為.

| 子節點 (Sub-key) | 類型 | 必填 | 說明 |
| --- | --- | --- | --- |
| `"trigger"` | `string` | 是 | 觸發器類型 ID |
| `"conditions"` | `object` | 否 | 觸發器的詳細條件過濾 |

---

### `rewards (Object)`

> 定義完成後的自動獎勵項目.

| 子節點 (Sub-key) | 類型 | 必填 | 說明 |
| --- | --- | --- | --- |
| `"recipes"` | `array` | 否 | 解鎖的合成表 ID 列表 |
| `"loot"` | `array` | 否 | 給予玩家的戰利品表 ID 列表 |
| `"experience"` | `int` | 否 | 給予的經驗值數值 |
| `"function"` | `string` | 否 | 執行特定的函式 (以伺服器權限執行) |

---

## 原版觸發器 (Triggers) 窮舉清單

### 實體與戰鬥類

| 觸發器 ID | 說明 |
| --- | --- |
| `minecraft:bee_nest_destroyed` | 破壞蜂巢/蜂箱. |
| `minecraft:bred_animals` | 繁殖動物. |
| `minecraft:entity_hurt_player` | 玩家受到實體傷害. |
| `minecraft:entity_killed_player` | 玩家被實體擊殺. |
| `minecraft:killed_by_arrow` | 被箭擊殺. |
| `minecraft:player_killed_entity` | 玩家擊殺實體. |
| `minecraft:summoned_entity` | 召喚實體 (如凋零怪). |

### 物品與環境類

| 觸發器 ID | 說明 |
| --- | --- |
| `minecraft:inventory_changed` | 物品欄狀態改變 (獲得/失去物品). |
| `minecraft:consume_item` | 消耗/食用物品. |
| `minecraft:enchanted_item` | 附魔物品. |
| `minecraft:filled_bucket` | 裝滿水桶/岩漿桶. |
| `minecraft:using_item` | 正在使用物品. |
| `minecraft:shot_crossbow` | 使用弩射擊. |

### 其他類

| 觸發器 ID | 說明 |
| --- | --- |
| `minecraft:impossible` | 無法自然觸發. 僅能透過指令達成. |
| `minecraft:tick` | 每刻觸發 (用於循環檢查). |
| `minecraft:location` | 玩家位置改變/檢查位置. |
| `minecraft:slept_in_bed` | 在床上睡覺. |
| `minecraft:hero_of_the_village` | 獲得村莊英雄效果. |
| `minecraft:voluntary_exile` | 獲得不祥之兆效果. |

---

## 外部連結 (References)

* [Minecraft Wiki - Advancement](https://minecraft.fandom.com/zh/wiki/%E8%BF%9B%E5%BA%A6)
* [Misode Data Pack Generators - Advancement](https://misode.github.io/advancement/)
* [資源位置與命名空間規範 (Resource Locations)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/ResourceLocations.md)
* [JSON 文本元件 (Raw JSON Text Components)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/json_text.md)
* [物品 NBT 矩陣 (Items)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.NBT/list.md)
* [實體 NBT 矩陣 (Entities)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.NBT/list.md)
* [進度指令 (advancement)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.commands/advancement.md)