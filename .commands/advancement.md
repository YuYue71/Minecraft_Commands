# /advancement

> **分類:** `指令` | **權限等級:** `2` | **適用版本:** `JE ≤ 1.20.4` | **命令方塊:** `true`

---

## 目錄

* [語法](#語法-syntax)
* [參數說明](#參數說明-parameters)
    * [grant 與 revoke](#grant-與-revoke)
    * [targets](#targets)
    * [選取模式 (Selection Modes)](#選取模式-selection-modes)
    * [advancement 與 criterion](#advancement-與-criterion)
* [原版進度 ID 清單](#原版進度-id-清單-vanilla-advancements)
    * [故事 (Story)](#故事-story)
    * [幽冥 (Nether)](#幽冥-nether)
    * [終界 (The End)](#終界-the-end)
    * [冒險 (Adventure)](#冒險-adventure)
    * [農業 (Husbandry)](#農業-husbandry)
* [外部連結](#外部連結-references)

---

## 語法 (Syntax)

```commands
/advancement grant <targets> everything
/advancement grant <targets> only <advancement> [criterion]
/advancement grant <targets> from <advancement>
/advancement grant <targets> until <advancement>
/advancement grant <targets> through <advancement>

```

* `<>` = 必填, `[]` = 選填
* `/advancement revoke ...` 的語法與上述 `grant` 完全相同, 僅需替換第一個動作參數即可.

| 參數 / 欄位 | 類型 | 預設 | 說明 |
| --- | --- | --- | --- |
| `grant` / `revoke` | `enum` | - | 賦予或剝奪目標玩家的進度 |
| `<targets>` | `entity` | - | 欲修改進度的目標玩家 |
| `everything` | `enum` | - | 模式: 包含遊戲內所有的進度 |
| `only` | `enum` | - | 模式: 僅限指定的單一進度 (或單一條件) |
| `from` | `enum` | - | 模式: 指定進度以及其所有的子進度 (後續進度) |
| `until` | `enum` | - | 模式: 指定進度以及其所有的父進度 (前置進度) |
| `through` | `enum` | - | 模式: 指定進度, 以及其關聯的所有父進度與子進度 |
| `<advancement>` | `string` | - | 欲操作的目標進度資源位置 (ID) |
| `[criterion]` | `string` | - | 該進度下的特定單一解鎖條件 |

---

## 參數說明 (Parameters)

### `grant` 與 `revoke`

> 決定此指令是要發放還是收回進度.

* `grant`: 達成 (解鎖) 指定的進度. 若玩家已擁有該進度, 則不會發生任何事.
* `revoke`: 撤銷 (鎖定) 指定的進度. 撤銷後玩家可以再次透過正常遊戲行為重新解鎖該進度.

---

### `targets`

> 受到進度變更影響的玩家實體.

* 此參數僅對玩家 (Player) 有效, 無法賦予非玩家實體 (如殭屍, 盔甲座) 進度.
* 支援使用目標選擇器 (如 `@p`, `@a`).

---

### 選取模式 (Selection Modes)

> 決定進度發放或撤銷的擴散範圍 (樹狀結構連鎖).

| 模式 | 說明與應用場景 |
| --- | --- |
| `everything` | 選擇所有已註冊的進度. 常用於 `/advancement revoke @a everything` 重置伺服器所有人的進度狀態. |
| `only` | 只精確影響輸入的那一個進度, 不會連鎖影響上下游. |
| `from` | 選擇該進度與它**後面衍生的所有子進度**. 若撤銷此項, 玩家將失去該進度樹後續的所有成就. |
| `until` | 選擇該進度與它**前面的所有父進度** (一路追溯到根目錄). 常用於發放中後期進度時, 自動補齊玩家漏掉的前置進度. |
| `through` | 同時結合 `from` 與 `until` 的效果. 選擇該進度的整條直系血脈 (包含所有前置與後續). |

---

### `advancement` 與 `criterion`

> 進度的精確識別名稱與內部條件.

* `<advancement>`: 必須輸入標準的資源位置 (詳見下方清單). 輸入時遊戲內通常會提供自動補全建議.
* `[criterion]`: 某些進度包含多個子條件 (例如「探索所有生物群系」需要跑遍多個地方). 若在 `only` 模式下附加此字串, 可以單獨解鎖或撤銷該進度底下的特定小條件, 而不影響整個進度的其他進度條.

---

## 原版進度 ID 清單 (Vanilla Advancements)

> 所有的原版進度皆以 `minecraft:` 作為命名空間前綴. 以下清單為了保持簡潔已省略該前綴. 例如 `story/mine_stone` 的完整 ID 為 `minecraft:story/mine_stone`.
> **提示:** 遊戲中除了這些主線進度外, 所有的合成配方解鎖也屬於進度的一環 (位於 `minecraft:recipes/...`), 但因數量高達數百種且通常不以指令發放, 故不列於此表.

### 故事 (Story)

| 進度 ID (`story/...`) | 說明 (成就名) | 進度 ID (`story/...`) | 說明 (成就名) |
| --- | --- | --- | --- |
| `root` | 進度起點 (Minecraft) | `mine_stone` | 石器時代 (挖掘石頭) |
| `upgrade_tools` | 獲得升級 (升級石鎬) | `smelt_iron` | 取得硬體 (熔煉鐵錠) |
| `obtain_armor` | 著裝完畢 (穿戴鐵裝甲) | `lava_bucket` | 惹火上身 (取得熔岩桶) |
| `iron_tools` | 鐵鎬出動 (取得鐵鎬) | `deflect_arrow` | 今天不行 (盾牌擋箭) |
| `form_obsidian` | 冰桶挑戰 (取得黑曜石) | `mine_diamond` | 鑽石！ (獲得鑽石) |
| `enter_the_nether` | 需要再深點 (進入幽冥) | `shiny_gear` | 用鑽石包覆我 (鑽石裝甲) |
| `enchant_item` | 附魔師 (附魔物品) | `cure_zombie_villager` | 殭屍醫生 (治癒殭屍村民) |
| `follow_ender_eye` | 視線狙擊 (跟隨終界之眼) | `enter_the_end` | 結束了嗎？ (進入終界) |

### 幽冥 (Nether)

| 進度 ID (`nether/...`) | 說明 (成就名) | 進度 ID (`nether/...`) | 說明 (成就名) |
| --- | --- | --- | --- |
| `root` | 進度起點 (幽冥) | `return_to_sender` | 退信處理 (擊返惡魂火球) |
| `find_bastion` | 當初那段日子 (探索堡壘) | `obtain_ancient_debris` | 藏在深處 (獲得遠古遺骸) |
| `fast_travel` | 亞空間氣泡 (透過幽冥移動) | `find_fortress` | 可怕的要塞 (發現幽冥要塞) |
| `obtain_crying_obsidian` | 誰在切洋蔥？ (哭泣黑曜石) | `uneasy_alliance` | 虛假的和平 (帶惡魂回主世界) |
| `loot_bastion` | 戰豬 (掠奪堡壘遺跡) | `use_lodestone` | 鄉村路帶我回家 (使用磁石) |
| `netherite_armor` | 殘骸成裝 (穿戴獄髓裝甲) | `get_wither_skull` | 陰森恐怖的骷髏 (取得頭顱) |
| `obtain_blaze_rod` | 深入火海 (取得烈焰桿) | `charge_respawn_anchor` | 並非九死一生 (充能重生錨) |
| `explore_nether` | 觀光勝地 (探索所有幽冥) | `summon_wither` | 凋零之巔 (召喚凋零怪) |
| `brew_potion` | 釀造在地 (釀造藥水) | `create_beacon` | 帶回家 (建造烽火台) |
| `all_potions` | 狂野的雞尾酒 (擁有所有藥水) | `create_full_beacon` | 烽火相傳 (完成最高烽火台) |
| `all_effects` | 我們該如何抵達？ (所有狀態) |  |  |

### 終界 (The End)

| 進度 ID (`end/...`) | 說明 (成就名) | 進度 ID (`end/...`) | 說明 (成就名) |
| --- | --- | --- | --- |
| `root` | 進度起點 (終界) | `kill_dragon` | 釋放終界 (擊敗終界龍) |
| `dragon_egg` | 下一代 (取得龍蛋) | `enter_end_gateway` | 遠端出逃 (進入終界折躍門) |
| `find_end_city` | 遊戲終局 (探索終界城) | `elytra` | 天際無垠 (取得鞘翅) |
| `levitate` | 絕佳視野 (漂浮 50 格高) | `respawn_dragon` | 結束了...重來 (重召喚終界龍) |
| `dragon_breath` | 你需要一點薄荷糖 (收集龍息) |  |  |

### 冒險 (Adventure)

| 進度 ID (`adventure/...`) | 說明 (成就名) | 進度 ID (`adventure/...`) | 說明 (成就名) |
| --- | --- | --- | --- |
| `root` | 進度起點 (冒險) | `volunteer_exile` | 自願流放 (擊殺襲擊隊長) |
| `kill_a_mob` | 怪物獵人 (擊殺怪物) | `trade` | 互惠互利 (與村民交易) |
| `honey_block_slide` | 沾滿蜂蜜 (蜂蜜方塊滑下) | `ol_betsy` | 老當益壯 (發射弩) |
| `lightning_rod_with_villager_no_fire` | 突波防護器 (避雷針保護村民) | `fall_from_world_height` | 洞穴與懸崖 (從頂落至底) |
| `avoid_vibration` | 潛行模式 (潛行避開伏守者) | `sleep_in_bed` | 甜蜜夢鄉 (在床上睡覺) |
| `hero_of_the_village` | 村莊英雄 (擊退突襲) | `throw_trident` | 丟棄的笑話 (投擲三叉戟) |
| `shoot_arrow` | 狙擊手 (弓箭射中實體) | `kill_all_mobs` | 怪物圖鑑 (擊殺所有種類怪物) |
| `totem_of_undying` | 死裡逃生 (觸發不死圖騰) | `summon_iron_golem` | 僱傭打手 (召喚鐵魔像) |
| `two_birds_one_arrow` | 一箭雙鵰 (弩一箭射殺兩隻) | `whos_the_pillager_now` | 以其人之道還治其人之身 |
| `arbalistic` | 弩射手 (弩一箭射殺五隻) | `adventuring_time` | 探險時間 (探索所有生態域) |
| `play_jukebox_in_meadows` | 充滿音樂的聲響 (草甸放音樂) | `walk_on_powder_snow_with_leather_boots` | 輕如兔躍 (皮靴走在細雪上) |
| `spyglass_at_parrot` | 是鳥？ (望遠鏡看鸚鵡) | `spyglass_at_ghast` | 是氣球？ (望遠鏡看惡魂) |
| `spyglass_at_dragon` | 是飛機？ (望遠鏡看終界龍) | `sniper_duel` | 狙擊對決 (50格外狙殺骷髏) |
| `bullseye` | 正中紅心 (射中标靶紅心) | `read_power_of_chiseled_bookshelf` | 知識的力量 (讀取雕紋書架) |
| `craft_decorated_pot` | 仔細修復 (合成飾紋陶罐) | `trim_with_any_armor_pattern` | 鍛造帶來型格 (鍛造台裝飾) |
| `trim_with_all_exclusive_armor_patterns` | 盔甲鍛造大師 (所有盔甲紋飾) | `salvage_sherd` | 尋找歷史 (刷子刷出陶片) |

### 農業 (Husbandry)

| 進度 ID (`husbandry/...`) | 說明 (成就名) | 進度 ID (`husbandry/...`) | 說明 (成就名) |
| --- | --- | --- | --- |
| `root` | 進度起點 (農業) | `safely_harvest_honey` | 是我們的 (營火採集蜂蜜) |
| `breed_an_animal` | 鸚鵡與蝙蝠 (繁殖動物) | `tame_an_animal` | 永遠的摯友 (馴服動物) |
| `fishy_business` | 陰險狡詐 (釣到魚) | `silk_touch_nest` | 蜂起雲湧 (絲綢之觸採蜂巢) |
| `plant_seed` | 播種的地方 (種植種子) | `multiply_tenants` | 共體時艱 (繁殖蜜蜂) |
| `make_a_sign_glow` | 大放異彩 (點亮告示牌) | `ride_a_boat_with_a_goat` | 不管發生任何事都要與山羊共乘船 |
| `glow_berry_bear_dream` | 散發光芒就像是... (餵狐狸) | `axolotl_in_a_bucket` | 可愛的掠食者 (水桶裝六角恐龍) |
| `kill_axolotl_target` | 友誼的治癒力 (與六角並肩) | `tadpole_in_a_bucket` | 桶子裡的巴克 (水桶裝蝌蚪) |
| `leash_all_frog_variants` | 團隊跳躍 (牽引所有青蛙變種) | `froglights` | 大顯神威！ (取得所有青蛙燈) |
| `obtain_sniffer_egg` | 聞風而動 (取得嗅探獸蛋) | `feed_snifflet` | 小傢伙大鼻子 (餵食小嗅探獸) |
| `plant_any_sniffer_seed` | 遠古種植 (種植嗅探獸種子) | `balanced_diet` | 均衡飲食 (吃下所有食物) |
| `complete_catalogue` | 完整的目錄 (馴服所有貓變種) | `tactical_fishing` | 戰術性釣魚 (水桶裝魚) |

---

## 外部連結 (References)

* [Minecraft Wiki - /advancement](https://zh.minecraft.wiki/w/%E5%91%BD%E4%BB%A4/advancement)
* [Minecraft Wiki - 成就](https://zh.minecraft.wiki/w/%E6%88%90%E5%B0%B1/Java%E7%89%88)
* [目標選擇器 (Target Selectors)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/TargetSelectors.md)
* [資源位置與命名空間規範 (Resource Locations)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/ResourceLocations.md)