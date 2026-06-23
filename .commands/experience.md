# /experience

> **分類:** `指令` | **權限等級:** `2` | **適用版本:** `JE ≤ 1.20.4` | **命令方塊:** `true`

---

## 目錄

* [語法](#語法-syntax)
* [參數說明](#參數說明-parameters)
    * [動作類型 (add, set, query)](#動作類型-add-set-query)
    * [targets](#targets)
    * [amount](#amount)
    * [單位類型 (levels, points)](#單位類型-levels-points)
* [外部連結](#外部連結-references)

---

## 語法 (Syntax)

```commands
/experience add <targets> <amount> [levels|points]
/experience set <targets> <amount> [levels|points]
/experience query <targets> <levels|points>

```

* `<>` = 必填, `[]` = 選填, `|` = 二擇一
* 提示: 遊戲內支援使用簡寫 `/xp` 來替代 `/experience`.

| 參數 / 欄位 | 類型 | 預設 | 說明 |
| --- | --- | --- | --- |
| `add` / `set` / `query` | `enum` | - | 對經驗值執行的動作類型 |
| `<targets>` | `entity` | - | 欲操作經驗值的目標玩家 |
| `<amount>` | `int` | - | 欲增加或設定的具體數值 |
| `[levels\|points]` / `<levels\|points>` | `enum` | `points` | 操作的經驗值單位 (等級或點數) |

---

## 參數說明 (Parameters)

### `動作類型 (add, set, query)`

> 決定對玩家經驗值進行何種操作.

| 值 | 說明 |
| --- | --- |
| `add` | 增加指定的經驗值. 若配合的 `amount` 為負數, 則為扣除經驗值. |
| `set` | 強制將經驗值固定至指定數值. 若設定的點數超出當前等級所需, 系統會自動進位計算並給予對應的等級. |
| `query` | 查詢目標目前的經驗值數量並輸出於聊天框. 常配合 `execute store` 讀取並儲存至計分板中. |

---

### `targets`

> 受指令影響的目標實體.

* 經驗值系統僅存在於玩家實體身上, 無法對非玩家實體 (如怪物, 盔甲座等) 執行此指令. 若選中非玩家實體, 指令將會無效.
* 支援使用目標選擇器 (如 `@p`, `@a`, `@r`). 若同時選中多名玩家, 將會一併對所有符合條件的玩家進行操作.

---

### `amount`

> 經驗值的具體變動數值.

* 必須為整數.
* 當動作為 `add` 時, 允許輸入負數 (例如 `-10`) 來扣除經驗值或等級. 若玩家的經驗值或等級被扣至 0 以下, 系統會將其維持在最低限度的 0, 不會出現負等級.
* 當動作為 `set` 時, 數值必須大於或等於 `0`. 無法將經驗值設定為負數.

---

### `單位類型 (levels, points)`

> 決定數值 `amount` 的單位是經驗點數還是等級. 若在 `add` 或 `set` 中不填寫此參數, 系統預設以點數處理. 在 `query` 中則為必填.

| 值 | 說明 |
| --- | --- |
| `levels` | 以「經驗等級 (Level)」作為單位. 例如操作數值為 5, 代表 5 個完整的等級. |
| `points` | (預設值) 以「經驗點數 (XP Orbs)」作為單位, 即螢幕下方經驗條所吸收的綠色點數. 注意: 玩家升級所需的點數會隨著當前等級越高而遞增. |

---

## 外部連結 (References)

* [Minecraft Wiki - /experience](https://zh.minecraft.wiki/w/%E5%91%BD%E4%BB%A4/experience)
* [目標選擇器 (Target Selectors)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/TargetSelectors.md)