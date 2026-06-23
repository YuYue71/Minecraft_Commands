# `/attribute`

> **分類:** `指令` | **權限等級:** `2` | **適用版本:** `JE ≤ 1.20.4` | **命令方塊:** `true`

---

## 目錄

* [語法](#語法-syntax)
* [參數說明](#參數說明-parameters)
    * [target 與 attribute](#target-與-attribute)
    * [操作類型 (Operations)](#操作類型-operations)
    * [scale (縮放比例)](#scale-縮放比例)
    * [modifier 運算模式 (Modifier Operations)](#modifier-運算模式-modifier-operations)
* [原版實體屬性 (Attributes) 完整清單](#原版實體屬性-attributes-完整清單)
* [外部連結](#外部連結-references)

---

## 語法 (Syntax)

```commands
/attribute <target> <attribute> get [scale]
/attribute <target> <attribute> base get [scale]
/attribute <target> <attribute> base set <value>
/attribute <target> <attribute> modifier add <uuid> <name> <value> <add\|multiply_base\|multiply>
/attribute <target> <attribute> modifier remove <uuid>
/attribute <target> <attribute> modifier value get <uuid> [scale]
```

* `<>` = 必填, `[]` = 選填, `\|` = 二擇一

| 參數 / 欄位 | 類型 | 預設 | 說明 |
| --- | --- | --- | --- |
| `<target>` | `entity` | - | 欲查詢或修改屬性的目標實體 |
| `<attribute>` | `string` | - | 欲操作的特定實體屬性 ID |
| `get` / `base` / `modifier` | `enum` | - | 決定對該屬性執行的操作分支 |
| `[scale]` | `float` | `1.0` | 查詢數值時的乘算放大倍率 |
| `<value>` | `float` | - | 欲設定的基礎數值或修飾符數值 |
| `<uuid>` | `string` | - | 修飾符的唯一識別碼 (UUID) |
| `<name>` | `string` | - | 修飾符的自訂名稱 (標籤文字) |
| `<add|multiply_base|multiply>` | `enum` | - | 修飾符對屬性數值的具體數學運算方式 |

---

## 參數說明 (Parameters)

### `target` 與 `attribute`

> 指定要修改哪個實體的哪項基礎能力值.

* `<target>`: 必須為單一實體. 支援使用目標選擇器 (如 `@p`, `@e[limit=1]`). 若選擇器匹配到多個實體, 指令將會執行失敗並報錯.
* `<attribute>`: 必須輸入標準的實體屬性資源位置 (如 `minecraft:generic.max_health`). 各種生物擁有的屬性不同, 若對目標使用其不具備的屬性 (例如修改殭屍的馬匹跳躍力), 指令亦會失效.

---

### `操作類型 (Operations)`

> 決定指令是要讀取數值, 覆寫基礎數值, 還是透過修飾符 (Modifier) 進行動態增減.

| 值 | 說明 |
| --- | --- |
| `get` | 獲取目標該屬性的「最終計算總值」 (包含所有修飾符, 藥水效果與裝備加成). |
| `base get` | 僅獲取目標該屬性的「基礎數值」 (不受任何裝備或藥水影響的原始值). |
| `base set` | 強制覆寫目標該屬性的「基礎數值」. |
| `modifier add` | 為該屬性新增一個獨立的數值修飾符. 必須指定一組不會與現有修飾符衝突的 `<uuid>` (格式如 `1111-222-333-444-5555`), 並給予名稱與運算規則. |
| `modifier remove` | 根據 `<uuid>` 移除指定的修飾符. |
| `modifier value get` | 讀取指定 `<uuid>` 修飾符的具體數值. |

---

### `scale (縮放比例)`

> 解決遊戲指令系統無法回傳小數點的問題.

* 當使用 `get` 相關操作時, 遊戲在聊天框或計分板中只能回傳「整數」.
* 許多屬性值 (如移動速度 `0.1`) 遠小於 1, 直接獲取會回傳 `0`.
* 透過填寫 `[scale]` (例如輸入 `100`), 系統會將原本的數值乘上此倍率後再輸出 (即 `0.1 * 100 = 10`), 方便後續利用計分板進行精確運算.

---

### `modifier 運算模式 (Modifier Operations)`

> 決定新增的修飾符是如何與現有數值進行數學交互的.

| 值 | 說明 |
| --- | --- |
| `add` | 加法運算. 直接將 `<value>` 加到屬性的總值上. 例如基礎攻擊力 2, 加上 `value=3` 的修飾符, 總攻擊力變為 5. |
| `multiply_base` | 基礎乘法. 將屬性的「基礎值」乘上 `<value>`, 再將結果加進總值中. 若有多個同類修飾符, 它們只會基於最原始的基礎值進行計算, 彼此之間互不相乘 (相加後再疊加). |
| `multiply` | 總值乘法. 結算完所有 `add` 與 `multiply_base` 後, 將當前的「暫時總值」乘上 `(1 + <value>)`. 若有多個同類修飾符, 它們會以指數形式互相乘算疊加 (利滾利). |

---

## 原版實體屬性 (Attributes) 完整清單

> 適用於 1.20.4 版本的 `<attribute>` 參數. 輸入時可省略 `minecraft:` 前綴. (註: 1.20.5+ 新增之屬性不包含於此列表)

### 通用屬性 (Generic Attributes)

| 屬性 ID | 說明 | 適用對象 | 合法數值範圍 |
| --- | --- | --- | --- |
| `generic.max_health` | **最大生命值**. 決定實體的血量上限. | 所有活動生物 | `1.0` .. `1024.0` |
| `generic.movement_speed` | **移動速度**. 影響地面的步行或奔跑速度. | 所有活動生物 | `0.0` .. `1024.0` |
| `generic.attack_damage` | **攻擊傷害**. 基礎近戰攻擊所造成的傷害點數. | 玩家與敵對生物 | `0.0` .. `2048.0` |
| `generic.attack_speed` | **攻擊速度**. 決定武器揮擊與傷害冷卻的恢復率. | 玩家與部分生物 | `0.0` .. `1024.0` |
| `generic.attack_knockback` | **攻擊擊退力**. 攻擊時對目標造成的基礎擊退距離. | 玩家與敵對生物 | `0.0` .. `5.0` |
| `generic.armor` | **護甲防禦值**. 減少受到的物理傷害. | 所有活動生物 | `0.0` .. `30.0` |
| `generic.armor_toughness` | **護甲韌性**. 抵抗高額單次傷害帶來的穿甲效果. | 所有活動生物 | `0.0` .. `20.0` |
| `generic.knockback_resistance` | **擊退抗性**. 抵抗被攻擊時擊退的機率 (`1.0` 為完全免疫). | 所有活動生物 | `0.0` .. `1.0` |
| `generic.follow_range` | **索敵範圍**. 怪物主動察覺並追蹤目標的半徑距離. | 具備 AI 的生物 | `0.0` .. `2048.0` |
| `generic.flying_speed` | **飛行速度**. 專屬飛行生物或鞘翅的動能速度. | 飛行生物與玩家 | `0.0` .. `1024.0` |
| `generic.luck` | **幸運值**. 影響戰利品表 (如釣魚, 開箱) 的高品質掉落率. | 玩家 | `-1024.0` .. `1024.0` |
| `generic.max_absorption` | **最大傷害吸收量**. 決定黃色護盾血量的上限 (1.20.2 新增). | 所有活動生物 | `0.0` .. `2048.0` |

### 特定生物屬性 (Specific Attributes)

| 屬性 ID | 說明 | 適用對象 | 合法數值範圍 |
| --- | --- | --- | --- |
| `horse.jump_strength` | **跳躍力**. 決定騎乘時長按空白鍵的最高跳躍強度. | 馬, 驢, 騾 | `0.0` .. `2.0` |
| `zombie.spawn_reinforcements` | **增援機率**. 受到攻擊時在周圍召喚新殭屍的機率. | 殭屍變種 | `0.0` .. `1.0` |

---

## 外部連結 (References)

* [Minecraft Wiki - /attribute](https://zh.minecraft.wiki/w/%E5%91%BD%E4%BB%A4/attribute)
* [目標選擇器 (Target Selectors)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/TargetSelectors.md)
* [資源位置與命名空間規範 (Resource Locations)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/ResourceLocations.md)