# `/<command>`

> **分類:** `指令` | **權限等級:** `2` | **適用版本:** `JE ≤ 1.20.4` | **命令方塊:** `true`

---

## 目錄

- [語法](#語法-syntax)
- [參數說明](#參數說明-parameters)
  - [參數A](#參數a)
  - [參數B](#參數b)
- [外部連結](#外部連結-references)

- 此處超連結位置保持不需做更改, 只有參數超連結跟標題要跟隨指令做修改(生成內容中刪除這行)

---

## 語法 (Syntax)

```commands
/command <目標選擇器> <參數A> <參數B> [參數C]
/command <目標選擇器> <參數A> <參數D> [最小值..最大值] [true|false]
```

* `<>` = 必填, `[]` = 選填, `|` = 二擇一, `..` = 範圍 (如 `1..10`)

| 參數 / 欄位 | 類型 | 預設 | 說明 |
| --- | --- | --- | --- |
| `<參數A>` | `enum` | - | 簡述作用 |
| `<參數B>` | `int` | - | 簡述作用 |
| `[參數C]` | `...` | - | 簡述作用 |
| `[參數D]` | `...` | - | 簡述作用 |
| `[最小值..最大值]` | `...` | - | 簡述作用 |
| `[true | false]` | `boolean` | `false` |

* 目標選擇器及座標這類無須列出, 除非座標是需要列出體積的再列出長寬高部分.

---

## 參數說明 (Parameters)

### `參數A`

> 說明此參數的功能與使用場景.

| 值 | 說明 |
| --- | --- |
| `值1` | 簡述 (預設值) |
| `值2` | 簡述 |
| `值3` | 簡述 |

---

### `參數B`

> 說明此參數的功能與使用場景.

| 值 | 說明 |
| --- | --- |
| `值1` | 簡述 |
| `值2` | 簡述 |

---

## 外部連結 (References)

* [Minecraft Wiki - /command](https://www.google.com/search?q=%23)
* (生成時請依據下方規範第 6 點, 自動插入引用的全域系統連結)

---

# 以下內容為生成規範(生成時請忽略, 無須寫入檔案中)

1. [絕對約束] 標點符號與格式 (Absolute Constraints):
  * 整份文件嚴禁使用全形標點符號 (如: ， 。 ： ； （ ）). 所有標點符號一律強制替換為半形 (如: , . : ; ( )).
  * 輸出純 Markdown 格式, 嚴禁附加任何提示語, 說明文字或對話. 所有佔位符必須完全替換.


2. 標頭與目錄規則 (Header & TOC Rules):
  * 標頭版本統一維持 `JE ≤ 1.20.4`. 權限等級與命令方塊支援必須正確填入.
  * 目錄 (TOC) 的連結文字必須使用中文, 連結目的地統一填入 `#`, 不填寫實際錨點 ID.
  * 所有 H2/H3 標題後方嚴禁附加 `{#anchor-id}` 語法.


3. 語法與參數表規則 (Syntax & Parameter Rules):
  * 若指令具備多重分支 (Multiple Branches), 必須於程式碼區塊內逐行列出所有有效的最小單元語法, 不展開所有可能組合.
  * 表格標頭必須嚴格使用 `| 參數 / 欄位 | 類型 | 預設 | 說明 |`. 必填欄位的預設值填 `-`, 不可留空或打 `X`.
  * 目標選擇器 (Target Selectors) 與常規座標 (Coordinates) 強制不展開說明, 僅保留於全域語法列. 若牽涉體積運算 (如 dx, dy, dz) 則必須列出體積參數.


4. 子元素與枚舉規則 (Subcommand & Enum Rules):
  * 若該指令無子指令 (如 `/say`), 將 `## 參數說明` 下方的 H3 標題直接替換為該指令唯一的具體參數名稱.
  * 枚舉資料 (Enum Data) 必須查找完整並全部列出, 絕對禁止使用「... 等」或「其餘略」進行省略. 無法確認的說明填 `-`.
  * 若某參數具備預設值, 必須在枚舉表格的說明欄位內明確標註 `(預設值)`.
  * 已棄用 (Deprecated) 的枚舉值仍須列出, 並於說明欄標註「已棄用 Deprecated」.


5. 長文件分段規則 (Pagination Rules):
  * 若預估枚舉條目過多 (如音效, 粒子, 物品等), 導致單次 Token 輸出可能超載, 必須先輸出主體骨架與表頭, 並使用 `` 標註, 待確認後再進行後續分段填補.


6. 全域系統自動映射與去冗餘規則 (Cross-Reference Auto-Linking & No-Redundancy):
  * 只要該指令的語法或參數中, 有使用或提及下列任何全域系統機制, 必須強制將對應的 Markdown 連結直接複製並加入到 `## 外部連結 (References)` 區塊中.
  * [絕對約束]: 如果生成指令時, 該指令內有任何引用到下方清單的內容, 絕對不用在指令的檔案中再生成一次詳細內容或展開解釋, 僅需在參數表簡述用途, 並直接用超連結指向 Github 連結即可, 確保指令文的極簡化.
  * 絕對映射清單 (請完全使用此格式貼上):
    * `[目標選擇器 (Target Selectors)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/TargetSelectors.md)`
    * `[座標系統 (Coordinate Systems)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/coordinates.md)`
    * `[JSON 文本元件 (Raw JSON Text Components)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/json_text.md)`
    * `[時間與時間單位 (Time & Duration Formats)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/TimeFormats.md)`
    * `[資源位置與命名空間規範 (Resource Locations)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/ResourceLocations.md)`
    * `[方塊狀態與標籤 (Block States & Tags)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/BlockStates_or_Tags.md)`
    * `[物品欄位編號 (Slot IDs)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/Slot_IDs.md)`
    * `[粒子特殊參數 (Particle Extra Arguments)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/ParticleExtraArguments.md)`
    * `[粒子效果 ID (Particle Effects)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/ParticleEffects.md)`
    * `[狀態效果 ID (Status Effects)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/StatusEffects.md)`
    * `[附魔類型 ID (Enchantments)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/Enchantments.md)`
    * `[音效 ID (Sound effects)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/SoundEffects.md)`
    * `[生態域 ID (Biome IDs)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/Biome_IDs.md)`
    * `[世界結構 ID (Structure IDs)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/Structure_IDs.md)`
    * `[實體 ID (Entity IDs)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/Entity_IDs.md)`
    * `[實體 NBT 矩陣 (Entities)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.NBT/list.md)`
    * `[方塊實體 NBT 矩陣 (Block Entities)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.NBT/list.md)`
    * `[物品 NBT 矩陣 (Items)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.NBT/list.md)`


7. 無外部組件映射之窮舉處理原則 (Inline Exhaustive List Fallback):
   - 觸發條件: 當指令包含需要列舉的特定 ID, 參數或資料清單 (如進度 ID, 遊戲規則等), 且該項目 **不在** 第 6 項「全域系統自動映射」的外部連結清單中時.
   - 處理動作: 絕對不可要求讀者自行去 Wiki 查詢或僅提供零星範例。必須直接在該指令文件的 `參數說明` 下方，新增一個獨立區塊 (例如 `## 原版 [項目名稱] 清單`).
   - 排版要求: 必須將所有原版資料使用高密度的「分類標題 (###)」與「Markdown 矩陣表格」進行歸納排版, 確保清單完整, 直觀且無冗餘贅字.


8. 管道符號跳脫原則 (Pipe Character Escaping):
   - 觸發條件: 當需要在 Markdown 表格的儲存格內部顯示垂直線 `|` 時 (例如表示二擇一的參數 `[A|B]`).
   - 處理動作: 必須強制使用反斜線進行跳脫, 寫成 `\|` (例如 `[A\|B]`), 絕對不可直接輸出純 `|`, 以防止表格渲染結構損毀.


9. 資料包引用與結構說明原則 (Datapack Reference Rules):
   - 觸發條件: 當指令的參數涉及依賴資料包 (Datapack) 定義的動態資源 (如 Loot Tables, Recipes, Advancements, Predicates, Item Modifiers, Functions 等) 時.
   - 處理動作: 
     1. 必須在參數表的「說明」欄位內明確標註「需透過資料包定義」.
     2. 必須在該指令文件內部 (`## 外部連結` 的上方), 新增一個獨立的 `## 資料包結構參考 (Datapack Structure)` 區塊.
   - 排版要求: 在該獨立區塊內, 必須列出該資源在資料包中的「標準目錄路徑」 (例如 `data/<namespace>/loot_tables/`), 並提供其 JSON 檔案的核心結構範例或關鍵節點說明, 以確保讀者能確實理解如何建立該資源.