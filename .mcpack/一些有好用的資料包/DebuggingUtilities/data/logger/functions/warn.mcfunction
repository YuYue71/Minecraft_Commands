# ==========================================================
# 檔案名稱: warn.mcfunction
# ==========================================================

# 設定 Warn 層級的前綴樣式 (黃色 [WARN])
data modify storage logger:buffer level_prefix set value '{"text":"[WARN]","color":"gold","bold":true}'

# 呼叫底層輸出
function logger:_print