# /jfr

> **分類:** `指令` | **權限等級:** `4` | **適用版本:** `JE ≤ 1.20.4` | **命令方塊:** `false`

---

## 目錄

* [語法](#語法-syntax)
* [參數說明](#參數說明-parameters)
    * [start 與 stop](#start-與-stop)
* [外部連結](#外部連結-references)

---

## 語法 (Syntax)

```commands
/jfr start
/jfr stop
```

* `/jfr` 指令不需要額外參數, 僅接受啟動與停止的枚舉字串.

| 參數 / 欄位 | 類型 | 預設 | 說明 |
| --- | --- | --- | --- |
| `start` | `enum` | - | 啟動 Java 飛行記錄器 |
| `stop` | `enum` | - | 停止 Java 飛行記錄器並儲存報告 |

---

## 參數說明 (Parameters)

### `start` 與 `stop`

> 伺服器底層效能分析 (Java Flight Recorder) 開關.

* `start`: 啟動 JFR 分析. 遊戲會開始收集 JVM 級別的底層效能數據, 包含記憶體分配, 垃圾回收 (GC) 狀況, 執行緒鎖定, 網路封包傳輸與遊戲刻 (Tick) 延遲等深度技術指標.
* `stop`: 停止分析並自動將記錄匯出為 `.jfr` 格式的檔案. 該檔案會儲存於伺服器或客戶端根目錄下的 `debug/` 資料夾中.
* 輸出的 `.jfr` 檔案必須使用外部專業工具 (如 Java Mission Control, JMC) 進行視覺化開啟與底層除錯, 非常適合用於排查極度隱蔽的伺服器卡頓, 執行緒死鎖 (Deadlock) 或記憶體流失 (Memory Leak) 問題.

---

## 外部連結 (References)

* [Minecraft Wiki - /jfr](https://zh.minecraft.wiki/w/%E5%91%BD%E4%BB%A4/jfr?variant=zh-tw)