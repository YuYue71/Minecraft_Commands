# /ride

> **分類:** `指令` | **權限等級:** `2` | **適用版本:** `JE ≤ 1.20.4` | **命令方塊:** `true`

---

## 目錄

* [語法](#語法-syntax)
* [參數說明](#參數說明-parameters)
    * [動作類型 (mount, dismount)](#動作類型-mount-dismount)
    * [target 與 vehicle](#target-與-vehicle)
* [外部連結](#外部連結-references)

---

## 語法 (Syntax)

```commands
/ride <target> mount <vehicle>
/ride <target> dismount

```

* `<>` = 必填

| 參數 / 欄位 | 類型 | 預設 | 說明 |
| --- | --- | --- | --- |
| `<target>` | `entity` | - | 欲作為乘客的目標實體 |
| `mount` / `dismount` | `enum` | - | 決定要進入騎乘狀態或是解除騎乘 |
| `<vehicle>` | `entity` | - | 欲作為載具被騎乘的目標實體 |

---

## 參數說明 (Parameters)

### `動作類型 (mount, dismount)`

> 決定實體是進入還是退出騎乘狀態.

| 值 | 說明 |
| --- | --- |
| `mount` | 讓 `<target>` 成為 `<vehicle>` 的乘客. 若 `<target>` 已經在騎乘其他實體, 會先自動解除目前的騎乘狀態, 再轉移至新的載具上. |
| `dismount` | 讓 `<target>` 強制解除目前的騎乘狀態並脫離載具. 若該實體本來就沒有騎乘任何東西, 則指令不會有任何效果. |

---

### `target` 與 `vehicle`

> 指定作為乘客與載具的具體實體.

* 兩者皆支援使用目標選擇器 (如 `@p`, `@e`).
* 作為乘客的 `<target>` 可以同時選取多個實體. 若選中多個實體, 系統會依序將它們全部堆疊或安排到指定的載具上.
* 作為載具的 `<vehicle>` **必須限制為單一實體** (例如使用 `@e[type=pig,limit=1]`). 若此參數匹配到超過一個實體, 指令將會直接報錯並終止執行.
* 遊戲系統內建防呆機制: 實體無法騎乘自己, 且無法形成無限循環的騎乘鏈 (例如 A 騎 B, B 騎 C, C 騎 A). 若嘗試透過指令構造此類循環, 系統將會自動阻斷該操作.

---

## 外部連結 (References)

* [Minecraft Wiki - /ride](https://zh.minecraft.wiki/w/%E5%91%BD%E4%BB%A4/ride)
* [目標選擇器 (Target Selectors)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/TargetSelectors.md)