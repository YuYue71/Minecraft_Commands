# /trigger

> **分類:** `指令` | **權限等級:** `0` | **適用版本:** `JE ≤ 1.20.4` | **命令方塊:** `true`

---

## 目錄

* [語法](#語法-syntax)
* [參數說明](#參數說明-parameters)
  * [objective](#objective)
  * [操作模式 (add|set)](#操作模式-addset)
* [外部連結](#外部連結-references)

---

## 語法 (Syntax)

```commands
/trigger <objective>
/trigger <objective> add <value>
/trigger <objective> set <value>
```

* `<>` = 必填, `[]` = 選填, `|` = 二擇一, `..` = 範圍 (如 `1..10`)

| 參數 / 欄位 | 類型 | 預設 | 說明 |
| --- | --- | --- | --- |
| `<objective>` | `string` | - | 欲修改的觸發器計分項目名稱 |
| `add` | `keyword` | - | 將數值累加至目前的計分值 |
| `set` | `keyword` | - | 將計分值設置為指定的數值 |
| `<value>` | `int` | - | 欲增加或設置的整數數值 |

---

## 參數說明 (Parameters)

### `objective`

> 指定一個判別標準 (Criteria) 為 `trigger` 的計分項目. 非管理員玩家僅能透過此指令修改被授權的觸發器項目.

| 限制條件 | 說明 |
| --- | --- |
| 判別標準 | 該項目的 Criteria 必須設定為 `trigger`. |
| 啟用狀態 | 必須先由管理員執行 `/scoreboard players enable <player> <objective>` 啟用該玩家的觸發權限. |

---

### 操作模式 (add\|set)

> 定義如何修改觸發器數值. 若僅輸入 `/trigger <objective>`, 則預設執行 `add 1`.

| 值 | 說明 |
| --- | --- |
| `add` | 執行加法運算. 將 `<value>` 加入當前分數. |
| `set` | 執行賦值運算. 將當前分數替換為 `<value>`. |

---

## 外部連結 (References)

* [Minecraft Wiki - /trigger](https://zh.minecraft.wiki/w/%E5%91%BD%E4%BB%A4/trigger)
* [資源位置與命名空間規範 (Resource Locations)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/ResourceLocations.md)