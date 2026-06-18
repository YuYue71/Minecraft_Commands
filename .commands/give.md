# `/give`（物品給予指令）

* > 用於將物品直接給予玩家
* > 可指定物品種類, 數量與NBT資料
* > 常用於測試與創造模式管理

---

## 語法結構 (Syntax)

```commands id="give0"
/give <目標> <物品> <數量> <nbt>
```

---

## 參數與引數拆解 (Arguments)

> 詳細解構語法中出現的每一個變數之填寫規範與底層資料型態

| 參數名稱           | 功能與語義說明    |
| -------------- | ---------- |
| `[必填]` `<目標>`  | 指定要接收物品的玩家 |
| `[必填]` `<物品>`  | 指定物品ID     |
| `[選填]` `<數量>`  | 指定物品數量     |
| `[選填]` `<nbt>` | 指定物品NBT資料  |

---

## 參數枚舉列表 (Parameter Enumeration)

### 物品

| 參數               | 說明                |
| ---------------- | ----------------- |
| `minecraft:item` | 任意 Minecraft 物品ID |

---

### 數量

| 參數     | 說明                         |
| ------ | -------------------------- |
| `<數值>` | 最小值：0 / 最大值：2147483647 / 支援負數：否 | 

---

### NBT（自訂資料）

| 參數      | 說明                |
| ------- | ----------------- |
| `<nbt>` | 物品NBT資料（自訂物品資料結構） |

---

## 跨元素語法關聯表 (Links Matrix)

| 關聯參數欄位  |                                                                                                                            |
| ------- | -------------------------------------------------------------------------------------------------------------------------- |
| `<目標>`  | [目標選擇器 (Target Selectors)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/target_selectors.md) |
| `<nbt>` | [物品NBT（Item NBT Structure）](https://github.com/YuYue71/Minecraft_Commands/blob/main/.data_structures/nbt_legacy/item_nbt.md)          |
