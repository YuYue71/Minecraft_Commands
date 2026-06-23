# /pardon

> **分類:** `指令` | **權限等級:** `3` | **適用版本:** `JE ≤ 1.20.4` | **命令方塊:** `false`

---

## 目錄

* [語法](#語法-syntax)
* [參數說明](#參數說明-parameters)
    * [targets](#targets)
* [外部連結](#外部連結-references)

---

## 語法 (Syntax)

```commands
/pardon <targets>

```

* `<>` = 必填

| 參數 / 欄位 | 類型 | 預設 | 說明 |
| --- | --- | --- | --- |
| `<targets>` | `string` | - | 欲解除封鎖 (取消 Ban) 的玩家名稱 |

---

## 參數說明 (Parameters)

### `targets`

> 將指定的玩家從伺服器黑名單 (Blacklist) 中移除.

* 執行此指令後, 該名玩家將恢復連線進入伺服器的權限.
* 由於被封鎖的玩家必定處於離線狀態, 因此此參數**不支援**使用目標選擇器 (如 `@p`, `@a`), 必須直接輸入精確的玩家遊戲 ID 名稱.
* 此指令的功能完全等同於直接在伺服器根目錄的 `banned-players.json` 檔案中刪除該玩家的紀錄.

---

## 外部連結 (References)

* [Minecraft Wiki - /pardon](https://zh.minecraft.wiki/w/%E5%91%BD%E4%BB%A4/pardon)