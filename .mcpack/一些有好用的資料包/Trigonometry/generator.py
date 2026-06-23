import math
import os

# 設定參數
SCALE = 1000  # 放大倍率, 1000 代表小數點後三位
OUTPUT_DIR = "data/math/functions/core"
FILENAME = "_sin_table.mcfunction"

# 確保輸出目錄存在
os.makedirs(OUTPUT_DIR, exist_ok=True)
output_path = os.path.join(OUTPUT_DIR, FILENAME)

# 產生 mcfunction 內容
with open(output_path, "w", encoding="utf-8") as f:
    f.write("# ==========================================================\n")
    f.write(f"# 檔案名稱: {FILENAME}\n")
    f.write("# 主要功能: Sin 數值窮舉 (由 Python 自動生成)\n")
    f.write(f"# 放大倍率: {SCALE}\n")
    f.write("# ==========================================================\n\n")
    
    for angle in range(360):
        # 計算弧度與 Sin 值
        rad = math.radians(angle)
        sin_val = round(math.sin(rad) * SCALE)
        
        # 寫入 Minecraft 指令
        f.write(f"execute if score #in_angle math matches {angle} run scoreboard players set #out_sin math {sin_val}\n")

print(f"[成功] 已生成 {FILENAME}, 共 360 行查表指令.")