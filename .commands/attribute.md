# `/attribute`（屬性修改指令）
* > 用於查詢、修改或重置實體（玩家或生物）的底層基礎屬性數值
* > 可為屬性添加修飾符（Modifier）以達成動態增減最大生命值、移動速度、攻擊力或擊退抗性等效果
* > 常用於 RPG 地圖製作、特殊裝備技能設計、職業系統與關卡動態平衡調整

---

## 語法結構 (Syntax)
```commands id="attribute"
/attribute <目標> <屬性名稱> get
/attribute <目標> <屬性名稱> base get <縮放比例>
/attribute <目標> <屬性名稱> base set <數值>
/attribute <目標> <屬性名稱> modifier add <UUID> <名稱> <數值> <運算模式>
/attribute <目標> <屬性名稱> modifier remove <UUID>
/attribute <目標> <屬性名稱> modifier value get <UUID> <縮放比例>
```

---

## 參數與引數拆解 (Arguments)
> 詳細解構語法中出現的每一個變數之填寫規範與底層資料型態

| 參數名稱 | 功能與語義說明 |
| --- | --- |
| `[必填]` `<目標>` | 指定要操作屬性的目標實體（通常為單一玩家或特定生物實體） |
| `[必填]` `<屬性名稱>` | 指定要管理的 Minecraft 內建實體屬性識別碼（Attribute ID） |
| `[必填]` `get` | 查詢該屬性最終計算完成的總數值（包含所有修飾符作用後的結果） |
| `[必填]` `base` | 進入該屬性的基礎值（Base Value）管理模式 |
| `[必填]` `modifier` | 進入該屬性的修飾符（Modifier）動態堆疊管理模式 |
| `[必填]` `<UUID>` | 修飾符的唯一識別碼（由四組連字號分隔的十六進位制數組組成，用於識別特定疊加效果） |
| `[必填]` `<名稱>` | 自訂該修飾符的內部文字名稱，用於程式碼內核或除錯標記 |
| `[必填]` `<數值>` | 要設定的基礎屬性值，或是修飾符要加減乘除的變量值 |
| `[必填]` `<運算模式>` | 指定修飾符對屬性數值的底層數學公式計算邏輯 |
| `[選填]` `<縮放比例>` | 查詢數值時的乘數放大係數（預設為 1.0，若設定為 100 則可將小數點數值轉為百分比整數顯示） |

---

## 參數枚舉列表 (Parameter Enumeration)

### 屬性名稱

#### 1. 通用基礎與核心物理屬性 (Generic Physics & Core)

| 參數 | 說明 |
| --- | --- |
| `generic.max_health` | 最大生命值（決定實體的心形血量上限） |
| `generic.max_absorption` | 最大吸收護盾值（實體可額外獲得的金黃色吸收心形護盾上限） |
| `generic.movement_speed` | 移動速度（基礎移動步速，數值微調即會對奔跑速度產生巨大影響） |
| `generic.scale` | 實體渲染比例（動態放大或縮小生物的肉體碰撞箱與外觀尺寸） |
| `generic.gravity` | 重力加速度（控制實體下落的加速度與受重力牽引的墜落速率） |
| `generic.step_height` | 踏步高度（實體不需要跳躍即可直接走上去的垂直方塊高度，例如 1.0 代表能走上一格高的台階） |
| `generic.jump_strength` | 跳躍強度（主要用於馬匹等特定實體的跳躍垂直高度與拋物線計算） |
| `generic.knockback_resistance` | 擊退抗性（數值介於 0.0 至 1.0 之間，1.0 代表完全免疫任何物理擊退效果） |

#### 2. 通用作戰與防禦屬性 (Generic Combat & Defense)

| 參數 | 說明 |
| --- | --- |
| `generic.attack_damage` | 攻擊傷害（徒手或基礎肉搏攻擊造成的原始傷害點數） |
| `generic.attack_knockback` | 攻擊擊退力（攻擊目標時賦予對方的物理擊退格數強度） |
| `generic.attack_speed` | 攻擊速度（決定攻擊冷卻條、蓄力槽恢復的速率快慢） |
| `generic.armor` | 防禦值（實體的基礎護甲點數，等同於裝備防具獲得的防禦線） |
| `generic.armor_toughness` | 護甲韌性（抵禦高額單次爆發傷害的韌性值，減少護甲被破甲的公式衰減） |

