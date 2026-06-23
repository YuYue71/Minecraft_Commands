# ==========================================================
# 檔案名稱: generate.mcfunction
# 主要功能: 根據 #min 與 #max 生成範圍內的隨機數 #result
# 調用要求: 執行此檔案前, 必須先確保計分板有 #min 與 #max 的值
# ==========================================================

# [1] 推進隨機種子 (Seed = Seed * a + c)
scoreboard players operation #seed random_numbers *= #a random_numbers
scoreboard players operation #seed random_numbers += #c random_numbers

# [2] 將 Seed 複製到結果變數, 並強制轉為絕對值 (避免負數餘數邏輯錯誤)
scoreboard players operation #result random_numbers = #seed random_numbers
execute if score #result random_numbers matches ..-1 run scoreboard players operation #result random_numbers *= #-1 random_numbers

# [3] 計算目標範圍 (Range = Max - Min + 1)
scoreboard players operation #range random_numbers = #max random_numbers
scoreboard players operation #range random_numbers -= #min random_numbers
scoreboard players add #range random_numbers 1

# [4] 產生最終結果 (Result = (Result % Range) + Min)
scoreboard players operation #result random_numbers %= #range random_numbers
scoreboard players operation #result random_numbers += #min random_numbers