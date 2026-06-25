# pack.mcmeta (資料包元數據)

> **分類:** `系統檔案` | **檔案格式:** `json` | **適用版本:** `JE ≤ 1.20.4` | **熱重載:** `/reload`

---

## 目錄

* [1. 目錄路徑 (Directory & Path)](#1-目錄路徑-directory--path)
* [2. 核心結構範本 (Core Structure Skeleton)](#2-核心結構範本-core-structure-skeleton)
* [3. 根節點屬性表 (Root Properties)](#3-根節點屬性表-root-properties)
* [4. 子對象詳解 (Sub-object Details)](#4-子對象詳解-sub-object-details)
    * [4.1 pack 屬性細節](#41-pack-屬性細節)
    * [4.2 filter 屬性細節](#42-filter-屬性細節)
* [5. 參數枚舉與可用值全清單 (Value Enumerations)](#5-參數枚舉與可用值全清單-value-enumerations)
    * [5.1 檔案版本號 (pack_format)](#51-檔案版本號-pack_format)
* [6. 數據約束與邊界條件 (Data Constraints)](#6-數據約束與邊界條件-data-constraints)
* [7. 外部連結 (References)](#7-外部連結-references)

---

## 1. 目錄路徑 (Directory & Path)

> 定義資料包的基礎資訊與版本標識, 必須存放於資料包的最頂層根目錄.

```file
[資料包根目錄]/pack.mcmeta
```

* 說明: 若缺少此檔案, 遊戲將無法識別該資料夾或壓縮檔為有效的資料包 (Datapack).

---

## 2. 核心結構範本 (Core Structure Skeleton)

> 包含基礎宣告與選填的命名空間過濾器.

```json
{
  "pack": {
    "description": "這是資料包的說明文字",
    "pack_format": 26
  },
  "filter": {
    "block": [
      {
        "namespace": "minecraft",
        "path": "recipes/.*"
      }
    ]
  }
}
```

---

## 3. 根節點屬性表 (Root Properties)

> 檔案第一層級的鍵值定義.

| 鍵值 (Key) | 類型 | 必填 | 簡述 | 說明、預設值與可用值索引 |
| --- | --- | --- | --- | --- |
| `"pack"` | `object` | 是 | 核心資訊 | 定義資料包的版本與描述內容. 連結至 [4.1](#41-pack-屬性細節). |
| `"filter"` | `object` | 否 | 內容過濾 | 用於隱藏或移除其他資料包中的指定內容. 連結至 [4.2](#42-filter-屬性細節). |

---

## 4. 子對象詳解 (Sub-object Details)

### 4.1 pack 屬性細節

> 決定資料包在遊戲清單中的顯示狀態 (Misode: Pack).

| 子鍵值 (Sub-key) | 類型 | 必填 | 簡述 | 說明 |
| --- | --- | --- | --- | --- |
| `"description"` | `JSON` | 是 | 描述文字 | 顯示於遊戲內資料包清單的說明. 支援 [JSON 文本元件](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/json_text.md). |
| `"pack_format"` | `int` | 是 | 格式版本 | 標識資料包對應的遊戲版本號. 可用值詳見 [5.1](#51-檔案版本號-pack_format). |

### 4.2 filter 屬性細節

> 透過正則表達式篩選並封鎖特定的資源路徑 (Misode: Filter).

| 子鍵值 (Sub-key) | 類型 | 必填 | 簡述 | 說明 |
| --- | --- | --- | --- | --- |
| `"block"` | `array` | 是 | 封鎖清單 | 包含多個過濾規則物件. 每個物件需含 `namespace` 與 `path`. |
| `"namespace"` | `string` | 是 | 命名空間 | 要過濾的命名空間 (支援正則表達式). |
| `"path"` | `string` | 是 | 資源路徑 | 要過濾的檔案路徑 (支援正則表達式, 如 `recipes/.*`). |

---

## 5. 參數枚舉與可用值全清單 (Value Enumerations)

### 5.1 檔案版本號 (pack_format)

> 不同的遊戲版本對應不同的 `pack_format` 數值, 填錯會導致資料包被標註為「不相容」.

| 參數值 (Value) | 適用遊戲版本 | 說明 |
| --- | --- | --- |
| `4` | 1.13 - 1.14.4 | 初始扁平化版本. |
| `5` | 1.15 - 1.16.1 |  |
| `6` | 1.16.2 - 1.16.5 | 引入世界生成配置. |
| `7` | 1.17 - 1.17.1 |  |
| `8` | 1.18 - 1.18.1 |  |
| `9` | 1.18.2 |  |
| `10` | 1.19 - 1.19.2 |  |
| `12` | 1.19.3 |  |
| `15` | 1.19.4 - 1.20.1 | 包含 1.20 初始版本. |
| `18` | 1.20.2 | 引進巨集與新的指令行為. |
| `26` | 1.20.3 - 1.20.4 | 當前 (JE 1.20.4) 穩定版本號. |

---

## 6. 數據約束與邊界條件 (Data Constraints)

* **檔案編碼**: 必須使用 `UTF-8` 編碼, 否則 JSON 中的中文字元可能顯示為亂碼.
* **JSON 語法**: 此檔案不允許有多餘的逗號或非標點符號, 否則整個資料包將無法被遊戲讀取.
* **格式相容性**: 雖然 `pack_format` 不正確仍可強制載入, 但可能導致特定指令或路徑解析失敗.

---

## 7. 外部連結 (References)

* [Minecraft Wiki - pack.mcmeta](https://zh.minecraft.wiki/w/Pack.mcmeta)
* [JSON 文本元件 (Raw JSON Text Components)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/json_text.md)
* [資源位置與命名空間規範 (Resource Locations)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/ResourceLocations.md)
* [相關指令: /reload](https://github.com/YuYue71/Minecraft_Commands/blob/main/.commands/reload.md)