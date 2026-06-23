# /save-all

> **分類:** `指令` | **權限等級:** `4` | **適用版本:** `JE ≤ 1.20.4` | **命令方塊:** `false`

---

## 目錄

* [語法](#語法-syntax)
* [參數說明](#參數說明-parameters)
    * [flush](#flush)
* [外部連結](#外部連結-references)

---

## 語法 (Syntax)

```commands
/save-all [flush]

```

* `[]` = 選填

| 參數 / 欄位 | 類型 | 預設 | 說明 |
| --- | --- | --- | --- |
| `[flush]` | `enum` | - | 是否強制立即寫入磁碟並暫停伺服器運作直到存檔完成 |

---

## 參數說明 (Parameters)

### `flush`

> 附加參數, 用於強制同步寫入.

* 執行 `/save-all` 會將伺服器所有的區塊, 玩家資料與世界狀態儲存至硬碟中.
* 若不附加此參數, 伺服器會將存檔任務排入背景處理佇列中, 不會影響遊戲進行.
* 若加上 `flush` (即執行 `/save-all flush`), 伺服器會立即暫停主執行緒進行強制寫入. 在存檔完成前, 遊戲世界會短暫凍結 (Lag), 適合用於關閉伺服器或進行重大地圖檔案備份前的強制確保手段.

---

## 外部連結 (References)

* [Minecraft Wiki - /save-all](https://zh.minecraft.wiki/w/%E5%91%BD%E4%BB%A4/save#save-all)
* [/save-off](https://github.com/YuYue71/Minecraft_Commands/blob/main/.commands/save-off.md)
* [/save-on](https://github.com/YuYue71/Minecraft_Commands/blob/main/.commands/save-on.md)