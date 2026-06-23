# /stopsound

> **分類:** `指令` | **權限等級:** `2` | **適用版本:** `JE ≤ 1.20.4` | **命令方塊:** `true`

---

## 目錄

* [語法](#語法-syntax)
* [參數說明](#參數說明-parameters)
    * [targets](#targets)
    * [source 與 sound](#source-與-sound)
* [原版音效來源頻道 (Sound Sources) 清單](#原版音效來源頻道-sound-sources-清單)
* [外部連結](#外部連結-references)

---

## 語法 (Syntax)

```commands
/stopsound <targets>
/stopsound <targets> <source>
/stopsound <targets> <source> <sound>
```

* `<>` = 必填, `[]` = 選填 (在此指令中, 藉由省略後方參數來達成大範圍停止)

| 參數 / 欄位 | 類型 | 預設 | 說明 |
| --- | --- | --- | --- |
| `<targets>` | `entity` | - | 欲停止播放音效的目標玩家 |
| `[source]` | `enum` | `*` (所有頻道) | 欲停止的特定音效分類頻道 |
| `[sound]` | `string` | - | 欲停止的特定音效 ID (資源位置) |

---

## 參數說明 (Parameters)

### `targets`

> 指定哪些玩家的客戶端需要停止播放聲音.

* 必須為玩家 (Player) 實體, 支援使用目標選擇器 (如 `@a`, `@p`).
* 由於遊戲的聲音渲染是完全由各個玩家的客戶端獨立計算的, 因此必須精確選擇玩家. 若選擇了非玩家實體 (如 `@e[type=pig]`), 指令將會執行失敗並報錯.

---

### `source` 與 `sound`

> 作為過濾器, 決定具體要停止哪些正在播放的聲音. 兩者皆為選填, 系統會根據填寫的精確度來執行對應操作:

* **都不填寫 (僅輸入 `/stopsound <targets>`)**:
直接強制停止該玩家當前聽見的**所有**聲音 (包含背景音樂, 環境音, 以及所有實體發出的聲音).
* **僅填寫 `source**`:
停止該玩家在指定頻道 (如 `music` 或 `weather`) 中的所有聲音. 非常適合用來強制切斷原版的背景音樂, 以便無縫銜接並播放自訂的資源包音樂.
* **兩者皆填寫**:
精準停止該頻道中的特定聲音 (如 `minecraft:entity.ender_dragon.death`). 若該聲音正在其他頻道播放, 則不會被停止.
* **萬用字元 `***`:
在 `source` 參數中, 允許輸入 `*` 來代表「所有頻道」. 例如 `/stopsound @a * minecraft:music.dragon`, 系統將會無視該音樂被歸類在哪個頻道, 強制將其停止.

---

## 原版音效來源頻道 (Sound Sources) 清單

> 對應 `<source>` 參數, 完全映射遊戲內的音效設定頻道.

| 音效來源 ID | 遊戲設定對應名稱 | 說明 |
| --- | --- | --- |
| `*` | 所有頻道 | 特殊萬用字元, 指代以下所有頻道. |
| `master` | 主音量 | 不受任何特定分類限制的根頻道. |
| `music` | 音樂 | 用於背景音樂與王戰音樂. |
| `record` | 唱片機/音符盒 | 用於音樂唱片與音符盒發出的聲音. |
| `weather` | 天氣 | 用於雨聲, 雷聲等自然氣候音效. |
| `block` | 方塊 | 用於放置, 破壞, 踩踏方塊等聲音. |
| `hostile` | 敵對生物 | 用於殭屍, 骷髏等怪物發出的聲音. |
| `neutral` | 友善生物 | 用於豬, 牛, 羊等被動或中立生物發出的聲音. |
| `player` | 玩家 | 用於玩家受傷, 攻擊, 飲食等聲音. |
| `ambient` | 環境/光影 | 用於洞穴音效與環境氛圍聲音. |
| `voice` | 語音/旁白 | 用於文字轉語音旁白功能的獨立頻道. |

---

## 外部連結 (References)

* [Minecraft Wiki - /stopsound](https://zh.minecraft.wiki/w/%E5%91%BD%E4%BB%A4/stopsound)
* [目標選擇器 (Target Selectors)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/TargetSelectors.md)
* [音效 ID (Sound effects)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/SoundEffects.md)
* [資源位置與命名空間規範 (Resource Locations)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/ResourceLocations.md)
* [/playsound](https://github.com/YuYue71/Minecraft_Commands/blob/main/.commands/playsound.md)