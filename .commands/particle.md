# /particle

> **分類:** `指令` | **權限等級:** `2` | **適用版本:** `JE ≤ 1.20.4` | **命令方塊:** `true`

---

## 目錄

* [語法](#語法-syntax)
* [參數說明](#參數說明-parameters)
    * [name](#name)
    * [pos, delta, speed 與 count](#pos-delta-speed-與-count)
    * [顯示模式 (Display Modes)](#顯示模式-display-modes)
    * [viewers](#viewers)
* [外部連結](#外部連結-references)

---

## 語法 (Syntax)

```commands
/particle <name>
/particle <name> [pos]
/particle <name> [pos] [delta] [speed] [count]
/particle <name> [pos] [delta] [speed] [count] [force|normal]
/particle <name> [pos] [delta] [speed] [count] [force|normal] [viewers]

```

* `<>` = 必填, `[]` = 選填, `|` = 二擇一

| 參數 / 欄位 | 類型 | 預設 | 說明 |
| --- | --- | --- | --- |
| `<name>` | `particle_id` | - | 欲生成的粒子效果 ID (可能包含特殊參數) |
| `[pos]` | `vec3` | 執行者當前位置 | 粒子的生成中心點三維座標 |
| `[delta]` | `vec3` | `0 0 0` | 粒子散佈的區域空間尺寸 (dx dy dz) |
| `[speed]` | `float` | `0` | 粒子的擴散, 移動速度或動態倍率 |
| `[count]` | `int` | `1` | 單次生成的粒子數量 |
| `[force\|normal]` | `enum` | `normal` | 決定粒子的渲染與強制顯示模式 |
| `[viewers]` | `entity` | 所有玩家 | 限定能看見該粒子的目標玩家 |

---

## 參數說明 (Parameters)

### `name`

> 指定欲播放的粒子效果種類.

* 必須輸入標準的粒子資源位置 (如 `minecraft:flame`, `minecraft:heart`).
* 某些特殊的粒子效果 (如 `dust`, `block`, `item`) 需要在 ID 後方接續附加參數來定義其顏色或材質. 若未填寫正確的特殊參數, 指令將會執行失敗.

---

### `pos`, `delta`, `speed` 與 `count`

> 控制粒子生成的空間分佈與物理動態.

* `[pos]`: 粒子群生成的基準中心點. 支援絕對座標與相對座標 (`~`, `^`).
* `[delta]`: 定義一個以 `[pos]` 為中心的三維長方體散佈空間. 輸入的三個數值分別代表在 X, Y, Z 軸向上的延伸範圍.
* `[count]`: 決定要在此範圍內隨機生成的粒子總數.
* **特殊零值效應 (Count = 0):** 若將 `[count]` 設置為 `0`, 系統的運算邏輯會發生改變. 此時 `[delta]` 的三個數值不再代表散佈空間, 而是轉變為粒子的「X Y Z 移動向量 (Motion Vector)」, 且 `[speed]` 會變成該向量的速度倍率. 這是製作具有固定飛行軌跡 (如射出的雷射或噴泉) 的重要技巧.

---

### `顯示模式 (Display Modes)`

> 決定粒子是否會受到玩家客戶端設定與距離的限制.

| 值 | 說明 |
| --- | --- |
| `normal` | (預設值) 遵循玩家客戶端的「粒子效果」顯示設定 (全部/減少/最少). 且只有當玩家距離粒子發生點在 32 格以內時才會看見. |
| `force` | 強制渲染粒子. 無視玩家客戶端的粒子顯示設定, 且可視距離將大幅提升至 512 格外. 常用於重要特效或強調視覺提示. |

---

### `viewers`

> 決定誰能夠在畫面上看見這些粒子.

* 必須為玩家 (Player) 實體, 支援使用目標選擇器 (如 `@p`, `@a[distance=..10]`).
* 若未填寫此參數, 預設情況下所有符合距離與顯示模式條件的玩家皆能看見. 若填寫了特定的目標選擇器, 則只有被選中的玩家才能看見, 其他玩家的畫面上完全不會產生該粒子效果 (適合製作僅限個人可見的導航光點或特效).

---

## 外部連結 (References)

* [Minecraft Wiki - /particle](https://www.google.com/search?q=https://minecraft.wiki/w/Commands/particle)
* [粒子效果 ID (Particle Effects)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/ParticleEffects.md)
* [粒子特殊參數 (Particle Extra Arguments)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/ParticleExtraArguments.md)
* [座標系統 (Coordinate Systems)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/coordinates.md)
* [目標選擇器 (Target Selectors)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/TargetSelectors.md)
* [資源位置與命名空間規範 (Resource Locations)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/ResourceLocations.md)