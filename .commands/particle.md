# `/particle`（粒子效果指令）
* > 用於在世界中的特定位置生成自訂的粒子視覺效果
* > 可控制粒子的擴散範圍、移動速度、生成數量以及渲染模式
* > 常用於地圖製作、技能特效、劇情動畫與場景氣氛烘托

---

## 語法結構 (Syntax)
```commands id="particle"
/particle <粒子名稱> <座標> <擴散半徑> <速度> <數量> <渲染模式> <檢視玩家>
```

---

## 參數與引數拆解 (Arguments)

| 參數名稱 | 功能與語義說明 |
| --- | --- |
| `[必填]` `<粒子名稱>` | 指定要生成的粒子類型 ID，部分粒子需外加參數（如顏色或方塊 ID） |
| `[選填]` `<座標>` | 粒子生成的中心點位置 |
| `[選填]` `<擴散半徑>` | 粒子在 X、Y、Z 軸方向上的隨機偏移擴散範圍（三維向量） |
| `[選填]` `<速度>` | 粒子的移動速度或動態表現速率 |
| `[選填]` `<數量>` | 每次指令執行時生成的粒子總數 |
| `[選填]` `<渲染模式>` | 指定粒子在遠距離玩家畫面上的顯示規則 |
| `[選填]` `<檢視玩家>` | 指定哪些玩家可以看到這個產生的粒子效果 |

---

## 參數枚舉列表 (Parameter Enumeration)

### 粒子名稱

