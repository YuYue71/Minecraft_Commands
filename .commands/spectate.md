# /spectate

> **分類:** `指令` | **權限等級:** `2` | **適用版本:** `JE ≤ 1.20.4` | **命令方塊:** `true`

---

## 目錄

* [語法](#語法-syntax)
* [參數說明](#參數說明-parameters)
    * [target](#target)
    * [player](#player)
* [外部連結](#外部連結-references)

---

## 語法 (Syntax)

```commands
/spectate
/spectate <target>
/spectate <target> <player>

```

* `<>` = 必填. 若不填寫任何參數, 預設為讓執行者解除當前的附身觀察狀態.

| 參數 / 欄位 | 類型 | 預設 | 說明 |
| --- | --- | --- | --- |
| `[target]` / `<target>` | `entity` | - | 欲附身觀察的目標實體 |
| `<player>` | `entity` | 執行者本身 | 被強制進入觀察視角的目標玩家 |

---

## 參數說明 (Parameters)

### `target`

> 指定要進入其視角的目標實體.

* 支援使用目標選擇器 (如 `@e[type=pig,limit=1]`, `@p`). 注意此選擇器只能精確選取「單一實體」, 若選取超過一個實體, 指令將會執行失敗.
* 玩家可以透過此指令附身到任何實體上 (包含其他玩家, 怪物, 甚至是掉落物與盔甲座), 畫面會鎖定為該實體的第一人稱視角, 並跟隨其移動.
* 某些特殊生物 (如苦力怕, 終界使者, 蜘蛛) 擁有獨特的視覺著色器 (Shaders), 附身後畫面會產生對應的特殊視覺濾鏡效果.
* **解除附身**: 若單純執行 `/spectate` 而不加上任何目標參數, 則會讓玩家脫離目前附身的實體, 恢復自由飛行狀態.

---

### `player`

> 決定哪一位玩家要被強制改變視角.

* 此參數僅能對玩家 (Player) 生效, 且該名玩家**必須已經處於旁觀模式 (Spectator)** (`/gamemode spectator`). 若該玩家處於生存或創造模式, 則指令將會無效.
* 若未填寫此參數, 系統預設會將執行指令者本人作為進入觀察視角的對象.
* 同樣只能精確選取「單一玩家」. 無法同時讓多名玩家一起附身到某個實體上 (除非透過迴圈或 `/execute` 指令逐一執行).

---

## 外部連結 (References)

* [Minecraft Wiki - /spectate](https://zh.minecraft.wiki/w/%E5%91%BD%E4%BB%A4/spectate)
* [目標選擇器 (Target Selectors)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/TargetSelectors.md)