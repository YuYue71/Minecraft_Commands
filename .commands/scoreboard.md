# `/scoreboard`（計分板系統指令）
* > 用於建立、修改與展示自訂的追蹤計分項，以進行數據化管理與變數運算
* > 負責追蹤玩家或任意虛擬字串（虛擬實體）的數值（如擊殺數、死亡數、自訂變數）
* > 常用於 RPG 屬性系統、伺服器經濟體系、動態統計排行榜與後端資料儲存運算

---

## 語法結構 (Syntax)
```commands id="scoreboard"
/scoreboard objectives list
/scoreboard objectives add <計分項> <準則> <顯示名稱>
/scoreboard objectives remove <計分項>
/scoreboard objectives setdisplay <顯示位置> <計分項>
/scoreboard objectives modify <計分項> displayname <顯示名稱>
/scoreboard objectives modify <計分項> rendertype <渲染模式>
/scoreboard players list <目標>
/scoreboard players get <目標> <計分項>
/scoreboard players set <目標> <計分項> <分數>
/scoreboard players add <目標> <計分項> <分數>
/scoreboard players remove <目標> <計分項> <分數>
```
```commands id="scoreboard_players_advanced"
/scoreboard players reset <目標> <計分項>
/scoreboard players enable <目標> <計分項>
/scoreboard players operation <目標> <計分項> <運算子> <源目標> <源計分項>
```

---

## 參數與引數拆解 (Arguments)
> 詳細解構語法中出現的每一個變數之填寫規範與底層資料型態

| 參數名稱 | 功能與語義說明 |
| --- | --- |
| `[必填]` `objectives` | 計分項目管理關鍵字，用於建立、刪除、修改計分板的整體欄位結構 |
| `[必填]` `players` | 玩家分數管理關鍵字，用於對特定目標或虛擬物件的分數進行增減、重置與運算 |
| `[必填]` `list` | 查詢關鍵字，用於列出當前世界已註冊的所有計分項目，或列出特定目標擁有的所有分數 |
| `[必填]` `add` | 建立或遞增關鍵字，用於新增一個計分項目欄位，或為目標手動疊加指定分數 |
| `[必填]` `remove` | 刪除或遞減關鍵字，用於將整個計分項目從世界移除，或從目標身上扣除指定分數 |
| `[必填]` `setdisplay` | 顯示宣告關鍵字，用於將指定的計分項目掛載到遊戲客戶端的特定 UI 渲染區塊 |
| `[必填]` `modify` | 修改屬性關鍵字，用於動態變更已有計分項目的顯示外觀（顯示名稱或渲染樣式） |
| `[必填]` `get` | 查詢分數關鍵字，用於讀取並在聊天欄單獨回傳特定目標在指定計分項中的數值 |
| `[必填]` `set` | 覆寫數值關鍵字，用於強行將目標在指定計分項中的分數設定為某一固定常數 |
| `[必填]` `reset` | 清除重置關鍵字，將特定目標（或全伺服器所有目標）的特定分數欄位徹底抹除（使其重回無資料狀態，而非 0 分） |
| `[必填]` `enable` | 授權激活關鍵字，用於開啟非管理員玩家對特定 `trigger` 準則計分項的手動修改權限 |
| `[必填]` `operation` | 運算式關鍵字，用於調用記憶體底層的代數運算子，執行兩個計分項之間的數學交疊運算 |
| `[必填]` `<計分項>` / `<源計分項>` | 計分項目的內部唯一識別名稱字串（長度不可超過 16 個字元） |
| `[必填]` `<準則>` | 指定該計分項的底層自動追蹤邏輯或手動控制綁定機制 |
| `[選填]` `<顯示名稱>` | 顯示在客戶端畫面上的文字（支援 JSON 文本組格式，若省略則預設與計分項名稱相同） |
| `[必填]` `<顯示位置>` | 指定計分板在遊戲介面（如右側欄、個人名牌下、TAB 列表）的渲染區塊 |
| `[必填]` `<渲染模式>` | 決定分數在生命值相關顯示位置時，要渲染為數字還是心形圖標 |
| `[必填]` `<目標>` / `<源目標>` | 指定要操作分數的目標實體選擇器，或任意自訂的虛擬字串名稱（變數名） |
| `[必填]` `<分數>` | 要手動寫入、疊加或扣除的常數數值 |
| `[必填]` `<運算子>` | 進行跨目標、跨計分項的分數數學運算邏輯符號 |

---

## 參數枚舉列表 (Parameter Enumeration)

### 1. 核心與自動追蹤準則 (Criteria)