| 參數 | 說明 |
| --- | --- |
| `ambient_entity_effect` | 藥水潛在環境粒子（半透明漩渦） |
| `angry_villager` | 村民發怒粒子（紅色閃電） |
| `ash` | 玄武岩三角洲灰燼粒子 |
| `block <方塊ID>` | 方塊破壞粒子（例：`block stone`） |
| `block_marker <方塊ID>` | 帶有特定方塊紋理的屏障狀標記粒子 |
| `bubble` | 水中氣泡 |
| `bubble_column_up` | 氣泡柱上升氣泡 |
| `bubble_pop` | 氣泡破裂粒子 |
| `campfire_cosy_smoke` | 營火溫和煙霧 |
| `campfire_signal_smoke` | 營火訊號煙霧（飄得更高） |
| `cherry_leaves` | 櫻花樹葉飄落粒子 |
| `cloud` | 煙霧雲 |
| `composter` | 堆肥桶升級粒子 |
| `conduit` | 潮湧核心粒子 |
| `crit` | 暴擊效果（帶十字閃光） |
| `current_down` | 水流向下產生的漩渦粒子 |
| `damage_indicator` | 傷害指示器（心形破碎粒子） |
| `dolphin` | 海豚產生的水花 |
| `dragon_breath` | 終界龍息粒子 |
| `dripping_dripstone_lava` | 鐘乳石滴落的岩漿 |
| `dripping_dripstone_water` | 鐘乳石滴落的水滴 |
| `dripping_honey` | 蜂巢滴落的蜂蜜 |
| `dripping_lava` | 方塊底部滴落的岩漿 |
| `dripping_obsidian_tear` | 哭泣的夾著幽藍淚滴的粒子 |
| `dripping_water` | 方塊底部滴落的水滴 |
| `dust <R> <G> <B> <大小>` | 色彩粉塵（例：`dust 1 0 0 1` 為紅色） |
| `dust_color_transition <R1> <G1> <B1> <大小> <R2> <G2> <B2>` | 漸層粉塵粒子 |
| `dust_plume` | 揚塵煙霧 |
| `effect` | 藥水氣泡粒子 |
| `elder_guardian` | 遠古守衛者詛咒浮現影子（放大版鬼臉） |
| `electric_spark` | 電擊火花 |
| `enchant` | 附魔台飄向書本的銀河符號 |
| `enchanted_hit` | 帶有附魔（如鋒利）武器攻擊時的魔法暴擊粒子 |
| `end_rod` | 終界燭粒子 |
| `entity_effect` | 實體藥水狀態粒子 |
| `explosion` | 大型爆炸粒子 |
| `explosion_emitter` | 多重連續爆炸效果（如終界龍死亡爆炸） |
| `falling_dripstone_lava` | 鐘乳石墜落的岩漿粒子 |
| `falling_dripstone_water` | 鐘乳石墜落的水滴粒子 |
| `falling_dust <方塊ID>` | 受重力落下的方塊粉塵 |
| `falling_honey` | 掉落中的蜂蜜滴 |
| `falling_lava` | 掉落中的岩漿滴 |
| `falling_nectar` | 掉落中的花蜜 |
| `falling_obsidian_tear` | 掉落中的哭泣曜石藍滴 |
| `falling_spore_blossom` | 孢子花掉落的粒子 |
| `falling_water` | 掉落中的水滴 |
| `firework` | 煙火火箭爆炸火花 |
| `fishing` | 釣魚浮標產生的波紋 |
| `flame` | 標準火焰粒子 |
| `flash` | 煙火爆炸時產生的巨大白色閃光 |
| `glow` | 螢光魷魚發光粒子 |
| `glow_squid_ink` | 螢光魷魚墨汁粒子 |
| `glowing_gaint_curse` | 大範圍發光射線粒子 |
| `gust` | 旋風人移動或攻擊時的突風粒子 |
| `gust_emitter` | 連續突風視覺軌跡 |
| `gust_dust` | 突風夾雜的沙塵 |
| `happy_villager` | 村民高興/餵食動物粒子（綠色星星） |
| `heart` | 馴服/繁殖動物時產生的愛心 |
| `instant_effect` | 瞬間藥水（如瞬間傷害/治療）碎裂粒子 |
| `item <物品ID>` | 物品粉碎粒子（例：`item apple`） |
| `item_slime` | 史萊姆跳躍時的綠色碎屑 |
| `item_snowball` | 雪球撞擊時的白色雪花 |
| `landing_honey` | 蜂蜜著地粒子 |
| `landing_lava` | 岩漿著地火星 |
| `landing_obsidian_tear` | 哭泣曜石藍滴著地粒子 |
| `large_smoke` | 大型煙霧 |
| `lava` | 岩漿跳動時的火星 |
| `mycelium` | 菌絲方塊散發的紫色微粒 |
| `nautilus` | 潮湧核心啟動時的鸚鵡螺殼符號 |
| `note` | 音箱發出的彩色音符 |
| `ominous_spawning` | 不祥試煉生怪磚生成粒子 |
| `pale_oak_leaves` | 蒼白橡樹樹葉飄落粒子 |
| `poof` | 煙霧爆開粒子（如生物死亡、撤銷載具） |
| `portal` | 地獄門/終界珍珠散發的紫色傳送粒子 |
| `potion` | 噴濺藥水落地碎裂效果 |
| `rain` | 雨滴撞擊地面產生的水花 |
| `sculk_charge <角度>` | 幽匿幽靈電荷蔓延粒子 |
| `sculk_charge_pop` | 幽匿電荷破裂微粒 |
| `sculk_soul` | 幽匿催化器吸收經驗時釋放的靈魂粒子 |
| `shriek <延遲時間>` | 幽匿感應器發出的震波尖叫粒子 |
| `slime` | 史萊姆史萊姆球碎屑 |
| `small_flame` | 微型火焰（如蠟燭、火把） |
| `smoke` | 標準黑煙 |
| `sneeze` | 貓熊打噴嚏粒子 |
| `sonic_boom` | 監守者（Warden）遠程音波衝擊波 |
| `soul` | 靈魂沙谷或靈魂火產生的漂浮靈魂面孔 |
| `soul_fire_flame` | 藍色靈魂火焰粒子 |
| `spore_blossom_air` | 孢子花漂浮在空氣中的懸浮微粒 |
| `splash` | 實體落水產生的巨大水花 |
| `spit` | 羊駝吐唾沫粒子 |
| `squid_ink` | 魷魚噴出的黑色墨汁 |
| `sweep_attack` | 橫掃攻擊的白色劍氣弧線 |
| `totem_of_undying` | 不死圖騰觸發時的金色與綠色降落粒子 |
| `trail` | 試煉風彈或特殊投擲物的軌跡粒子 |
| `underwater` | 水中懸浮的深海微粒 |
| `vibration` | 聲音振動軌跡粒子 |
| `vault_connection` | 試煉密室寶庫鑰匙連線引導粒子 |
| `warped_spore` | 詭異森林散發的藍色孢子微粒 |
| `wax_off` | 刮除銅方塊蠟的白色火花 |
| `wax_on` | 對銅方塊塗蠟的橙色火花 |
| `white_smoke` | 白煙 |
| `witch` | 女巫散發的紫色魔法微粒 |
| `wither_invulnerable` | 凋零怪無敵狀態時的藍色護盾粒子 |

### 渲染模式

| 參數 | 說明 |
| --- | --- |
| `normal` | 正常模式。遵循玩家自身的視距設定，超出距離則不渲染 |
| `force` | 強制模式。不論玩家影像設定如何，在 512 格內皆會強制在用戶端渲染 |

---

## 數值規則

### 座標範圍

| 參數 | 說明 |
| --- | --- |
| `<數值>` | 最小值 -30000000 最大值 30000000 是否支援負數 是 |

### 擴散半徑

| 參數 | 說明 |
| --- | --- |
| `<數值>` | 最小值 0.0 最大值 無限制 是否支援負數 否 |

### 速度

| 參數 | 說明 |
| --- | --- |
| `<數值>` | 最小值 0.0 最大值 無限制 是否支援負數 否 |

### 數量

| 參數 | 說明 |
| --- | --- |
| `<整數>` | 最小值 0 最大值 無限制 是否支援負數 否 |

---

## 跨元素語法關聯表 (Links Matrix)

| 關聯參數欄位 | 參引語法元件名稱 |
| --- | --- |
| `<座標>` | [空間座標系統全指南 (Coordinates)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/coordinates.md) |
| `<檢視玩家>` | [目標選擇器 (Target Selectors)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/target_selectors.md) |