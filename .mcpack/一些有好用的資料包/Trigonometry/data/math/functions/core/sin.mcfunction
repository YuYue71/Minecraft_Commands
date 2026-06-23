# ==========================================================
# 檔案名稱: sin.mcfunction
# 主要功能: 接收 #in_angle, 輸出 #out_sin
# ==========================================================

# [1] 角度正規化 (將任意角度限縮至 0 ~ 359 之間)
scoreboard players operation #in_angle math %= #360 math
execute if score #in_angle math matches ..-1 run scoreboard players operation #in_angle math += #360 math

# [2] 呼叫查表核心
function math:core/_sin_table