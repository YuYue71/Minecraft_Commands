# /banlist

> **分類:** `指令` | **權限等級:** `3` | **適用版本:** `JE ≤ 1.20.4` | **命令方塊:** `false`

---

## 目錄

* [語法](#語法-syntax)
* [參數說明](#參數說明-parameters)
    * [type](#type)
* [外部連結](#外部連結-references)

---

## 語法 (Syntax)

```commands
/banlist [type]

```

* `[]` = 選填

| 參數 / 欄位 | 類型 | 預設 | 說明 |
| --- | --- | --- | --- |
| `[type]` | `enum` | `players` | 欲查詢的黑名單類型 |

---

## 參數說明 (Parameters)

### `type`

> 指定欲查看的黑名單項目類別.

| 值 | 說明 |
| --- | --- |
| `players` | 顯示所有被封鎖的玩家帳號 (預設值) |
| `ips` | 顯示所有被封鎖的 IP 位址 |

* 若不填寫此參數, 系統預設顯示所有被封鎖的 `players`.
* 執行指令後, 伺服器會以列表形式顯示當前黑名單中的所有項目數量與詳細名稱或位址.

---

## 外部連結 (References)

* [Minecraft Wiki - /banlist](https://minecraft.fandom.com/zh/wiki/Talk:%E5%91%BD%E4%BB%A4/ban?variant=zh-tw)