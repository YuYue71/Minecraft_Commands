# 函式巨集 (`functions/`)

> **分類:** `資料包` ｜ **適用版本:** `JE ≤ 1.20.4`

---

## 目錄

* [概覽](#概覽-overview)
* [核心結構](#核心結構-core-structure)
* [執行與語法限制](#執行與語法限制-execution-and-syntax-constraints)
* [生命週期與函式標籤](#生命週期與函式標籤-life-cycle-and-function-tags)
* [巨集展開](#巨集展開-macros-1202)
* [注意事項](#注意事項-notes)
* [外部連結](#外部連結-references)

---

## 概覽 (Overview)

函式 (`functions/`) 存放由純文字構成之 `.mcfunction` Command Scripts (指令腳本)，允許遊戲於單一 Tick (遊戲刻) 內依序執行多條指令，為資料包建構複雜系統與自動化流程之核心邏輯引擎。

---

## 核心結構 (Core Structure)

**路徑：** `data/<namespace>/functions/<名稱>.mcfunction`

```mcfunction
# 這是一行註解 (Comment)
execute as @a[tag=player] at @s run particle minecraft:flame ~ ~1 ~ 0 0 0 0.05 10

# 執行另一個函式
function namespace:system/init

```

---

## 執行與語法限制 (Execution and Syntax Constraints)

| 規則 | 說明 |
| --- | --- |
| 指令前綴 | 腳本內之指令**不可**使用 `/` 作為開頭，直接撰寫指令名稱即可。 |
| 註解符號 | 以 `#` 開頭的行視為 Comment (註解)，執行時會被引擎安全忽略。 |
| 執行順序 | 嚴格 Top-to-Bottom (由上至下) 依序執行，上一行指令之副作用會立即影響下一行。 |
| 執行環境 | 若未透過 `execute` 顯式切換 Execution Context (執行上下文)，函式預設由 Server (伺服器) 執行，執行座標為世界原點 `(0, 0, 0)`。 |
| 遞迴上限 | 受限於 Game Rule (遊戲規則) 之 `maxCommandChainLength`（預設 `65536`），指令總執行數超出限制將強制中斷以防止伺服器 Crash (崩潰)。 |

---

## 生命週期與函式標籤 (Life Cycle and Function Tags)

透過定義 Function Tags (函式標籤，路徑：`data/minecraft/tags/functions/<名稱>.json`)，可將特定函式綁定至伺服器之底層生命週期。

| 標籤路徑 | 觸發時機 | 說明 |
| --- | --- | --- |
| `#minecraft:load` | 資料包載入時 | 當伺服器啟動或玩家執行 `/reload` 指令時觸發**一次**。常用於初始化 Scoreboard (計分板) 或設定常數。 |
| `#minecraft:tick` | 每遊戲刻 | 每 1 Tick（即每秒 20 次）自動觸發。為實現常駐檢測、自訂實體行為與 Game Loop (遊戲迴圈) 之核心入口。 |

---

## 巨集展開 (Macros) `[1.20.2+]`

自 1.20.2 起，函式引入 Macro (巨集) 系統，允許在執行期動態替換變數，大幅減少重複之 Hardcode (硬編碼) 與窮舉窮舉列舉。

* **宣告變數：** 在 `.mcfunction` 內部指令中使用 `$(變數名)` 標記需替換的位置。巨集函式內包含 `$` 替換字符的行，其開頭亦會以 `$` 標示為巨集指令。
* **動態呼叫：** 必須搭配包含目標變數之 Compound NBT (複合 NBT 標籤) 或 NBT 路徑進行呼叫，引擎會在編譯時將 NBT 值注入變數。

```mcfunction
# 檔案：namespace:print_message.mcfunction
$say Hello, $(name)! Your score is $(score).

```

```mcfunction
# 呼叫端範例
function namespace:print_message {name: "Steve", score: 100}

```

---

## 注意事項 (Notes)

* 包含語法錯誤的 `.mcfunction` 檔案在伺服器載入時會直接失效，並於 Server Log (伺服器日誌) 拋出解析錯誤，導致整個函式無法被呼叫。
* 大量或高運算複雜度（如多重巢狀 `execute` 實體選擇）的指令若掛載於 `#minecraft:tick`，將導致嚴重的 TPS (每秒 Tick 數) 衰減。
* 函式內無法直接捕捉單一指令的 Return Value (回傳值)，若需儲存運算結果，必須搭配 `execute store` 寫入計分板或實體 NBT。

---

## 外部連結 (References)

* [Minecraft Wiki - 函式/巨集](https://minecraft.fandom.com/zh/wiki/Java%E7%89%88%E5%87%BD%E6%95%B0)

---

*最後更新：2026-06-22*