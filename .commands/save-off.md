# /save-off

> **分類:** `指令` | **權限等級:** `4` | **適用版本:** `JE ≤ 1.20.4` | **命令方塊:** `false`

---

## 目錄

* [語法](#語法-syntax)
* [參數說明](#參數說明-parameters)
* [外部連結](#外部連結-references)

---

## 語法 (Syntax)

```commands
/save-off

```

* 此指令不需要任何額外參數.

| 參數 / 欄位 | 類型 | 預設 | 說明 |
| --- | --- | --- | --- |
| (無) | - | - | 停用伺服器的自動存檔機制 |

---

## 參數說明 (Parameters)

> 暫停世界資料寫入硬碟.

* 執行此指令後, 伺服器將不再自動進行週期性的背景存檔 (包含區塊與玩家資料).
* 通常用於需要對伺服器地圖進行外部檔案複製, 或是執行備份腳本的期間, 避免伺服器在備份過程中寫入新資料導致檔案損毀或發生不一致的衝突.
* 關閉自動存檔期間, 伺服器若發生崩潰或意外斷電, 將會遺失自最後一次存檔以來的所有的進度.

---

## 外部連結 (References)

* [Minecraft Wiki - /save-off](https://zh.minecraft.wiki/w/%E5%91%BD%E4%BB%A4/save#save-off)
* [/save-all](https://github.com/YuYue71/Minecraft_Commands/blob/main/.commands/save-all.md)
* [/save-on](https://github.com/YuYue71/Minecraft_Commands/blob/main/.commands/save-on.md)