# `/item`（物品指令）

* > 用於修改或替換容器或實體中的物品

## 語法結構 (Syntax)

```commands
/item replace block <座標> <容器槽位> <物品> [數量]
/item replace entity <目標> <物品欄位> <物品> [數量]
```

## 參數與引數拆解 (Arguments)

| 參數名稱                 | 功能與語義說明  |
| -------------------- | -------- |
| `[必填]` `<替換>`        | 固定子指令    |
| `[必填]` `<方塊容器或實體>`   | 指定作用目標類型 |
| `[必填]` `<座標>`        | 方塊位置     |
| `[必填]` `<目標選擇器>`     | 指定實體     |
| `[必填]` `<容器槽位或裝備欄位>` | 物品放置位置   |
| `[必填]` `<物品ID>`      | 要放入的物品   |
| `[選填]` `<數量>`        | 物品數量     |

## 參數枚舉列表 (Parameter Enumeration)

### 替換類型

| 參數       | 說明     |
| -------- | ------ |
| `block`  | 方塊容器   |
| `entity` | 實體物品欄位 |

### 容器槽位（方塊）

| 參數                 | 說明      |
| ------------------ | ------- |
| `container.<0-53>` | 箱子等容器槽位 |

### 物品欄位（實體）

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

## 跨元素語法關聯表 (Links Matrix)

| 關聯參數欄位    | 參引語法元件名稱                                                                                                                                                                                                                       |
| --------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `<座標位置>`  | [https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/coordinates.md](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/coordinates.md)                                         |
| `<目標選擇器>` | [https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/target_selectors.md](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/target_selectors.md)                               |
| `<物品ID>`  | [https://github.com/YuYue71/Minecraft_Commands/blob/main/.data_structures/nbt_legacy/item_nbt.md](https://github.com/YuYue71/Minecraft_Commands/blob/main/.data_structures/nbt_legacy/item_nbt.md)                             |
| `<文字內容>`  | [https://github.com/YuYue71/Minecraft_Commands/blob/main/.data_structures/nbt_legacy/text_components_legacy.md](https://github.com/YuYue71/Minecraft_Commands/blob/main/.data_structures/nbt_legacy/text_components_legacy.md) |
