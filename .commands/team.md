# `/team`（隊伍系統管理指令）
* > 用於建立、管理與配置遊戲世界的隊伍（Teams）架構，負責將玩家或實體進行分組
* > 透過變更隊伍屬性，可直接干涉遊戲引擎底層的碰撞箱機制、名字標籤渲染、隊友傷害判定以及計分板側邊欄過濾
* > 常用於多陣營 PVP 地圖、多玩家協力 PVE 副本、友軍傷害保護（Anti-Friendly Fire）以及名牌客製化視覺設計

---

## 語法結構 (Syntax)
```commands id="team_management"
/team list
/team list <隊伍名稱>
/team add <隊伍名稱> [<顯示名稱>]
/team remove <隊伍名稱>
/team empty <隊伍名稱>
/team join <隊伍名稱> [<目標>]
/team leave [<目標>]
```
```commands id="team_modification"
/team modify <隊伍名稱> displayName <顯示名稱>
/team modify <隊伍名稱> color <顏色>
/team modify <隊伍名稱> prefix <前綴>
/team modify <隊伍名稱> suffix <後綴>
/team modify <隊伍名稱> friendlyFire <true|false>
/team modify <隊伍名稱> seeFriendlyInvisibles <true|false>
/team modify <隊伍名稱> nametagVisibility <可見性模式>
/team modify <隊伍名稱> deathMessageVisibility <可見性模式>
/team modify <隊伍名稱> collisionRule <碰撞規則>
```

---

## 參數與引數拆解 (Arguments)
> 詳細解構語法中出現的每一個變數之填寫規範與底層資料型態

| 參數名稱 | 功能與語義說明 |
| --- | --- |
| `[必填]` `list` | 查詢關鍵字，用於列出世界中所有隊伍，或單獨列出指定隊伍內的所有成員名單 |
| `[必填]` `add` | 建立關鍵字，用於新增一個隊伍欄位 |
| `[必填]` `remove` | 刪除關鍵字，用於解散並徹底移除指定隊伍（隊伍內成員會自動退隊） |
| `[必填]` `empty` | 清空關鍵字，用於強制將指定隊伍內的所有成員一次性全部踢出，但保留隊伍本體 |
| `[必填]` `join` | 加入關鍵字，將指定目標實體編入該隊伍中（一個實體同時只能屬於一個隊伍） |
| `[必填]` `leave` | 脫離關鍵字，將指定目標實體從其當前所屬的隊伍中移除 |
| `[必填]` `modify` | 屬性變更關鍵字，用於動態調整隊伍的各項核心底層參數與視覺外觀 |
| `[必填]` `<隊伍名稱>` | 隊伍的內部唯一識別名稱字串（ID），用於指令內部定址 |
| `[選填]` `<顯示名稱>` | 顯示在聊天欄或特定介面上的外顯文字（支援 JSON 文本組格式，若省略預設同隊伍名稱） |
| `[選填]` `<目標>` | 指定要操作的目標實體選擇器或虛擬玩家字串（若在 `join` 或 `leave` 中省略，預設為執行指令者本人） |
| `[必填]` `<顏色>` | 指定隊伍的代表顏色，會直接同步變更隊友名牌、TAB 列表名稱與發光邊框（Glowing）的渲染色彩 |
| `[必填]` `<前綴>` / `<後綴>` | 附加在隊伍成員名稱前後的文本字串（支援 JSON 文本組格式，常用於稱號或公會字尾） |

---

## 參數枚舉列表 (Parameter Enumeration)

### 1. 核心控制開關 (Option Toggles)

| 屬性名稱 | 可選參數 | 引擎底層行為與運行邏輯說明 |
| --- | --- | --- |
| `friendlyFire` | `true`/`false` | **友軍傷害**：設定為 `false` 時，同一隊伍的成員之間將無法互相造成肉體物理傷害（免疫箭矢、近戰揮砍、藥水濺射，但仍會受到範圍性環境爆炸波及）。 |
| `seeFriendlyInvisibles` | `true`/`false` | **看見隱形隊友**：設定為 `true` 時，當隊友處於「隱形狀態效果」下，同隊成員仍可看見其呈現半透明、幽靈狀的渲染外觀（且能看見其護甲）。 |

---

### 2. 可見性控制模式 (Visibility Modes)
> 用於 `nametagVisibility`（名字標籤可見性）與 `deathMessageVisibility`（死亡訊息可見性）

