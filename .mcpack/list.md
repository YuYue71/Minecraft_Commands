# 資料包編寫說明 (Data Pack Guide)

## 基礎說明 (Basic Information)

每次資料包有修改或更新內容後, 必須在遊戲內執行 `/reload` 指令來重新加載資料包, 變更才會生效.

---

## 目錄結構解析 (Directory Structure)

本資料包採用模組化結構設計, 區分「原版觸發器」與「自訂專案邏輯」, 以確保高可讀性與擴充性.

```tree
├── data                                    # 資料包的主要內容目錄
│   ├── example                             # 自訂專案命名空間 (可替換為專案名稱)
│   │   ├── advancements                    # 成就與進度觸發器目錄
│   │   │   ├── advancements.md             # 成就進度系統開發說明文件
│   │   │   └── template.json               # 成就進度設定檔範本
│   │   ├── chat_type                       # 聊天格式與樣式自訂目錄
│   │   │   ├── chat_type.md                # 聊天格式系統開發說明文件
│   │   │   └── template.json               # 聊天格式設定檔範本
│   │   ├── damage_type                     # 自訂傷害來源目錄 (如自製魔法傷害)
│   │   │   ├── damage_type.md              # 傷害類型系統開發說明文件
│   │   │   └── template.json               # 傷害類型設定檔範本
│   │   ├── dimension                       # 自訂維度生成配置目錄
│   │   │   ├── dimension.md                # 維度生成系統開發說明文件
│   │   │   └── template.json               # 維度配置設定檔範本
│   │   ├── dimension_type                  # 維度環境參數目錄 (亮度, 高度, 天空顏色等)
│   │   │   ├── dimension_type.md           # 維度參數系統開發說明文件
│   │   │   └── template.json               # 維度環境參數設定檔範本
│   │   ├── functions                       # 核心程式碼指令區塊 (.mcfunction)
│   │   │   ├── core                        # 核心邏輯目錄 (高頻運算與主迴圈)
│   │   │   │   └── tick.mcfunction         # 每遊戲刻觸發的常駐指令腳本
│   │   │   ├── init                        # 初始化目錄 (變數宣告, 計分板建立)
│   │   │   │   └── load.mcfunction         # 系統重載時觸發的初始化腳本
│   │   │   ├── utils                       # 實用工具目錄 (如系統清理器)
│   │   │   │   └── uninstall.mcfunction    # 徹底移除專案殘留變數的清理腳本
│   │   │   ├── functions.md                # 函式系統開發說明文件
│   │   │   └── second_tick.mcfunction      # 降頻處理的秒級觸發腳本範本
│   │   ├── item_modifiers                  # 物品屬性修飾器目錄 (動態修改 NBT, 附魔等)
│   │   │   ├── item_modifiers.md           # 物品修飾器系統開發說明文件
│   │   │   └── template.json               # 物品修飾設定檔範本
│   │   ├── loot_tables                     # 戰利品表目錄 (自訂掉落物, 寶箱內容, 抽獎池)
│   │   │   ├── loot_tables.md              # 戰利品表系統開發說明文件
│   │   │   └── template.json               # 戰利品表設定檔範本
│   │   ├── predicates                      # 條件檢測邏輯目錄 (將複雜判斷獨立模組化)
│   │   │   ├── predicates.md               # 條件檢測系統開發說明文件
│   │   │   └── template.json               # 條件檢測設定檔範本
│   │   ├── recipes                         # 自訂合成表目錄 (工作台, 熔爐, 切石機等)
│   │   │   ├── recipes.md                  # 合成表系統開發說明文件
│   │   │   └── template.json               # 合成表設定檔範本
│   │   ├── structures                      # 建築結構檔案存放區
│   │   │   ├── structures.md               # 結構系統開發說明文件
│   │   │   └── template.json               # 結構配置設定檔範本 (實體結構通常為 .nbt)
│   │   └── tags                            # 標籤群組目錄 (將多種目標歸類為同一變數)
│   │       ├── blocks                      # 方塊標籤目錄
│   │       │   └── template.json           # 方塊標籤設定檔範本
│   │       ├── entity_types                # 實體標籤目錄
│   │       │   └── template.json           # 實體標籤設定檔範本
│   │       ├── items                       # 物品標籤目錄
│   │       │   └── template.json           # 物品標籤設定檔範本
│   │       └── tags.md                     # 標籤系統開發說明文件
│   └── minecraft                           # 原版命名空間 (用於掛載或覆寫原版機制)
│       └── tags                            # 原版標籤目錄
│           └── functions                   # 原版系統函式觸發器標籤
│               ├── load.json               # 綁定重載時自動執行的自訂函式清單
│               └── tick.json               # 綁定每遊戲刻自動執行的自訂函式清單
└── pack.mcmeta                             # 資料包識別與版本核心設定檔 (必要)
```

