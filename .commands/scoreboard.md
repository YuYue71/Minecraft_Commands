# /scoreboard

> **分類:** `指令` | **權限等級:** `2` | **適用版本:** `JE ≤ 1.20.4` | **命令方塊:** `true`

---

## 目錄

* [語法](#語法-syntax)
* [參數說明](#參數說明-parameters)
  * [objectives](#objectives)
  * [players](#players)
* [原版判別標準 (Criteria) 窮舉清單](#原版判別標準-criteria-窮舉清單)
* [外部連結](#外部連結-references)

---

## 語法 (Syntax)

```commands
/scoreboard objectives add <objective> <criteria> [<displayName>]
/scoreboard objectives modify <objective> <displayname\|rendertype> <...>
/scoreboard objectives remove <objective>
/scoreboard objectives setdisplay <slot> [<objective>]

/scoreboard players add <target> <objective> <score>
/scoreboard players remove <target> <objective> <score>
/scoreboard players set <target> <objective> <score>
/scoreboard players get <target> <objective>
/scoreboard players list [<target>]
/scoreboard players reset <target> [<objective>]
/scoreboard players enable <target> <objective>
/scoreboard players displayname <target> <objective> <displayName>
/scoreboard players operation <target> <objective> <operation> <source> <objective>
```

* `<>` = 必填, `[]` = 選填, `|` = 二擇一, `..` = 範圍 (如 `1..10`)

| 參數 / 欄位 | 類型 | 預設 | 說明 |
| --- | --- | --- | --- |
| `<objective>` | `string` | - | 計分項目 (Objective) 的內部名稱 |
| `<criteria>` | `enum` | - | 計分項目判別標準 (Criteria) |
| `[displayName]` | `JSON` | - | 顯示在介面上的名稱 (JSON 格式) |
| `<target>` | `Target Selector` | - | 目標玩家或實體名稱 |
| `<score>` | `int` | - | 分數數值 (32 位元整數) |
| `<operation>` | `operator` | - | 數學運算子 (如 `+=`, `-=`, `*=`, `/=`, `%=`, `=`, `<>`, `>`, `<`) |

---

## 參數說明 (Parameters)

### `objectives`

> 用於管理計分板的項目結構.

| 子指令 | 說明 |
| --- | --- |
| `add` | 建立新的計分項目. |
| `modify` | 修改現有項目的顯示名稱或渲染類型 (Hearts\|Integers). |
| `remove` | 刪除指定的計分項目. |
| `setdisplay` | 設置項目的顯示位置 (如 `sidebar`, `list`, `belowName`). |

---

### `players`

> 用於操作具體實體或玩家的分數值.

| 子指令 | 說明 |
| --- | --- |
| `operation` | 在兩個計分值之間執行算術運算. |
| `enable` | 允許非管理員玩家使用 `/trigger` 指令操作特定項目. |
| `reset` | 移除特定實體在該項目中的紀錄 (而非僅設為 0). |

---

## 原版判別標準 (Criteria) 窮舉清單

### 基礎內建標準 (Built-in Criteria)

| ID | 說明 |
| --- | --- |
| `dummy` | 僅能透過指令修改 (預設值). |
| `trigger` | 類似 dummy, 但可被玩家透過 `/trigger` 指令操作. |
| `deathCount` | 玩家死亡時自動累加. |
| `playerKillCount` | 玩家擊殺其他玩家時自動累加. |
| `totalKillCount` | 玩家擊殺任何實體時自動累加. |
| `health` | 自動同步實體目前生命值 (唯讀, 範圍 0-20). |
| `xp` | 自動同步玩家目前的經驗值總量 (唯讀). |
| `level` | 自動同步玩家目前的等級 (唯讀). |
| `food` | 自動同步玩家目前的飽食度 (唯讀, 範圍 0-20). |
| `air` | 自動同步玩家目前的氧氣值 (唯讀, 範圍 0-300). |
| `armor` | 自動同步玩家目前的護甲值 (唯讀, 範圍 0-20). |

### 隊伍關聯標準 (Team Criteria)

| ID 格式 | 說明 |
| --- | --- |
| `teamkill.<color>` | 擊殺特定顏色隊伍的成員時累加. |
| `killedByTeam.<color>` | 被特定顏色隊伍的成員擊殺時累加. |

* 顏色包含: `black`, `dark_blue`, `dark_green`, `dark_aqua`, `dark_red`, `dark_purple`, `gold`, `gray`, `dark_gray`, `blue`, `green`, `aqua`, `red`, `light_purple`, `yellow`, `white`.

### 動作觸發標準 (Action Criteria)

| 類型 | ID 格式 | 說明 |
| --- | --- | --- |
| 挖掘方塊 | `minecraft.mined:minecraft.<block_id>` | 破壞特定方塊時累加. |
| 消耗物品 | `minecraft.used:minecraft.<item_id>` | 使用或消耗特定物品時累加. |
| 製作物品 | `minecraft.crafted:minecraft.<item_id>` | 在工作台等合成特定物品時累加. |
| 損壞物品 | `minecraft.broken:minecraft.<item_id>` | 物品耐久度耗盡消失時累加. |
| 拾取物品 | `minecraft.picked_up:minecraft.<item_id>` | 從地面撿起特定物品時累加. |
| 丟棄物品 | `minecraft.dropped:minecraft.<item_id>` | 丟出特定物品時累加. |
| 擊殺實體 | `minecraft.killed:minecraft.<entity_id>` | 擊殺特定類型實體時累加. |
| 被擊殺 | `minecraft.killed_by:minecraft.<entity_id>` | 被特定類型實體擊殺時累加. |

### 自定義統計標準 (Custom Criteria)

> 格式統一為 `minecraft.custom:minecraft.<stat_name>`. 以下列出常用項目:

| 分類 | 常見統計 ID (省略前綴) |
| --- | --- |
| **移動類** | `walk_one_cm`, `crouch_one_cm`, `sprint_one_cm`, `swim_one_cm`, `fly_one_cm`, `fall_one_cm` |
| **互動類** | `jump`, `leave_game`, `play_time`, `total_world_time`, `time_since_death`, `sneak_time` |
| **戰鬥類** | `damage_dealt`, `damage_taken`, `damage_blocked_by_shield`, `mob_kills`, `deaths` |
| **其它類** | `talked_to_villager`, `traded_with_villager`, `inspect_hopper`, `open_chest`, `sleep_in_bed` |

---

## 外部連結 (References)

* [Minecraft Wiki - /scoreboard](https://zh.minecraft.wiki/w/%E5%91%BD%E4%BB%A4/scoreboard)
* [目標選擇器 (Target Selectors)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/TargetSelectors.md)
* [JSON 文本元件 (Raw JSON Text Components)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/json_text.md)
* [資源位置與命名空間規範 (Resource Locations)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/ResourceLocations.md)
* [實體 ID (Entity IDs)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/Entity_IDs.md)