| 模式參數 | 說明與渲染邊界 |
| --- | --- |
| `always` | **總是可見**（系統預設）：所有玩家不論敵友，皆能看見該隊伍成員的頭頂名牌或死亡訊息。 |
| `never` | **總是隱藏**：所有玩家皆無法看見該隊伍成員的頭頂名牌，且其死亡訊息不會在左下角聊天欄廣播。 |
| `hideForOtherTeams` | **僅對敵對陣營隱藏**：只有同隊的隊友才能看見名牌/死亡訊息，非本隊的外人皆無法看見（常用於團隊對抗賽）。 |
| `hideForOwnTeam` | **僅對自己隊友隱藏**：除了自己隊伍的隊友看不見外，其餘所有外人、敵對陣營玩家皆能正常看見其名牌/死亡訊息。 |

---

### 3. 實體碰撞箱規則 (Collision Rules)
> 用於 `collisionRule`，控制引擎底層實體相互推擠、卡位的碰撞體交疊邏輯

| 規則參數 | 說明與物理推擠行為 |
| --- | --- |
| `always` | **總是碰撞**（系統預設）：此隊伍成員與世界上的任何實體（不論敵友、甚至是怪物）皆會發生真實的物理推擠與卡位。 |
| `never` | **徹底關閉碰撞**：此隊伍成員在移動時，會直接穿透任何實體的碰撞箱，無法推擠任何人，也不會被任何人推擠。 |
| `pushOtherTeams` | **僅推擠外人**：此隊伍成員之間移動時不會互相推擠（無障礙穿透隊友），但會推擠非本隊的其他玩家或實體。 |
| `pushOwnTeam` | **僅推擠隊友**：此隊伍成員之間移動時會發生激烈的推擠卡位，但面對非本隊的外人時，會直接穿透對方。 |

---

### 4. 系統內建顏色矩陣 (Team Colors)
> 用於 `modify <隊伍名稱> color <顏色>`，同時會影響目標實體在 `glowing`（發光）狀態下的外框線顏色

| 顏色識別碼 | 說明 | 顏色識別碼 | 說明 |
| --- | --- | --- | --- |
| `black` | 深黑色 | `dark_blue` | 深藍色 |
| `dark_green` | 深綠色 | `dark_aqua` | 深青色（青碧色） |
| `dark_red` | 深紅色 | `dark_purple` | 深紫色 |
| `gold` | 金黃色 | `gray` | 淺灰色 |
| `dark_gray` | 深灰色 | `blue` | 藍色 |
| `green` | 綠色 | `aqua` | 青色（水藍色） |
| `red` | 紅色 | `light_purple` | 亮紫色（粉紫色） |
| `yellow` | 黃色 | `white` | 純白色 |
| `reset` | **重置清除**（恢復系統預設白/名字不發光） |  |  |

---

## 數值與字串規則

### 隊伍識別碼限制 (Team ID Rules)

| 限制項目 | 規範與技術邊界說明 |
| --- | --- |
| **字元合法性** | 隊伍 ID 必須為合法的單一連續字串，內部名稱嚴禁包含空格。 |
| **長度邊界** | 隊伍唯一識別名稱字串長度**不可超過 16 個字元**。 |
| **重置覆蓋行為** | 執行 `team add` 時若名稱與已有隊伍衝突會直接報錯；若執行 `join`，目標實體會自動脫離原先的隊伍，並強行移編至新隊伍。 |

---

## 跨元素語法關聯表 (Links Matrix)

| 關聯參數欄位 | 參引語法元件名稱 |
| --- | --- |
| `<目標>` | [目標選擇器 (Target Selectors)](https://www.google.com/search?q=https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/target_selectors.md) |
| 目標選擇器篩選器範例 | `[team=隊伍名]`、`[team=!隊伍名]`（排除）、`[team=]`（篩選無隊伍者） |
| `<顯示名稱>` / `<前綴>` / `<後綴>` | [Raw JSON 文本 NBT 格式 (Legacy Text Component)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.data_structures/nbt_legacy/text_components_legacy.md) |
| 動態渲染過濾掛載 | [計分板系統指令 (Scoreboard Display Slots)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.commands/scoreboard.md) 中的 `sidebar.team.<顏色>` 區塊 |