#### 基礎與狀態同步類

| 準則識別碼 | 自動追蹤之觸發事件與運行邏輯說明 |
| --- | --- |
| `dummy` | **手動控制（虛擬欄位）**：最常用的準則。引擎不會主動修改其數值，完全由指令進行讀寫，常用於變數儲存。 |
| `trigger` | **觸發器欄位**：特殊的手動欄位。常規玩家無法修改其分數，除非管理員預先使用 `enable` 授權，玩家才能透過 `/trigger` 指令自行更改。 |
| `deathCount` | 自動追蹤目標的累積死亡次數。 |
| `playerKillCount` | 自動追蹤玩家擊殺其他玩家的累積次數。 |
| `totalKillCount` | 自動追蹤玩家擊殺任何實體（包含怪物、動物與其他玩家）的累積總次數。 |
| `health` | **生命值追蹤**：自動即時同步目標的當前血量值（數值範圍為 0 至 20，每半顆心為 1）。此準則唯讀，無法被指令手動覆寫。 |
| `xp` | 自動即時同步玩家當前的經驗值總量。 |
| `level` | 自動即時同步玩家當前的經驗等級數值。 |
| `food` | 自動即時同步玩家當前的飢餓度數值（滿狀態為 20）。 |
| `air` | 自動即時同步玩家當前的剩餘含氧量（滿狀態為 300，代表在水下的呼吸泡泡）。 |
| `armor` | 自動即時同步玩家當前裝備的防禦保護點數。 |

#### 內建統計大系（`minecraft.custom` 全家族常規事件）

