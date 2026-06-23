# /debug

> **分類:** `指令` | **權限等級:** `3` | **適用版本:** `JE ≤ 1.20.4` | **命令方塊:** `false`

---

## 目錄

* [語法](#語法-syntax)
* [參數說明](#參數說明-parameters)
    * [start 與 stop](#start-與-stop)
    * [function](#function)
* [外部連結](#外部連結-references)

---

## 語法 (Syntax)

```commands
/debug start
/debug stop
/debug function <name>
```

* `<>` = 必填

| 參數 / 欄位 | 類型 | 預設 | 說明 |
| --- | --- | --- | --- |
| `<name>` | `string` | - | 欲追蹤執行的函式資源位置 (如 `minecraft:tick`) |

---

## 參數說明 (Parameters)

### `start` 與 `stop`

> 伺服器效能分析 (Profiling) 記錄開關.

* `start`: 啟動效能數據收集. 包含 CPU 使用率, 記憶體波動與遊戲刻 (Tick) 耗時等底層效能資訊.
* `stop`: 停止記錄, 並自動將這段期間的分析報告打包為 `.zip` 檔案, 儲存於伺服器根目錄的 `debug/` 資料夾內.

---

### `function`

> 追蹤並執行指定的資料包函式.

* 強制執行指定的 `<name>` 函式, 並將該函式內部每一行指令的逐步執行狀況, 成敗與耗時記錄下來.
* 執行結束後, 追蹤報告會自動匯出為純文字檔案, 同樣儲存於伺服器端的 `debug/` 資料夾中.
* 常用於資料包開發者尋找複雜巢狀函式或連鎖指令中的邏輯錯誤.

---

## 外部連結 (References)

* [Minecraft Wiki - /debug](https://zh.minecraft.wiki/w/%E5%91%BD%E4%BB%A4/debug?variant=zh-tw)
* [資源位置與命名空間規範 (Resource Locations)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/ResourceLocations.md)