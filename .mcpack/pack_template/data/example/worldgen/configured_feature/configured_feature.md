# worldgen/configured_feature (配置特徵)

> **分類:** `世界生成` | **檔案格式:** `json` | **適用版本:** `JE ≤ 1.20.4` | **熱重載:** `/reload`

---

## 目錄

* [1. 目錄路徑 (Directory & Path)](#1-目錄路徑-directory--path)
* [2. 核心結構範本 (Core Structure Skeleton)](#2-核心結構範本-core-structure-skeleton)
* [3. 根節點屬性表 (Root Properties)](#3-根節點屬性表-root-properties)
* [4. 子對象詳解 (Sub-object Details)](#4-子對象詳解-sub-object-details)
    * [4.1 樹木特徵 (Tree Config)](#41-樹木特徵-tree-config)
    * [4.2 礦石特徵 (Ore Config)](#42-礦石特徵-ore-config)
    * [4.3 隨機選擇特徵 (Random Selector)](#43-隨機選擇特徵-random-selector)
* [5. 參數枚舉與可用值全清單 (Value Enumerations)](#5-參數枚舉與可用值全清單-value-enumerations)
    * [5.1 特徵類型 (Feature Types)](#51-特徵類型-feature-types)
* [6. 數據約束與邊界條件 (Data Constraints)](#6-數據約束與邊界條件-data-constraints)
* [7. 外部連結 (References)](#7-外部連結-references)

---

## 1. 目錄路徑 (Directory & Path)

> 定義「什麼」被生成。設定特徵的具體方塊構成與形狀邏輯 (如樹的形狀、礦物團的大小)。

```file
data/<namespace>/worldgen/configured_feature/[子資料夾]/<檔案名稱>.json
```

* `<namespace>`: 命名空間 (如 `minecraft`, `example`).
* `<registry>`: `worldgen/configured_feature`.
* 調用標識符: `<namespace>:[子資料夾]/<檔案名稱>`.

---

## 2. 核心結構範本 (Core Structure Skeleton)

> 由於特徵具備高度多態性 (Polymorphism)，結構取決於 `type` 的設定。

```json
// 範例: 礦石生成 (minecraft:ore)
{
  "type": "minecraft:ore",
  "config": {
    "size": 9,
    "discard_chance_on_air_exposure": 0.0,
    "targets": [
      {
        "target": { "predicate_type": "minecraft:tag_match", "tag": "minecraft:stone_ore_replaceables" },
        "state": { "Name": "minecraft:iron_ore" }
      }
    ]
  }
}

// 範例: 隨機選擇 (minecraft:random_selector)
{
  "type": "minecraft:random_selector",
  "config": {
    "features": [
      { "chance": 0.33, "feature": "example:tall_tree" }
    ],
    "default": "example:normal_tree"
  }
}
```

---

## 3. 根節點屬性表 (Root Properties)

> 檔案第一層級的鍵值定義。

| 鍵值 (Key) | 類型 | 必填 | 簡述 | 說明與可用值索引 |
| --- | --- | --- | --- | --- |
| `"type"` | `string` | 是 | 特徵種類 | 指定此特徵的演算模型。詳見 [5.1](#51-特徵類型-feature-types)。 |
| `"config"` | `object` | 是 | 具體配置 | 根據 `type` 不同，內部的鍵值會徹底改變。詳見 [§4](#4-子對象詳解-sub-object-details)。 |

---

## 4. 子對象詳解 (Sub-object Details)

### 4.1 樹木特徵 (Tree Config)

> 適用於 `type: "minecraft:tree"`。

| 子鍵值 (Sub-key) | 類型 | 必填 | 簡述 | 說明 |
| --- | --- | --- | --- | --- |
| `"trunk_provider"` | `object` | 是 | 樹幹材料 | 定義樹幹方塊種類 (支援隨機狀態)。 |
| `"foliage_provider"` | `object` | 是 | 樹葉材料 | 定義樹葉方塊種類。 |
| `"trunk_placer"` | `object` | 是 | 樹幹形狀 | 定義高度、粗細與分支邏輯。 |
| `"foliage_placer"` | `object` | 是 | 樹葉形狀 | 定義樹冠的半徑與生長範圍。 |
| `"minimum_size"` | `object` | 是 | 最小空間 | 檢查生成所需的最小垂直/水平空間。 |
| `"decorators"` | `array` | 否 | 裝飾器 | 添加藤蔓、蜂巢、可可豆等額外內容。 |

### 4.2 礦石特徵 (Ore Config)

> 適用於 `type: "minecraft:ore"` 或 `minecraft:scattered_ore"`。

| 子鍵值 (Sub-key) | 類型 | 必填 | 簡述 | 說明 |
| --- | --- | --- | --- | --- |
| `"size"` | `int` | 是 | 團簇大小 | 每次生成嘗試的最大方塊數量 (0-64)。 |
| `"targets"` | `array` | 是 | 目標對照 | 包含 `"target"` (要被替換的方塊) 與 `"state"` (產出的方塊)。 |
| `"discard_chance_on_air_exposure"` | `float` | 是 | 暴露判定 | 若方塊接觸空氣，該方塊消失的機率 (0.0-1.0)。 |

### 4.3 隨機選擇特徵 (Random Selector)

> 適用於 `type: "minecraft:random_selector"`。

| 子鍵值 (Sub-key) | 類型 | 必填 | 簡述 | 說明 |
| --- | --- | --- | --- | --- |
| `"features"` | `array` | 是 | 權重列表 | 包含 `{ "chance": float, "feature": "id" }` 的物件陣列。 |
| `"default"` | `string` | 是 | 保底特徵 | 當上述所有機率皆未中標時，強制生成的特徵 ID。 |

---

## 5. 參數枚舉與可用值全清單 (Value Enumerations)

### 5.1 特徵類型 (Feature Types)

| 參數值 (Value) | 簡述 | 完整遊戲行為說明 |
| --- | --- | --- |
| `minecraft:tree` | 樹木 | 生成具有樹幹、樹葉與裝飾器的複雜結構。 |
| `minecraft:ore` | 礦石 | 在指定方塊內部替換並生成礦物團。 |
| `minecraft:flower` | 花卉 | 散佈單一或多種花卉方塊。 |
| `minecraft:random_selector` | 隨機分支 | 根據設定的機率從多個特徵中選取一個執行。 |
| `minecraft:simple_block` | 簡單方塊 | 放置單一特定方塊 (常用於湖泊表面的浮萍或甘蔗)。 |
| `minecraft:vegetation_patch` | 植被斑塊 | 在地表生成一層特定材料 (如泥土) 並在其上生成裝飾物。 |
| `minecraft:huge_mushroom` | 巨型蘑菇 | 生成紅色或褐色巨型蘑菇。 |
| `minecraft:geode` | 地質晶洞 | 生成包含多層結構與紫水晶的核心結構。 |

---

## 6. 數據約束與邊界條件 (Data Constraints)

* **礦石大小 (size)**: `size` 數值並非 100% 精確的產出量，而是一個演算法的上限參考。
* **機率控制 (chance)**: `random_selector` 的機率應從前到後進行權重分配，總和不一定要等於 1.0 (按順序判定)。
* **樹木高度**: `trunk_placer` 中的高度參數若過大，可能導致因觸及世界高度限制而生成失敗。
* **方塊狀態**: `state` 欄位必須包含有效的方塊 ID 及其屬性 (Properties)。

---

## 7. 外部連結 (References)

* [Misode Configured Feature Generator](https://misode.github.io/worldgen/configured-feature/)
* [Minecraft Wiki - Configured Feature](https://zh.minecraft.wiki/w/%E9%85%8D%E7%BD%AE%E7%89%B9%E5%BE%81)
* [資源位置與命名空間規範 (Resource Locations)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/ResourceLocations.md)
* [方塊狀態與標籤 (Block States & Tags)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/BlockStates_or_Tags.md)
* [放置特徵速查表 (Placed Feature)](https://github.com/YuYue71/Minecraft_Commands/blob/main/pack_template/data/example/worldgen/placed_feature/placed_feature.md)