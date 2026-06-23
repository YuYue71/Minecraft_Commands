# /gamerule

> **分類:** `指令` | **權限等級:** `2` | **適用版本:** `JE ≤ 1.20.4` | **命令方塊:** `true`

---

## 目錄

* [語法](#語法-syntax)
* [參數說明](#參數說明-parameters)
  * [gamerule (布林值)](#gamerule-布林值-boolean)
  * [gamerule (整數值)](#gamerule-整數值-integer)
* [外部連結](#外部連結-references)

---

## 語法 (Syntax)

```commands
/gamerule <gamerule>
/gamerule <gamerule> <value>
```

* `<>` = 必填, `[]` = 選填
* 僅輸入 `<gamerule>` 時為查詢當前該規則的數值, 加上 `<value>` 時為設定新數值.

| 參數 / 欄位 | 類型 | 預設 | 說明 |
| --- | --- | --- | --- |
| `<gamerule>` | `enum` | - | 要查詢或設定的遊戲規則名稱 |
| `<value>` | `boolean | int` | - |

---

## 參數說明 (Parameters)

### `<gamerule>` (布林值 Boolean)

> `<value>` 必須填入 `true` (開啟) 或 `false` (關閉).

| 值 | 說明 |
| --- | --- |
| `announceAdvancements` | 玩家獲得進度時是否在聊天框廣播 (預設值: true) |
| `commandBlockOutput` | 指令方塊執行指令時是否在聊天框輸出提示 (預設值: true) |
| `disableElytraMovementCheck` | 伺服器是否取消對鞘翅飛行的移動速度作弊檢查 (預設值: false) |
| `disableRaids` | 是否禁用村莊突襲事件 (預設值: false) |
| `doDaylightCycle` | 是否進行日夜更替 (預設值: true) |
| `doEntityDrops` | 非生物實體 (如礦車, 物品展示框, 畫) 被破壞時是否掉落為物品 (預設值: true) |
| `doFireTick` | 火焰是否會自然蔓延與熄滅 (預設值: true) |
| `doImmediateRespawn` | 玩家死亡後是否跳過死亡畫面並立即重生 (預設值: false) |
| `doInsomnia` | 幻影魔物是否會在夜間生成 (預設值: true) |
| `doLimitedCrafting` | 玩家是否只能合成已經解鎖配方的物品 (預設值: false) |
| `doMobLoot` | 生物死亡時是否掉落實體物品與經驗值 (預設值: true) |
| `doMobSpawning` | 怪物與動物是否會自然生成 (預設值: true) |
| `doPatrolSpawning` | 掠奪者巡邏隊是否會自然生成 (預設值: true) |
| `doTileDrops` | 方塊被破壞時是否掉落為物品 (預設值: true) |
| `doTraderSpawning` | 流浪商人是否會自然生成 (預設值: true) |
| `doVinesSpread` | 藤蔓與發光地衣等是否會自然蔓延 (預設值: true) |
| `doWardenSpawning` | 伏守者是否會自然生成 (預設值: true) |
| `doWeatherCycle` | 天氣是否會自然變化 (預設值: true) |
| `drowningDamage` | 實體是否會受到窒息與溺水傷害 (預設值: true) |
| `fallDamage` | 實體是否會受到墜落傷害 (預設值: true) |
| `fireDamage` | 實體是否會受到火焰與岩漿傷害 (預設值: true) |
| `forgiveDeadPlayers` | 鐵魔像等中立生物是否會在惹怒他們的玩家死亡後停止仇恨 (預設值: true) |
| `freezeDamage` | 實體是否會受到細雪的冰凍傷害 (預設值: true) |
| `globalSoundEvents` | 特定音效 (如凋零召喚, 終界龍死亡) 是否全伺服器玩家都能聽見 (預設值: true) |
| `keepInventory` | 玩家死亡後是否保留物品欄與經驗值而不掉落 (預設值: false) |
| `logAdminCommands` | 伺服器是否將管理員的指令執行記錄寫入日誌檔 (預設值: true) |
| `mobGriefing` | 生物是否能破壞或改變方塊 (如苦力怕爆炸破壞地形, 終界使者搬磚) (預設值: true) |
| `naturalRegeneration` | 玩家飢餓值飽滿時是否會自然恢復生命值 (預設值: true) |
| `projectilesCanBreakBlocks` | 拋射物是否能破壞特定方塊 (如箭矢破壞歌萊花, 終界水晶) (預設值: true) |
| `reducedDebugInfo` | 按下 F3 時是否精簡化除錯畫面, 隱藏座標與視角等詳細資訊 (預設值: false) |
| `sendCommandFeedback` | 玩家執行指令後是否在聊天框顯示執行成功回饋 (預設值: true) |
| `showDeathMessages` | 玩家或已命名寵物死亡時是否在聊天框廣播死亡訊息 (預設值: true) |
| `spectatorsGenerateChunks` | 旁觀模式玩家在移動時是否能生成新的世界區塊 (預設值: true) |
| `universalAnger` | 被激怒的中立生物是否會無差別攻擊附近所有玩家, 而非僅攻擊激怒者 (預設值: false) |
| `blockExplosionDropDecay` | 一般方塊爆炸時, 掉落物是否會隨距離中心衰減而減少掉落率 (預設值: true) |
| `mobExplosionDropDecay` | 生物爆炸 (如苦力怕) 時, 掉落物是否會衰減減少掉落率 (預設值: false) |
| `tntExplosionDropDecay` | TNT 爆炸時, 掉落物是否會衰減減少掉落率 (預設值: false) |
| `waterSourceConversion` | 兩個水源方塊是否能無限生成新的水源方塊 (預設值: true) |
| `lavaSourceConversion` | 兩個熔岩源方塊是否能無限生成新的熔岩源方塊 (預設值: false) |

---

### `<gamerule>` (整數值 Integer)

> `<value>` 必須填入有效的整數數字.

| 值 | 說明 |
| --- | --- |
| `commandModificationBlockLimit` | 單次指令 (如 `/clone`, `/fill`) 允許修改的最大方塊數量上限 (預設值: 32768) |
| `maxCommandChainLength` | 連鎖指令方塊單次執行允許的最大連鎖方塊長度 (預設值: 65536) |
| `maxEntityCramming` | 單一方塊空間內容納實體的上限, 超過會受到實體擠壓傷害. 設為 0 則完全關閉此傷害 (預設值: 24) |
| `playersSleepingPercentage` | 伺服器跳過夜晚所需入睡玩家的百分比. 設為 0 代表一人睡覺即可過夜, 大於 100 則無法過夜 (預設值: 100) |
| `randomTickSpeed` | 每區塊 (16x16x16) 每刻發生的隨機刻次數. 控制農作物生長, 樹葉枯萎等速度. 設為 0 則停止生長 (預設值: 3) |
| `snowAccumulationHeight` | 下雪時, 露天雪層可累積的最大堆疊層數高度 (預設值: 1) |
| `spawnRadius` | 玩家首次進入世界或無床重生時, 距離世界重生點的分散半徑 (預設值: 10) |

---

## 外部連結 (References)

* [Minecraft Wiki - /gamerule](https://minecraft.fandom.com/zh/wiki/%E6%B8%B8%E6%88%8F%E8%A7%84%E5%88%99?variant=zh-tw)
* [目標選擇器 (Target Selectors)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/TargetSelectors.md)