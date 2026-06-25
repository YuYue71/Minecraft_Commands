# damage_type (傷害類型)

> **分類:** `生命與戰鬥` | **檔案格式:** `json` | **適用版本:** `JE ≤ 1.20.4` | **熱重載:** `/reload`

---

## 目錄

* [1. 目錄路徑 (Directory & Path)](#1-目錄路徑-directory--path)
* [2. 核心結構範本 (Core Structure Skeleton)](#2-核心結構範本-core-structure-skeleton)
* [3. 根節點屬性表 (Root Properties)](#3-根節點屬性表-root-properties)
* [4. 參數枚舉與可用值全清單 (Value Enumerations)](#4-參數枚舉與可用值全清單-value-enumerations)
    * [4.1 傷害縮放 (Scaling)](#41-傷害縮放-scaling)
    * [4.2 傷害效果 (Effects)](#42-傷害效果-effects)
    * [4.3 死亡訊息類型 (Death Message Type)](#43-死亡訊息類型-death-message-type)
* [5. 數據約束與邊界條件 (Data Constraints)](#5-數據約束與邊界條件-data-constraints)
* [6. 外部連結 (References)](#6-外部連結-references)

---

## 1. 目錄路徑 (Directory & Path)

> 定義自定義傷害的行為屬性、飢餓消耗以及死亡訊息翻譯架構.

```file
data/<namespace>/damage_type/[子資料夾]/<檔案名稱>.json
```

* `<namespace>`: 命名空間 (如 `minecraft`, `example`).
* `<registry>`: `damage_type`.
* 調用標識符: `<namespace>:[子資料夾]/<檔案名稱>`.

---

## 2. 核心結構範本 (Core Structure Skeleton)

> 包含傷害屬性與視覺效果的標準編寫骨架.

```json
{
  "message_id": "death.attack.example",
  "exhaustion": 0.1,
  "scaling": "always",
  "effects": "burning",
  "death_message_type": "default"
}
```

---

## 3. 根節點屬性表 (Root Properties)

> 檔案第一層級的鍵值定義與約束.

| 鍵值 (Key) | 類型 | 必填 | 簡述 | 說明、預設值與可用值索引 |
| --- | --- | --- | --- | --- |
| `"message_id"` | `string` | 是 | 訊息識別碼 | 用於建構死亡訊息的翻譯鍵 (如 `death.attack.<message_id>`). |
| `"exhaustion"` | `float` | 是 | 飢餓消耗 | 受到該傷害時增加的飽食度消耗量. 預設值參考: 攻擊為 `0.1`. |
| `"scaling"` | `enum` | 是 | 難度縮放 | 決定傷害是否隨遊戲難度變更. 可用值詳見 [4.1](#41-傷害縮放-scaling). |
| `"effects"` | `enum` | 否 | 視覺效果 | 受到傷害時播放的特殊動畫或音效. 可用值詳見 [4.2](#42-傷害效果-effects). |
| `"death_message_type"` | `enum` | 否 | 訊息格式 | 決定死亡訊息顯示時的附加邏輯. 可用值詳見 [4.3](#43-死亡訊息類型-death-message-type). |

---

## 4. 參數枚舉與可用值全清單 (Value Enumerations)

### 4.1 傷害縮放 (Scaling)

> 定義傷害在不同難度 (簡單/普通/困難) 下的計算方式.

| 參數值 (Value) | 簡述 | 完整遊戲行為說明與影響範圍 |
| --- | --- | --- |
| `never` | 不縮放 | 傷害量在任何難度下皆保持固定. |
| `always` | 全時縮放 | 傷害隨難度調整 (簡單減半, 困難倍增). |
| `when_caused_by_living_non_player` | 針對非玩家生物 | 僅當傷害源為非玩家生物 (如殭屍) 時才隨難度縮放. |

### 4.2 傷害效果 (Effects)

> 定義實體受傷時表現出的物理特性與聲效 (Misode: Effects).

| 參數值 (Value) | 簡述 | 完整遊戲行為說明與影響範圍 |
| --- | --- | --- |
| `hurt` | 一般受傷 | 播放標準受傷音效與紅色閃爍 (預設值). |
| `thorns` | 荊棘效果 | 播放荊棘反彈音效. |
| `drowning` | 溺水效果 | 播放溺水受傷音效. |
| `burning` | 著火效果 | 播放著火受傷音效. |
| `poking` | 刺傷效果 | 播放甜莓莓叢刺傷音效. |
| `freezing` | 凍傷效果 | 播放凍傷受傷音效. |

### 4.3 死亡訊息類型 (Death Message Type)

> 決定翻譯系統如何處理死亡訊息的參數 (Misode: Death Message Type).

| 參數值 (Value) | 簡述 | 完整遊戲行為說明與影響範圍 |
| --- | --- | --- |
| `default` | 預設模式 | 顯示為 `[玩家] 被 [來源] 殺死了`. |
| `fall_variants` | 掉落變體 | 包含掉落高度相關的額外翻譯 (常用於摔死或攀爬相關). |
| `intentional_game_design` | 特殊設計 | 顯示特定的諷刺訊息 (如在終界睡床爆炸的訊息). |

---

## 5. 數據約束與邊界條件 (Data Constraints)

* **飢餓消耗 (exhaustion)**: 最小值為 `0.0`. 設定過高會導致玩家受傷一次即進入極度飢餓狀態.
* **翻譯鏈結**: `message_id` 指向的是語言檔案中的鍵值路徑. 若自定義維度未定義語言包, 將顯示為原始字串.

---

## 6. 外部連結 (References)

* [Misode Data Pack Generators - Damage Type](https://misode.github.io/damage-type/)
* [Minecraft Wiki - Damage Type Definition](https://zh.minecraft.wiki/)
* [資源位置與命名空間規範 (Resource Locations)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/ResourceLocations.md)
* [相關指令: /damage](https://github.com/YuYue71/Minecraft_Commands/blob/main/.commands/damage.md)