# /defaultgamemode

> **分類:** `指令` | **權限等級:** `2` | **適用版本:** `JE ≤ 1.20.4` | **命令方塊:** `true`

---

## 目錄

* [語法](#語法-syntax)
* [參數說明](#參數說明-parameters)
    * [mode](#mode)
* [外部連結](#外部連結-references)

---

## 語法 (Syntax)

```commands
/defaultgamemode <mode>

```

* `<>` = 必填

| 參數 / 欄位 | 類型 | 預設 | 說明 |
| --- | --- | --- | --- |
| `<mode>` | `enum` | - | 欲設定的預設遊戲模式 |

---

## 參數說明 (Parameters)

### `mode`

> 伺服器整體的預設遊戲模式.

| 值 | 說明 |
| --- | --- |
| `survival` | 生存模式 |
| `creative` | 創造模式 |
| `adventure` | 冒險模式 |
| `spectator` | 旁觀模式 |

* 執行此指令後, 會變更該世界或伺服器底層預設的遊戲模式.
* 僅影響**首次加入伺服器的新玩家**, 或尚未被伺服器單獨記錄遊戲模式的玩家.
* 已經在伺服器中擁有特定遊戲模式紀錄的在線或離線玩家 (例如曾經被 `/gamemode` 更改過) 不會受到此指令影響. 若要強制同步變更所有在線玩家的模式, 應使用 `/gamemode` 指令.

---

## 外部連結 (References)

* [Minecraft Wiki - /defaultgamemode](https://zh.minecraft.wiki/w/%E5%91%BD%E4%BB%A4/defaultgamemode?variant=zh-tw)