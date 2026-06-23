# damage_type (傷害類型)

> **分類:** `資料包元素` | **檔案格式:** `json` | **命名空間支援:** `true` | **熱重載:** `/reload`

---

## 目錄

* [目錄路徑](#目錄路徑-directory--path)
* [核心結構](#核心結構-core-structure)
* [節點說明](#節點說明-node-explanations)
    * [message_id (訊息 ID)](#message_id)
    * [scaling (難度縮放)](#scaling-難度縮放)
    * [effects (視覺效果)](#effects-視覺效果)
* [外部連結](#外部連結-references)

---

## 目錄路徑 (Directory & Path)

> 傷害類型定義了傷害的屬性、難度縮放以及死亡訊息的基礎鍵值.

```file
data/<namespace>/damage_type/[子資料夾]/<檔案名稱>.json
```

* `<namespace>` = 命名空間 (如 `minecraft`, `example`)
* `[子資料夾]` = 開發者自訂的分類目錄 (選填)
* `<檔案名稱>` = 決定該傷害類型的 ID 名稱
* 遊戲內調用格式為: `<namespace>:[子資料夾]/<檔案名稱>` (例如 `example:void_burn`)

---

## 核心結構 (Core Structure)

> 每個傷害類型必須定義訊息 ID 與難度縮放邏輯.

```json
{
    "message_id": "custom_damage",
    "exhaustion": 0.1,
    "scaling": "always",
    "effects": "burning",
    "death_message_type": "default"
}
```

| 鍵值 / 節點 (Key) | 類型 | 必填 | 說明 |
| --- | --- | --- | --- |
| `"message_id"` | `string` | 是 | 用於建構死亡訊息的翻譯鍵值 |
| `"exhaustion"` | `float` | 是 | 造成傷害時增加的飢餓消耗值 |
| `"scaling"` | `enum` | 是 | 傷害如何受遊戲難度縮放 |
| `"effects"` | `enum` | 否 | 受到該傷害時產生的視覺/聽覺效果 |
| `"death_message_type"` | `enum` | 否 | 死亡訊息的格式化類型 |

---

## 節點說明 (Node Explanations)

### `message_id`

> 決定玩家死亡時顯示的翻譯字串前綴. 

| 格式範例 | 說明 |
| --- | --- |
| `custom_damage` | 若死因為此類型, 翻譯鍵值將尋找 `death.attack.custom_damage`. |

---

### `scaling` (難度縮放)

> 定義該傷害是否隨難度 (簡單, 普通, 困難) 增減.

| 值 | 說明 |
| --- | --- |
| `never` | 傷害量不隨難度改變. |
| `always` | 傷害量隨難度縮放. |
| `when_caused_by_living_non_player` | 若來源為非玩家的生物則縮放, 否則不縮放. |

---

### `effects` (視覺效果)

> 定義實體受傷時表現出的特效類型.

| 值 | 說明 |
| --- | --- |
| `hurt` | 一般受傷效果 (預設值). |
| `thorns` | 荊棘反傷效果. |
| `drowning` | 溺水效果. |
| `burning` | 著火受傷效果. |
| `poking` | 甜莓莓叢/尖銳物刺傷效果. |
| `freezing` | 凍傷效果. |

---

### `death_message_type`

| 值 | 說明 |
| --- | --- |
| `default` | 一般死亡訊息格式 (預設值). |
| `fall_variants` | 包含掉落高度相關的變體訊息. |
| `intentional_game_design` | 特殊格式 (如床在終界爆炸的訊息). |

---

## 外部連結 (References)

* [Minecraft Wiki - Damage Type](https://zh.minecraft.wiki/w/%E4%BC%A4%E5%AE%B3%E7%B1%BB%E5%9E%8B?variant=zh-tw)
* [Misode Data Pack Generators - Damage Type](https://misode.github.io/damage-type/)
* [資源位置與命名空間規範 (Resource Locations)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/ResourceLocations.md)
* [傷害指令 (damage)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.commands/damage.md)