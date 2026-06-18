# `/locate`（結構定位）

* > 搜尋並回傳最近的指定結構或生物群系位置
* > 用於快速定位世界生成內容

## 語法結構 (Syntax)

```commands id="locate"
/locate structure <結構名稱>
/locate biome <生物群系ID>
```

## 參數與引數拆解 (Arguments)

| 參數名稱       | 功能與語義說明         |
| ---------- | --------------- |
| `<類型>`     | 指定搜尋類型（結構或生物群系） |
| `<結構名稱>`   | 要搜尋的結構          |
| `<生物群系ID>` | 要搜尋的生物群系        |

---

## 參數枚舉列表 (Parameter Enumeration)

### 類型

| 參數          | 說明     |
| ----------- | ------ |
| `structure` | 搜尋結構   |
| `biome`     | 搜尋生物群系 |

---

### 結構名稱

| 參數                           | 說明     |
| ---------------------------- | ------ |
| `minecraft:village_plains`   | 平原村莊   |
| `minecraft:village_desert`   | 沙漠村莊   |
| `minecraft:village_savanna`  | 熱帶草原村莊 |
| `minecraft:village_snowy`    | 雪地村莊   |
| `minecraft:village_taiga`    | 針葉林村莊  |
| `minecraft:stronghold`       | 要塞     |
| `minecraft:stronghold`       | 地牢     |
| `minecraft:mineshaft`        | 廢棄礦坑   |
| `minecraft:desert_pyramid`   | 沙漠神殿   |
| `minecraft:jungle_pyramid`   | 叢林神殿   |
| `minecraft:igloo`            | 雪屋     |
| `minecraft:shipwreck`        | 沉船     |
| `minecraft:ocean_ruin`       | 海底遺跡   |
| `minecraft:ruined_portal`    | 破碎傳送門  |
| `minecraft:end_city`         | 終界城    |
| `minecraft:fortress`         | 地獄堡壘   |
| `minecraft:bastion_remnant`  | 遠古遺跡堡壘 |
| `minecraft:woodland_mansion` | 林地府邸   |
| `minecraft:ancient_city`     | 古城     |

---

### 生物群系ID

| 參數                       | 說明   |
| ------------------------ | ---- |
| `minecraft:plains`       | 平原   |
| `minecraft:forest`       | 森林   |
| `minecraft:desert`       | 沙漠   |
| `minecraft:taiga`        | 針葉林  |
| `minecraft:jungle`       | 叢林   |
| `minecraft:savanna`      | 熱帶草原 |
| `minecraft:swamp`        | 沼澤   |
| `minecraft:ocean`        | 海洋   |
| `minecraft:deep_ocean`   | 深海   |
| `minecraft:badlands`     | 惡地   |
| `minecraft:mountains`    | 山地   |
| `minecraft:snowy_plains` | 雪原   |

---

## 跨元素語法關聯表 (Links Matrix)

| 關聯參數欄位 | 參引語法元件名稱                                                                                                            |
| ------ | ------------------------------------------------------------------------------------------------------------------- |
| `<座標>` | [空間座標系統全指南（Coordinates）](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/coordinates.md) |
