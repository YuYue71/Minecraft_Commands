# 函式 (Functions/)

> **分類:** `資料包` | **適用版本:** `JE 1.20.4` | **路徑:** `data/<namespace>/functions/<名稱>.mcfunction`

* **引用格式:** `namespace:名稱` (不含副檔名)

---

## 概覽 (Overview)

以 `.mcfunction` 為副檔名的純文字檔案, 用於按順序執行一系列 Minecraft 指令. 支援透過資料包進行邏輯群組, 循環呼叫以及 1.20.4 核心的巨集 (Macros) 動態參數傳遞.

---

## 檔案格式 (File Format)

```mcfunction
# 這是註解內容
say 這是第一條執行的指令
give @s minecraft:diamond 1
$say 這是巨集指令, 歡迎使用 $(player_name)

```

---

## 核心規則 (Core Rules)

### 基礎語法規範

* 每行只能寫一條指令.
* 指令前方**嚴禁**加上斜線前綴 `/` (例如: 必須寫 `say test`, 嚴禁寫 `/say test`).
* 使用井字號 `#` 開頭的行會被識別為註解, 執行時會自動忽略.
* 檔案編碼必須嚴格維持 `UTF-8` 無 BOM 格式, 否則會造成中文或特殊字元解析失敗.

### 巨集機制 (Macros) `[1.20.2+]`

> 在 1.20.4 中, 函式支援動態參數傳遞. 當某行以 `$` 開頭時, 該行會被編譯為巨集行.

* **語法格式:** `$cmd $(變數名)`
* **呼叫方式:** 必須搭配 `/function <命名空間:函式> <NBT_Compound>` 傳遞參數.
* **範例:**
若 `data/demo/functions/spawn.mcfunction` 內容為:
```mcfunction
$summon $(mob_id) ~ ~ ~

```


執行以下指令呼叫:
```minecraft
/function demo:spawn {mob_id:"minecraft:zombie"}

```



---

## 執行機制 (Execution Mechanism)

### 執行聯鎖與效能

* **單池限制 (Max Command Chain):** 單次函式呼叫引發的指令執行總上限受遊戲規則 `maxCommandChainLength` 限制 (預設為 65536 條指令). 超出此限制的指令將不會被執行.
* **同刻執行 (Tick-based Execution):** 函式內的所有指令皆在同一個遊戲刻 (Tick) 內瞬間按順序執行完畢, 畫面不會產生指令間的物理延遲.
* **執行主體與定位:** 預設情況下, 函式內所有指令的執行者 (`@s`) 與執行座標皆繼承自觸發該 `/function` 指令的實體或系統源. 可在內部搭配 `/execute` 重新定位.

---

## 注意事項 (Notes)

* 函式內支援遞迴呼叫 (自己呼叫自己), 但必須嚴格設計終止條件, 否則會瞬間觸發 `maxCommandChainLength` 上限而強制中斷.
* 空白行會被自動忽略, 不會計入 `maxCommandChainLength` 消耗.
* 若函式內任何一行指令語法出錯, 遊戲主控台會拋出錯誤, 但該行前后的正確指令仍會繼續執行, 不會導致整份檔案崩潰.

---

## 外部連結 (References)

* [Minecraft Wiki - 函式](https://minecraft.fandom.com/zh/wiki/Java%E7%89%88%E5%87%BD%E6%95%B0?variant=zh-tw)

---

*最後更新: 2026-06-21*