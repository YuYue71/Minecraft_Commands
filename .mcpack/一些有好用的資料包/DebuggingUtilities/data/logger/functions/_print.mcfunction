# ==========================================================
# 檔案名稱: _print.mcfunction
# 主要功能: 讀取 storage 內的日誌設定並輸出到所有擁有管理員權限的玩家
# ==========================================================

# 輸出日誌 (利用 tellraw 解析 NBT 資料)
# 格式: [層級] 訊息內容
tellraw @a[tag=admin] [{"nbt":"level_prefix","storage":"logger:buffer","interpret":true}, {"text":" "}, {"nbt":"message","storage":"logger:buffer","interpret":true}]

# 清理緩衝區，避免殘留
data remove storage logger:buffer level_prefix
data remove storage logger:buffer message