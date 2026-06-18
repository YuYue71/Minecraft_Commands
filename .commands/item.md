# `/item`（物品管理指令）

* > 用於修改玩家或容器中的物品
* > 支援取得, 替換, 修改物品內容
* > 基於 Minecraft Java 1.20.4 item components 系統

---

## 語法結構 (Syntax)

```commands id="item0"
/item <目標> <子指令> <槽位> <來源>
```

---

## 參數與引數拆解 (Arguments)

| 參數名稱           | 功能與語義說明     |
| -------------- | ----------- |
| `[必填]` `<目標>`  | 指定被操作的實體或容器 |
| `[必填]` `<子指令>` | 指定操作方式      |
| `[選填]` `<槽位>`  | 指定物品槽位      |
| `[選填]` `<來源>`  | 指定物品來源或修改來源 |

---

## 參數枚舉列表 (Parameter Enumeration)

### 子指令

| 參數        | 說明              |
| --------- | --------------- |
| `replace` | 替換指定槽位物品        |
| `copy`    | 複製物品到目標槽位       |
| `modify`  | 修改物品 components |
| `get`     | 取得物品            |

---

### 槽位

| 參數                 | 說明  |
| ------------------ | --- |
| `mainhand`         | 主手  |
| `offhand`          | 副手  |
| `hotbar.<0-8>`     | 快捷欄 |
| `inventory.<0-26>` | 背包  |
| `armor.head`       | 頭盔  |
| `armor.chest`      | 胸甲  |
| `armor.legs`       | 護腿  |
| `armor.feet`       | 鞋子  |

---

### 來源

| 參數             | 說明     |
| -------------- | ------ |
| `<item_stack>` | 直接物品堆  |
| `<block>`      | 方塊容器來源 |
| `<entity>`     | 實體物品來源 |

---

### 數值

| 參數     | 說明                         |
| ------ | -------------------------- |
| `<數值>` | 最小值：1 / 最大值：32767 / 支援負數：否 |

---

## 跨元素語法關聯表 (Links Matrix)

| 關聯參數欄位  |                                                                                                                              |
| ------- | ---------------------------------------------------------------------------------------------------------------------------- |
| `<目標>`  | [目標選擇器 (Target Selectors)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/target_selectors.md)   |
| `<nbt>` | [物品NBT（Item NBT Structure）](https://github.com/YuYue71/Minecraft_Commands/blob/main/.data_structures/nbt_legacy/item_nbt.md) |
