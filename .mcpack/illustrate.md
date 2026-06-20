# 資料包編寫說明 (Data package preparation)
## 說明
> 每次資料包有更新必須使用 /reload 指令來重新加載資料包


## 資料結構
```tree
datapack/               # 世界資料夾內, 主要放資料包的資料夾
└── packname/           # 資料包
    ├── pack.mcmeta     # 資料包識別檔案 (必要)
    ├── pack.png        # 資料包圖標 (不是很必要)
    └── data/
        ├── name0/      # 命名空間0
        │   └── .../    # 放其他各種操作類別的資料夾
        ├── name1/      # 命名空間1
        ├── name2/      # 命名空間2
        └── minecraft/  # 原版命名空間 (會覆蓋原版內容)
```

---

## 關於 pack.mcmeta 的內容
## 該檔案是用於讓 minecraft 能夠讀取並識別為資料包的核心檔案
> 內容示範如下

```mcmeta
{
    "pack": {
        "pack_format": <版本編號>,
        "description": "此為資料包說明"
    }
}
```

### 版本對應編號表
|編號|版本|
|---|---|
|`61`|1.21.1+|
|`57`|1.21.0|
|`48`|1.20.5 - 1.20.6|
|`26`|1.20.3 - 1.20.4|
|`18`|1.20.2|
|`15`|1.20 - 1.20.1|
|`12`|1.19.3 - 1.19.4|
|`10`|1.19 - 1.19.2|
|`8`|1.18 - 1.18.2|
|`7`|1.17 - 1.17.1|
|`6`|1.16.2 - 1.16.5|
|`5`|1.15 - 1.16.1|
|`4`|1.14 - 1.14.4|
|`1`|1.13 - 1.13.2|

---

## 所有命名空間下可用的操作資料夾目錄
> 對應所需創建資料夾即可

|分類|資料夾名稱|主要功能用途|
|---|---|---|
|生成結構|[worldgen/](data/worldgen.md)|世界生成核心, 包含結構, 生物群系, 特徵等|
|函式巨集|[functions/](data/functions.md)|存放 .mcfunction 指令腳本, 用於自動化執行指令|
|修改數據|[loot_tables/](data/loot_tables)|修改方塊挖掘, 生物掉落物, 釣魚或寶箱內容|
|成就進度|[advancements/](data/advancements.md)|定義成就系統, 可用於觸發特殊事件或獎勵|
|自訂合成|[recipes/](data/recipes.md)|定義新的物品合成表（工作台、熔爐等）|
|定義標籤|[tags/](data/tags.md)|將多種方塊, 物品或實體進行分組|
|傷害類型|[damage_type/](data/damage_type.md)|定義自定義的傷害來源類型|
|聊天訊息|[chat_type/](data/chat_type.md)|自定義聊天室訊息的顯示格式|
|自訂維度|[dimension/](data/dimension.md)|定義新的維度|
|維度類型|[dimension_type/](data/dimension_type.md)|定義維度的環境屬性（如亮度, 天空顏色, 高度限制）|

---

## 跨元素語法關聯表 (Links Matrix)
| 關聯參數欄位 | 參引語法元件名稱 |
| --- | --- |
| 資料包 | [資料包管理指令 (Data package management instructions)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.commands/datapack.md) |