# /worldborder

> **分類:** `指令` | **權限等級:** `2` | **適用版本:** `JE ≤ 1.20.4` | **命令方塊:** `true`

---

## 目錄

* [語法](#語法-syntax)
* [參數說明](#參數說明-parameters)
    * [set 與 add](#set-與-add)
    * [center](#center)
    * [damage](#damage)
    * [warning](#warning)
    * [get](#get)
* [外部連結](#外部連結-references)

---

## 語法 (Syntax)

```commands
/worldborder add <distance> [time]
/worldborder set <distance> [time]
/worldborder center <pos>
/worldborder damage amount <damagePerBlock>
/worldborder damage buffer <distance>
/worldborder warning distance <distance>
/worldborder warning time <time>
/worldborder get

```

* `<>` = 必填, `[]` = 選填

| 參數 / 欄位 | 類型 | 預設 | 說明 |
| --- | --- | --- | --- |
| `<distance>` | `float` | - | 世界邊界的直徑長度, 或緩衝/警告距離 (單位: 方塊) |
| `[time]` / `<time>` | `int` | `0` | 邊界縮放的過渡時間, 或警告時間 (單位: 秒) |
| `<pos>` | `vec2` | `0 0` | 邊界中心的 2D 座標 (X 與 Z 軸) |
| `<damagePerBlock>` | `float` | `0.2` | 玩家每越過邊界一格所受到的每秒傷害量 |

---

## 參數說明 (Parameters)

### `set` 與 `add`

> 控制世界邊界的直徑大小 (正方形邊長).

* `set <distance>`: 將世界邊界的總寬度直接設定為指定的方塊數.
* `add <distance>`: 在當前的寬度基礎上增加方塊數 (若為負數則為縮小).
* `[time]`: 指定邊界擴大或縮小到新尺寸所需的漸變時間 (必須為**秒數**, 此處不支援 `t` 或 `d` 等刻度後綴). 在漸變期間, 邊界會以平滑的動畫移動. 若不填寫則瞬間改變.

---

### `center`

> 移動世界邊界的中心點.

* 輸入二維座標 (X 與 Z). 改變中心點會讓整個正方形邊界平移.
* 詳細的座標寫法請參閱座標系統的規範說明.

---

### `damage`

> 設定越界的懲罰傷害機制.

* `damage buffer <distance>`: 設定安全緩衝區的距離 (預設為 `5.0`). 玩家離開邊界後, 在這段距離內仍不會受到傷害, 超過此緩衝區才開始扣血.
* `damage amount <damagePerBlock>`: 設定越過緩衝區後, 玩家每向外遠離一個方塊, 每秒會受到的傷害值倍率 (預設為 `0.2`).

---

### `warning`

> 設定邊界逼近時的螢幕泛紅警告.

* `warning distance <distance>`: 當玩家距離邊界剩下幾個方塊時, 畫面開始閃爍紅色警告 (預設為 `5.0`).
* `warning time <time>`: 當縮小中的邊界預計在幾秒後會觸碰到玩家時, 畫面開始閃爍紅色警告 (預設為 `15`).

---

### `get`

> 查詢並在聊天框輸出當前世界邊界的精確寬度 (直徑).

---

## 外部連結 (References)

* [Minecraft Wiki - /worldborder](https://zh.minecraft.wiki/w/%E5%91%BD%E4%BB%A4/worldborder)
* [時間與時間單位 (Time & Duration Formats)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/TimeFormats.md)
* [座標系統 (Coordinate Systems)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/coordinates.md)