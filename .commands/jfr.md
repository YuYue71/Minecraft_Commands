# `/jfr`（Java Flight Recorder 指令）

* > 用於記錄伺服器效能分析資料
* > 基於 Java Flight Recorder 功能
* > 已於新版本整合至 `/debug`

## 語法結構 (Syntax)

```commands
/jfr <操作>
```

---

## 參數與引數拆解 (Arguments)

> 詳細解構語法中出現的每一個變數之填寫規範與底層資料型態

| 參數名稱          | 功能與語義說明     |
| ------------- | ----------- |
| `[必填]` `<操作>` | 指定 JFR 記錄操作 |

---

## 參數枚舉列表 (Parameter Enumeration)

### 操作

| 參數        | 說明          |
| --------- | ----------- |
| `<start>` | 開始記錄 JFR 資料 |
| `<stop>`  | 停止記錄並輸出檔案   |
