# `/spawnpoint`

> **分類:** `指令` | **權限等級:** `2` | **適用版本:** `JE ≤ 1.20.4` | **命令方塊:** `true`

---

## 目錄

* [語法](#語法-syntax)
* [參數說明](#參數說明-parameters)
    * [targets](#targets)
    * [pos](#pos)
    * [angle](#angle)
* [外部連結](#外部連結-references)

---

## 語法 (Syntax)

```commands
/spawnpoint
/spawnpoint [targets]
/spawnpoint [targets] [pos]
/spawnpoint [targets] [pos] [angle]

```

* `[]` = 選填. 若不填寫任何參數, 預設將執行者當前的腳下座標與視角設為其專屬的重生點.

| 參數 / 欄位 | 類型 | 預設 | 說明 |
| --- | --- | --- | --- |
| `[targets]` | `entity` | 執行者本身 | 欲設定專屬重生點的目標玩家 |
| `[pos]` | `vec3` | 執行者當前位置 | 欲設定的重生點精確座標 |
| `[angle]` | `float` | 執行者當前視角 | 玩家重生時的面朝角度 (偏航角 Yaw) |

---

## 參數說明 (Parameters)

### `targets`

> 決定要更改誰的個人重生點.

* 此指令僅能對玩家 (Player) 實體生效. 無法為非玩家實體 (如怪物, 盔甲座) 設定重生點.
* 支援使用目標選擇器 (如 `@p`, `@a`, `@r`). 若選中多名玩家, 將會同時更新所有符合條件玩家的重生紀錄.
* 設定後, 當該玩家死亡並點擊重生時, 會優先在以此指令設定的座標復活, 覆蓋掉世界預設出生點 (World Spawn) 或床 (Bed) 的紀錄.

---

### `pos`

> 指定玩家復活時的具體座標位置.

* 包含三個軸向 (X, Y, Z) 的數值.
* 支援絕對座標與相對座標 (`~`, `^`), 寫法請參見全域座標系統規範.
* 若設定的座標在半空中或是危險區域 (如岩漿湖), 玩家重生時可能會立刻受到墜落或燃燒傷害.

---

### `angle`

> 設定玩家在該座標復活時的視線水平朝向.

* 允許輸入範圍為 `-180.0` 到 `180.0` 之間的浮點數.
* `0.0` 代表正南方向, `90.0` 代表正西方向, `-90.0` 代表正東方向, `180.0` 或 `-180.0` 代表正北方向.
* 支援使用相對角度 (如 `~90.0` 代表在玩家原本視角上向右轉 90 度).
* 確保玩家復活時的視線固定朝向特定的建築景觀或遊戲指引方向.

---

## 外部連結 (References)

* [Minecraft Wiki - /spawnpoint](https://zh.minecraft.wiki/w/%E5%91%BD%E4%BB%A4/spawnpoint)
* [目標選擇器 (Target Selectors)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/TargetSelectors.md)
* [座標系統 (Coordinate Systems)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/coordinates.md)