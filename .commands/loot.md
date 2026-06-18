# `/loot`（戰利品生成）

* > 從戰利品表生成物品並放入目標容器或掉落
* > 可用於模擬方塊掉落、實體掉落或函數戰利品

## 語法結構 (Syntax)

```commands id="loot"
/loot give <目標> <來源類型>
/loot insert <座標> <來源類型>
/loot spawn <座標> <來源類型>
/loot replace block <座標> <容器槽位> <來源類型>
/loot replace entity <目標> <物品欄位> <來源類型>
```

## 參數與引數拆解 (Arguments)

| 參數名稱     | 功能與語義說明   |
| -------- | --------- |
| `<動作>`   | 指定戰利品輸出方式 |
| `<目標>`   | 接收物品的實體   |
| `<座標>`   | 方塊位置或生成位置 |
| `<容器槽位>` | 方塊容器物品槽位  |
| `<物品欄位>` | 實體裝備或背包欄位 |
| `<來源類型>` | 戰利品來源設定   |

---

## 參數枚舉列表 (Parameter Enumeration)

### 動作

| 參數               | 說明       |
| ---------------- | -------- |
| `give`           | 直接給予玩家物品 |
| `insert`         | 插入容器     |
| `spawn`          | 在地面生成掉落物 |
| `replace block`  | 替換方塊容器內容 |
| `replace entity` | 替換實體物品欄位 |

---

### 來源類型

| 參數             | 說明            |
| -------------- | ------------- |
| `fish <戰利品表>`  | 釣魚戰利品         |
| `loot <戰利品表>`  | 一般戰利品表        |
| `kill <目標>`    | 殺死實體掉落        |
| `mine <方塊>`    | 挖掘方塊掉落        |
| `vault <戰利品表>` | 儲物箱戰利品（1.20+） |

---

### 物品欄位（entity）

| 參數                 | 說明  |
| ------------------ | --- |
| `armor.head`       | 頭盔  |
| `armor.chest`      | 胸甲  |
| `armor.legs`       | 護腿  |
| `armor.feet`       | 靴子  |
| `weapon.mainhand`  | 主手  |
| `weapon.offhand`   | 副手  |
| `hotbar.<0-8>`     | 快捷欄 |
| `inventory.<0-35>` | 背包  |

---

## 跨元素語法關聯表 (Links Matrix)

| 關聯參數欄位    | 參引語法元件名稱                                                                                                                     |
| --------- | ---------------------------------------------------------------------------------------------------------------------------- |
| `<目標>`    | [目標選擇器 (Target Selectors)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/target_selectors.md)   |
| `<座標>`    | [空間座標系統全指南（Coordinates）](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/coordinates.md)          |
| `<物品NBT>` | [物品NBT（Item NBT Structure）](https://github.com/YuYue71/Minecraft_Commands/blob/main/.data_structures/nbt_legacy/item_nbt.md) |
