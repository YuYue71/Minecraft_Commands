# structures (結構檔案)

> **分類:** `生成結構` | **檔案格式:** `nbt` | **適用版本:** `JE ≤ 1.20.4` | **熱重載:** `/reload`

---

## 目錄

* [1. 目錄路徑 (Directory & Path)](#1-目錄路徑-directory--path)
* [2. 檔案生成方式 (File Generation)](#2-檔案生成方式-file-generation)
* [3. 調用方式 (Usage)](#3-調用方式-usage)
* [4. 外部連結 (References)](#4-外部連結-references)

---

## 1. 目錄路徑 (Directory & Path)

> 定義結構檔案在資料包中的物理存放位置與調用 ID.

```file
data/<namespace>/structures/[子資料夾]/<檔案名稱>.nbt
```

* `<namespace>`: 命名空間 (如 `minecraft`, `example`).
* `<registry>`: `structures`.
* 調用標識符: `<namespace>:[子資料夾]/<檔案名稱>`.

---

## 2. 檔案生成方式 (File Generation)

> 結構檔案以二進位 NBT 格式儲存, 無法透過文字編輯器直接編寫.

* **結構方塊 (Structure Block)**: 在遊戲內使用「儲存 (Save)」模式設定範圍後匯出. 檔案將自動生成於伺服器或存檔資料夾的 `generated` 目錄下, 需手動移動至資料包中.
* **外部工具**: 可使用 NBTExplorer 修改內部資料, 或使用第三方地圖編輯器 (如 Litematica, WorldEdit) 進行轉換匯出.
* **資料特性**: 內部包含方塊調色盤 (Palette)、實體資料以及精確的方塊狀態 NBT.

---

## 3. 調用方式 (Usage)

> 定義如何在遊戲世界或地圖生成中應用該 NBT 結構.

* **結構方塊 (Structure Block)**: 在「載入 (Load)」模式下輸入調用標識符, 即可在世界中預覽並放置該結構.
* **指令調用**: 使用 `/place template <標識符> <座標>` 將其放置於指定位置 (1.19+ 版本).
* **世界生成 (Worldgen)**: 用於 `worldgen/structure` 配置中, 作為遺跡、村莊或其他自然生成建築的組成模板.
* **Jigsaw 方塊**: 用於拼圖系統 (Jigsaw System), 透過連接口動態拼接多個 `.nbt` 檔案以生成大型隨機建築.

---

## 4. 外部連結 (References)

* [Minecraft Wiki - Structure Block](https://zh.minecraft.wiki/)
* [座標系統 (Coordinate Systems)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/coordinates.md)
* [資源位置與命名空間規範 (Resource Locations)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/ResourceLocations.md)
* [世界結構 ID (Structure IDs)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/Structure_IDs.md)
* [相關指令: /place](https://github.com/YuYue71/Minecraft_Commands/blob/main/.commands/place.md)