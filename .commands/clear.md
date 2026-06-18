# `/clear`（清除物品指令）

* > 用於清除玩家背包內物品
* > 可指定物品類型與數量
* > 常用於重置或管理玩家物資

## 語法結構 (Syntax)

```commands id="clear0"
/clear <目標> <物品> <數量>
```

---

## 參數與引數拆解 (Arguments)

> 詳細解構語法中出現的每一個變數之填寫規範與底層資料型態

| 參數名稱          | 功能與語義說明     |
| ------------- | ----------- |
| `[選填]` `<目標>` | 指定要清除物品的玩家  |
| `[選填]` `<物品>` | 指定要清除的物品 ID |
| `[選填]` `<數量>` | 指定清除數量      |

---

## 參數枚舉列表 (Parameter Enumeration)

### 物品

| 參數                 | 說明                 |
| ------------------ | ------------------ |
| `<minecraft:item>` | 指定 Minecraft 物品 ID |

---

### 數量

| 參數     | 說明         |
| ------ | ---------- |
| `<整數>` | 清除指定數量     |
| `0`    | 清除所有符合條件物品 |

---

## 跨元素語法關聯表 (Links Matrix)

| 關聯參數欄位 | 參引語法元件名稱                                                                                                                   |
| ------ | -------------------------------------------------------------------------------------------------------------------------- |
| `<目標>` | [目標選擇器 (Target Selectors)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/target_selectors.md) |
| `<nbt>` | [物品NBT（Item NBT Structure）](https://github.com/YuYue71/Minecraft_Commands/blob/main/.data_structures/nbt_legacy/item_nbt.md)          |
