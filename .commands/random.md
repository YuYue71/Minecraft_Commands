# /random

> **分類:** `指令` | **權限等級:** `2` | **適用版本:** `JE 1.20.2 - 1.20.4` | **命令方塊:** `true`

---

## 目錄

* [語法](#語法-syntax)
* [參數說明](#參數說明-parameters)
  * [value](#value)
  * [roll](#roll)
  * [reset](#reset)
* [外部連結](#外部連結-references)

---

## 語法 (Syntax)

```commands
/random value <range> [<sequence>]
/random roll <range> [<sequence>]
/random reset <sequence> [<seed>] [<include_world_seed>] [<include_sequence_id>]
/random reset * [<seed>] [<include_world_seed>] [<include_sequence_id>]
```

* `<>` = 必填, `[]` = 選填, `|` = 二擇一, `..` = 範圍 (如 `1..10`)

| 參數 / 欄位 | 類型 | 預設 | 說明 |
| --- | --- | --- | --- |
| `<range>` | `range` | - | 隨機數值的範圍 (如 `1..100`) |
| `<sequence>` | `Resource Location` | - | 指定使用的隨機序列 (Random Sequence) ID |
| `*` | `keyword` | - | 代表重設所有已定義的隨機序列 |
| `[seed]` | `long` | - | 指定新的隨機種子碼 (Seed) |
| `[include_world_seed]` | `boolean` | `true` | 是否將世界種子 (World Seed) 納入計算 |
| `[include_sequence_id]` | `boolean` | `true` | 是否將序列 ID 納入計算 |

---

## 參數說明 (Parameters)

### `value`

> 生成一個指定範圍內的隨機整數, 並將結果作為指令的傳回值 (Result Value). 常用於 `/execute store` 配合使用.

| 值 | 說明 |
| --- | --- |
| `<range>` | 使用 `min..max` 格式定義閉區間範圍 (含邊界). |
| `[sequence]` | (選填) 指定一個命名的隨機序列. 相同序列在相同狀態下會產生可預測的隨機結果. |

---

### `roll`

> 行為與 `value` 相似, 但其設計意圖是用於模擬「擲骰 (Rolling)」行為. 產生的數值同樣會顯示在聊天欄位或作為傳回值.

---

### `reset`

> 重設一個或所有隨機序列的狀態, 使其回到初始的偽隨機 (Pseudo-random) 狀態.

| 值 | 說明 |
| --- | --- |
| `<sequence>` | 欲重設的特定序列 ID. |
| `*` | 重設伺服器內所有已快取的隨機序列. |
| `[seed]` | 設置新的數值基礎. 相同種子會導致序列產生的隨機數順序完全相同. |

---

## 外部連結 (References)

* [Minecraft Wiki - /random](https://zh.minecraft.wiki/w/%E5%91%BD%E4%BB%A4/random)
* [資源位置與命名空間規範 (Resource Locations)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/ResourceLocations.md)