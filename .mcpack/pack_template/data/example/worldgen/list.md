# 世界生成開發說明 (World Generation Guide)

> **目錄位置:** `data/<namespace>/worldgen/`
> **適用版本:** `JE ≤ 1.20.4` | **熱重載:** `/reload` (部分變更需重啟世界)

---

## 目錄結構解析 (Directory Structure)

`worldgen` 目錄下包含多個子登錄空間, 用於定義從微觀方塊堆疊到宏觀地形特徵的完整世界演算法.

```tree
├── worldgen                                    # 世界生成核心目錄
│   ├── biome                                   # 生物群系定義 (氣候, 色彩, 實體生成)
│   ├── configured_feature                      # 配置特徵 (定義「什麼」被生成, 如一棵樹, 一團礦石)
│   ├── density_function                        # 密度函數 (1.18+ 用於控制地形形狀的數學函數)
│   ├── multi_noise_biome_source_parameter_list # 多重噪音群系參數列表 (自訂群系分佈集)
│   ├── noise                                   # 噪音參數 (定義地形起伏的基礎噪音)
│   ├── noise_settings                          # 噪音設置 (定義地形整體架構, 如海平面, 高度)
│   ├── placed_feature                          # 放置特徵 (定義特徵「如何」分佈, 如頻率, 高度)
│   ├── processor_list                          # 處理器列表 (結構生成時的方塊替換規則)
│   ├── structure                               # 結構配置 (定義結構的生成邏輯與群系限制)
│   ├── structure_set                           # 結構集 (定義結構在世界上的分佈間距與種子)
│   ├── template_pool                           # 模板池 (Jigsaw 拼圖系統的零件庫)
│   └── world_preset                            # 世界預設 (定義維度組合與生成預設)
└── list.md                                     # 世界生成開發速查表 (本檔案)
```

---

## 世界生成組件字典 (Worldgen Dictionary)

| 分類項目 | 簡述 | 主要功能用途與 Misode 映射 |
| --- | --- | --- |
| [`biome`](biome/biome.md) | 群系定義 | 設置氣候(溫度/降雨)、地表材質、環境音效、粒子微粒與生物生成權重. |
| [`configured_feature`](configured_feature/configured_feature.md) | 特徵屬性 | 定義特徵的具體組成, 例如礦石的方塊種類、樹木的形狀、湖泊的液體類型. |
| [`placed_feature`](placed_feature/placed_feature.md) | 放置規則 | 將 `configured_feature` 封裝並套用分佈邏輯, 如每區塊生成次數、高度區間限制. |
| [`structure`](structure/structure.md) | 結構參數 | 指向 `template_pool`, 決定建築物如何適應地形 (如隨地勢起伏) 以及所屬分類. |
| [`structure_set`](structure_set/structure_set.md) | 分佈密度 | 控制結構在世界地圖上的稀有度, 定義結構間的距離 (Spacing) 與位移 (Separation). |
| [`template_pool`](template_pool/template_pool.md) | 拼圖零件 | Jigsaw 系統的核心, 定義結構各部分的 NBT 模板路徑與連接權重. |
| [`noise_settings`](noise_settings/noise_settings.md) | 地形架構 | 決定維度的地形形狀、方塊填充規律、海平面高度及地層分佈 (核心複雜設定). |
| [`density_function`](density_function/density_function.md) | 地形數值 | 透過數學運算 (如 Add, Mul, Clamp) 動態調整噪音值以精確雕刻地形. |
| [`processor_list`](processor_list/processor_list.md) | 方塊修改 | 在結構生成後執行方塊替換 (如將部分石頭替換為苔石) 或隨機移除方塊. |
| [`noise`](noise/noise.md) | 噪音波形 | 定義基礎的噪音八度音階 (Octaves) 與振幅. |

---

## 組件關聯邏輯 (Workflow Matrix)

世界生成的執行流程具備嚴格的嵌套關係, 編寫時建議遵循以下路徑:

1.  **特徵路徑**: `configured_feature` (定義內容) → `placed_feature` (定義分佈) → 放入 `biome` 的 `features` 陣列.
2.  **結構路徑**: `.nbt` 檔案 (實體建築) → `template_pool` (零件清單) → `structure` (生成邏輯) → `structure_set` (世界分佈).
3.  **地形路徑**: `density_function` (數學邏輯) → `noise_settings` (地形配置) → 放入 `dimension` 的 `generator`.

---

## 數據約束與版本注意事項 (Technical Constraints)

*   **1.18+ 噪音系統**: 自 1.18 起, 世界生成改為基於噪音的 3D 生成系統, 許多 1.17 之前的地型產生方式已棄用.
*   **高度限制**: `noise_settings` 中的高度參數必須與對應的 `dimension_type` 設定相符.
*   **熱重載限制**: 修改 `worldgen` 內容後執行 `/reload` 通常可更新部分邏輯, 但已生成的區塊 (Generated Chunks) 不會發生改變; 結構分佈與地形形狀的變更通常需要創建新世界或進入未加載區塊才能觀察到.

---

## 外部連結 (References)

* [Misode Worldgen Generators - 視覺化生成工具](https://misode.github.io/worldgen/)
* [Minecraft Wiki - 世界生成定義](https://zh.minecraft.wiki/w/%E4%B8%96%E7%95%8C%E7%94%9F%E6%88%90)
* [資源位置與命名空間規範 (Resource Locations)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/ResourceLocations.md)
* [生態域 ID (Biome IDs)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/Biome_IDs.md)
* [世界結構 ID (Structure IDs)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/Structure_IDs.md)