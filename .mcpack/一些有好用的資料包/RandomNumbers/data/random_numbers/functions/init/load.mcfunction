# ==========================================================
# 檔案名稱: load.mcfunction
# 主要功能: 初始化亂數引擎變數, 設定 LCG 數學常數
# ==========================================================

# [1] 建立亂數專屬計分板
scoreboard objectives add random_numbers dummy "亂數引擎變數"

# [2] 注入 LCG 常數 (使用 Microsoft C runtime 參數標準)
scoreboard players set #a random_numbers 214013
scoreboard players set #c random_numbers 2531011
scoreboard players set #-1 random_numbers -1

# [3] 預設 Seed 保護機制 (若無 Seed 則給予預設值 1)
execute unless score #seed random_numbers = #seed random_numbers run scoreboard players set #seed random_numbers 1

# [4] 載入提示
tellraw @a [{"text":"\n[系統] ","color":"green","bold":true},{"text":"RandomNumbers (亂數引擎) 已成功載入!","color":"white","bold":false}]