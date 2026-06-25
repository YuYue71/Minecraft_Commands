# advancements (進度)

> **分類:** `成就與進度系統` | **檔案格式:** `json` | **適用版本:** `JE ≤ 1.20.4` | **熱重載:** `/reload`

---

## 目錄

* [1. 目錄路徑 (Directory & Path)](#1-目錄路徑-directory--path)
* [2. 核心結構範本 (Core Structure Skeleton)](#2-核心結構範本-core-structure-skeleton)
* [3. 根節點屬性表 (Root Properties)](#3-根節點屬性表-root-properties)
* [4. 子對象詳解 (Sub-object Details)](#4-子對象詳解-sub-object-details)
    * [4.1 display (介面顯示配置)](#41-display-介面顯示配置)
    * [4.2 criteria (達成條件細節)](#42-criteria-達成條件細節)
    * [4.3 rewards (進度獎勵)](#43-rewards-進度獎勵)
* [5. 參數枚舉與可用值全清單 (Value Enumerations)](#5-參數枚舉與可用值全清單-value-enumerations)
    * [5.1 邊框類型 (Frame Types)](#51-邊框類型-frame-types)
    * [5.2 核心觸發器 ID (Trigger IDs)](#52-核心觸發器-id-trigger-ids)
* [6. 數據約束與邊界條件 (Data Constraints)](#6-數據約束與邊界條件-data-constraints)
* [7. 資料包結構參考 (Datapack Structure)](#7-資料包結構參考-datapack-structure)
* [8. 外部連結 (References)](#8-外部連結-references)

---

## 1. 目錄路徑 (Directory & Path)

> 定義進度檔案在資料包中的物理存放位置與遊戲內調用 ID.

```file
data/<namespace>/advancements/[子資料夾]/<檔案名稱>.json
```

* `<namespace>`: 命名空間 (如 `minecraft`, `example`).
* `<registry>`: `advancements`.
* 調用標識符: `<namespace>:[子資料夾]/<檔案名稱>`.

---

## 2. 核心結構範本 (Core Structure Skeleton)

> 包含顯示、條件判斷與獎勵的完整進度編寫骨架.

```json
{
  "display": {
    "icon": { "item": "minecraft:diamond" },
    "title": { "text": "進度標題" },
    "description": { "text": "進度描述詳情" },
    "frame": "task",
    "show_toast": true,
    "announce_to_chat": true,
    "hidden": false
  },
  "parent": "minecraft:story/root",
  "criteria": {
    "requirement_1": {
      "trigger": "minecraft:inventory_changed",
      "conditions": {
        "items": [ { "items": ["minecraft:diamond"] } ]
      }
    }
  },
  "requirements": [ ["requirement_1"] ],
  "rewards": {
    "experience": 100,
    "loot": ["minecraft:chests/igloo_chest"],
    "function": "example:init_system"
  }
}
```

---

## 3. 根節點屬性表 (Root Properties)

> 檔案第一層級的鍵值定義.

| 鍵值 (Key) | 類型 | 必填 | 簡述 | 說明、預設值與可用值索引 |
| --- | --- | --- | --- | --- |
| `"display"` | `object` | 否 | GUI 顯示 | 定義在進度選單中的圖示與文字. 連結至 [4.1](#41-display-介面顯示配置). |
| `"parent"` | `string` | 否 | 父級進度 | 引用另一進度 ID. 若未填則此進度為分頁根進度. |
| `"criteria"` | `object` | 是 | 達成條件 | 包含一個或多個具名觸發條件. 連結至 [4.2](#42-criteria-達成條件細節). |
| `"requirements"` | `array` | 否 | 條件邏輯 | 定義條件間的 AND/OR 關係. 預設為全需達成. |
| `"rewards"` | `object` | 否 | 完成獎勵 | 達成進度後給予玩家的各類資源. 連結至 [4.3](#43-rewards-進度獎勵). |

---

## 4. 子對象詳解 (Sub-object Details)

### 4.1 display (介面顯示配置)

> 設置進度在選單中的視覺表現 (Misode: Display).

| 子鍵值 (Sub-key) | 類型 | 必填 | 簡述 | 說明 |
| --- | --- | --- | --- | --- |
| `"icon"` | `object` | 是 | 顯示圖示 | 包含 `"item"` (物品 ID) 與 `"nbt"` (選填). |
| `"title"` | `JSON` | 是 | 進度標題 | 支援 [JSON 文本元件](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/json_text.md). |
| `"description"` | `JSON` | 是 | 描述文字 | 支援 JSON 文本元件, 顯示於標題下方. |
| `"frame"` | `enum` | 否 | 邊框外觀 | 決定 GUI 邊框形狀. 詳見 [5.1](#51-邊框類型-frame-types). 預設為 `task`. |
| `"background"` | `string` | 否 | 背景貼圖 | 僅根進度有效. 引用 `textures/block/` 下的路徑. |
| `"show_toast"` | `boolean` | 否 | 彈窗提示 | 達成時是否在畫面右上角彈出提示. 預設 `true`. |
| `"announce_to_chat"` | `boolean` | 否 | 聊天廣播 | 達成時是否在聊天欄公告全員. 預設 `true`. |
| `"hidden"` | `boolean` | 否 | 是否隱藏 | 設為 `true` 則在達成前不顯示於選單. 預設 `false`. |

### 4.2 criteria (達成條件細節)

> 進度的核心判斷邏輯 (Misode: Criteria).

| 子鍵值 (Sub-key) | 類型 | 必填 | 簡述 | 說明 |
| --- | --- | --- | --- | --- |
| `"trigger"` | `string` | 是 | 觸發器 | 指定觸發此條件的行為類別. 詳見 [5.2](#52-核心觸發器-id-trigger-ids). |
| `"conditions"` | `object` | 否 | 判斷內容 | 根據觸發器類型填入對應的 Predicate 判定參數. |

### 4.3 rewards (進度獎勵)

> 達成進度後給予玩家的項目 (Misode: Rewards).

| 子鍵值 (Sub-key) | 類型 | 必填 | 簡述 | 說明 |
| --- | --- | --- | --- | --- |
| `"experience"` | `int` | 否 | 經驗值 | 直接給予玩家指定數量的經驗值. |
| `"loot"` | `array` | 否 | 戰利品表 | 解鎖並直接給予指定戰利品表中的物品. |
| `"recipes"` | `array` | 否 | 合成配方 | 自動解鎖指定的合成表 ID. |
| `"function"` | `string` | 否 | 執行函式 | 觸發指定的 `mcfunction`. 以伺服器權限執行. |

---

## 5. 參數枚舉與可用值全清單 (Value Enumerations)

### 5.1 邊框類型 (Frame Types)

| 參數值 (Value) | 簡述 | 完整遊戲行為說明與影響範圍 |
| --- | --- | --- |
| `task` | 普通任務 | 圓形邊框, 用於一般的進度流程. |
| `goal` | 目標達成 | 帶尖角的圓形邊框, 用於具有里程碑意義的階段. |
| `challenge` | 挑戰達成 | 帶裝飾的星型邊框, 達成時會有特殊音效. |

### 5.2 核心觸發器 ID (Trigger IDs)

| 參數值 (Value) | 簡述 | 完整遊戲行為說明與影響範圍 |
| --- | --- | --- |
| `minecraft:inventory_changed` | 物品欄變動 | 當玩家獲得或失去特定物品、數量時觸發. |
| `minecraft:location` | 位置檢查 | 每刻檢查玩家所在的座標、維度或生物群系. |
| `minecraft:tick` | 每刻觸發 | 玩家存在的每一刻都會觸發 (常用於無條件達成的進度). |
| `minecraft:player_killed_entity` | 擊殺實體 | 玩家擊殺特定生物或實體時觸發. |
| `minecraft:consume_item` | 消耗物品 | 玩家食用、飲用或消耗特定物品時觸發. |
| `minecraft:bred_animals` | 繁殖動物 | 當玩家成功讓兩隻動物交配時觸發. |
| `minecraft:impossible` | 指令觸發 | 無法自然達成, 僅能透過指令或特定事件腳本達成. |
| `minecraft:placed_block` | 放置方塊 | 玩家在世界中放置特定方塊時觸發. |
| `minecraft:enter_block` | 進入方塊區間 | 玩家與特定方塊碰撞或進入其體積內 (如傳送門). |

---

## 6. 數據約束與邊界條件 (Data Constraints)

* **條件唯一性**: `criteria` 鍵值名稱 (如 `requirement_1`) 在同一檔案內不可重複.
* **邏輯分組**: `requirements` 若包含多個子陣列 `[ ["A"], ["B", "C"] ]`, 則代表 `A OR (B AND C)`.
* **資源深度**: `parent` 的鏈結長度建議不要過長, 否則 GUI 介面顯示可能超出邊界.

---

## 7. 資料包結構參考 (Datapack Structure)

### 進度定義檔案位置
`data/<namespace>/advancements/<path>.json`

**範例:**
欲建立一個名為「採礦高手」的進度, 檔案位於:
`data/example/advancements/mining/diamond_expert.json`
調用標識符為 `example:mining/diamond_expert`.

---

## 8. 外部連結 (References)

* [Misode Data Pack Generators - Advancement](https://misode.github.io/advancement/)
* [Minecraft Wiki - Advancement Definition](https://zh.minecraft.wiki/)
* [資源位置與命名空間規範 (Resource Locations)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/ResourceLocations.md)
* [JSON 文本元件 (Raw JSON Text Components)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/json_text.md)
* [相關指令: /advancement](https://github.com/YuYue71/Minecraft_Commands/blob/main/.commands/advancement.md)