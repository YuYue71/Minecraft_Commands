# /deop

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
/deop <targets>
```

* `<>` = 必填

| 參數 / 欄位 | 類型 | 預設 | 說明 |
| --- | --- | --- | --- |
| `<targets>` | `string/entity` | - | 欲撤銷伺服器管理員 (OP) 權限的玩家名稱或目標 |

---

## 參數說明 (Parameters)

### `targets`

> 移除指定玩家的管理員特權.

* 一旦執行此指令, 目標玩家的權限等級將立即降至伺服器預設值 (通常為等級 0), 且會失去使用高權限指令 (如 `/gamemode`, `/ban`, `/stop` 等) 以及繞過伺服器保護區塊的權力.
* 支援使用目標選擇器 (如 `@p`, `@r`), 但解析後的目標實體必須是玩家.
* 若指定的玩家當前不在線上, 只要輸入其精確的遊戲 ID, 依然可以成功撤銷其管理員權限.

---

## 外部連結 (References)

* [Minecraft Wiki - /deop](https://zh.minecraft.wiki/w/%E5%91%BD%E4%BB%A4/deop?variant=zh-tw)
* [目標選擇器 (Target Selectors)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/TargetSelectors.md)