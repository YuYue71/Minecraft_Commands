# /execute

> **分類:** `指令` | **權限等級:** `2` | **適用版本:** `JE ≤ 1.20.4` | **命令方塊:** `true`

---

## 目錄

* [語法](#語法-syntax)
* [參數說明](#參數說明-parameters)
  * [修飾子指令 (Modifiers)](#修飾子指令-modifiers)
  * [條件子指令 (Conditionals)](#條件子指令-conditionals)
  * [儲存子指令 (Store)](#儲存子指令-store)
* [資料包結構參考 (Datapack Structure)](#資料包結構參考-datapack-structure)
* [外部連結](#外部連結-references)

---

## 語法 (Syntax)

```commands
/execute <subcommand> <...> run <command>
/execute <subcommand> <...> <subcommand> <...>
```

* `<>` = 必填, `[]` = 選填, `|` = 二擇一, `..` = 範圍 (如 `1..10`)

| 參數 / 欄位 | 類型 | 預設 | 說明 |
| --- | --- | --- | --- |
| `<subcommand>` | `enum` | - | 指定 execute 的子指令類型 |
| `<command>` | `command` | - | 最終執行的指令本體 |

---

## 參數說明 (Parameters)

### 修飾子指令 (Modifiers)

> 用於變換或偏移指令的執行上下文 (Execution Context).

| 值 | 說明 |
| --- | --- |
| `as <target>` | 更改執行者 (Executor). 不改變位置, 朝向或維度. |
| `at <target>` | 將執行位置, 朝向與維度同步為指定實體. |
| `align <axes>` | 將座標對齊至方塊格中心. 軸可為 `x`, `y`, `z` 的組合. |
| `anchored <eyes\|feet>` | 設置視線錨點為眼睛 (Eyes) 或腳部 (Feet). |
| `facing <pos>` | 使執行朝向指向特定空間座標點. |
| `facing entity <target> <anchor>` | 使執行朝向指向特定實體的眼睛或腳部. |
| `in <dimension>` | 切換執行的維度 (Dimension). |
| `on <relation>` | (1.19.4+) 根據實體關係定位 (如 `vehicle`, `passengers`, `owner`). |
| `positioned <pos>` | 更改執行座標 (Position) 為特定位置. |
| `positioned as <target>` | 將執行座標同步為指定實體的位置. |
| `rotated <rot>` | 更改執行朝向 (Rotation). |
| `rotated as <target>` | 將執行朝向同步為指定實體的朝向. |
| `summon <entity>` | (1.20.2+) 生成一個新實體並將其設為後續指令的執行者與位置. |

---

### 條件子指令 (Conditionals)

> `if` 為條件成立時繼續執行, `unless` 為條件不成立時繼續執行.

| 值 | 說明 |
| --- | --- |
| `block <pos> <block>` | 檢查指定位置是否為特定方塊 (支援方塊狀態). |
| `blocks <start> <end> <destination> <all\|masked>` | 比較兩個區域內的方塊是否完全匹配. |
| `data <source> <path>` | 檢查特定 NBT 路徑是否存在或符合特定數值. |
| `entity <target>` | 檢查是否存在至少一個符合條件的實體. |
| `predicate <predicate>` | 檢查指定謂詞 (Predicate) 的 JSON 條件是否成立 (需資料包). |
| `score <target> <objective> <operator> <source> <objective>` | 比較兩個計分板數值. |
| `score <target> <objective> matches <range>` | 檢查計分板數值是否在指定區間內. |
| `loaded <pos>` | 檢查指定座標所在的區塊 (Chunk) 是否已載入. |
| `function <function>` | (1.20+) 執行函式並根據其傳回值決定條件 (0 為失敗). |

---

### 儲存子指令 (Store)

> 將後續指令的執行結果值 (Result) 或成功次數 (Success) 儲存至特定位置.

| 值 | 說明 |
| --- | --- |
| `result` | 儲存指令的實際傳回值. |
| `success` | 儲存指令的成功次數 (1 為成功, 0 為失敗). |

**儲存目標 (Storage Targets):**

| 目標類型 | 語法結構 | 說明 |
| --- | --- | --- |
| `score` | `<target> <objective>` | 存入計分板 (Scoreboard). |
| `block` | `<pos> <path> <type> <scale>` | 存入方塊實體 (Block Entity) NBT. |
| `entity` | `<target> <path> <type> <scale>` | 存入實體 (Entity) NBT. |
| `storage` | `<id> <path> <type> <scale>` | 存入全域儲存空間 (Command Storage). |

---

## 資料包結構參考 (Datapack Structure)

### 謂詞 (Predicates)
若使用 `if predicate`, 資源檔案路徑應為:
`data/<namespace>/predicates/<name>.json`

### 函式 (Functions)
若使用 `run function` 或 `if function`, 資源檔案路徑應為:
`data/<namespace>/functions/<name>.mcfunction`

---

## 外部連結 (References)

* [Minecraft Wiki - /execute](https://zh.minecraft.wiki/w/%E5%91%BD%E4%BB%A4/execute)
* [目標選擇器 (Target Selectors)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/TargetSelectors.md)
* [座標系統 (Coordinate Systems)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/coordinates.md)
* [資源位置與命名空間規範 (Resource Locations)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/ResourceLocations.md)
* [方塊狀態與標籤 (Block States & Tags)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/BlockStates_or_Tags.md)
* [實體 ID (Entity IDs)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/Entity_IDs.md)
* [實體 NBT 矩陣 (Entities)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.NBT/list.md)
* [方塊實體 NBT 矩陣 (Block Entities)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.NBT/list.md)