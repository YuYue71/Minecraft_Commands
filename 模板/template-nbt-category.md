# [大類名稱] NBT

> **分類:** `NBT`　｜　**適用版本:** `JE 1.XX+`

---

## 目錄

- [概覽](#overview)
- [通用欄位](#common-fields)
- [子類A 專屬欄位](#category-a)
  - [複合結構：欄位名稱](#category-a-compound)
- [子類B 專屬欄位](#category-b)
- [條件依賴](#conditional-fields)
- [注意事項](#notes)
- [外部連結](#references)

---

## 概覽 (Overview) {#overview}

一句話說明此大類 NBT 的適用對象與使用場景。

---

## 通用欄位（所有 [大類] 共用） {#common-fields}

| Tag | 類型 | 預設 | 說明 |
|-----|------|:----:|------|
| `欄位名稱` | `float` | — | 說明 |
| `欄位名稱` | `byte` | `0b` | 說明，`1b` = 啟用 |
| `欄位名稱` | `string` | — | 說明 `[1.XX+]` |

---

## [子類A] 專屬欄位 {#category-a}

> 適用對象說明（如：所有生物 Mob、容器類方塊實體）

| Tag | 類型 | 預設 | 說明 |
|-----|------|:----:|------|
| `欄位名稱` | `string` | — | 說明，枚舉值見下方 |
| `欄位名稱` | `compound[]` | — | 說明，結構見下方 |
| `欄位名稱` | `byte` | `0b` | 說明，`1b` = 啟用 |

#### `欄位名稱`（string）枚舉值

| 值 | 分類 | 說明 |
|----|------|------|
| `minecraft:值A` | 分類X | 說明 |
| `minecraft:值B` | 分類X | 說明 |
| `minecraft:值C` | 分類Y | 說明 `[1.XX+]` |

### 複合結構：`欄位名稱[]` {#category-a-compound}

```snbt
欄位名稱: [
    {
        SubTagA: "minecraft:值",
        SubTagB: 0b,
        SubTagC: 200
    }
]
```

| 子 Tag | 類型 | 必填 | 預設 | 說明 |
|--------|------|:----:|:----:|------|
| `SubTagA` | `string` | ✓ | — | 說明，枚舉值見下方 |
| `SubTagB` | `byte` | | `0b` | 說明，`1b` = 啟用 |
| `SubTagC` | `int` | | — | 說明 |

#### `SubTagA` 枚舉值

| 值 | 分類 | 說明 |
|----|------|------|
| `minecraft:值A` | 分類X | 說明 |
| `minecraft:值B` | 分類X | 說明 |
| `minecraft:值C` | 分類Y | 說明 `[1.XX+]` |

---

## [子類B] 專屬欄位 {#category-b}

> 適用對象說明

| Tag | 類型 | 預設 | 說明 |
|-----|------|:----:|------|
| `欄位名稱` | `類型` | — | 說明 |

---

## 條件依賴 (Conditional Fields) {#conditional-fields}

> 無欄位相依或互斥關係時，此區塊整段刪除

| 條件 | 生效欄位 | 失效 / 忽略欄位 |
|------|---------|---------------|
| 條件說明 | `欄位` | — |

---

## 注意事項 (Notes) {#notes}

- 條列，一點一事，不廢話
- `[1.XX+]` 版本後行為變更說明

---

## 外部連結 (References) {#references}

- [Minecraft Wiki - [大類名稱]](#)

---

*最後更新：YYYY-MM-DD*
