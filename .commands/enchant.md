# `/enchant`（附魔指令）

* > 用於對玩家手持物品施加附魔效果
* > 只能作用於主手物品
* > 可直接指定附魔種類與等級

## 語法結構 (Syntax)

```commands id="enchant0"
/enchant <目標> <附魔> <等級>
```

---

## 參數與引數拆解 (Arguments)

> 詳細解構語法中出現的每一個變數之填寫規範與底層資料型態

| 參數名稱          | 功能與語義說明  |
| ------------- | -------- |
| `[必填]` `<目標>` | 指定要附魔的玩家 |
| `[必填]` `<附魔>` | 指定附魔 ID  |
| `[選填]` `<等級>` | 指定附魔等級   |

---

## 參數枚舉列表 (Parameter Enumeration)

### 附魔（Java Edition 1.20.4 全部可用）

| 參數                                | 說明   |
| --------------------------------- | ---- |
| `minecraft:protection`            | 保護   |
| `minecraft:fire_protection`       | 火焰保護 |
| `minecraft:feather_falling`       | 摔落保護 |
| `minecraft:blast_protection`      | 爆炸保護 |
| `minecraft:projectile_protection` | 射擊保護 |
| `minecraft:respiration`           | 水下呼吸 |
| `minecraft:aqua_affinity`         | 水下挖掘 |
| `minecraft:thorns`                | 荊棘   |
| `minecraft:depth_strider`         | 深海漫遊 |
| `minecraft:frost_walker`          | 冰霜行者 |
| `minecraft:soul_speed`            | 靈魂疾行 |
| `minecraft:swift_sneak`           | 潛行迅捷 |
| `minecraft:sharpness`             | 鋒利   |
| `minecraft:smite`                 | 不死剋星 |
| `minecraft:bane_of_arthropods`    | 戰蟲剋星 |
| `minecraft:knockback`             | 擊退   |
| `minecraft:fire_aspect`           | 火焰附加 |
| `minecraft:looting`               | 掠奪   |
| `minecraft:sweeping_edge`         | 橫掃之刃 |
| `minecraft:efficiency`            | 效率   |
| `minecraft:silk_touch`            | 絲綢之觸 |
| `minecraft:unbreaking`            | 耐久   |
| `minecraft:fortune`               | 幸運   |
| `minecraft:power`                 | 力量   |
| `minecraft:punch`                 | 擊退弓  |
| `minecraft:flame`                 | 火焰弓  |
| `minecraft:infinity`              | 無限   |
| `minecraft:luck_of_the_sea`       | 海之幸運 |
| `minecraft:lure`                  | 魚餌   |
| `minecraft:loyalty`               | 忠誠   |
| `minecraft:impaling`              | 穿刺   |
| `minecraft:riptide`               | 激流   |
| `minecraft:channeling`            | 引雷   |
| `minecraft:multishot`             | 多重射擊 |
| `minecraft:piercing`              | 穿透   |
| `minecraft:quick_charge`          | 快速裝填 |
| `minecraft:mending`               | 修補   |
| `minecraft:vanishing_curse`       | 消失詛咒 |
| `minecraft:binding_curse`         | 綁定詛咒 |

---

### 等級

| 參數     | 說明                         |
| ------ | -------------------------- |
| `<等級>` | 最小值：1 / 最大值：32767 / 支援負數：否 |

---

## 跨元素語法關聯表 (Links Matrix)

| 關聯參數欄位 |                                                                                                                            |
| ------ | -------------------------------------------------------------------------------------------------------------------------- |
| `<目標>` | [目標選擇器 (Target Selectors)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/target_selectors.md) |
