# /publish

> **分類:** `指令` | **權限等級:** `4` | **適用版本:** `JE ≤ 1.20.4` | **命令方塊:** `false`

---

## 目錄

* [語法](#語法-syntax)
* [參數說明](#參數說明-parameters)
    * [allowCommands](#allowcommands)
    * [gamemode](#gamemode)
    * [port](#port)
* [外部連結](#外部連結-references)

---

## 語法 (Syntax)

```commands
/publish [allowCommands] [gamemode] [port]
```

* `[]` = 選填. 若要設定後方的參數, 前方的參數必須先被填寫.

| 參數 / 欄位 | 類型 | 預設 | 說明 |
| --- | --- | --- | --- |
| `[allowCommands]` | `boolean` | `false` | 是否允許加入的玩家使用指令 (作弊) |
| `[gamemode]` | `enum` | 當前世界預設 | 加入區域網路玩家的預設遊戲模式 |
| `[port]` | `int` | 隨機 | 區域網路對外開放的通訊埠號碼 (Port) |

---

## 參數說明 (Parameters)

### `allowCommands`

> 決定新加入區域網路 (LAN) 遊戲的玩家是否擁有指令權限.

* 填寫 `true` (允許作弊) 或 `false` (禁止作弊).
* 若設為 `true`, 透過區網加入的玩家將自動獲得與房主相同的管理員 (OP) 指令執行權限.
* 此指令僅能在單人遊戲 (Singleplayer) 中執行, 用於將目前的單機世界發佈至區域網路. 若世界已處於開放狀態, 再次執行將會失敗.

---

### `gamemode`

> 設定新加入玩家的遊戲模式.

* 可填寫 `survival` (生存), `creative` (創造), `adventure` (冒險), 或 `spectator` (旁觀).
* 此設定僅會影響透過區域網路新加入該世界的玩家, 並不會改變房主自己目前的遊戲模式.

---

### `port`

> 指定伺服器監聽的網路通訊埠 (Port).

* 允許輸入 `0` 到 `65535` 之間的有效整數.
* 若不填寫此參數或填入無法使用的數值, 系統會自動隨機分配一個可用的動態通訊埠 (通常介於 `49152` 到 `65535` 之間), 並在聊天框中顯示分配的埠號結果.
* 若玩家在區網連線時遇到防火牆阻擋或需要搭配 VPN (如 Radmin, Hamachi) 進行遠端連線, 可透過此參數強制作業系統使用特定的通訊埠 (如標準的 `25565`), 以便於進行路由器設定或防火牆規則放行.

---

## 外部連結 (References)

* [Minecraft Wiki - /publish](https://zh.minecraft.wiki/w/%E5%91%BD%E4%BB%A4/publish)