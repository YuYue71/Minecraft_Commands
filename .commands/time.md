# /time

> **分類:** `指令` | **權限等級:** `2` | **適用版本:** `JE ≤ 1.20.4` | **命令方塊:** `true`

---

## 目錄

* [語法](#語法-syntax)
* [參數說明](#參數說明-parameters)
    * [set 與 add](#set-與-add)
    * [query](#query)
* [外部連結](#外部連結-references)

---

## 語法 (Syntax)

```commands
/time add <time>
/time set <time>
/time set <day|night|noon|midnight>
/time query <daytime|gametime|day>
```

* `<>` = 必填

| 參數 / 欄位 | 類型 | 預設 | 說明 |
| --- | --- | --- | --- |
| `add` | `enum` | - | 將指定的時間量疊加到當前時間上 |
| `set` | `enum` | - | 將世界時間強制設定為指定數值或時段 |
| `query` | `enum` | - | 查詢當前世界的特定時間數據 |
| `<time>` | `time` | - | 欲增加或設定的時間數值 |

---

## 參數說明 (Parameters)

### `set` 與 `add`

> 改變當前的世界時間.

* `add`: 推進時間. 例如 `/time add 100` 會讓時間前進 100 刻.
* `set`: 將時間固定至特定點. 可直接輸入刻數, 或使用系統內建的文字標籤來快速設定常用時段:
* `day`: 早上 (等於 `1000`)
* `noon`: 中午 (等於 `6000`)
* `night`: 晚上 (等於 `13000`)
* `midnight`: 午夜 (等於 `18000`)


* `<time>` 參數的單位預設為遊戲刻 (Tick). 支援使用後綴字母來指定不同單位 (如 `d`, `s`, `t`), 詳細規範請參閱時間與時間單位文件.

---

### `query`

> 獲取時間數據, 常用於透過指令方塊擷取時間值並存入計分板中.

| 值 | 說明 |
| --- | --- |
| `daytime` | 查詢當前時間在一天之內的總刻數 (數值範圍為 `0` 到 `24000`) |
| `gametime` | 查詢自世界創建以來總共經過的絕對總刻數 (不會因為 `/time set` 而倒退) |
| `day` | 查詢世界目前已經度過的天數 |

---

## 外部連結 (References)

* [Minecraft Wiki - /time](https://zh.minecraft.wiki/w/%E5%91%BD%E4%BB%A4/time)
* [時間與時間單位 (Time & Duration Formats)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/TimeFormats.md)