---

## 核心配置檔 (pack.mcmeta)

`pack.mcmeta` 是讓 Minecraft 能夠讀取並識別為資料包的核心檔案. 內部的 `pack_format` 數值必須對應當前的遊戲版本.

### 版本對應編號表 (Pack Formats)

| 編號 | 支援遊戲版本區間 |
| --- | --- |
| `61` | 1.21.1+ |
| `57` | 1.21.0 |
| `48` | 1.20.5 - 1.20.6 |
| `26` | 1.20.3 - 1.20.4 |
| `18` | 1.20.2 |
| `15` | 1.20 - 1.20.1 |
| `12` | 1.19.3 - 1.19.4 |
| `10` | 1.19 - 1.19.2 |
| `8` | 1.18 - 1.18.2 |
| `7` | 1.17 - 1.17.1 |
| `6` | 1.16.2 - 1.16.5 |
| `5` | 1.15 - 1.16.1 |
| `4` | 1.14 - 1.14.4 |
| `1` | 1.13 - 1.13.2 |

---

## 命名空間替換指南 (Namespace Replacement Guide)

若要將預設的 `example` 修改為你自己的專案名稱 (例如 `my_project`), 必須確保以下兩步皆完成, 否則會造成路徑斷鏈與系統失效:

1. **修改實體資料夾名稱:** 將 `data/example/` 重新命名為 `data/my_project/`.
2. **修改系統觸發器 JSON:** 進入 `data/minecraft/tags/functions/` 目錄:
    * 開啟 `load.json`, 將內部的 `"example:init/load"` 替換為 `"my_project:init/load"`.
    * 開啟 `tick.json`, 將內部的 `"example:core/tick"` 替換為 `"my_project:core/tick"`.


3. **修改所有函式內部呼叫:** 在所有的 `.mcfunction` 檔案內部, 若有使用 `/function example:...` 互相呼叫的指令, 皆需同步替換為新的命名空間.

---

## 所有操作分類與用途字典 (Operations Dictionary)

| 分類 | 目錄名稱 | 主要功能用途 |
| --- | --- | --- |
| 函式巨集 | [`functions`](pack_template/data/example/functions/functions.md) | 存放 `.mcfunction` 指令腳本, 用於封裝並自動化執行多條指令. |
| 修改數據 | [`loot_tables`](pack_template/data/example/loot_tables/loot_tables.md) | 修改方塊挖掘, 生物死亡掉落物, 釣魚或寶箱內容. |
| 成就進度 | [`advancements`](pack_template/data/example/advancements/advancements.md) | 定義成就系統, 常用於在後台無聲觸發特殊事件或給予獎勵. |
| 自訂合成 | [`recipes`](pack_template/data/example/recipes/recipes.md) | 定義新的物品合成表 (包含工作台, 熔爐, 營火, 切石機等). |
| 定義標籤 | [`tags`](pack_template/data/example/tags/tags.md) | 定義標籤群組, 可將多種方塊, 物品或實體綁定為同一個變數名以便檢測. |
| 生成結構 | [`structures`](pack_template/data/example/structures/structures.md) | 存放 `.nbt` 結構檔案, 可配合結構方塊或指令生成自訂建築. |
| 條件判斷 | [`predicates`](pack_template/data/example/predicates/predicates.md) | 自定義邏輯條件 (例如: 檢測玩家背包是否有物品, 時間是否為夜晚). |
| 物品修飾 | [`item_modifiers`](pack_template/data/example/item_modifiers/item_modifiers.md) | 用於在指令中快速且動態地修改物品屬性 (如修改名稱, Lore, 附魔). |
| 傷害類型 | [`damage_type`](pack_template/data/example/damage_type/damage_type.md) | 定義自訂的傷害來源與死亡提示訊息. |
| 聊天訊息 | [`chat_type`](pack_template/data/example/chat_type/chat_type.md) | 自定義聊天室訊息的顯示格式與外觀. |
| 自訂維度 | [`dimension`](pack_template/data/example/dimension/dimension.md) | 定義全新的自訂維度 (包含地形生成器設定). |
| 維度類型 | [`dimension_type`](pack_template/data/example/dimension_type/dimension_type.md) | 定義維度的環境與物理屬性 (如時間流速, 亮度, 高度限制, 床的爆炸與否). |

---

## 跨元素語法關聯表 (Links Matrix)

| 關聯項目 | 外部參考連結 |
| --- | --- |
| Data Pack Generators | [Misode 資料包視覺化生成工具](https://misode.github.io/) |
| 遊戲內管理指令 | [資料包管理指令 (datapack)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.commands/datapack.md) |
| Minecraft Wiki | [資料包 (Data Pack) 官方百科](https://minecraft.fandom.com/zh/wiki/%E6%95%B0%E6%8D%AE%E5%8C%85?variant=zh-tw) |