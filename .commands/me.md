# /me

> **分類:** `指令` | **權限等級:** `0` | **適用版本:** `JE ≤ 1.20.4` | **命令方塊:** `true`

---

## 目錄

* [語法](#語法-syntax)
* [參數說明](#參數說明-parameters)
    * [action](#action)
* [外部連結](#外部連結-references)

---

## 語法 (Syntax)

```commands
/me <action>

```

* `<>` = 必填

| 參數 / 欄位 | 類型 | 預設 | 說明 |
| --- | --- | --- | --- |
| `<action>` | `string` | - | 欲發送的動作或狀態描述文字 |

---

## 參數說明 (Parameters)

### `action`

> 指定要在聊天框中廣播的動作或狀態內容.

* 允許直接包含空格, 且不需要使用引號包覆整段文字.
* 執行後, 聊天框中會以獨特的斜體動作格式顯示: `* 執行者名稱 <action>`. 例如玩家 Steve 輸入 `/me 正在砍樹`, 所有玩家的聊天框皆會顯示 `* Steve 正在砍樹`.
* 若由命令方塊執行, 其預設名稱會顯示為 `@`. 玩家可以透過鐵砧重新命名命令方塊, 來改變發送動作時顯示的前綴名稱.
* 支援使用目標選擇器 (如 `@p`, `@a`). 指令執行後, 文字內的選擇器會被自動解析並轉換為對應的玩家或實體名稱顯示於對話中.

---

## 外部連結 (References)

* [Minecraft Wiki - /me](https://zh.minecraft.wiki/w/%E5%91%BD%E4%BB%A4/me)
* [目標選擇器 (Target Selectors)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/TargetSelectors.md)