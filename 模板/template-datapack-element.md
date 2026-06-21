# 元素名稱 (`element_folder/`)

> **分類:** `資料包`　｜　**適用版本:** `JE 1.XX+`
> **路徑:** `data/<namespace>/element_folder/<名稱>.json`　｜　**引用格式:** `namespace:名稱`

---

## 目錄

- [概覽](#overview)
- [JSON 結構](#json-structure)
- [欄位說明](#fields)
  - [根層欄位](#root-fields)
  - [子欄位：欄位B](#fields-b)
- [枚舉值速查](#enums)
  - [欄位A 可填值](#enum-a)
  - [欄位B.子欄位 可填值](#enum-b-sub)
- [條件依賴](#conditional-fields)
- [注意事項](#notes)
- [外部連結](#references)

---

## 概覽 (Overview) {#overview}

一句話說明此元素的功能與使用場景。

---

## JSON 結構 {#json-structure}

```json
{
    "欄位A": "minecraft:值",
    "欄位B": {
        "子欄位": "值"
    },
    "選填欄位C": false
}
```

---

## 欄位說明 (Fields) {#fields}

### 根層欄位 {#root-fields}

| 欄位 | 類型 | 必填 | 預設 | 說明 |
|------|------|:----:|:----:|------|
| `欄位A` | `string` | ✓ | — | 說明此欄位的用途 |
| `欄位B` | `object` | ✓ | — | 說明此欄位的用途，子欄位見下方 |
| `選填欄位C` | `boolean` | | `false` | 說明此欄位的用途 |

### 子欄位：`欄位B` {#fields-b}

| 欄位 | 類型 | 必填 | 預設 | 說明 |
|------|------|:----:|:----:|------|
| `子欄位` | `string` | ✓ | — | 說明 |

---

## 枚舉值速查 {#enums}

### `欄位A` 可填值 {#enum-a}

| 值 | 分類 | 說明 |
|----|------|------|
| `minecraft:值A` | 分類X | 說明 |
| `minecraft:值B` | 分類X | 說明 |
| `minecraft:值C` | 分類Y | 說明 `[1.XX+]` |

### `欄位B.子欄位` 可填值 {#enum-b-sub}

| 值 | 分類 | 說明 |
|----|------|------|
| `值A` | 分類X | 說明 |
| `值B` | 分類Y | 說明 |

---

## 條件依賴 (Conditional Fields) {#conditional-fields}

> 無欄位相依或互斥關係時，此區塊整段刪除

| 條件 | 生效欄位 | 失效 / 忽略欄位 |
|------|---------|---------------|
| `欄位A` = `"值A"` 時 | `欄位B` 必填 | `選填欄位C` 被忽略 |
| `欄位A` = `"值B"` 時 | `選填欄位C` 有效 | `欄位B` 可省略 |

---

## 注意事項 (Notes) {#notes}

- 條列，一點一事，不廢話
- `[1.XX+]` 版本後行為變更說明

---

## 外部連結 (References) {#references}

- [Minecraft Wiki - 元素名稱](#)

---

*最後更新：YYYY-MM-DD*