| 準則識別碼 | 自動追蹤之觸發事件與運行邏輯說明 |
| --- | --- |
| `minecraft.custom:minecraft.leave_game` | 統計玩家退出伺服器、中斷連線的累積次數。 |
| `minecraft.custom:minecraft.play_time` | 統計玩家身處世界的總遊戲時間（以遊戲刻 Tick 為計量單位，1秒=20Tick）。 |
| `minecraft.custom:minecraft.total_world_time` | 統計該存檔世界被運行的總時間（即便玩家處於掛機或死掉狀態亦會累計）。 |
| `minecraft.custom:minecraft.time_since_death` | 統計玩家自上一次死亡以來存活的時間（每次復活會自動歸零，重新按 Tick 累計）。 |
| `minecraft.custom:minecraft.time_since_rest` | 統計玩家自上一次在床上睡覺躺下以來的流逝時間（用於判定幻翼何時生成）。 |
| `minecraft.custom:minecraft.sneak_time` | 統計玩家按下 Shift 鍵進行潛行的累計總時間。 |
| `minecraft.custom:minecraft.walk_one_cm` | 統計玩家在地面上步行的累積總距離（單位為公分，1格寬度=100公分）。 |
| `minecraft.custom:minecraft.crouch_one_cm` | 統計玩家保持蹲姿移位的累積總距離。 |
| `minecraft.custom:minecraft.sprint_one_cm` | 統計玩家處於疾跑狀態下的奔跑累積總距離。 |
| `minecraft.custom:minecraft.swim_one_cm` | 統計玩家在水流或深海中游泳移位的累積總距離。 |
| `minecraft.custom:minecraft.fall_one_cm` | 統計玩家從高處垂直墜落、摔落的累積總距離（不論最終是否受傷）。 |
| `minecraft.custom:minecraft.climb_one_cm` | 統計玩家攀爬梯子、藤蔓或扭曲藤時垂直上升的累積總距離。 |
| `minecraft.custom:minecraft.fly_one_cm` | 統計玩家處於創造模式飛行，或在生存模式使用鞘翅滑翔的累積總距離。 |
| `minecraft.custom:minecraft.walk_on_water_one_cm` | 統計玩家踩在水面上（如使用寒冰行者附魔霜冰）移位的累積總距離。 |
| `minecraft.custom:minecraft.walk_under_water_one_cm` | 統計玩家完全沒入水底、在水床表面步行的累積總距離。 |
| `minecraft.custom:minecraft.jump` | 統計玩家手動按下跳躍鍵的累積次數。 |
| `minecraft.custom:minecraft.damage_dealt` | 統計玩家對外輸出的總傷害點數（數值放大了 10 倍，即打出 1 點血，計分板加 10）。 |
| `minecraft.custom:minecraft.damage_taken` | 統計玩家本身肉體承受的外來總傷害點數（數值同樣放大了 10 倍）。 |
| `minecraft.custom:minecraft.talked_to_villager` | 統計玩家與村民右鍵觸發對話或交易介面的累積次數。 |
| `minecraft.custom:minecraft.traded_with_villager` | 統計玩家與村民成功完成物品交易的累積次數。 |
| `minecraft.custom:minecraft.inspect_hopper` | 統計玩家右鍵打開漏斗介面進行查看的累積次數。 |
| `minecraft.custom:minecraft.inspect_dispenser` | 統計玩家右鍵打開發射器介面進行查看的累積次數. |
| `minecraft.custom:minecraft.inspect_dropper` | 統計玩家右鍵打開投擲器介面進行查看的累積次數。 |
| `minecraft.custom:minecraft.open_chest` | 統計玩家打開常規木質箱子容器的累積次數。 |
| `minecraft.custom:minecraft.open_shulker_box` | 統計玩家打開任意顏色界伏盒容器的累積次數。 |
| `minecraft.custom:minecraft.open_barrel` | 統計玩家打開木桶容器的累積次數。 |
| `minecraft.custom:minecraft.trigger_trapped_chest` | 統計玩家因打開陷阱箱而觸發訊號的累積次數。 |
| `minecraft.custom:minecraft.mob_kills` | 統計玩家擊殺非玩家實體（怪物、動物）的累積總次數。 |
| `minecraft.custom:minecraft.animals_bred` | 統計玩家使用食物餵食並使動物成功繁衍後代的累積次數。 |
| `minecraft.custom:minecraft.fish_caught` | 統計玩家使用釣魚竿成功將魚類、垃圾或寶物拉上岸的累積次數。 |
| `minecraft.custom:minecraft.clean_shulker_box` | 統計玩家在煉藥鍋中洗掉自訂界伏盒顏色的累積次數。 |
| `minecraft.custom:minecraft.clean_armor` | 統計玩家在煉藥鍋中洗掉皮革護甲染色層的累積次數。 |
| `minecraft.custom:minecraft.clean_banner` | 統計玩家在煉藥鍋中洗掉旗幟圖案層級的累積次數。 |
| `minecraft.custom:minecraft.interact_with_anvil` | 統計玩家右鍵點擊並使用鐵砧修復、命名、附魔裝備的累積次數。 |
| `minecraft.custom:minecraft.interact_with_beacon` | 統計玩家打開信標介面投餵礦物以變更全域 Buff 狀態的累積次數。 |
| `minecraft.custom:minecraft.interact_with_blast_furnace` | 統計玩家打開高爐介面的累積次數。 |
| `minecraft.custom:minecraft.interact_with_smoker` | 統計玩家打開煙燻爐介面的累積次數。 |
| `minecraft.custom:minecraft.interact_with_campfire` | 統計玩家對營火放置食材進行烹飪的累積次數。 |
| `minecraft.custom:minecraft.interact_with_cartography_table` | 統計玩家使用製圖台複製、鎖定、放大地圖的累積次數。 |
| `minecraft.custom:minecraft.interact_with_grindstone` | 統計玩家使用砂輪清除裝備附魔並獲取經驗的累積次數。 |
| `minecraft.custom:minecraft.interact_with_lectern` | 統計玩家右鍵翻閱講台書籍的累積次數。 |
| `minecraft.custom:minecraft.interact_with_loom` | 統計玩家打開織布機自訂旗幟樣式的累積次數. |
| `minecraft.custom:minecraft.interact_with_stonecutter` | 統計玩家打開切石機進行方塊塑形的累積次數。 |
| `minecraft.custom:minecraft.bell_ring` | 統計玩家手動敲響鐘方塊的累積次數。 |
| `minecraft.custom:minecraft.raid_trigger` | 統計玩家身上帶有不祥之兆狀態效果並走入村莊，進而強行觸發襲擊事件的累積次數。 |
| `minecraft.custom:minecraft.raid_win` | 統計玩家成功消滅所有襲擊波次、捍衛村莊並獲得村莊英雄稱號的累積次數。 |

#### 引擎動態註冊類（根據全遊戲 ID 自動衍生之大系家族）

