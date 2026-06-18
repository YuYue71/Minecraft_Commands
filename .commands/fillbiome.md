# `/fillbiome`（生物群系填充）

* > 修改指定區域的生物群系
* > 影響天氣、生成、生態與環境表現

## 語法結構 (Syntax)

```commands id="fillbiome"
/fillbiome <起始座標> <結束座標> <生物群系ID>
```

## 參數與引數拆解 (Arguments)

| 參數名稱       | 功能與語義說明  |
| ---------- | -------- |
| `<起始座標>`   | 區域第一個角落  |
| `<結束座標>`   | 區域第二個角落  |
| `<生物群系ID>` | 要設定的生物群系 |

---

## 參數枚舉列表 (Parameter Enumeration)

### 生物群系ID

| 參數                                  | 說明     |
| ----------------------------------- | ------ |
| `minecraft:plains`                  | 平原     |
| `minecraft:sunflower_plains`        | 向日葵平原  |
| `minecraft:forest`                  | 森林     |
| `minecraft:flower_forest`           | 花林     |
| `minecraft:birch_forest`            | 樺木森林   |
| `minecraft:dark_forest`             | 黑森林    |
| `minecraft:old_growth_birch_forest` | 老樺木森林  |
| `minecraft:old_growth_pine_taiga`   | 老松針林   |
| `minecraft:old_growth_spruce_taiga` | 老雲杉針葉林 |
| `minecraft:taiga`                   | 針葉林    |
| `minecraft:snowy_taiga`             | 雪地針葉林  |
| `minecraft:savanna`                 | 熱帶草原   |
| `minecraft:savanna_plateau`         | 高原熱帶草原 |
| `minecraft:windswept_savanna`       | 風蝕熱帶草原 |
| `minecraft:jungle`                  | 叢林     |
| `minecraft:sparse_jungle`           | 稀疏叢林   |
| `minecraft:bamboo_jungle`           | 竹林     |
| `minecraft:desert`                  | 沙漠     |
| `minecraft:badlands`                | 惡地     |
| `minecraft:wooded_badlands`         | 林地惡地   |
| `minecraft:eroded_badlands`         | 侵蝕惡地   |
| `minecraft:swamp`                   | 沼澤     |
| `minecraft:mangrove_swamp`          | 紅樹林沼澤  |
| `minecraft:beach`                   | 海灘     |
| `minecraft:snowy_beach`             | 雪地海灘   |
| `minecraft:stony_shore`             | 岩石海岸   |
| `minecraft:river`                   | 河流     |
| `minecraft:frozen_river`            | 冰封河流   |
| `minecraft:ocean`                   | 海洋     |
| `minecraft:cold_ocean`              | 冷海洋    |
| `minecraft:frozen_ocean`            | 冰封海洋   |
| `minecraft:lukewarm_ocean`          | 溫暖海洋   |
| `minecraft:warm_ocean`              | 熱帶海洋   |
| `minecraft:deep_ocean`              | 深海     |
| `minecraft:deep_cold_ocean`         | 冷深海    |
| `minecraft:deep_frozen_ocean`       | 冰封深海   |
| `minecraft:deep_lukewarm_ocean`     | 溫暖深海   |
| `minecraft:the_void`                | 虛空     |
| `minecraft:meadow`                  | 草甸     |
| `minecraft:grove`                   | 林地山谷   |
| `minecraft:snowy_slopes`            | 雪坡     |
| `minecraft:frozen_peaks`            | 冰封山峰   |
| `minecraft:jagged_peaks`            | 鋸齒山峰   |
| `minecraft:stony_peaks`             | 石峰     |
| `minecraft:lush_caves`              | 繁茂洞穴   |
| `minecraft:dripstone_caves`         | 滴水石洞穴  |
| `minecraft:deep_dark`               | 深暗之域   |

---

## 數值規則

### 座標

| 參數     | 說明                                  |
| ------ | ----------------------------------- |
| `<數值>` | 最小值 -30000000 最大值 30000000 是否支援負數 是 |

---

## 跨元素語法關聯表 (Links Matrix)

| 關聯參數欄位   | 參引語法元件名稱                                                                                                            |
| -------- | ------------------------------------------------------------------------------------------------------------------- |
| `<起始座標>` | [空間座標系統全指南（Coordinates）](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/coordinates.md) |
| `<結束座標>` | [空間座標系統全指南（Coordinates）](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/coordinates.md) |
