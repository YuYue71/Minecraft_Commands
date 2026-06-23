# /tag

> **分類:** `指令` | **權限等級:** `2` | **適用版本:** `JE ≤ 1.20.4` | **命令方塊:** `true`

---

## 目錄

* [語法](#語法-syntax)
* [參數說明](#參數說明-parameters)
  * [add](#add)
  * [remove](#remove)
  * [list](#list)
* [外部連結](#外部連結-references)

---

## 語法 (Syntax)

```commands
/tag <target> add <name>
/tag <target> remove <name>
/tag <target> list
```

* `<>` = 必填, `[]` = 選填, `|` = 二擇一, `..` = 範圍 (如 `1..10`)

| 參數 / 欄位 | 類型 | 預設 | 說明 |
| --- | --- | --- | --- |
| `<target>` | `Target Selector` | - | 指定要操作標籤 (Scoreboard Tag) 的目標實體 |
| `add` | `keyword` | - | 為目標新增標籤 |
| `remove` | `keyword` | - | 移除目標的標籤 |
| `list` | `keyword` | - | 列出目標擁有的所有標籤 |
| `<name>` | `string` | - | 標籤的自定義名稱 |

---

## 參數說明 (Parameters)

### `add`

> 為指定的實體新增一個自定義標籤. 標籤可用於 `/execute if entity @e[tag=<name>]` 等目標選擇器篩選.

| 值 | 說明 |
| --- | --- |
| `<name>` | 標籤名稱. 不可包含空格. 若實體已擁有該標籤, 則操作無效. |

---

### `remove`

> 從指定的實體中移除已存在的標籤.

| 值 | 說明 |
| --- | --- |
| `<name>` | 欲移除的標籤名稱. 若實體未擁有該標籤, 則操作無效. |

---

### `list`

> 在聊天欄中顯示指定實體當前擁有的所有標籤清單. 

* 注意: 若目標選擇器匹配多個實體, 系統通常僅會顯示其中一個實體的標籤清單.

---

## 外部連結 (References)

* [Minecraft Wiki - /tag](https://zh.minecraft.wiki/w/%E5%91%BD%E4%BB%A4/tag)
* [目標選擇器 (Target Selectors)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/TargetSelectors.md)