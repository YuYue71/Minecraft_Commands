# /whitelist

> **分類:** `指令` | **權限等級:** `3` | **適用版本:** `JE ≤ 1.20.4` | **命令方塊:** `false`

---

## 目錄

* [語法](#語法-syntax)
* [參數說明](#參數說明-parameters)
    * [on 與 off](#on-與-off)
    * [add 與 remove](#add-與-remove)
    * [list 與 reload](#list-與-reload)
* [外部連結](#外部連結-references)

---

## 語法 (Syntax)

```commands
/whitelist on
/whitelist off
/whitelist add <targets>
/whitelist remove <targets>
/whitelist list
/whitelist reload

```

* `<>` = 必填

| 參數 / 欄位 | 類型 | 預設 | 說明 |
| --- | --- | --- | --- |
| `on` / `off` | `enum` | - | 啟用或停用伺服器白名單機制 |
| `add` / `remove` | `enum` | - | 將玩家新增至白名單或從中移除 |
| `<targets>` | `string` | - | 欲新增或移除的精確玩家名稱 |
| `list` | `enum` | - | 顯示當前白名單內的所有玩家 |
| `reload` | `enum` | - | 從伺服器硬碟重新載入白名單檔案 |

---

## 參數說明 (Parameters)

### `on` 與 `off`

> 控制伺服器專屬連線名單 (Whitelist) 的總開關.

* `on`: 啟動白名單. 啟動後, 只有被記錄在名單內的玩家與伺服器管理員 (OP) 才能連線進入伺服器. 未在名單內的玩家嘗試連線時會被伺服器拒絕, 並顯示預設提示 `You are not white-listed on this server!`.
* `off`: 關閉白名單. 任何人皆可自由連線進入伺服器 (前提是未受到 `/ban` 或其他防火牆阻擋).

---

### `add` 與 `remove`

> 編輯允許進入伺服器的玩家名單.

* `add <targets>`: 將指定的玩家名稱加入白名單. 即使該玩家當前不在線上, 只要精確輸入其遊戲 ID 即可成功註冊.
* `remove <targets>`: 將指定的玩家從白名單中剔除. 若被移除的玩家當前正處於連線狀態且白名單已開啟, 該玩家**不會**立刻被踢出伺服器, 直到他下次嘗試重新連線時才會遭到阻擋 (除非在 `server.properties` 中的 `enforce-whitelist` 屬性被設為 `true`).
* 由於此指令的執行對象包含離線玩家, 因此此參數**不支援**使用目標選擇器 (如 `@p`, `@a`), 必須直接輸入文字字串名稱.

---

### `list` 與 `reload`

> 查詢與同步名單狀態.

* `list`: 統整並在聊天框列出當前白名單中已註冊的玩家總數與詳細名稱清單.
* `reload`: 強制伺服器重新讀取根目錄下的 `whitelist.json` 實體檔案. 適用於管理員直接透過 FTP 或純文字編輯器修改了該 JSON 檔案的內容後, 不需重啟整個伺服器 (Restart) 即可讓新名單立即生效.

---

## 外部連結 (References)

* [Minecraft Wiki - /whitelist](https://zh.minecraft.wiki/w/%E5%91%BD%E4%BB%A4/whitelist)