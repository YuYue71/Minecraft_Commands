# /playsound

> **分類:** `指令` | **權限等級:** `2` | **適用版本:** `JE ≤ 1.20.4` | **命令方塊:** `true`

---

## 目錄

* [語法](#語法-syntax)
* [參數說明](#參數說明-parameters)
    * [sound 與 source](#sound-與-source)
    * [targets 與 pos](#targets-與-pos)
    * [volume, pitch 與 minVolume](#volume-pitch-與-minvolume)
* [原版音效來源頻道 (Sound Sources) 清單](#原版音效來源頻道-sound-sources-清單)
* [外部連結](#外部連結-references)

---

## 語法 (Syntax)

```commands
/playsound <sound> <source> <targets> [pos] [volume] [pitch] [minVolume]

```

* `<>` = 必填, `[]` = 選填

| 參數 / 欄位 | 類型 | 預設 | 說明 |
| --- | --- | --- | --- |
| `<sound>` | `string` | - | 欲播放的音效 ID (資源位置) |
| `<source>` | `enum` | - | 決定音效播放的聲音分類頻道 |
| `<targets>` | `entity` | - | 欲聽見音效的目標玩家 |
| `[pos]` | `vec3` | 執行者當前位置 | 聲音發出的三維中心點座標 |
| `[volume]` | `float` | `1.0` | 聲音的播放音量與傳播半徑倍率 |
| `[pitch]` | `float` | `1.0` | 聲音的音調與播放速度 (0.0..2.0) |
| `[minVolume]` | `float` | `0.0` | 距離過遠時的最低保障音量 (0.0..1.0) |

---

## 參數說明 (Parameters)

### `sound` 與 `source`

> 指定要播放什麼聲音, 以及它歸屬於遊戲設定中的哪個音量頻道.

* `<sound>`: 必須輸入標準的音效資源位置 (如 `minecraft:entity.zombie.ambient`, `minecraft:block.bell.use`). 若有安裝客戶端資源包 (Resource Pack), 亦可輸入自訂的音效 ID.
* `<source>`: 決定此聲音對應玩家「選項 > 音效設定」中的哪個拉桿. 若玩家將該頻道的音量拉至 0%, 則無論指令如何設定, 玩家皆無法聽見此聲音.

---

### `targets` 與 `pos`

> 決定誰能聽見聲音, 以及聲音是從哪裡傳來的.

* `<targets>`: 只能是玩家 (Player) 實體. 支援使用目標選擇器 (如 `@a`, `@p`). 只有符合條件的玩家客戶端會接收到播放聲音的封包, 其他玩家完全聽不見.
* `[pos]`: 聲音發生的立體聲來源位置. 支援絕對座標與相對座標 (`~`, `^`). 此座標會與玩家的當前位置計算出 3D 環繞音效 (如左耳或右耳聽見).

---

### `volume`, `pitch` 與 `minVolume`

> 精確控制聲音的物理表現與衰減邏輯.

* `[volume]`: 設定聲音的音量. 正常值為 `0.0` 到 `1.0`. 若輸入大於 `1.0` 的數值, 距離聲源極近時的最高音量並不會突破 100%, 而是會**按比例擴大聲音的傳播半徑** (預設傳播半徑為 `16 * volume` 格).
* `[pitch]`: 設定聲音的音高與播放速度, 有效範圍為 `0.0` 到 `2.0`. 小於 `1.0` 時聲音會變得低沉且緩慢, 大於 `1.0` 時聲音會變得尖銳且急促.
* `[minVolume]`: 當玩家處於聲音的正常傳播半徑之外時, 強制給予的最小音量. 若設為 `1.0`, 則該玩家無論距離聲源多遠, 都能以 100% 的音量聽見該聲音, 非常適合用於製作無視距離的全伺服器音效廣播.

---

## 原版音效來源頻道 (Sound Sources) 清單

> 對應 `<source>` 參數, 完全映射遊戲內的音效設定頻道.

| 音效來源 ID | 遊戲設定對應名稱 | 說明 |
| --- | --- | --- |
| `master` | 主音量 | 不受任何特定分類限制, 僅受主音量拉桿控制. |
| `music` | 音樂 | 用於背景音樂. |
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

* [Minecraft Wiki - /playsound](https://zh.minecraft.wiki/w/%E5%91%BD%E4%BB%A4/playsound)
* [音效 ID (Sound effects)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/SoundEffects.md)
* [目標選擇器 (Target Selectors)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/TargetSelectors.md)
* [座標系統 (Coordinate Systems)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/coordinates.md)
* [資源位置與命名空間規範 (Resource Locations)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/ResourceLocations.md)
* [/stopsound](https://github.com/YuYue71/Minecraft_Commands/blob/main/.commands/stopsound.md)