| 準則識別碼大系組合式 | 自動追蹤之觸發事件與運行邏輯說明 |
| --- | --- |
| `minecraft.mined:minecraft.<方塊ID>` | **方塊挖掘統計**：自動追蹤玩家在生存模式下成功挖掘並破壞該特定方塊的累積次數。 |
| `minecraft.crafted:minecraft.<物品ID>` | **合成與燒煉統計**：自動追蹤玩家透過合成台、熔爐、切石機、織布機等任何管道製造出該特定物品的累積數量（注意：為產出的物品總個數，而非合成动作次數）。 |
| `minecraft.used:minecraft.<物品ID>` | **物品使用/放置統計**：自動追蹤玩家消耗或激活該特定物品的累積次數。對於方塊類物品，代表放置方塊；對於工具/武器，代表揮動消耗外觀耐久度；對於食物/藥水，代表飲用/食用成功。 |
| `minecraft.broken:minecraft.<物品ID>` | **工具損耗統計**：自動追蹤玩家的特定工具、武器或護甲因耐久度歸零而破裂毀壞的累積次數。 |
| `minecraft.picked_up:minecraft.<物品ID>` | **拾取物品統計**：自動追蹤玩家從地面上撿起該特定掉落物項目的累積總數量。 |
| `minecraft.dropped:minecraft.<物品ID>` | **丟棄物品統計**：自動追蹤玩家按下 Q 鍵或從背包介面將該特定物品丟棄至世界中的累積總數量。 |
| `minecraft.killed:minecraft.<生物ID>` | **擊殺特定生物統計**：自動追蹤玩家手動殺死該特定種類生物的累積次數。 |
| `minecraft.killed_by:minecraft.<生物ID>` | **被特定生物擊殺統計**：自動追蹤玩家死於該特定種類生物攻擊的累積次數。 |

---

### 2. 顯示位置 (Display Slots)

| 參數 | 說明 |
| --- | --- |
| `sidebar` | 全局右側側邊欄列表（所有隊伍皆可看見的通用側邊欄） |
| `list` | 玩家列表（按下 Tab 鍵時，顯示在玩家名稱後方的欄位） |
| `below_name` | 個人名牌下方（直接渲染在玩家角色頭頂名稱的下方，其他玩家肉眼可見） |
| `sidebar.team.<隊伍顏色>` | **隊伍專屬側邊欄**：只有屬於該特定顏色隊伍的成員，才能在自己的右側側邊欄看見此計分項（例如 `sidebar.team.red`、`sidebar.team.blue` 等所有十六種內建顏色） |

---

### 3. 渲染模式 (Render Types)

| 參數 | 說明 |
| --- | --- |
| `integer` | 數字模式：將分數以標準的阿拉伯數字格式渲染顯示。 |
| `hearts` | 心形模式：將分數轉化為一串紅心圖標進行顯示（通常與 `health` 準則搭配使用，僅在 `list` 與 `below_name` 位置生效）。 |

---

### 4. 分數運算子 (Operation Operators)
> 用於 `/scoreboard players operation` 指令，執行 `目標` 與 `源目標` 之間的分數底層代數運算（公式：`目標分數 = 目標分數 [運算符] 源目標分數`）

| 運算子 | 數學行為與運算公式說明 |
| --- | --- |
| `+=` | **加算**：將目標分數加上源目標的分數。 |
| `-=` | **減算**：將目標分數減去源目標的分數。 |
| `*=` | **乘算**：將目標分數乘以源目標的分數。 |
| `/=` | **整除除算**：將目標分數除以源目標的分數，無條件捨去小數點，僅保留整數商（若源分數為 0 則會報錯且不執行）。 |
| `%=` | **取餘數**：將目標分數除以源目標的分數，並保留其除算後的餘數。 |
| `=` | **賦值覆蓋**：將目標的分數直接覆寫並同步為與源目標完全相同的分數。 |
| `<` | **求極小值**：交叉比對兩者分數，若源目標的分數小於當前目標分數，則將目標分數更新為該較小值；反之則保持不變。 |
| `>` | **求極大值**：交叉比對兩者分數，若源目標的分數大於當前目標分數，則將目標分數更新為該較大值；反之則保持不變。 |
| `><` | **數值互換**：將目標分數與源目標的分數進行記憶體位置上的數值對調。 |

---

## 數值規則

### 分數邊界值 (Score Boundaries)

| 參數 | 說明 |
| --- | --- |
| `<分數>` | 最小值：`-2147483648` / 最大值：`2147483647`（嚴格遵守標準 32 位元有號整數上限） / 支援負數：是 / 預設值：無 / 註：若運算結果溢出最大或最小值，分數會自動繞回至整數邊界的另一端。 |

---

## 跨元素語法關聯表 (Links Matrix)

| 關聯參數欄位 | 參引語法元件名稱 |
| --- | --- |
| `<目標>` / `<源目標>` | [目標選擇器 (Target Selectors)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/target_selectors.md) |
| `<顯示名稱>` | [聊天與文本系統 (Chat and Text System)](https://www.google.com/search?q=https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/chat_system.md) |