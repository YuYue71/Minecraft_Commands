# `/placefeature`（地形特徵放置）

* > 在指定位置生成世界生成特徵（Feature）
* > 用於測試或強制放置樹木、礦物、裝飾結構等生成物

## 語法結構 (Syntax)

```commands id="placefeature"
/placefeature <特徵名稱> <座標>
```

## 參數與引數拆解 (Arguments)

| 參數名稱     | 功能與語義說明  |
| -------- | -------- |
| `<特徵名稱>` | 要生成的世界特徵 |
| `<座標>`   | 放置位置     |

---

## 參數枚舉列表 (Parameter Enumeration)

### 特徵名稱

| 參數                       | 說明     |
| ------------------------ | ------ |
| `minecraft:oak`          | 橡木樹    |
| `minecraft:birch`        | 樺木樹    |
| `minecraft:spruce`       | 雲杉樹    |
| `minecraft:pine`         | 松樹類生成  |
| `minecraft:acacia`       | 金合歡樹   |
| `minecraft:jungle_tree`  | 叢林樹    |
| `minecraft:azalea_tree`  | 杜鵑樹    |
| `minecraft:flower_plain` | 花草地生成  |
| `minecraft:ore_dirt`     | 泥土礦物分布 |
| `minecraft:ore_gravel`   | 礫石礦物分布 |
| `minecraft:ore_clay`     | 黏土礦物分布 |
| `minecraft:ore_coal`     | 煤礦生成   |
| `minecraft:ore_iron`     | 鐵礦生成   |
| `minecraft:ore_gold`     | 金礦生成   |
| `minecraft:ore_redstone` | 紅石礦生成  |
| `minecraft:ore_diamond`  | 鑽石礦生成  |
| `minecraft:ore_lapis`    | 青金石礦生成 |
| `minecraft:ore_copper`   | 銅礦生成   |

---

## 數值規則

### 座標

| 參數     | 說明                                  |
| ------ | ----------------------------------- |
| `<數值>` | 最小值 -30000000 最大值 30000000 是否支援負數 是 |

---

## 跨元素語法關聯表 (Links Matrix)

| 關聯參數欄位 | 參引語法元件名稱                                                                                                            |
| ------ | ------------------------------------------------------------------------------------------------------------------- |
| `<座標>` | [空間座標系統全指南（Coordinates）](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/coordinates.md) |
