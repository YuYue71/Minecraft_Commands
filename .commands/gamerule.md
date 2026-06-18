# `/gamerule`（遊戲規則指令）

* > 用於設定或查詢世界遊戲規則
* > 影響遊戲核心行為與機制
* > 可動態修改且立即生效

## 語法結構 (Syntax)

```commands id="gamerule0"
/gamerule <規則> <值>
```

---

## 參數與引數拆解 (Arguments)

> 詳細解構語法中出現的每一個變數之填寫規範與底層資料型態

| 參數名稱          | 功能與語義說明      |
| ------------- | ------------ |
| `[必填]` `<規則>` | 指定要修改的遊戲規則   |
| `[選填]` `<值>`  | 設定該規則的布林值或數值 |

---

## 參數枚舉列表 (Parameter Enumeration)

### 規則

| 參數                           | 說明           |
| ---------------------------- | ------------ |
| `announceAdvancements`       | 是否公告進度達成     |
| `commandBlockOutput`         | 指令方塊是否輸出訊息   |
| `disableElytraMovementCheck` | 是否關閉鞘翅移動檢測   |
| `disableRaids`               | 是否關閉襲擊事件     |
| `doDaylightCycle`            | 是否啟用日夜循環     |
| `doEntityDrops`              | 實體是否掉落物品     |
| `doFireTick`                 | 火焰是否蔓延       |
| `doImmediateRespawn`         | 是否立即重生       |
| `doInsomnia`                 | 是否生成幻翼       |
| `doLimitedCrafting`          | 是否限制合成配方     |
| `doMobLoot`                  | 生物是否掉落戰利品    |
| `doMobSpawning`              | 是否生成生物       |
| `doPatrolSpawning`           | 是否生成掠奪者巡邏隊   |
| `doTraderSpawning`           | 是否生成流浪商人     |
| `doWeatherCycle`             | 是否啟用天氣循環     |
| `drowningDamage`             | 是否啟用溺水傷害     |
| `fallDamage`                 | 是否啟用摔落傷害     |
| `fireDamage`                 | 是否啟用火焰傷害     |
| `forgiveDeadPlayers`         | 怪物是否遺忘死亡玩家仇恨 |
| `freezeDamage`               | 是否啟用冰凍傷害     |
| `keepInventory`              | 死亡是否保留物品     |
| `logAdminCommands`           | 是否記錄管理員指令    |
| `maxCommandChainLength`      | 指令連鎖最大長度     |
| `maxEntityCramming`          | 實體擁擠上限       |
| `mobGriefing`                | 生物是否破壞方塊     |
| `naturalRegeneration`        | 是否自然回血       |
| `randomTickSpeed`            | 隨機刻速度        |
| `reducedDebugInfo`           | 是否減少除錯資訊     |
| `sendCommandFeedback`        | 是否顯示指令回饋     |
| `showDeathMessages`          | 是否顯示死亡訊息     |
| `showTags`                   | 是否顯示標籤       |

---

### 值

| 參數      | 說明                    |
| ------- | --------------------- |
| `true`  | 啟用                    |
| `false` | 停用                    |
| `<整數>`  | 適用於數值型規則，如 tick 或上限設定 |
