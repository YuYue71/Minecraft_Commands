# ==========================================================
# 檔案名稱: reseed.mcfunction
# 主要功能: 注入極大範圍的真隨機數來洗牌 LCG 種子碼
# 執行時機: 建議可在 load.mcfunction 尾端呼叫, 或定期執行
# ==========================================================

execute store result score #seed random_numbers run random value -1073741823..1073741823