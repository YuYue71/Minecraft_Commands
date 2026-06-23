# ==========================================================
# 檔案名稱: uninstall.mcfunction
# 執行時機: 欲徹底移除此資料包前, 由管理者手動輸入指令執行
# 主要功能: 刪除所有專屬計分板, 清除全域變數與實體標籤, 確保無殘留垃圾資料
# ==========================================================

# [1] 移除全域計分板
# 刪除在 load.mcfunction 中建立的所有計分板
scoreboard objectives remove example_timer
scoreboard objectives remove example_vars

# [2] 清除特定實體標籤 (若有使用)
# 移除所有實體身上可能殘留的專案專屬標籤 (此處為範例, 需依實際專案使用的標籤進行增減)
tag @e remove my_magic_entity

# [3] 發送卸載成功提示
# 告知管理者清理完成, 可以安全關閉伺服器並刪除資料夾
tellraw @a [{"text":"\n[系統] ","color":"red","bold":true},{"text":"Example 資料包內部資料已徹底清除.","color":"white","bold":false}]
tellraw @a [{"text":"[提示] ","color":"yellow","bold":true},{"text":"所有相關計分板與全域標籤已移除, 您現在可以安全地刪除資料包檔案.\n","color":"gray","bold":false}]