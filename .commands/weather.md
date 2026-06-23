# /weather

> **分類:** `指令` | **權限等級:** `2` | **適用版本:** `JE ≤ 1.20.4` | **命令方塊:** `true`

---

## 目錄

* [語法](#語法-syntax)
* [參數說明](#參數說明-parameters)
    * [type](#type)
    * [duration](#duration)
* [外部連結](#外部連結-references)

---

## 語法 (Syntax)

```commands
/weather clear [duration]
/weather rain [duration]
/weather thunder [duration]
```

* `[]` = 選填

| 參數 / 欄位 | 類型 | 預設 | 說明 |
| --- | --- | --- | --- |
| `clear` / `rain` / `thunder` | `enum` | - | 欲設定的目標天氣狀態 |
| `[duration]` | `time` | 隨機 | 該天氣狀態預計持續的時間 |

---

## 參數說明 (Parameters)

### `type`

> 強制變更當前世界的天氣.

| 值 | 說明 |
| --- | --- |
| `clear` | 晴天. 天空無雲, 不會降雨或降雪. 敵對生物會在陽光下燃燒. |
| `rain` | 雨天 (或在寒冷生物群系中為降雪). 天色變暗, 陽光亮度降低至無法使殭屍燃燒, 且會撲滅露天的火焰. |
| `thunder` | 雷雨天. 除了降雨外, 還會隨機產生閃電劈中地表. 亮度極低, 使得敵對生物可以在白天自然生成. |

---

### `duration`

> 控制天氣變化後的維持時間長度.

* 若未指定此參數, 系統將會自動隨機分配一個時間長度 (通常介於 `300` 到 `900` 秒之間, 即 5 到 15 分鐘).
* 時間單位的預設格式為遊戲刻 (Tick), 但同樣支援使用後綴符號 (如 `s` 秒, `d` 天) 進行快速設定, 詳見全域時間規範.
* 當指定的持續時間結束後, 天氣會自動恢復自然隨機循環狀態.

---

## 外部連結 (References)

* [Minecraft Wiki - /weather](https://zh.minecraft.wiki/w/%E5%91%BD%E4%BB%A4/weather?variant=zh-tw)
* [時間與時間單位 (Time & Duration Formats)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/TimeFormats.md)