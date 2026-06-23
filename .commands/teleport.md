# `/teleport`

> **分類:** `指令` | **權限等級:** `2` | **適用版本:** `JE ≤ 1.20.4` | **命令方塊:** `true`

---

## 目錄

* [語法](#語法-syntax)
* [參數說明](#參數說明-parameters)
    * [targets 與 destination](#targets-與-destination)
    * [location 與 rotation](#location-與-rotation)
    * [facing (朝向設定)](#facing-朝向設定)
* [外部連結](#外部連結-references)

---

## 語法 (Syntax)

```commands
/teleport <destination>
/teleport <location>
/teleport <targets> <destination>
/teleport <targets> <location>
/teleport <targets> <location> <rotation>
/teleport <targets> <location> facing <facingLocation>
/teleport <targets> <location> facing entity <facingEntity> [facingAnchor]

```

* `<>` = 必填, `[]` = 選填.
* 此指令的功能與行為與 `/tp` 完全相同, 兩者在遊戲底層互為別名 (Alias).

| 參數 / 欄位 | 類型 | 預設 | 說明 |
| --- | --- | --- | --- |
| `<targets>` | `entity` | 執行者本身 | 欲被傳送的目標實體 |
| `<destination>` | `entity` | - | 傳送的目的地實體 |
| `<location>` | `vec3` | - | 傳送的目的地三維座標 |
| `<rotation>` | `vec2` | 保持原有視角 | 傳送後水平與垂直的視角角度 |
| `facing` | `enum` | - | 啟用朝向特定座標或實體的參數宣告 |
| `<facingLocation>` | `vec3` | - | 傳送後欲強制看向的三維絕對 / 相對座標 |
| `entity` | `enum` | - | 宣告朝向目標為實體 |
| `<facingEntity>` | `entity` | - | 傳送後欲強制看向的目標實體 |
| `[facingAnchor]` | `enum` | `feet` | 強制看向實體的具體部位 (眼睛或腳) |

---

## 參數說明 (Parameters)

### `targets` 與 `destination`

> 指定誰要被傳送, 以及要傳送到哪個實體身邊.

* 兩者皆支援使用目標選擇器 (如 `@p`, `@e`).
* 作為被傳送者的 `<targets>` 可以同時選取多個實體. 系統會將選中的所有實體一併傳送.
* 作為目的地的 `<destination>` **必須限制為單一實體** (例如使用 `@e[type=pig,limit=1]`). 若此參數匹配到超過一個實體, 指令將會直接報錯並終止執行.
* 若未填寫 `<targets>`, 系統預設會將執行指令者本人作為被傳送的對象.

---

### `location` 與 `rotation`

> 指定傳送的精確三維空間座標與視角方向.

* `<location>`: 包含三個軸向 (X, Y, Z) 的座標數值. 支援絕對座標與相對座標 (`~`, `^`).
* `<rotation>`: 包含兩個數值 (水平旋轉角度 Yaw, 垂直俯仰角度 Pitch).
* 水平角度 (Yaw): `0` 為正南, `90` 為正西, `-90` 為正東, `180` / `-180` 為正北.
* 垂直角度 (Pitch): `0` 為平視, `90` 為正下方, `-90` 為正上方.
* 支援相對座標 (`~`), 代表基於實體當前的視角進行相對轉動 (例如 `~ ~180` 代表視角水平向後轉).



---

### `facing (朝向設定)`

> 傳送實體後, 強制改變其視角以精準看向某個座標或實體.

* `facing <facingLocation>`: 傳送落地後, 實體的頭部與視角會自動轉向並精確對準指定的 `X Y Z` 座標點.
* `facing entity <facingEntity> [facingAnchor]`: 傳送落地後, 實體會自動轉頭看向另一個實體. 注意此處的 `<facingEntity>` 同樣必須限制為單一實體.
* `[facingAnchor]`: 當看向實體時, 決定要對齊該目標實體的哪個具體部位:

| 值 | 說明 |
| --- | --- |
| `feet` | (預設值) 看向目標實體的腳部 (即實體的基準座標原點). |
| `eyes` | 看向目標實體的眼睛高度. 常用於讓玩家傳送後能直接與目標對視. |

---

## 外部連結 (References)

* [Minecraft Wiki - /teleport](https://zh.minecraft.wiki/w/%E5%91%BD%E4%BB%A4/teleport)
* [目標選擇器 (Target Selectors)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/TargetSelectors.md)
* [座標系統 (Coordinate Systems)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/coordinates.md)