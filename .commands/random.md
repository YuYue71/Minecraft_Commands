# `/random`（隨機數值生成指令）
* > 用於在指定的閉區間範圍內生成一個隨機整數，並將其直接代入計分板、全域獨立儲存空間（Storage）或特定實體的 NBT 標籤中
* > 支援指定自訂的「隨機序列識別碼（Sequence ID）」，以實現偽隨機數生成（PRNG）的確定性控制與種子碼（Seed）同步滾動
* > 常用於 RPG 裝備隨機屬性洗練、隨機副本傳送、隨機掉落物機率判定以及需要精確可重複驗證（Replayable）的隨機邏輯生成

---

## 語法結構 (Syntax)
```commands id="random_value"
/random value <範圍>
/random value <範圍> <序列識別碼>
```
```commands id="random_control"
/random roll <範圍>
/random roll <範圍> <序列識別碼>
/random reset <序列識別碼>
/random reset <序列識別碼> <種子碼>
/random reset <序列識別碼> <種子碼> <包含主副序列> <包含世界種子>
```

---

## 參數與引數拆解 (Arguments)
> 詳細解構語法中出現的每一個變數之填寫規範與底層資料型態

| 參數名稱 | 功能與語義說明 |
| --- | --- |
| `[必填]` `value` | 隨機數獲取關鍵字，生成隨機數並在聊天欄顯示，常與 `/execute store` 搭配將結果寫入記憶體變數中 |
| `[必填]` `roll` | 隨機數廣播關鍵字，生成隨機數，並直接在聊天欄內向全伺服器所有玩家進行廣播顯示（常用於公開抽獎） |
| `[必填]` `reset` | 隨機序列重置關鍵字，用於將特定的隨機數生成序列強制初始化，或手動綁定新的偽隨機數種子 |
| `[必填]` `<範圍>` | 指定隨機數生成的閉區間數值區間（格式為 `最小值..最大值`） |
| `[選填]` `<序列識別碼>` | 自訂的隨機序列資源識別碼（格式為 `命名空間:路徑`），用於隔離與鎖定隨機數生成流 |
| `[選填]` `<種子碼>` | 64 位元長整數值，用作該特定隨機數生成器的初始數學種子（Seed） |
| `[選填]` `<包含主副序列>` | 布林值（`true`|`false`），指定重置時是否同時重置與該序列相關聯的衍生子序列 |
| `[選填]` `<包含世界種子>` | 布林值（`true`|`false`），指定重置種子時，是否需要將目前地圖的世界種子（World Seed）加入代數混淆運算中 |

---

## 參數枚舉列表 (Parameter Enumeration)

### 1. 範圍語法格式 (Range Format)

| 參數格式 | 說明與邊界限制 |
| --- | --- |
| `<最小值>..<最大值>` | **雙端閉區間**。例如 `1..100` 代表生成的隨機整數 $x$ 嚴格符合 $1 \le x \le 100$。兩端數值必須皆為明確的整數，且左側數值必須小於或等於右側數值。 |

### 2. 重置與混淆控制 (Reset Options)

| 屬性名稱 | 可選參數 | 引擎底層行為與運行邏輯說明 |
| --- | --- | --- |
| `includeSequenceId` | `true`/`false` | 是否包含子序列。若為 `true`（系統預設），除了該核心識別碼本身，其衍生的狀態流也會一併被初始化。 |
| `includeWorldSeed` | `true`/`false` | 是否混淆世界種子。若為 `true`（系統預設），引擎會將當前的地圖種子與手動填寫的 `<種子碼>` 進行異或（XOR）運算，增加數值的客觀物理不確定性。 |

---

## 數值規則與底層核心邊界

### 1. 隨機數值區間邊界 (Value Boundaries)

| 參數 | 說明 |
| --- | --- |
| `<最小值>` / `<最大值>` | 最小值：`-2147483648` / 最大值：`2147483647`（嚴格受限於標準 32 位元有號整數極限） / 支援負數：是 / 區間最大跨度：其最大值與最小值的絕對值差不可超過 $4294967295$。 |

### 2. 種子碼數值邊界 (Seed Boundaries)

| 參數 | 說明 |
| --- | --- |
| `<種子碼>` | 最小值：`-9223372036854775808` / 最大值：`9223372036854775807`（標準 64 位元有號長整數 `Long` 範圍） |

---

## 核心限制與控制流運作規範
> `/random` 指令底層基於線性同餘或 Xoroshiro 演算法實現偽隨機管理，具備以下決定性特性：

1. **隨機序列隔離（Sequence Isolation）**：
* 如果在執行指令時省略了 `<序列識別碼>`，引擎會預設調用全域的「非特定隨機流（Unsequenced Random）」。
* 若指定了自訂的 `<序列識別碼>`（如 `custom_rpg:loot_box`），則該隨機數的產生將獨立於世界其他機制。這意味著：**只要重置時給予相同的種子碼，每一次連續調用該序列所得到的隨機數數值順序將會 100% 完全相同**。這在開發地圖的存檔重播、防作弊檢驗或確定性隨機機制中至關重要。


2. **與後端變數對接（Storage/Scoreboard Write）**：
* `/random value` 本身不具備修改世界的副作用，必須結合 `/execute store` 進行鏈接。
* *範例：將一個 1 到 20 的隨機點數寫入玩家的計分板：*
```commands id="random_store_example"
/execute store result score @s d20_dice run random value 1..20
```



---

## 跨元素語法關聯表 (Links Matrix)

| 關聯參數欄位 | 參引語法元件名稱 |
| --- | --- |
| 數值寫入端 | [計分板數值與變數調控系統 (Scoreboard)](https://www.google.com/search?q=https://github.com/YuYue71/Minecraft_Commands/blob/main/.commands/scoreboard.md) |
| 數據流中介 | [複合執行與資料暫存指令 (Execute Store)](https://www.google.com/search?q=https://github.com/YuYue71/Minecraft_Commands/blob/main/.commands/execute.md) |
| 全域世界種子源 | [世界種子查詢指令 (Seed)](https://www.google.com/search?q=https://github.com/YuYue71/Minecraft_Commands/blob/main/.commands/seed.md) |