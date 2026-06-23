# /pardon-ip

> **分類:** `指令` | **權限等級:** `3` | **適用版本:** `JE ≤ 1.20.4` | **命令方塊:** `false`

---

## 目錄

* [語法](#語法-syntax)
* [參數說明](#參數說明-parameters)
    * [target](#target)
* [外部連結](#外部連結-references)

---

## 語法 (Syntax)

```commands
/pardon-ip <target>
```

* `<>` = 必填

| 參數 / 欄位 | 類型 | 預設 | 說明 |
| --- | --- | --- | --- |
| `<target>` | `string` | - | 欲解除封鎖 (取消 IP Ban) 的 IP 位址 |

---

## 參數說明 (Parameters)

### `target`

> 將指定的 IP 位址從伺服器連線黑名單 (Blacklist) 中移除.

* 執行此指令後, 來自該 IP 位址的任何遊戲用戶端將恢復連線進入伺服器的權限.
* 必須直接輸入標準的 IPv4 位址 (如 `192.168.1.100`), **不支援**輸入玩家名稱. 若要解封特定玩家名稱, 需使用 `/pardon` 指令.
* 此指令的功能完全等同於直接在伺服器根目錄的 `banned-ips.json` 檔案中刪除該 IP 的紀錄.

---

## 外部連結 (References)

* [Minecraft Wiki - /pardon-ip](https://zh.minecraft.wiki/w/%E5%91%BD%E4%BB%A4/pardon#pardon-ip)