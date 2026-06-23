# /list

> **分類:** `指令` | **權限等級:** `0` | **適用版本:** `JE ≤ 1.20.4` | **命令方塊:** `true`

---

## 目錄

* [語法](#語法-syntax)
* [參數說明](#參數說明-parameters)
    * [uuids](#uuids)
* [外部連結](#外部連結-references)

---

## 語法 (Syntax)

```commands
/list [uuids]

```

* `[]` = 選填

| 參數 / 欄位 | 類型 | 預設 | 說明 |
| --- | --- | --- | --- |
| `[uuids]` | `enum` | - | 是否在列表中同時顯示玩家的 UUID |

---

## 參數說明 (Parameters)

### `uuids`

> 附加參數, 用於顯示在線玩家的唯一識別碼 (UUID).

* 僅執行 `/list` 時, 伺服器會在聊天框中輸出當前的最大玩家容納人數, 總在線人數, 以及所有在線玩家的名稱列表.
* 若加上 `uuids` 參數 (即執行 `/list uuids`), 系統輸出的名單中會在每位玩家的名稱旁邊附加上他們對應的 UUID 字串 (格式如 `xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx`).
* 由於此指令的權限等級極低, 任何玩家 (包含未取得管理員權限的一般玩家) 預設皆可執行, 因此常用於快速查看當前伺服器內有哪些人正在線上.

---

## 外部連結 (References)

* [Minecraft Wiki - /list](https://zh.minecraft.wiki/w/%E5%91%BD%E4%BB%A4/list)