# NBT 總覽 (NBT Overview)

> **分類:** `NBT`　｜　**適用版本:** `JE 1.XX+`

---

## 目錄

- [概覽](#)
- [資料類型速查](#)
- [路徑語法](#)
- [大類索引](#)
- [注意事項](#)
- [外部連結](#)
---

## 概覽 (Overview)

NBT（Named Binary Tag）是 Minecraft 儲存實體、方塊、物品狀態的資料格式。指令中以 SNBT（Stringified NBT）文字形式輸入。

---

## 資料類型速查 (Data Types)

| 後綴 | 類型 | 範圍 | 範例 |
|------|------|------|------|
| `b` | Byte | -128 ~ 127 | `1b`、`0b` |
| `s` | Short | -32768 ~ 32767 | `300s` |
| 無後綴 | Integer | -2³¹ ~ 2³¹-1 | `100` |
| `l` | Long | -2⁶³ ~ 2⁶³-1 | `100000l` |
| `f` | Float | 單精度浮點 | `1.5f` |
| `d` | Double | 雙精度浮點 | `1.5d` |
| `"..."` | String | — | `"minecraft:stone"` |
| `{...}` | Compound | — | `{Key:Value}` |
| `[...]` | List | 同類型元素 | `[1b, 2b, 3b]` |
| `[B;...]` | Byte Array | — | `[B;1b,0b,1b]` |
| `[I;...]` | Int Array | — | `[I;1,2,3]` |
| `[L;...]` | Long Array | — | `[L;100l,200l]` |

---

## 路徑語法 (Path Syntax)

> 用於 `data get`、`data modify`、`execute if data`、`store result` 等指令

| 語法 | 說明 | 範例 |
|------|------|------|
| `Key` | 存取 Compound 的欄位 | `Health` |
| `Key.SubKey` | 巢狀存取 | `display.Name` |
| `Key[N]` | 存取 List 第 N 個（0-based）| `ArmorItems[0]` |
| `Key[]` | 對 List 所有元素操作 | `Passengers[]` |
| `Key[{SubKey:Val}]` | 篩選符合條件的元素 | `Inventory[{Slot:0b}]` |

---

## 大類索引

| 大類 | 說明文件 |
|------|---------|
| 實體 NBT | [nbt-entity.md](#) |
| 物品 NBT | [nbt-item.md](#) |
| 方塊實體 NBT | [nbt-block-entity.md](#) |

---

## 注意事項 (Notes)

- List Tag 內所有元素必須為相同類型，混用導致解析錯誤
- `execute if data` 只檢查路徑是否存在，不比較值；比較值需搭配 `store` + `score`
- `[1.20.5+]` 物品 NBT 由 `tag` 遷移至 `components`，兩套格式不相容

---

## 外部連結 (References)

- [Minecraft Wiki - NBT 格式](#)
- [Minecraft Wiki - SNBT 格式](#)

---

*最後更新：YYYY-MM-DD*
