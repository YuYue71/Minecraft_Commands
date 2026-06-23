# ==========================================================
# 檔案名稱: load.mcfunction
# 主要功能: 初始化數學引擎變數, 設定角度轉換常數
# ==========================================================

# [1] 建立全域數學計分板
scoreboard objectives add math dummy "三角函數運算"

# [2] 注入運算用常數
scoreboard players set #360 math 360
scoreboard players set #90 math 90

# [3] 載入提示
tellraw @a [{"text":"\n[系統] ","color":"green","bold":true},{"text":"Trigonometry (三角函數庫) 已成功載入!","color":"white","bold":false}]