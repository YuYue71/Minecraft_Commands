# function/
## 注意事項
- function 資料夾內每個檔案必須以 `.mcfunction` 結尾
- 指令開頭不能有"/"
- 使用"#"可以寫註解
- 不能打指令跟註解以外的內容
- 一行一條指令
- 可以建立模組化結構管理 function

---

## 技巧
### 重複執行 function
- 在 minecraft 命名空間下建立一個 function 並使用該函式指定要每 tick 重複執行函數
- 結構如下
    ```tree
    data/
    └── minecraft/name/functions/
        └── tick.json   # 指定重複執行檔(必須名為tick.json)
    ```
- tick.json
    ```json
    {
        "values": [
            "命名空間:函數0",
            "命名空間:函數1",
            "name:tags"
        ]
    }
    ```

### 每次重新加載執行一次 function
- 在 minecraft 命名空間下建立一個 function 並使用該函式指定要每次重新加載都執行一次的函數
- 結構如下
    ```tree
    data/
    └── minecraft/name/functions/
        └── load.json   # 指定重複執行檔(必須名為load.json)
    ```
- load.json
    ```json
    {
        "values": [
            "命名空間:函數0",
            "命名空間:函數1",
            "name:tags"
        ]
    }
    ```

---

## 跨元素語法關聯表 (Links Matrix)

| 關聯參數欄位 | 參引語法元件名稱 |
| --- | --- |
| 函式指令 | [/function（函數執行指令）](https://github.com/YuYue71/Minecraft_Commands/blob/main/.commands/function.md) |
| 指令列表 | [空間座標系統全指南 (Coordinates)](https://github.com/YuYue71/Minecraft_Commands/blob/main/README.md) |