# /effect

> **分類:** `指令` | **權限等級:** `2` | **適用版本:** `JE ≤ 1.20.4` | **命令方塊:** `true`

---

## 目錄

* [語法](#語法-syntax)
* [參數說明](#參數說明-parameters)
* [動作類型 (clear, give)](#動作類型-clear-give)
    * [targets](#targets)
    * [effect](#effect)
    * [duration](#duration)
    * [amplifier](#amplifier)
    * [hideParticles](#hideparticles)
* [外部連結](#外部連結-references)

---

## 語法 (Syntax)

```commands
/effect clear <targets> [effect]
/effect give <targets> <effect> [duration] [amplifier] [hideParticles]

```

* `<>` = 必填, `[]` = 選填

| 參數 / 欄位 | 類型 | 預設 | 說明 |
| --- | --- | --- | --- |
| `clear` / `give` | `enum` | - | 決定要清除還是給予狀態效果 |
| `<targets>` | `entity` | - | 欲改變狀態效果的目標實體 |
| `[effect]` / `<effect>` | `string` | 所有效果 | 欲操作的狀態效果 ID |
| `[duration]` | `int|string` | `30` | 效果持續的時間 |
| `[amplifier]` | `int` | `0` | 效果的等級倍率 |
| `[hideParticles]` | `boolean` | `false` | 是否隱藏效果產生的粒子與右上角圖示 |

---

## 參數說明 (Parameters)

### `動作類型 (clear, give)`

> 決定此指令對實體身上的狀態效果執行何種操作.

| 值 | 說明 |
| --- | --- |
| `clear` | 清除目標身上的狀態效果. |
| `give` | 賦予目標特定的狀態效果. 若目標身上已擁有同種類且等級相同或更低的效果, 則會被新的持續時間覆蓋. |

---

### `targets`

> 決定要影響哪些實體.

* 支援所有活動實體 (包含玩家, 怪物, 動物等), 無法應用於非生物實體 (如船, 礦車).
* 支援使用目標選擇器 (如 `@p`, `@e`). 若同時選中多個實體, 將會一併給予或清除它們的效果.

---

### `effect`

> 指定要操作的狀態效果種類.

* 必須輸入標準的狀態效果資源位置 (如 `minecraft:speed`, `minecraft:poison`).
* 在 `clear` 模式下, 此參數為選填. 若不填寫, 將會一併清除該目標身上「所有」的狀態效果 (等同於喝下牛奶).

---

### `duration`

> 設定效果維持的時間長度.

* 預設單位為秒 (Seconds). 允許輸入大於 `0` 的有效整數.
* 若未填寫此參數, 系統預設會給予 `30` 秒的效果.
* 支援輸入特殊字串 `infinite`, 將會賦予目標無限時間 (實際上為極長時間) 的狀態效果. 此效果在玩家死亡前不會因時間流逝而消失.
* 亦支援全域時間單位的後綴符號 (如 `s`, `t`, `d`). 詳見外部連結規範.

---

### `amplifier`

> 設定狀態效果的強度等級.

* 必須輸入介於 `0` 到 `255` 之間的整數.
* 注意: 遊戲內的實際效果等級等於此數值 `+ 1`. 例如輸入 `0` 會獲得等級 I 的效果, 輸入 `1` 會獲得等級 II, 輸入 `255` 會獲得等級 CCLVI.
* 若未填寫此參數, 預設數值為 `0` (即等級 I).

---

### `hideParticles`

> 決定是否隱藏該狀態效果所產生的視覺特效.

| 值 | 說明 |
| --- | --- |
| `false` | (預設值) 實體周圍會不斷冒出藥水粒子, 且玩家的畫面右上角及背包介面會顯示該效果的圖示. |
| `true` | 強制隱藏實體周圍的藥水粒子, 同時也會隱藏玩家畫面右上角的狀態圖示 (但背包介面內依然可見). 常用於隱形效果或自訂地圖中避免粒子遮擋視線. |

---

## 外部連結 (References)

* [Minecraft Wiki - /effect](https://zh.minecraft.wiki/w/%E5%91%BD%E4%BB%A4/effect)
* [目標選擇器 (Target Selectors)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/TargetSelectors.md)
* [資源位置與命名空間規範 (Resource Locations)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/ResourceLocations.md)
* [狀態效果 ID (Status Effects)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/StatusEffects.md)
* [時間與時間單位 (Time & Duration Formats)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/TimeFormats.md)