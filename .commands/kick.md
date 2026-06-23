# /kick

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
/kick <targets> [reason]
```

* `<>` = 必填, `[]` = 選填

| 參數 / 欄位 | 類型 | 預設 | 說明 |
| --- | --- | --- | --- |
| `<targets>` | `entity` | - | 欲踢出伺服器的在線玩家 |
| `[reason]` | `string` | `Kicked by an operator.` | 顯示給被踢出玩家的原因與提示訊息 |

---

## 參數說明 (Parameters)

### `targets`

> 將指定的在線玩家強制斷線並踢出伺服器.

* 執行此指令後, 目標玩家會立刻與伺服器中斷連線. 但與 `/ban` 不同, 被踢出的玩家隨時可以再次連線加入伺服器.
* 支援使用目標選擇器 (如 `@p`, `@r`, `@a`), 但解析出來的實體必須是當前正在線上的玩家.
* 若輸入的目標為非玩家實體或是不在線上的玩家, 則指令將會執行失敗.

---

### `reason`

> 顯示給被強制斷線玩家的自訂訊息.

* 當玩家被踢出並回到連線中斷畫面時, 遊戲介面上所顯示的提示文字.
* 允許輸入包含空格的完整句子, 無需使用引號包覆. 若不填寫, 則會顯示系統預設的踢出訊息.

---

## 外部連結 (References)

* [Minecraft Wiki - /kick](https://zh.minecraft.wiki/w/%E5%91%BD%E4%BB%A4/kick?variant=zh-hk)
* [目標選擇器 (Target Selectors)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/TargetSelectors.md)