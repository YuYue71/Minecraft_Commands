# `/recipe`

> **分類:** `指令` | **權限等級:** `2` | **適用版本:** `JE ≤ 1.20.4` | **命令方塊:** `true`

---

## 目錄

* [語法](#語法-syntax)
* [參數說明](#參數說明-parameters)
    * [動作類型 (give, take)](#動作類型-give-take)
    * [targets](#targets)
    * [recipe](#recipe)
* [外部連結](#外部連結-references)

---

## 語法 (Syntax)

```commands
/recipe give <targets> <recipe>
/recipe give <targets> *
/recipe take <targets> <recipe>
/recipe take <targets> *
```

* `<>` = 必填, `*` = 特殊萬用字元

| 參數 / 欄位 | 類型 | 預設 | 說明 |
| --- | --- | --- | --- |
| `give` / `take` | `enum` | - | 賦予或剝奪玩家的合成配方解鎖進度 |
| `<targets>` | `entity` | - | 欲操作合成配方的目標玩家 |
| `<recipe>` | `string` | - | 欲操作的特定配方資源位置 ID |
| `*` | `string` | - | 特殊萬用字元, 代表遊戲內所有已註冊的配方 |

---

## 參數說明 (Parameters)

### `動作類型 (give, take)`

> 決定對配方進度執行的操作種類.

| 值 | 說明 |
| --- | --- |
| `give` | 解鎖配方. 該配方將會出現在玩家的配方簿 (Recipe Book) 中, 並且畫面右上角會跳出「解鎖新配方」的提示通知. |
| `take` | 鎖定配方. 將該配方從玩家的配方簿中移除, 玩家必須再次獲得對應材料才能重新自然解鎖. |

---

### `targets`

> 受到配方變更影響的實體.

* 僅對玩家 (Player) 有效, 無法對非玩家實體使用.
* 支援使用目標選擇器 (如 `@p`, `@a`, `@r`).

---

### `recipe`

> 指定欲解鎖或鎖定的具體配方項目.

* 若要指定單一配方, 必須輸入標準的資源位置 (如 `minecraft:golden_apple`).
* 遊戲中絕大多數的配方 ID 都與合成出的物品 ID 相同, 但某些透過特殊工作台 (如切石機, 熔爐) 產出的多重配方可能會有後綴 (如 `minecraft:stone_from_smelting`).
* **萬用字元 (`*`)**: 若輸入星號, 則代表一次性解鎖或鎖定遊戲內「所有的配方」.
* *注意事項*: 對玩家執行 `/recipe give @p *` 會導致畫面右上角瞬間湧入數百條配方解鎖通知而產生視覺干擾. 若要避免此情況, 建議先執行 `/gamerule sendCommandFeedback false`, 待配方發放完畢後再將其改回 `true`.

---

## 外部連結 (References)

* [Minecraft Wiki - /recipe](https://zh.minecraft.wiki/w/%E5%91%BD%E4%BB%A4/recipe)
* [Minecraft Wiki - 配方表](https://zh.minecraft.wiki/w/%E5%90%88%E6%88%90#%E5%AE%8C%E6%95%B4%E9%85%8D%E6%96%B9%E6%B8%85%E5%96%AE)
* [目標選擇器 (Target Selectors)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/TargetSelectors.md)
* [資源位置與命名空間規範 (Resource Locations)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/ResourceLocations.md)