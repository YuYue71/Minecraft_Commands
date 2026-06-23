# /tick

> **分類:** `指令` | **權限等級:** `3` | **適用版本:** `JE 1.20.3 - 1.20.4` | **命令方塊:** `false`

---

## 目錄

* [語法](#語法-syntax)
* [參數說明](#參數說明-parameters)
  * [rate](#rate)
  * [sprint](#sprint)
  * [step](#step)
* [外部連結](#外部連結-references)

---

## 語法 (Syntax)

```commands
/tick query
/tick rate <rate>
/tick freeze
/tick unfreeze
/tick step <time>
/tick step stop
/tick sprint <time>
/tick sprint stop
```

* `<>` = 必填, `[]` = 選填, `|` = 二擇一, `..` = 範圍 (如 `1..10`)

| 參數 / 欄位 | 類型 | 預設 | 說明 |
| --- | --- | --- | --- |
| `query` | `keyword` | - | 查詢當前目標刻速率與效能資訊 |
| `rate` | `keyword` | - | 設置每秒執行的刻數 (Tick Rate) |
| `<rate>` | `float` | - | 目標速率 (範圍 1.0..1000.0) |
| `freeze` | `keyword` | - | 凍結所有遊戲流程 (實體, 區塊更新, 時間) |
| `unfreeze` | `keyword` | - | 解除凍結狀態, 恢復正常遊戲流程 |
| `step` | `keyword` | - | 在凍結狀態下步進執行指定時間 |
| `sprint` | `keyword` | - | 以硬體極限速率快速執行指定時間 |
| `<time>` | `Time` | - | 執行的時間長度 (需含單位, 如 10s, 100t) |

---

## 參數說明 (Parameters)

### `rate`

> 調整伺服器每秒嘗試執行的遊戲刻 (Ticks) 數量. 預設值為 20.0.

| 值 | 說明 |
| --- | --- |
| `<rate>` | 設置新的刻速率. 調高可使遊戲加速, 調低可使遊戲變慢. 數值上限受硬體效能限制. |

---

### `sprint`

> 強制伺服器在指定時間內不進行同步等待, 以最快速度運行. 用於跳過冗長的等待過程 (如農作物生長, 長途移動).

| 值 | 說明 |
| --- | --- |
| `<time>` | 衝刺執行的持續時間. 結束後會返回原有的刻速率. |
| `stop` | 立即終止當前的衝刺行為. |

---

### `step`

> 僅在遊戲處於 `freeze` (凍結) 狀態時可用. 允許遊戲精準地運行一段時間後再次自動進入凍結.

| 值 | 說明 |
| --- | --- |
| `<time>` | 步進執行的時間長度. 用於逐幀觀察遊戲行為或進行技術調試. |
| `stop` | 立即終止當前的步進執行. |

---

## 外部連結 (References)

* [Minecraft Wiki - /tick](https://zh.minecraft.wiki/w/%E5%91%BD%E4%BB%A4/tick)
* [時間與時間單位 (Time & Duration Formats)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/TimeFormats.md)