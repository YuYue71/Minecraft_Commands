# /setidletimeout

> **分類:** `指令` | **權限等級:** `3` | **適用版本:** `JE ≤ 1.20.4` | **命令方塊:** `false`

---

## 目錄

* [語法](#語法-syntax)
* [參數說明](#參數說明-parameters)
    * [minutes](#minutes)
* [外部連結](#外部連結-references)

---

## 語法 (Syntax)

```commands
/setidletimeout <minutes>

```

* `<>` = 必填

| 參數 / 欄位 | 類型 | 預設 | 說明 |
| --- | --- | --- | --- |
| `<minutes>` | `int` | `0` | 允許玩家閒置的最大時間 (分鐘) |

---

## 參數說明 (Parameters)

### `minutes`

> 設定伺服器自動踢出閒置 (AFK) 玩家的判定時間.

* 輸入一個大於 `0` 的整數代表閒置的判定分鐘數. 例如設定為 `10`, 則玩家若連續 10 分鐘沒有任何動作 (包含移動, 轉動視角, 發送聊天訊息或使用物品), 將會被伺服器強制斷線以節省資源.
* 若輸入 `0`, 則代表完全關閉自動踢出機制, 玩家可以無限期在伺服器中掛網.
* 被踢出時, 玩家的遊戲畫面上會收到類似 `You have been idle for too long!` 的連線中斷提示.
* 執行此指令後, 會直接同步修改伺服器根目錄下 `server.properties` 檔案中的 `player-idle-timeout` 屬性數值.

---

## 外部連結 (References)

* [Minecraft Wiki - /setidletimeout](https://zh.minecraft.wiki/w/%E5%91%BD%E4%BB%A4/setidletimeout)