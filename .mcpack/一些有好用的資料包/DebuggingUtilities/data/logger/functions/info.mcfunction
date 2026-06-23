# ==========================================================
# 檔案名稱: info.mcfunction
# ==========================================================

# 設定 Info 層級的前綴樣式 (綠色 [INFO])
data modify storage logger:buffer level_prefix set value '{"text":"[INFO]","color":"green","bold":true}'

# 呼叫底層輸出
function logger:_print