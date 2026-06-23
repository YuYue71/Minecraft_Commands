# /team

> **分類:** `指令` | **權限等級:** `2` | **適用版本:** `JE ≤ 1.20.4` | **命令方塊:** `true`

---

## 目錄

* [語法](#語法-syntax)
* [參數說明](#)
  * [管理指令 (add, remove, list, empty)](#管理指令-add-remove-list-empty)
  * [成員指令 (join, leave)](#成員指令-join-leave)
  * [修改指令 (modify)](#修改指令-modify)
* [枚舉值窮舉清單](#枚舉值窮舉清單)
* [外部連結](#外部連結-references)

---

## 語法 (Syntax)

```commands
/team add <team> [<displayName>]
/team remove <team>
/team list [<team>]
/team empty <team>
/team join <team> [<members>]
/team leave <members>
/team modify <team> <option> <value>
```

* `<>` = 必填, `[]` = 選填, `|` = 二擇一, `..` = 範圍 (如 `1..10`)

| 參數 / 欄位 | 類型 | 預設 | 說明 |
| --- | --- | --- | --- |
| `<team>` | `string` | - | 隊伍的內部唯一識別名稱 |
| `[displayName]` | `JSON` | - | 隊伍顯示在介面上的名稱 |
| `[members]` | `Target Selector` | - | 指定加入或離開隊伍的實體 (預設為執行者) |
| `<option>` | `enum` | - | 欲修改的隊伍屬性選項 |
| `<value>` | `mixed` | - | 根據選項提供的具體參數值 |

---

## 參數說明 (Parameters)

### 管理指令 (add, remove, list, empty)

> 用於建立, 刪除或查看隊伍結構.

| 子指令 | 說明 |
| --- | --- |
| `add` | 建立一個新隊伍. |
| `remove` | 刪除指定的隊伍. |
| `list` | 列出所有隊伍. 若指定隊伍名稱則列出該隊伍成員. |
| `empty` | 移除指定隊伍中的所有成員. |

---

### 成員指令 (join, leave)

> 用於操作實體與隊伍之間的歸屬關係.

| 子指令 | 說明 |
| --- | --- |
| `join` | 將指定實體加入特定隊伍. 實體會自動脫離原先的隊伍. |
| `leave` | 將指定實體從其當前所屬的隊伍中移除. |

---

### 修改指令 (modify)

> 調整隊伍的視覺外觀, 社交機制與戰鬥行為.

| 選項 (Option) | 說明 | 數值類型 (Value) |
| --- | --- | --- |
| `displayName` | 修改隊伍顯示名稱. | `JSON` |
| `color` | 修改隊伍顏色 (影響成員名字顏色與發光輪廓). | `enum (顏色)` |
| `prefix` | 設置隊伍成員名字的前綴. | `JSON` |
| `suffix` | 設置隊伍成員名字的後綴. | `JSON` |
| `friendlyFire` | 是否允許隊友之間互相傷害. | `boolean` |
| `seeFriendlyInvisibles` | 是否允許隊友看見隱形的隊友 (呈現半透明). | `boolean` |
| `nametagVisibility` | 設置名字標籤的可見度規則. | `enum (可見性)` |
| `deathMessageVisibility` | 設置死亡訊息的可見度規則. | `enum (可見性)` |
| `collisionRule` | 設置實體碰撞規則. | `enum (碰撞)` |

---

## 枚舉值窮舉清單

### 隊伍顏色 (Color)

| 值 | 說明 |
| --- | --- |
| `black` | 黑色 |
| `dark_blue` | 深藍色 |
| `dark_green` | 深綠色 |
| `dark_aqua` | 深青色 |
| `dark_red` | 深紅色 |
| `dark_purple` | 深紫色 |
| `gold` | 金色 |
| `gray` | 灰色 |
| `dark_gray` | 深灰色 |
| `blue` | 藍色 |
| `green` | 綠色 |
| `aqua` | 青色 |
| `red` | 紅色 |
| `light_purple` | 淺紫色 |
| `yellow` | 黃色 |
| `white` | 白色 |
| `reset` | 重設為預設顏色 (預設值) |

### 可見性規則 (Visibility)
*適用於 `nametagVisibility` 與 `deathMessageVisibility`*

| 值 | 說明 |
| --- | --- |
| `always` | 所有人皆可見 (預設值). |
| `never` | 所有人皆不可見. |
| `hideForOtherTeams` | 僅隊友可見. |
| `hideForOwnTeam` | 僅隊友不可見. |

### 碰撞規則 (Collision Rule)

| 值 | 說明 |
| --- | --- |
| `always` | 與所有實體發生碰撞 (預設值). |
| `never` | 不與任何實體發生碰撞. |
| `pushOtherTeams` | 僅推擠其他隊伍的成員. |
| `pushOwnTeam` | 僅推擠同隊伍的成員. |

---

## 外部連結 (References)

* [Minecraft Wiki - /team](https://zh.minecraft.wiki/w/%E5%91%BD%E4%BB%A4/team)
* [目標選擇器 (Target Selectors)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/TargetSelectors.md)
* [JSON 文本元件 (Raw JSON Text Components)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/json_text.md)