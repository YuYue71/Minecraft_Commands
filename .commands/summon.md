# `/summon`（召喚實體）

* > 在指定位置生成實體

## 語法結構 (Syntax)

```commands id="summon"
/summon <實體ID> <座標> <生物NBT>
```

## 參數與引數拆解 (Arguments)

| 參數名稱      | 功能與語義說明  |
| --------- | -------- |
| `[必填]` `<實體ID>`  | 要生成的實體類型 |
| `[選填]` `<座標>`    | 生成位置     |
| `[選填]` `<生物NBT>` | 實體附加資料   |

---

## 參數枚舉列表 (Parameter Enumeration)

### 實體ID

| 參數                           | 說明    |
| ---------------------------- | ----- |
| `minecraft:allay`            | 悅靈    |
| `minecraft:armadillo`        | 犰狳    |
| `minecraft:axolotl`          | 美西螈   |
| `minecraft:bat`              | 蝙蝠    |
| `minecraft:bee`              | 蜜蜂    |
| `minecraft:blaze`            | 烈焰使者  |
| `minecraft:bogged`           | 沼骸    |
| `minecraft:breeze`           | 旋風人   |
| `minecraft:camel`            | 駱駝    |
| `minecraft:cat`              | 貓     |
| `minecraft:cave_spider`      | 洞穴蜘蛛  |
| `minecraft:chicken`          | 雞     |
| `minecraft:cod`              | 鱈魚    |
| `minecraft:cow`              | 牛     |
| `minecraft:creeper`          | 苦力怕   |
| `minecraft:dolphin`          | 海豚    |
| `minecraft:donkey`           | 驢     |
| `minecraft:drowned`          | 溺屍    |
| `minecraft:elder_guardian`   | 远古守卫者 |
| `minecraft:enderman`         | 終界使者  |
| `minecraft:endermite`        | 終界蟎   |
| `minecraft:evoker`           | 喚魔者   |
| `minecraft:fox`              | 狐狸    |
| `minecraft:frog`             | 青蛙    |
| `minecraft:ghast`            | 地獄幽靈  |
| `minecraft:giant`            | 巨人    |
| `minecraft:glow_squid`       | 發光魷魚  |
| `minecraft:goat`             | 山羊    |
| `minecraft:guardian`         | 守衛者   |
| `minecraft:hoglin`           | 豬布獸   |
| `minecraft:horse`            | 馬     |
| `minecraft:husk`             | 尸殼    |
| `minecraft:illusioner`       | 幻術師   |
| `minecraft:iron_golem`       | 鐵魔像   |
| `minecraft:llama`            | 羊駝    |
| `minecraft:magma_cube`       | 岩漿史萊姆 |
| `minecraft:mooshroom`        | 蘑菇牛   |
| `minecraft:mule`             | 騾     |
| `minecraft:ocelot`           | 豹貓    |
| `minecraft:panda`            | 熊貓    |
| `minecraft:parrot`           | 鸚鵡    |
| `minecraft:phantom`          | 幻翼    |
| `minecraft:pig`              | 豬     |
| `minecraft:piglin`           | 豬布林   |
| `minecraft:piglin_brute`     | 豬布林蠻兵 |
| `minecraft:pillager`         | 掠奪者   |
| `minecraft:polar_bear`       | 北極熊   |
| `minecraft:pufferfish`       | 河豚    |
| `minecraft:rabbit`           | 兔子    |
| `minecraft:ravager`          | 劫掠獸   |
| `minecraft:salmon`           | 鮭魚    |
| `minecraft:sheep`            | 綿羊    |
| `minecraft:shulker`          | 潛影貝   |
| `minecraft:silverfish`       | 蠹蟲    |
| `minecraft:skeleton`         | 骷髏    |
| `minecraft:skeleton_horse`   | 骷髏馬   |
| `minecraft:slime`            | 史萊姆   |
| `minecraft:sniffer`          | 嗅探獸   |
| `minecraft:snow_golem`       | 雪傀儡   |
| `minecraft:spider`           | 蜘蛛    |
| `minecraft:squid`            | 魷魚    |
| `minecraft:stray`            | 流浪者   |
| `minecraft:strider`          | 熾足獸   |
| `minecraft:tadpole`          | 蝌蚪    |
| `minecraft:trader_llama`     | 商人羊駝  |
| `minecraft:tropical_fish`    | 熱帶魚   |
| `minecraft:turtle`           | 海龜    |
| `minecraft:vex`              | 伏守靈   |
| `minecraft:villager`         | 村民    |
| `minecraft:vindicator`       | 衛道士   |
| `minecraft:wandering_trader` | 流浪商人  |
| `minecraft:warden`           | 監守者   |
| `minecraft:witch`            | 女巫    |
| `minecraft:wither`           | 凋零    |
| `minecraft:wither_skeleton`  | 凋零骷髏  |
| `minecraft:wolf`             | 狼     |
| `minecraft:zoglin`           | 豬殭獸   |
| `minecraft:zombie`           | 殭屍    |
| `minecraft:zombie_horse`     | 殭屍馬   |
| `minecraft:zombie_villager`  | 殭屍村民  |
| `minecraft:zombified_piglin` | 殭屍豬布林 |

---

## 跨元素語法關聯表 (Links Matrix)

| 關聯參數欄位    | 參引語法元件名稱                                                                   |
| --------- | -------------------------------------------------------------------------- |
| `<座標>`    | [空間座標系統全指南（Coordinates）](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/coordinates.md)              |
| `<目標>`    | [目標選擇器 (Target Selectors)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/target_selectors.md)       |
| `<生物NBT>` | [生物NBT（Entity NBT Structure）](https://github.com/YuYue71/Minecraft_Commands/blob/main/.data_structures/nbt_legacy/entity_nbt.md) |
