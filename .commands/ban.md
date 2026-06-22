# /ban

> **分類:** `指令` | **權限等級:** `3` | **適用版本:** `JE ≤ 1.20.4` | **命令方塊:** `false`

---

## 目錄

* [語法](#語法-syntax)
* [參數說明](#參數說明-parameters)
    * [targets](#targets)
    * [reason](#reason)
* [外部連結](#外部連結-references)

---

## 語法 (Syntax)

```commands
/ban <targets> [reason]

```

* `<>` = 必填, `[]` = 選填

| 參數 / 欄位 | 類型 | 預設 | 說明 |
| --- | --- | --- | --- |
| `<targets>` | `entity` | - | 欲封鎖的玩家或目標 |
| `[reason]` | `string` | `Banned by an operator.` | 顯示給被封鎖玩家的原因與提示訊息 |

---

## 參數說明 (Parameters)

### `targets`

> 欲加入伺服器黑名單 (Blacklist) 的玩家目標.

* 執行此指令後, 目標玩家將會被立刻踢出伺服器, 並且無法再次連線加入.
* 支援使用目標選擇器 (如 `@p`, `@a`), 但目標實體必須是玩家.
* 若指定的玩家當前不在線上, 只要輸入其精確的遊戲 ID, 依然可以將其加入封鎖名單.

---

### `reason`

> 顯示給被封鎖玩家的自訂訊息.

* 當被封鎖的玩家斷線或嘗試重新連線進入伺服器時, 遊戲畫面上所顯示的提示文字.
* 允許輸入包含空格的完整句子, 無需使用引號包覆.

---

## 外部連結 (References)

* [Minecraft Wiki - /ban](https://minecraft.fandom.com/zh/wiki/Talk:%E5%91%BD%E4%BB%A4/ban?variant=zh-tw)
* [目標選擇器 (Target Selectors)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/TargetSelectors.md)