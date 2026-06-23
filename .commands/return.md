# /return

> **分類:** `指令` | **權限等級:** `2` | **適用版本:** `JE ≤ 1.20.4` | **命令方塊:** `true`

---

## 目錄

* [語法](#語法-syntax)
* [參數說明](#參數說明-parameters)
  * [value](#value)
  * [fail](#fail)
  * [run](#run)
* [資料包結構參考 (Datapack Structure)](#資料包結構參考-datapack-structure)
* [外部連結](#外部連結-references)

---

## 語法 (Syntax)

```commands
/return <value>
/return fail
/return run <command>
```

* `<>` = 必填, `[]` = 選填, `|` = 二擇一, `..` = 範圍 (如 `1..10`)

| 參數 / 欄位 | 類型 | 預設 | 說明 |
| --- | --- | --- | --- |
| `<value>` | `int` | - | 指定函式的傳回值 (Result Value) |
| `fail` | `keyword` | - | (1.20+) 強制使函式執行失敗 |
| `run` | `keyword` | - | (1.20+) 執行指令並將其結果作為函式的傳回值 |
| `<command>` | `command` | - | 欲執行並獲取結果的指令 |

---

## 參數說明 (Parameters)

### `value`

> 終止當前函式 (Function) 或指令腳本的執行, 並向呼叫者傳回一個整數值.

| 值 | 說明 |
| --- | --- |
| `<integer>` | 任何整數值. 該值會作為 `/execute store ... result` 或 `/function` 的傳回結果. |

---

### `fail`

> (1.20+) 立即終止執行, 並將該函式的成功次數 (Success Count) 設為 0, 傳回值 (Result Value) 亦設為 0.

---

### `run`

> (1.20+) 執行指定的指令, 並將該指令的執行結果直接作為函式的傳回值. 若指令執行失敗, 則函式亦視為失敗.

| 值 | 說明 |
| --- | --- |
| `<command>` | 任何合法的 Minecraft 指令. |

---

## 資料包結構參考 (Datapack Structure)

### 函式 (Functions)
`/return` 指令僅在函式內部執行時具有實際意義, 用於流程控制 (Flow Control) 與早期退出 (Early Exit). 檔案位置:
`data/<namespace>/functions/<path>.mcfunction`

**執行邏輯範例:**
1. 若執行 `/return`, 該行之後的所有指令將被跳過 (Skipped).
2. 若在循環 (如 `execute as ... run function ...`) 中使用, 僅會退出當前層級的函式執行.

---

## 外部連結 (References)

* [Minecraft Wiki - /return](https://zh.minecraft.wiki/w/%E5%91%BD%E4%BB%A4/return)
* [資源位置與命名空間規範 (Resource Locations)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/ResourceLocations.md)