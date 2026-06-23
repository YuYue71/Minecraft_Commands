# ==========================================================
# 檔案名稱: tick.mcfunction
# 執行時機: 每一遊戲刻 (Tick) 自動執行 (每秒 20 次)
# 主要功能: 核心迴圈、條件檢測、冷卻時間計算
# ==========================================================

# [1] 全域計時器推進
# 每一刻讓系統計時器 +1
scoreboard players add #system example_timer 1

# [2] 降頻器範例 (每秒執行一次)
# 當計時器達到 20 (剛好 1 秒) 時，執行指定的邏輯
execute if score #system example_timer matches 20.. run function example:second_tick

# [3] 高頻條件檢測範例
# 尋找腳下踩著鑽石磚的玩家，並給予發光效果 (極短時間)
execute as @a at @s if block ~ ~-1 ~ diamond_block run effect give @s glowing 1 0 true

# ---------------------------------------------------------
# 以下這行是為了配合 load.mcfunction 的降頻器，當時間到達 20 後將其歸零
# 這樣它就會不斷在 0~20 之間循環，形成完美的「秒鐘」
# ---------------------------------------------------------
execute if score #system example_timer matches 20.. run scoreboard players set #system example_timer 0