#### 3. 環境與環境傷害互動屬性 (Environment Interaction)

| 參數 | 說明 |
| --- | --- |
| `generic.fall_damage_multiplier` | 墜落傷害倍率（動態調整該實體摔落時所受傷害的百分比係數） |
| `generic.safe_fall_distance` | 安全墜落格數（實體在高空落下時，不會受到任何傷害的基礎緩衝高度） |
| `generic.burning_time_multiplier` | 燃燒時間倍率（影響實體著火後，火焰持續灼燒的時間縮放比例） |
| `generic.explosion_knockback_resistance` | 爆炸擊退抗性（抵抗來自 TNT、床或環境爆炸產生的物理衝擊波位移強度） |
| `generic.oxygen_bonus` | 額外含氧量（影響實體在水下呼吸槽消耗完畢前，所能額外維持的溺水緩衝時間） |
| `generic.water_movement_efficiency` | 水中移動效率（控制實體在水流或深海中移動時的阻力衰減率） |

#### 4. 玩家專屬核心屬性 (Player Exclusive)

| 參數 | 說明 |
| --- | --- |
| `player.block_break_speed` | 方塊破壞速度（玩家徒手或使用工具挖掘、砍伐方塊時的底層效率速率） |
| `player.block_interaction_range` | 方塊互動距離（玩家放置方塊、點擊箱子、拉動拉桿的最大格數範圍距離） |
| `player.entity_interaction_range` | 實體互動距離（玩家左鍵攻擊怪物、右鍵對村民交易、餵食動物的最大格數格距） |
| `player.mining_efficiency` | 挖掘效率附加值（直接疊加在工具附魔效率之外的底層採礦速率） |
| `player.sneaking_speed` | 潛行移動速度（玩家按下 Shift 蹲下移動時的步速占正常走路速度的比例） |
| `player.submerged_mining_speed` | 水下挖掘速度（調整玩家頭部沒入水中時，挖掘方塊速度被強行降速的修正係數） |
| `player.sweeping_damage_ratio` | 橫掃傷害比例（使用劍進行橫掃千軍攻擊時，對周圍副目標造成的傷害百分比強度） |
| `generic.luck` | 幸運值（影響開啟戰利品箱、釣魚時獲得高級稀有寶物的機率權重） |

#### 5. 生物與特定實體屬性 (Entity & Mob Specific)

| 參數 | 說明 |
| --- | --- |
| `generic.follow_range` | 生物追蹤半徑（判定敵對生物發現並追擊玩家的格數範圍） |
| `generic.flying_speed` | 飛行速度（鸚鵡、蜜蜂、幻翼等具備飛行能力實體在空中的移動速率） |
| `generic.spawn_reinforcements_chance` | 召喚援兵機率（殭屍專屬屬性，受到傷害時在周圍黑暗處憑空生成額外殭屍的機率） |

---

### 運算模式

| 參數 | 說明 |
| --- | --- |
| `add_value` | 加算模式（模式0）：直接將引數中的數值加到基礎屬性上。公式：`基礎值 + 修飾符數值` |
| `add_multiplied_base` | 基礎倍率乘算模式（模式1）：將修飾符數值乘以基礎值後再加算。公式：`基礎值 * (1 + 修飾符數值)` |
| `add_multiplied_total` | 總值乘算模式（模式2）：將之前所有運算完畢的總和，乘以該修飾符的變量。公式：`當前總值 * (1 + 修飾符數值)` |

---

## 數值規則

### 基礎值與修飾符數值

| 參數 | 說明 |
| --- | --- |
| `<數值>` | 最小值：依據特定屬性而定（多數屬性最小值為 0.0，部分如防禦值上限與縮放有各自安全邊界） / 最大值：1024.0（部分屬性如 scale、max_health 之絕對邊界依引擎核心設定） / 支援負數：是（例如將攻擊力加算負值可達成實體弱化效果） |

---

## 跨元素語法關聯表 (Links Matrix)

| 關聯參數欄位 | 參引語法元件名稱 |
| --- | --- |
| `<目標>` | [目標選擇器 (Target Selectors)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/target_selectors.md) |