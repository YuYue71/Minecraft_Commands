# `/data`（資料標籤管理指令）
* > 用於直接查詢、修改、合併或清除方塊實體（Block Entities）與實體（Entities）底層的 NBT（Named Binary Tag）資料結構
* > 支援跨物件的資料複製與儲存，是實現高階動態邏輯、自訂屬性儲存與自動化系統的核心指令
* > 常用於複雜地圖機制開發、自訂特殊裝備屬性、儲存全域變數與動態修改生物行為

---

## 語法結構 (Syntax)
```commands id="data"
/data get block <座標> <路徑> <縮放比例>
/data get entity <目標> <路徑> <縮放比例>
/data get storage <資料夾名稱> <路徑> <縮放比例>
/data merge block <座標> <NBT資料>
/data merge entity <目標> <NBT資料>
/data merge storage <資料夾名稱> <NBT資料>
/data modify block <座標> <路徑> <修改模式> from block <源座標> <源路徑>
/data modify block <座標> <路徑> <修改模式> from entity <源目標> <源路徑>
/data modify block <座標> <路徑> <修改模式> from storage <源資料夾名稱> <源路徑>
/data modify block <座標> <路徑> <修改模式> value <NBT值>
/data modify entity <目標> <路徑> <修改模式> from block <源座標> <源路徑>
/data modify entity <目標> <路徑> <修改模式> from entity <源目標> <源路徑>
/data modify entity <目標> <路徑> <修改模式> from storage <源資料夾名稱> <源路徑>
/data modify entity <目標> <路徑> <修改模式> value <NBT值>
/data modify storage <資料夾名稱> <路徑> <修改模式> from block <源座標> <源路徑>
/data modify storage <資料夾名稱> <路徑> <修改模式> from entity <源目標> <源路徑>
/data modify storage <資料夾名稱> <路徑> <修改模式> from storage <源資料夾名稱> <源路徑>
/data modify storage <資料夾名稱> <路徑> <修改模式> value <NBT值>
/data remove block <座標> <路徑>
/data remove entity <目標> <路徑>
/data remove storage <資料夾名稱> <路徑>
```

---

## 參數與引數拆解 (Arguments)
> 詳細解構語法中出現的每一個變數之填寫規範與底層資料型態

| 參數名稱 | 功能與語義說明 |
| --- | --- |
| `[必填]` `get` | 查詢指令，用於讀取並在聊天欄顯示指定的 NBT 資料標籤值 |
| `[必填]` `merge` | 合併指令，將新輸入的 NBT 標籤與目標現有的 NBT 標籤進行融合與覆蓋 |
| `[必填]` `modify` | 修改指令，對特定 NBT 路徑進行高階的動態增減、替換或跨物件資料串接 |
| `[必填]` `remove` | 移除指令，直接將指定的 NBT 標籤或路徑節點從目標中徹底刪除 |
| `[必填]` `block` | 指定操作目標為世界中的方塊實體（例如：箱子、熔爐、命令方塊、告示牌） |
| `[必填]` `entity` | 指定操作目標為遊戲世界中的實體（例如：玩家、殭屍、掉落物、盔甲架） |
| `[必填]` `storage` | 指定操作目標為全域獨立的資料儲存空間（獨立於任何方塊與實體，重載地圖亦會保留） |
| `[必填]` `<座標>` / `<源座標>` | 標記方塊實體在三維空間中的精確位置座標 |
| `[必填]` `<目標>` / `<源目標>` | 指定要操作的目標實體（注意：modify 與 merge 模式無法直接修改玩家實體 NBT） |
| `[必填]` `<資料夾名稱>` | 全域儲存空間的命名空間識別碼（格式為 `命名空間:識別路徑`，如 `custom_rpg:player_stats`） |
| `[選填]` `<路徑>` / `<源路徑>` | 指定 NBT 內部的特定標籤節點路徑（使用點號 `.` 分隔層級，使用方括號 `[]` 指定陣列索引） |
| `[選填]` `<縮放比例>` | 讀取數值時的乘數放大係數（僅在 get 模式中生效，可將小數點資料放大為整數顯示） |
| `[必填]` `<修改模式>` | 指定 modify 子指令在操作路徑時的底層結構對接邏輯 |
| `[必填]` `<NBT資料>` / `<NBT值>` | 符合標準 SNBT（Stringified NBT）格式的標籤資料內容 |

