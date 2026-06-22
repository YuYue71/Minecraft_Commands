# 特定物品專屬 NBT (Specific Items NBT)

> **分類:** `NBT` | **適用版本:** `JE ≤ 1.20.4`

---

## 目錄

* [SNBT 結構](#snbt-結構-structure)
* [藥水與食物標籤](#藥水與食物標籤-potions--food)
* [書本與文字標籤](#書本與文字標籤-books)
* [煙火與武器標籤](#煙火與武器標籤-fireworks--weapons)
* [裝備與工具標籤](#裝備與工具標籤-equipment--tools)
* [方塊資料包裝標籤](#方塊資料包裝標籤-block-data-wrappers)
* [外部連結](#外部連結-references)

---

## SNBT 結構 (Structure)

```snbt
{
    id: "minecraft:written_book",
    Count: 1b,
    tag: {
        title: "冒險指南",
        author: "Steve",
        generation: 0,
        pages: [
            '{"text":"第一頁內容...","color":"black"}',
            '{"text":"第二頁內容...","color":"black"}'
        ]
    }
}

```

* SNBT 格式, 適用於 `/give`, `/item`, `/clear` 指令.
* 包含在特定物品堆疊的 `tag:{}` 複合結構內.

---

## 藥水與食物標籤 (Potions & Food)

> 適用於藥水, 飛濺藥水, 滯留藥水, 藥水箭與謎之燉肉.

| 標籤 (Tag) | 類型 | 預設 | 說明 |
| --- | --- | --- | --- |
| `Potion` | `string` | - | 原版預設的藥水效果組合資源位置 (如 `"minecraft:long_invisibility"`). 決定基礎效果與藥水顏色 |
| `CustomPotionColor` | `int` | - | 自訂藥水外觀顏色的十進位 RGB 代碼 (會覆寫 `Potion` 產生的顏色) |
| `custom_potion_effects` | `list` | `[]` | 額外附加的狀態效果陣列, 內部為 Compound 結構 (包含 `Id`, `Amplifier`, `Duration` 等, 與實體的 `ActiveEffects` 結構相同) |
| `Effects` | `list` | `[]` | 僅限謎之燉肉: 食用後給予的狀態效果陣列, 內部結構為 `{EffectId: <狀態ID>, EffectDuration: <刻數>}` |

---

## 書本與文字標籤 (Books)

> 適用於書與筆 (writable_book) 與成書 (written_book).

| 標籤 (Tag) | 類型 | 預設 | 說明 |
| --- | --- | --- | --- |
| `pages` | `list` | `[]` | 書本內容的字串陣列. `writable_book` 支援純文字字串; `written_book` 必須為 JSON 文本格式 |
| `title` | `string` | - | 僅限成書: 書本標題名稱 |
| `author` | `string` | - | 僅限成書: 作者名稱 |
| `generation` | `int` | `0` | 僅限成書: 複本世代 (`0`=原作, `1`=原作的複本, `2`=複本的複本, `3`=破爛不堪). 達到 2 時玩家將無法在製圖表中繼續複製 |
| `resolved` | `byte` | `0b` | 僅限成書: 內容中的實體選擇器 (`@p` 等) 或計分板目標是否已被解析轉換為純文字 (`1b`=是) |

---

## 煙火與武器標籤 (Fireworks & Weapons)

> 適用於煙火火箭, 煙火之星, 弩與附魔書.

| 物品類型 | 標籤 (Tag) | 類型 | 說明 |
| --- | --- | --- | --- |
| **煙火火箭** | `Fireworks` | `compound` | 煙火火箭的複合標籤 (包含 `Flight` 與 `Explosions`) |
|  | └ `Flight` | `byte` | 飛行時間(等級), 1 等級約為 0.5 秒 (通常填 `1b` 到 `3b`) |
|  | └ `Explosions` | `list` | 包含多個煙火之星爆炸效果的陣列 (見下方 `Explosion` 結構) |
| **煙火之星** | `Explosion` | `compound` | 單一煙火爆炸效果的複合標籤 |
|  | └ `Type` | `byte` | 爆炸形狀 (`0b`=小球, `1b`=大球, `2b`=星型, `3b`=苦力怕, `4b`=爆裂) |
|  | └ `Flicker` | `byte` | 是否有閃爍效果 (`1b`=是) |
|  | └ `Trail` | `byte` | 是否有軌跡效果 (`1b`=是) |
|  | └ `Colors` | `int_array` | 爆炸初始顏色的十進位 RGB 代碼陣列 |
|  | └ `FadeColors` | `int_array` | 爆炸漸變顏色的十進位 RGB 代碼陣列 |
| **弩** | `Charged` | `byte` | 弩是否已處於上膛狀態 (`1b`=是) |
|  | `ChargedProjectiles` | `list` | 上膛的彈藥物品陣列. 包含 1 到 3 個 (若有多重射擊) 箭矢或煙火的物品 Compound (具備 `id`, `Count`, `tag`) |
| **附魔書** | `StoredEnchantments` | `list` | 儲存於附魔書內的附魔陣列. 結構與通用物品的 `Enchantments` 完全相同 (包含 `id` 與 `lvl`) |

---

## 裝備與工具標籤 (Equipment & Tools)

> 適用於地圖, 羅盤, 玩家頭顱與具備紋飾的盔甲.

| 物品類型 | 標籤 (Tag) | 類型 | 說明 |
| --- | --- | --- | --- |
| **地圖** | `map` | `int` | 綁定的地圖資料 ID (與 `data/maps/map_<id>.dat` 對應) |
|  | `map_color` | `int` | 自訂地圖物品在圖示上的底色十進位 RGB 代碼 |
|  | `Decorations` | `list` | 手動在地圖上添加的標記點 (如探險家地圖的林地府邸圖示), 內部包含 `id`, `type`, `x`, `z`, `rot` |
| **羅盤** | `LodestonePos` | `compound` | 磁石的絕對座標 (包含 `X`, `Y`, `Z` 整數) |
|  | `LodestoneDimension` | `string` | 磁石所在的維度資源位置 (如 `"minecraft:the_nether"`) |
|  | `LodestoneTracked` | `byte` | 是否自動追蹤該磁石的存續狀態 (`1b`=是, 若磁石被破壞羅盤將會亂轉) |
| **玩家頭顱** | `SkullOwner` | `string` 或 `compound` | 定義頭顱的外觀擁有者 (結構與方塊實體的 `SkullOwner` 相同) |
| **防具盔甲** | `Trim` | `compound` | 盔甲紋飾的複合結構 (包含 `material` 礦物材料與 `pattern` 紋飾樣板的資源位置字串) |

---

## 方塊資料包裝標籤 (Block Data Wrappers)

> 用於物品狀態下, 將方塊狀態或方塊實體資料封裝並攜帶, 待放置於世界時自動套用.

| 標籤 (Tag) | 類型 | 預設 | 說明 |
| --- | --- | --- | --- |
| `BlockEntityTag` | `compound` | `{}` | 當方塊被放置時, 系統會將此標籤內的所有資料直接複製到該方塊的方塊實體 (Block Entity) 中. (如攜帶內容物的箱子, 含有指令的指令方塊) |
| `BlockStateTag` | `compound` | `{}` | 當方塊被放置時, 強制套用的方塊狀態 (Block State). 內容為鍵值對 (如 `{facing: "north", half: "top"}`) |

---

## 外部連結 (References)

* [Minecraft Wiki - 物品格式](https://zh.minecraft.wiki/w/%E7%89%A9%E5%93%81%E6%A0%BC%E5%BC%8F?variant=zh-tw)
* [JSON 文本元件 (Raw JSON Text Components)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/json_text.md)
* [資源位置與命名空間規範 (Resource Locations)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/ResourceLocations.md)
* [方塊狀態與標籤 (Block States & Tags)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/BlockStates_or_Tags.md)
* [狀態效果 ID (Status Effects)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/StatusEffects.md)
* [附魔類型 ID (Enchantments)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/Enchantments.md)