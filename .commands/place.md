# `/place`（結構放置）

* > 在世界中生成結構或模板
* > 用於快速放置原版生成內容或結構方塊內容

## 語法結構 (Syntax)

```commands id="place"
/place structure <結構名稱> <座標>
/place jigsaw <起始結構> <目標結構> <深度> <座標>
/place template <模板名稱> <座標> <旋轉> <鏡像>
```

## 參數與引數拆解 (Arguments)

| 參數名稱     | 功能與語義說明     |
| -------- | ----------- |
| `<動作類型>` | 指定放置模式      |
| `<結構名稱>` | 要生成的結構      |
| `<起始結構>` | jigsaw 起始結構 |
| `<目標結構>` | jigsaw 目標結構 |
| `<模板名稱>` | 結構方塊模板      |
| `<深度>`   | jigsaw 延伸深度 |
| `<座標>`   | 放置位置        |
| `<旋轉>`   | 結構旋轉方向      |
| `<鏡像>`   | 結構鏡像方式      |

---

## 參數枚舉列表 (Parameter Enumeration)

### 動作類型

| 參數          | 說明      |
| ----------- | ------- |
| `structure` | 放置完整結構  |
| `jigsaw`    | 拼圖式結構生成 |
| `template`  | 模板放置    |

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
| `minecraft:mineshaft`        | 廢棄礦坑   |
| `minecraft:desert_pyramid`   | 沙漠神殿   |
| `minecraft:jungle_pyramid`   | 叢林神殿   |
| `minecraft:igloo`            | 雪屋     |
| `minecraft:shipwreck`        | 沉船     |
| `minecraft:ocean_ruin`       | 海底遺跡   |
| `minecraft:ruined_portal`    | 破碎傳送門  |
| `minecraft:woodland_mansion` | 林地府邸   |
| `minecraft:ancient_city`     | 古城     |
| `minecraft:end_city`         | 終界城    |
| `minecraft:fortress`         | 地獄堡壘   |
| `minecraft:bastion_remnant`  | 遠古遺跡堡壘 |

---

### 旋轉

| 參數                    | 說明     |
| --------------------- | ------ |
| `none`                | 不旋轉    |
| `clockwise_90`        | 順時針90度 |
| `clockwise_180`       | 180度   |
| `counterclockwise_90` | 逆時針90度 |

---

### 鏡像

| 參數           | 說明   |
| ------------ | ---- |
| `none`       | 無鏡像  |
| `left_right` | 左右鏡像 |
| `front_back` | 前後鏡像 |

---

## 數值規則

### 深度

| 參數     | 說明                    |
| ------ | --------------------- |
| `<數值>` | 最小值 0 最大值 20 是否支援負數 否 |

---

## 跨元素語法關聯表 (Links Matrix)

| 關聯參數欄位 | 參引語法元件名稱                                                                                                            |
| ------ | ------------------------------------------------------------------------------------------------------------------- |
| `<座標>` | [空間座標系統全指南（Coordinates）](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/coordinates.md) |
