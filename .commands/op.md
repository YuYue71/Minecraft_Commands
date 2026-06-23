# /op

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
/op <targets>

```

* `<>` = 必填

| 參數 / 欄位 | 類型 | 預設 | 說明 |
| --- | --- | --- | --- |
| `<targets>` | `string/entity` | - | 欲賦予伺服器管理員 (OP) 權限的玩家名稱或目標 |

---

## 參數說明 (Parameters)

### `targets`

> 賦予指定玩家高等級的伺服器管理員特權.

* 執行此指令後, 目標玩家將獲得伺服器的管理員權限 (預設為等級 4, 實際等級取決於 `server.properties` 中的 `op-permission-level` 設定), 允許其執行如 `/gamemode`, `/ban`, `/stop` 等進階指令, 並可繞過重生點保護區塊的破壞限制.
* 支援使用目標選擇器 (如 `@p`, `@r`), 但解析後的目標實體必須是當前正在線上的玩家.
* 若欲賦予權限的玩家當前不在線上, 只要精確輸入其完整的遊戲 ID 名稱, 依然可以成功將其提升為管理員.
* 若要撤銷此權限, 需使用 `/deop` 指令.

---

## 外部連結 (References)

* [Minecraft Wiki - /op](https://zh.minecraft.wiki/w/%E5%91%BD%E4%BB%A4/op)
* [目標選擇器 (Target Selectors)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/TargetSelectors.md)