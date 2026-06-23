# ==========================================================
# 檔案名稱: cos.mcfunction
# 主要功能: 接收 #in_angle, 輸出 #out_cos
# ==========================================================

# [1] 相位平移 (Cos 相當於 Sin 提早 90 度)
scoreboard players operation #in_angle math += #90 math

# [2] 呼叫 Sin 進行計算 (Sin 腳本內含正規化機制)
function math:core/sin

# [3] 提取結果
scoreboard players operation #out_cos math = #out_sin math

# [4] 復原輸入角度 (保持乾淨的開發環境, 避免破壞原始變數)
scoreboard players operation #in_angle math -= #90 math