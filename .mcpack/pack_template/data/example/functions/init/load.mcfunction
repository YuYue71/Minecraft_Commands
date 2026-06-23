# ==========================================================
# 檔案名稱: load.mcfunction
# 執行時機: 系統載入或輸入 /reload 時執行一次
# 主要功能: 初始化變數、建立基礎環境、發送成功提示
# ==========================================================

# [1] 遊戲規則設定 (優化環境)
# 關閉指令執行時的煩人系統提示，保持聊天框乾淨
gamerule commandBlockOutput false
gamerule sendCommandFeedback false

# [2] 建立全域計分板 (變數)
# 建立一個名為 'example_timer' 的計分板，用於計算時間
scoreboard objectives add example_timer dummy "專案計時器"

# 建立一個名為 'example_vars' 的計分板，用於存放各種數值
scoreboard objectives add example_vars dummy "專案全域變數"

# [3] 重置或初始化數值
# 將計時器歸零 (使用假名 #system 來儲存系統變數)
scoreboard players set #system example_timer 0

# [4] 載入成功提示 (Tellraw)
# 當開發者輸入 /reload 後，看到這行文字代表資料包沒有語法錯誤且成功啟動
tellraw @a [{"text":"\n[系統] ","color":"green","bold":true},{"text":"Example 資料包已成功載入！","color":"white","bold":false}]
tellraw @a [{"text":"[提示] ","color":"yellow","bold":true},{"text":"版本: 1.20.4 | 核心模組已啟動\n","color":"gray","bold":false}]