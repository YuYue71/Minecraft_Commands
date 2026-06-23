# ==========================================================
# 檔案名稱: error.mcfunction
# ==========================================================

# 設定 Error 層級的前綴樣式 (紅色 [ERROR])
data modify storage logger:buffer level_prefix set value '{"text":"[ERROR]","color":"dark_red","bold":true}'

# 發生錯誤時發出音效提示開發者 (標準原版語法)
playsound minecraft:block.note_block.bass master @a[tag=admin] ~ ~ ~ 1 0.5

# 呼叫底層輸出
function logger:_print