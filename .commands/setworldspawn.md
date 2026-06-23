# /setworldspawn

> **分類:** `指令` | **權限等級:** `2` | **適用版本:** `JE ≤ 1.20.4` | **命令方塊:** `true`

---

## 目錄

* [語法](#語法-syntax)
* [參數說明](#參數說明-parameters)
    * [pos](#pos)
    * [angle](#angle)
* [外部連結](#外部連結-references)

---

## 語法 (Syntax)

```commands
/setworldspawn
/setworldspawn <pos>
/setworldspawn <pos> <angle>
```

* `<>` = 必填, `[]` = 選填
* 若不輸入任何參數, 預設將執行者當前的腳下座標設為新的世界出生點.

| 參數 / 欄位 | 類型 | 預設 | 說明 |
| --- | --- | --- | --- |
| `<pos>` | `vec3` | 執行者當前位置 | 欲設定的世界出生點中心座標 |
| `<angle>` | `float` | `0.0` | 玩家在此點重生時的預設視角朝向角度 |

---

## 參數說明 (Parameters)

### `pos`

> 指定世界初始出生點 (World Spawn Point) 的三個軸向座標.

* 影響所有新加入世界的玩家首入點, 以及未綁定床 (Bed) 或重生錨 (Respawn Anchor) 的玩家死亡後的復活位置.
* 座標引用的詳細規範與相對座標符號 (`~`, `^`) 的使用方式, 請直接參閱全域組件的座標系統文件.

---

### `angle`

> 設定玩家在該重生點復活時的面對角度 (偏航角 Yaw).

* 允許輸入範圍為 `-180.0` 到 `180.0` 之間的浮點數.
* `0.0` 代表正南方向, `90.0` 代表正西方向, `-90.0` 代表正東方向, `180.0` 或 `-180.0` 代表正北方向.
* 設定此參數能確保玩家死亡重生或首次進服時, 視線會固定朝向特定的景觀或導引告示牌, 常用於冒險地圖與伺服器大廳的初始防呆設計.

---

## 外部連結 (References)

* [Minecraft Wiki - /setworldspawn](https://zh.minecraft.wiki/w/%E5%91%BD%E4%BB%A4/setworldspawn)
* [座標系統 (Coordinate Systems)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/coordinates.md)