---

## 參數枚舉列表 (Parameter Enumeration)

### 修改模式 (Modify Modes)

| 參數 | 說明 |
| --- | --- |
| `append` | 追加模式：將源資料作為新元素，添加至目標數組（List）標籤的末尾 |
| `insert <索引值>` | 插入模式：將源資料插入至目標數組（List）指定的索引位置（原位置後的元素自動後移） |
| `merge` | 合併模式：將源資料結構與目標物件或複合標籤（Compound）進行欄位合併 |
| `prepend` | 前置追加模式：將源資料作為新元素，插入至目標數組（List）的最前端（索引 0 的位置） |
| `set` | 覆蓋模式：將目標路徑對應的現有標籤數值或結構，直接替換為源資料內容 |

---

### 常用 NBT 路徑示例 (NBT Path Examples)

| 參數 | 說明 |
| --- | --- |
| `CustomName` | 實體或方塊容器的自訂自定義名稱（JSON 文本組格式） |
| `Items` | 容器方塊（如箱子）或生物背包內的所有物品清單列表數組 |
| `Items[0].id` | 容器內第一個欄位（Slot 0）中物品的物品識別碼（Item ID） |
| `Health` | 生物或實體的當前生命值點數（Float 單精度浮點數） |
| `Rotation[0]` | 實體的水平朝向偏航角（Yaw）數值 |
| `Motion` | 實體的當前三軸運動向量速度列表（由三個雙精度浮點數組成的數組） |
| `ArmorItems` | 生物身上裝備的護甲四件套數據（由腳至頭依序排列） |
| `ForgeData` | 常用於儲存模組、插件或自訂腳本的第三方核心變數外掛空間 |

---

## 數值規則

### 縮放比例 (Scale Coefficient)

| 參數 | 說明 |
| --- | --- |
| `<數值>` | 最小值：無限制（但不可為 0.0） / 最大值：無限制 / 支援負數：是 / 預設值：1.0 / 註：常用於將 Health 或 Motion 等浮點數乘以 100 或 1000 以配合 `scoreboard` 進行整數儲存 |

### 插入索引值 (Insert Index)

| 參數 | 說明 |
| --- | --- |
| `<整數>` | 最小值：0 / 最大值：依當前數組長度而定 / 支援負數：否 / 註：若輸入 0 代表插入至數組最前方，等同於 `prepend` 效果 |

---

## 核心限制與安全防護規範
> 由於 `/data` 指令直接操作底層記憶體資料結構，引擎設有硬性保護機制：

1. **玩家 NBT 修改封鎖**：
* 引擎完全禁止使用 `merge` 或 `modify` 去直接改動「玩家（Player）」實體的底層 NBT 數據（例如無法直接修改玩家的 `Health`、`Inventory` 或 `Abilities`）。
* **替代方案**：若需要修改玩家數據，必須先將玩家資料複製到 `storage` 或「盔甲架」等載體，在載體修改完畢後，透過給予效果（如 `/effect`）、修改屬性（如 `/attribute`）或物品替換（如 `/item`）間接反饋至玩家身上。


2. **實體 UUID 保護**：
* 無法透過 `/data` 修改實體的 `UUID` 標籤，避免造成核心物件索引衝突與區塊資料損壞。



---

## 跨元素語法關聯表 (Links Matrix)

| 關聯參數欄位 | 參引語法元件名稱 |
| --- | --- |
| `<目標>` / `<源目標>` | [目標選擇器 (Target Selectors)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/target_selectors.md) |
| `<座標>` / `<源座標>` | [空間座標系統全指南 (Coordinates)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/coordinates.md) |