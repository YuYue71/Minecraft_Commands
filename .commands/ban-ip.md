# /ban-ip

> **分類:** `指令` | **權限等級:** `3` | **適用版本:** `JE ≤ 1.20.4` | **命令方塊:** `false`

---

## 目錄

* [語法](#語法-syntax)
* [參數說明](#參數說明-parameters)
    * [target](#target)
    * [reason](#reason)
* [外部連結](#外部連結-references)
---

## 語法 (Syntax)

```commands
/ban-ip <target> [reason]

```

* `<>` = 必填, `[]` = 選填

| 參數 / 欄位 | 類型 | 預設 | 說明 |
| --- | --- | --- | --- |
| `<target>` | `string` | - | 欲封鎖的 IP 位址或在線玩家名稱 |
| `[reason]` | `string` | `IP banned by an operator.` | 顯示給被封鎖 IP 玩家的原因與提示訊息 |

---

## 參數說明 (Parameters)

### `target`

> 將指定的 IP 位址加入伺服器黑名單 (Blacklist).

* 允許直接輸入標準的 IPv4 位址 (如 `192.168.1.100`).
* 若輸入的是**當前在線玩家的名稱**, 伺服器會自動抓取該玩家連線時所使用的 IP 位址進行封鎖, 並將該玩家踢出伺服器.
* 一旦某個 IP 位址被封鎖, 任何試圖從該 IP 連線進入伺服器的玩家 (無論使用哪個遊戲帳號) 都會被拒絕登入.

---

### `reason`

> 顯示給被封鎖連線者的自訂訊息.

* 當使用者嘗試從被封鎖的 IP 重新連線進入伺服器時, 遊戲畫面上所顯示的提示文字.
* 允許輸入包含空格的完整句子, 無需使用引號包覆.

---

## 外部連結 (References)

* [Minecraft Wiki - /ban-ip](https://minecraft.fandom.com/zh/wiki/Talk:%E5%91%BD%E4%BB%A4/ban?variant=zh-tw)