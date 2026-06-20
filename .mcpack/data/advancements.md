# advancements/ 成就進度
- > 用於定義玩家在遊戲中的成就樹, 控制視覺 UI 展示
- > 負責監聽底層遊戲引擎的各類事件（Criteria Triggers）, 取代高頻命令方塊檢測
- > 支援觸發後的自動回饋（Rewards）, 可精確配發戰利品, 解鎖配方或執行自訂函數

## 注意事項
- advancements 資料夾內每個檔案必須以 `.json` 結尾
- 嚴禁將 minecraft:tick 作為無條件泛用的後端掛載點, 若進度條件過於複雜, 讓其以每秒 20 次的頻率對全伺服器玩家進行比對, 其造成的記憶體遍歷開銷將等同於甚至超越傳統高頻指令方塊, 應當嚴格遵循「事件導向思維」, 只有在必須精準定位如「玩家裝備耐久歸零瞬間」這類無明確 trigger 的邊緣情況下，才動用 tick 配合精確的 NBT 篩選

---

## json 檔案內容格式
### 結構
```json
{
  "display": {
    "icon": { "item": "minecraft:stone" },
    "title": "進度標題",
    "description": "進度敘述",
    "frame": "task",
    "show_toast": true,
    "announce_to_chat": true,
    "hidden": false
  },
  "parent": "命名空間:父節點路徑",
  "criteria": {
    "自訂條件鍵值": {
      "trigger": "觸發器識別碼",
      "conditions": {
        // 觸發器專屬的篩選條件
      }
    }
  },
  "requirements": [
    ["自訂條件鍵值"]
  ],
  "rewards": {
    "experience": 0,
    "loot": [],
    "recipes": [],
    "function": "命名空間:函數路徑"
  },
  "sends_telemetry_event": false
}
```

---

### 包含元素
|類型|參數|說明|
|---|---|---|
|[必填]觸發器|[`"criteria": { ... }`](#criteria----觸發器)|整個進度的引擎核心, 告訴伺服器「何時, 發生什麼事情時」要觸發這個進度|
|[選填]顯示|[`"display": { ... }`](#display----顯示)|決定該進度在前端（玩家遊戲介面）的渲染與互動方式|
|[選填]前一級進度|[`"parent": "命名空間:進度路徑"`](#parent-命名空間進度路徑-前一級進度)|定義此進度在成就樹狀圖中的「上一層（父節點）」是誰, 用於建構 UI 上的連線關係|
|[選填]觸發器組合|[`"requirements": [ ... ]`](#requirements----觸發器組合)|定義 criteria 裡的多個條件需要如何組合, 才能算「達成此進度」, 底層採用合取範式（AND 與 OR 的組合）|
|[選填]獎品|[`"rewards": { ... }`](#rewards----獎品)|當玩家滿足 requirements（或 criteria）的瞬間, 引擎自動且零延遲派發的獎勵或動作|
|[選填]遙測數據上報|[`"sends_telemetry_event": bool`](#sends_telemetry_event-bool-遙測數據上報)|Minecraft 1.19.3 引入的底層機制, 決定當玩家達成此進度時, 是否要向 Mojang 官方伺服器發送遙測（Telemetry）數據(預設false)|

---

### `"criteria": { ... }` 觸發器
> 這是監聽事件的核心區域, 其 trigger 對照表請參考：[Minecraft Wiki: 進度觸發器列表](https://minecraft.fandom.com/zh/wiki/%E8%BF%9B%E5%BA%A6/JSON%E6%A0%BC%E5%BC%8F?so=search#minecraft:allay_drop_item_on_block)

|子元素|說明|
|---|---|
|<自訂鍵值>|開發者自行設定的條件名稱, 用於 requirements 引用|
|trigger|指定監聽的遊戲事件代碼|
|conditions|根據該 Trigger 要求的細部參數（如 player, entity, item 等篩選條件）|

---

### `"display": { ... }` 顯示
> 若存在此物件, 進度將在 UI 中呈現

|子元素|說明|
|---|---|
|icon|定義圖示資訊（item: 物品 ID；nbt: 選填的 SNBT 字串）|
|title|進度顯示標題（支援 JSON 文字格式）|
|description|進度顯示敘述（支援 JSON 文字格式）|
|frame|進度外框樣式（task, goal, challenge）|
|show_toast|達成時是否顯示右上角提示彈窗|
|announce_to_chat|達成時是否在聊天欄發布公告|
|hidden|是否在達成前隱藏此進度及其後續節點|

---

### `"parent": "命名空間:進度路徑"` 前一級進度
> 定義該進度掛在誰的下面（顯示連線關係）
- 作用
    - 建立樹狀圖: 指向其他進度路徑, 使介面呈現前後邏輯
    - 定義新分頁: 若不填 parent, 該進度會成為一個全新分頁的「根節點（Root）」
- 注意: 不可循環引用（A 指 B, B 指 A）, 且必須是合法的命名空間路徑

---

### `"requirements": [ ... ]` 觸發器組合

|子元素|說明|
|---|---|
|requirements|控制達成條件的邏輯, 如 [[""A"", ""B""], [""C""]] 表示 (A 或 B) 且 C|

---

### `"rewards": { ... }` 獎品
> 觸發後的自動化指令執行區

|子元素|說明|
|---|---|
|experience|給予玩家的經驗值總量|
|loot|觸發戰利品表（Loot Tables）的資源路徑列表|
|recipes|給予玩家解鎖的合成配方 ID 列表|
|function|達成時以該玩家為執行者, 觸發的 .mcfunction 函數檔案路徑|

---

### `"sends_telemetry_event": bool` 遙測數據上報
> 這裡就只有 true/false 而已, 看要不要都沒差

---

## 跨元素語法關聯表 (Links Matrix)

| 關聯參數欄位 | 參引語法元件名稱 |
| --- | --- |
| 函式指令 | [/function（函數執行指令）](https://github.com/YuYue71/Minecraft_Commands/blob/main/.commands/function.md) |
| `<JSON訊息>` | [文本NBT標籤](https://github.com/YuYue71/Minecraft_Commands/blob/main/.data_structures/nbt_legacy/text_components_legacy.md) |
| Minecraft Wiki | [進度觸發器列表](https://minecraft.fandom.com/zh/wiki/%E8%BF%9B%E5%BA%A6/JSON%E6%A0%BC%E5%BC%8F?so=search#minecraft:allay_drop_item_on_block) |