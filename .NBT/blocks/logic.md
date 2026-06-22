# 邏輯與機制方塊實體 NBT (Logic & Mechanics Block Entities NBT)

> **分類:** `NBT` | **適用版本:** `JE ≤ 1.20.4`

---

## 目錄

* [SNBT 結構](https://www.google.com/search?q=%23snbt-%E7%B5%90%E6%A7%8B-structure)
* [指令方塊標籤](https://www.google.com/search?q=%23%E6%8C%87%E4%BB%A4%E6%96%B9%E5%A1%8A%E6%A8%99%E7%B1%A4-command-blocks)
* [生怪磚標籤](https://www.google.com/search?q=%23%E7%94%9F%E6%80%AA%E7%A3%9A%E6%A8%99%E7%B1%A4-spawners)
    * [SpawnPotentials 結構](https://www.google.com/search?q=%23spawnpotentials-%E7%B5%90%E6%A7%8B)
* [其他機制方塊標籤](https://www.google.com/search?q=%23%E5%85%B6%E4%BB%96%E6%A9%9F%E5%88%B6%E6%96%B9%E5%A1%8A%E6%A8%99%E7%B1%A4-other-mechanics)
* [外部連結](https://www.google.com/search?q=%23%E5%A4%96%E9%83%A8%E9%80%A3%E7%B5%90-references)

---

## SNBT 結構 (Structure)

```snbt
{
    id: "minecraft:command_block",
    x: 0,
    y: 64,
    z: 0,
    Command: "say Hello World",
    auto: 1b,
    TrackOutput: 0b,
    conditionMet: 1b
}

```

* SNBT 格式, 適用於 `/setblock`, `/data get/merge/modify block` 指令.
* 涵蓋負責處理遊戲底層邏輯與自動化運作的方塊: 指令方塊 (包含連鎖與重複), 生怪磚, 結構方塊, 蜂箱/蜂巢, 終界折躍門, 幽匿尖嘯體.

---

## 指令方塊標籤 (Command Blocks)

> 適用於 `minecraft:command_block`, `minecraft:chain_command_block`, `minecraft:repeating_command_block`.

| 標籤 (Tag) | 類型 | 預設 | 說明 |
| --- | --- | --- | --- |
| `Command` | `string` | `""` | 儲存於方塊內的指令內容字串 |
| `SuccessCount` | `int` | `0` | 上次指令執行後的成功次數 (常被紅石比較器讀取以輸出訊號強度) |
| `LastOutput` | `string` | `""` | 上次執行結果的文字回饋. 必須為 JSON 文本元件的字串格式 |
| `TrackOutput` | `byte` | `1b` | 是否將執行結果記錄至 `LastOutput` 標籤中 (`1b`=是). 關閉可減輕伺服器負擔 |
| `powered` | `byte` | `0b` | 當前方塊是否接收到紅石訊號 (`1b`=是) |
| `auto` | `byte` | `0b` | 是否設為「永遠活動」 (`1b`=永遠活動, `0b`=需要紅石) |
| `conditionMet` | `byte` | `0b` | 用於條件制令方塊 (Conditional). 標記其背後的指令方塊上次是否執行成功 |
| `UpdateLastExecution` | `byte` | `1b` | 決定是否要更新 `LastExecution` 的刻數記錄 |
| `LastExecution` | `long` | `0L` | 記錄上次執行此指令方塊的絕對遊戲時間刻 (Game Tick) |

---

## 生怪磚標籤 (Spawners)

> 適用於 `minecraft:spawner`. 負責實體的自動化生成邏輯.

| 標籤 (Tag) | 類型 | 預設 | 說明 |
| --- | --- | --- | --- |
| `Delay` | `short` | `20s` | 距離下一次生成週期的剩餘遊戲刻. 若設為 `-1`, 則會立刻隨機重置此計時 |
| `MinSpawnDelay` | `short` | `200s` | 生成週期的最小間隔刻數 (預設 10 秒) |
| `MaxSpawnDelay` | `short` | `800s` | 生成週期的最大間隔刻數 (預設 40 秒) |
| `SpawnCount` | `short` | `4s` | 每次生成週期嘗試生成的實體數量 |
| `MaxNearbyEntities` | `short` | `6s` | 偵測範圍內允許存在的最大同類實體數量. 若達標則暫停生成 |
| `RequiredPlayerRange` | `short` | `16s` | 啟動生怪磚所需的最大玩家距離半徑 (以方塊為單位) |
| `SpawnRange` | `short` | `4s` | 實體可生成位置的最大隨機半徑 (以方塊為中心) |
| `SpawnData` | `compound` | - | 決定下一次要生成的特定實體資料 (結構見下方 `data` 說明) |
| `SpawnPotentials` | `list` | `[]` | 儲存多個備選實體的陣列. 生怪磚會依據權重從中隨機抽選並覆寫至 `SpawnData` |

---

### `SpawnPotentials` 結構

> 陣列內的每一個 Compound 代表一種可能生成的實體選項 (適用於 1.19.3 以上版本的新格式).

| 子標籤 | 類型 | 預設 | 說明 |
| --- | --- | --- | --- |
| `weight` | `int` | `1` | 必填. 該實體被抽選到的權重值. 數值越高機率越大 |
| `data` | `compound` | `{}` | 必填. 包含 `entity` (實體 NBT 與 ID) 以及 `custom_spawn_rules` (自訂生成光照限制等) 的複合資料 |

---

## 其他機制方塊標籤 (Other Mechanics)

> 涵蓋世界生成或特殊觸發邏輯的獨立機制方塊.

| 標籤 (Tag) | 類型 | 預設 | 說明 |
| --- | --- | --- | --- |
| **蜂箱/蜂巢** | `Bees` | `list` | 儲存目前在蜂箱內的蜜蜂 NBT (包含 `EntityData`, `TicksInHive`, `MinOccupationTicks`) |
|  | `FlowerPos` | `compound` | 記錄該蜂箱綁定的花朵座標 (包含整數標籤 `X`, `Y`, `Z`) |
| **結構方塊** | `name` | `string` | 結構的資源位置 (如 `minecraft:village/plains/houses/plains_small_house_1`) |
|  | `mode` | `string` | 結構方塊的工作模式. 包含 `SAVE`, `LOAD`, `CORNER`, `DATA` |
|  | `posX`, `posY`, `posZ` | `int` | 結構區域相對於方塊本身的座標偏移量 |
|  | `sizeX`, `sizeY`, `sizeZ` | `int` | 結構區域的體積長寬高 |
| **幽匿尖嘯體** | `warning_level` | `int` | `0` |
|  | `can_summon` | `byte` | `0b` |
| **終界折躍門** | `ExactTeleport` | `byte` | `0b` |
|  | `ExitPortal` | `compound` | 傳送目的地的絕對座標 (包含整數標籤 `X`, `Y`, `Z`) |
|  | `Age` | `long` | `0L` |

---

## 外部連結 (References)

* [Minecraft Wiki - 區塊格式](https://minecraft.fandom.com/zh/wiki/%E5%8C%BA%E5%9D%97%E6%A0%BC%E5%BC%8F?variant=zh-tw)
* [座標系統 (Coordinate Systems)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/Coordinates.md)
* [JSON 文本元件 (Raw JSON Text Components)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/json_text.md)
* [資源位置與命名空間規範 (Resource Locations)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/ResourceLocations.md)