# `/advancement`（進度指令）

* > 用於管理玩家進度系統
* > 可授予, 移除或查詢進度
* > 影響遊戲內成就與進度狀態

## 語法結構 (Syntax)

```commands id="advancement0"
/advancement <操作> <目標> <進度模式> <進度>
```

---

## 參數與引數拆解 (Arguments)

> 詳細解構語法中出現的每一個變數之填寫規範與底層資料型態

| 參數名稱            | 功能與語義說明           |
| --------------- | ----------------- |
| `[必填]` `<操作>`   | 指定進度操作類型          |
| `[必填]` `<目標>`   | 指定玩家或目標選擇器        |
| `[選填]` `<進度模式>` | 指定進度作用範圍模式        |
| `[選填]` `<進度>`   | 指定 advancement ID |

---

## 參數枚舉列表 (Parameter Enumeration)

### 操作

| 參數       | 說明       |
| -------- | -------- |
| `grant`  | 授予進度     |
| `revoke` | 移除進度     |
| `test`   | 測試進度是否達成 |
| `list`   | 列出進度     |

---

### 進度模式（Progress Mode）

| 參數           | 說明          |
| ------------ | ----------- |
| `only`       | 僅作用於指定進度    |
| `from`       | 從指定進度開始包含後續 |
| `through`    | 包含整條進度路徑    |
| `until`      | 到指定進度為止     |
| `everything` | 作用於所有進度     |

---

### 進度（全部內建 Advancement）

#### Minecraft 根節點

| 參數                     | 說明    |
| ---------------------- | ----- |
| `minecraft:story/root` | 故事根進度 |

---

#### 故事（Story）

| 參數                                     | 說明     |
| -------------------------------------- | ------ |
| `minecraft:story/mine_stone`           | 採集石頭   |
| `minecraft:story/upgrade_tools`        | 升級工具   |
| `minecraft:story/smelt_iron`           | 冶煉鐵    |
| `minecraft:story/obtain_armor`         | 獲得盔甲   |
| `minecraft:story/lava_bucket`          | 裝取熔岩   |
| `minecraft:story/iron_tools`           | 製作鐵工具  |
| `minecraft:story/deflect_arrow`        | 擋下箭矢   |
| `minecraft:story/form_obsidian`        | 形成黑曜石  |
| `minecraft:story/mine_diamond`         | 挖到鑽石   |
| `minecraft:story/enter_the_nether`     | 進入地獄   |
| `minecraft:story/shiny_gear`           | 鑽石裝備   |
| `minecraft:story/enchant_item`         | 附魔物品   |
| `minecraft:story/cure_zombie_villager` | 治療殭屍村民 |
| `minecraft:story/follow_ender_eye`     | 追隨終界之眼 |
| `minecraft:story/enter_the_end`        | 進入終界   |

---

#### 冒險（Adventure）

| 參數                                          | 說明       |
| ------------------------------------------- | -------- |
| `minecraft:adventure/root`                  | 冒險根進度    |
| `minecraft:adventure/sleep_in_bed`          | 睡覺       |
| `minecraft:adventure/spyglass_at_parrot`    | 用望遠鏡看鸚鵡  |
| `minecraft:adventure/kill_a_mob`            | 擊殺怪物     |
| `minecraft:adventure/trade`                 | 與村民交易    |
| `minecraft:adventure/honey_block_slide`     | 蜂蜜滑行     |
| `minecraft:adventure/ol_betsy`              | 使用弩      |
| `minecraft:adventure/whos_the_pillager_now` | 擊殺掠奪者隊長  |
| `minecraft:adventure/arbalistic`            | 一發擊殺多怪   |
| `minecraft:adventure/adventuring_time`      | 探索所有生物群系 |
| `minecraft:adventure/kill_all_mobs`         | 擊殺所有生物   |

---

#### 下界（Nether）

| 參數                                        | 說明       |
| ----------------------------------------- | -------- |
| `minecraft:nether/root`                   | 地獄根進度    |
| `minecraft:nether/return_to_sender`       | 反彈火球     |
| `minecraft:nether/find_bastion`           | 發現堡壘遺跡   |
| `minecraft:nether/obtain_ancient_debris`  | 獲得遠古遺骸   |
| `minecraft:nether/fast_travel`            | 地獄快速旅行   |
| `minecraft:nether/find_fortress`          | 發現地獄堡壘   |
| `minecraft:nether/obtain_crying_obsidian` | 哭泣黑曜石    |
| `minecraft:nether/distract_piglin`        | 分散豬布林注意  |
| `minecraft:nether/ride_strider`           | 騎炙足獸     |
| `minecraft:nether/uneasy_alliance`        | 帶惡魂回主世界  |
| `minecraft:nether/all_potions`            | 獲得所有藥水效果 |
| `minecraft:nether/all_effects`            | 獲得所有狀態效果 |

---

#### 終界（End）

| 參數                             | 說明    |
| ------------------------------ | ----- |
| `minecraft:end/root`           | 終界根進度 |
| `minecraft:end/kill_dragon`    | 擊敗終界龍 |
| `minecraft:end/dragon_egg`     | 獲得龍蛋  |
| `minecraft:end/elytra`         | 獲得鞘翅  |
| `minecraft:end/respawn_dragon` | 重生終界龍 |
| `minecraft:end/dragon_breath`  | 收集龍息  |
| `minecraft:end/levitate`       | 浮空效果  |

---

#### 農牧（Husbandry）

| 參數                                       | 說明     |
| ---------------------------------------- | ------ |
| `minecraft:husbandry/root`               | 農牧根進度  |
| `minecraft:husbandry/breed_an_animal`    | 繁殖動物   |
| `minecraft:husbandry/tame_an_animal`     | 馴服動物   |
| `minecraft:husbandry/fishy_business`     | 捕魚     |
| `minecraft:husbandry/silk_touch_nest`    | 取得蜂巢   |
| `minecraft:husbandry/plant_seed`         | 種植作物   |
| `minecraft:husbandry/balanced_diet`      | 吃所有食物  |
| `minecraft:husbandry/complete_catalogue` | 完整動物圖鑑 |

---

## 跨元素語法關聯表 (Links Matrix)

| 關聯參數欄位 | 參引語法元件名稱                                                                                                                   |
| ------ | -------------------------------------------------------------------------------------------------------------------------- |
| `<目標>` | [目標選擇器 (Target Selectors)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/target_selectors.md) |
