# dimension (維度)

> **分類:** `資料包元素` | **檔案格式:** `json` | **命名空間支援:** `true` | **熱重載:** `/reload`

---

## 目錄

* [目錄路徑](#目錄路徑-directory--path)
* [核心結構](#核心結構-core-structure)
* [節點說明](#節點說明-node-explanations)
    * [type (維度類型引用)](#type)
    * [generator (生成器設置)](#generator-object)
* [外部連結](#外部連結-references)

---

## 目錄路徑 (Directory & Path)

> 維度檔案定義了世界的生成邏輯與結構, 決定了該維度如何產生地型與生物群系.

```file
data/<namespace>/dimension/[子資料夾]/<檔案名稱>.json
```

* `<namespace>` = 命名空間 (如 `minecraft`, `example`)
* `[子資料夾]` = 開發者自訂的分類目錄 (選填)
* `<檔案名稱>` = 決定該維度的 ID 名稱
* 遊戲內調用格式為: `<namespace>:[子資料夾/]<檔案名稱>` (例如 `example:void_world`)

---

## 核心結構 (Core Structure)

> 每個維度檔案必須指定其維度類型 (dimension_type) 與生成器 (generator).

```json
{
    "type": "minecraft:overworld",
    "generator": {
        "type": "minecraft:noise",
        "settings": "minecraft:overworld",
        "biome_source": {
            "type": "minecraft:multi_noise",
            "preset": "minecraft:overworld"
        }
    }
}
```

| 鍵值 / 節點 (Key) | 類型 | 必填 | 說明 |
| --- | --- | --- | --- |
| `"type"` | `string` | 是 | 引用 `dimension_type` 的資源位置 ID |
| `"generator"` | `object` | 是 | 定義地形生成與生物群系分佈的邏輯 |

---

## 節點說明 (Node Explanations)

### `type`

> 決定維度的物理特性 (如是否有天頂、床是否會爆炸、光照規律).

| 屬性 | 說明 |
| --- | --- |
| `引用 ID` | 必須指向 `data/<namespace>/dimension_type/` 下的 JSON 檔案或原版內建 ID. |

---

### `generator (Object)`

> 設置維度的具體地形演算法.

| 子節點 (Sub-key) | 類型 | 必填 | 說明 |
| --- | --- | --- | --- |
| `"type"` | `string` | 是 | 生成器類型 (通常為 `minecraft:noise`). |
| `"settings"` | `string` | 是 | 噪音設置 ID (如 `minecraft:overworld`, `minecraft:nether`). |
| `"biome_source"` | `object` | 是 | 生物群系來源配置. |

---

### `biome_source (Object)`

> 定義生物群系在該維度中的分佈規律.

| 子節點 (Sub-key) | 類型 | 必填 | 說明 |
| --- | --- | --- | --- |
| `"type"` | `string` | 是 | 分佈類型 (如 `minecraft:multi_noise`, `minecraft:fixed`). |
| `"preset"` | `string` | 否 | 使用原版預設值 (如 `minecraft:overworld`). |
| `"biomes"` | `array` | 否 | 當類型為自訂時, 列出所有包含的生物群系及其參數. |

---

## 外部連結 (References)

* [Minecraft Wiki - Dimension](https://zh.minecraft.wiki/w/%E7%BB%B4%E5%BA%A6%E7%B1%BB%E5%9E%8B?variant=zh-hk#%E5%AE%9A%E4%B9%89%E6%A0%BC%E5%BC%8F)
* [Misode Data Pack Generators - Dimension](https://misode.github.io/dimension/)
* [資源位置與命名空間規範 (Resource Locations)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/ResourceLocations.md)
* [生態域 ID (Biome IDs)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/Biome_IDs.md)
* [維度切換指令 (execute)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.commands/execute.md)
* [傳送指令 (teleport)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.commands/teleport.md)