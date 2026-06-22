## 配置特徵 (`configured_feature/`)

> 定義個別特徵（如植物、地下礦物、地表裝飾）之核心方塊組成與基礎幾何。

**路徑：** `data/<namespace>/worldgen/configured_feature/<名稱>.json`

### JSON 結構

#### type = `"minecraft:ore"` 時

```json
{
    "type": "minecraft:ore",
    "config": {
        "size": 9,
        "discard_chance_on_air_exposure": 0.0,
        "targets": [
            {
                "target": {
                    "predicate_type": "minecraft:tag_match",
                    "tag": "minecraft:stone_ore_replaceables"
                },
                "state": {
                    "Name": "minecraft:iron_ore"
                }
            }
        ]
    }
}

```

#### type = `"minecraft:tree"` 時

```json
{
    "type": "minecraft:tree",
    "config": {
        "ignore_vines": true,
        "force_dirt": false,
        "minimum_size": {
            "type": "minecraft:two_layers_feature_size",
            "limit": 1,
            "lower_size": 0,
            "upper_size": 1
        },
        "dirt_provider": {
            "type": "minecraft:simple_state_provider",
            "state": { "Name": "minecraft:dirt" }
        },
        "trunk_provider": {
            "type": "minecraft:simple_state_provider",
            "state": { "Name": "minecraft:oak_log", "Properties": { "axis": "y" } }
        },
        "foliage_provider": {
            "type": "minecraft:simple_state_provider",
            "state": { "Name": "minecraft:oak_leaves", "Properties": { "distance": "7", "persistent": "false" } }
        },
        "trunk_placer": {
            "type": "minecraft:straight_trunk_placer",
            "base_height": 4,
            "height_rand_a": 2,
            "height_rand_b": 0
        },
        "foliage_placer": {
            "type": "minecraft:blob_foliage_placer",
            "radius": 2,
            "offset": 0,
            "height": 3
        },
        "decorators": []
    }
}

```

### 欄位說明

#### 根層欄位

| 欄位 | 類型 | 必填 | 預設 | 說明 |
| --- | --- | --- | --- | --- |
| `type` | `string` | ✓ | — | 目標特徵類型之註冊識別碼 |
| `config` | `object` | ✓ | — | 該特徵專屬之資料結構，內部鍵值嚴格隨 `type` 變動，子欄位見下方 |

#### 子欄位：`config` (`type` = `"minecraft:ore"` 時)

| 欄位 | 類型 | 必填 | 預設 | 說明 |
| --- | --- | --- | --- | --- |
| `size` | `int` | ✓ | — | 礦脈單次生成之最大方塊數量 |
| `discard_chance_on_air_exposure` | `float` | ✓ | — | 礦脈接觸空氣時取消生成之機率 |
| `targets` | `array[]` | ✓ | — | 定義目標底層方塊與替換方塊狀態之映射規則陣列 |

#### 子欄位：`config` (`type` = `"minecraft:tree"` 時)

| 欄位 | 類型 | 必填 | 預設 | 說明 |
| --- | --- | --- | --- | --- |
| `trunk_provider` | `object` | ✓ | — | 樹幹方塊狀態提供者 |
| `foliage_provider` | `object` | ✓ | — | 樹葉方塊狀態提供者 |
| `trunk_placer` | `object` | ✓ | — | 樹幹幾何放置演算法 |
| `foliage_placer` | `object` | ✓ | — | 樹冠幾何放置演算法 |
| `minimum_size` | `object` | ✓ | — | 樹木生成空間驗證條件 |
| `decorators` | `array[]` | ✓ | — | 樹木裝飾器（如蜂巢、藤蔓）列表 |

### 枚舉值速查

#### `type` 可填值

| 值 | 分類 | 說明 |
| --- | --- | --- |
| `minecraft:ore` | 礦物 | 替換底層方塊生成標準礦脈 |
| `minecraft:scattered_ore` | 礦物 | 生成離散分佈之礦脈（如地獄石英礦） |
| `minecraft:geode` | 礦物 | 生成由多層外殼組成之晶洞結構 |
| `minecraft:fossil` | 礦物 | 生成由骨塊與煤礦組成之化石結構 |
| `minecraft:monster_room` | 結構 | 生成包含生怪磚與寶箱之地牢 |
| `minecraft:tree` | 植被 | 透過放置器幾何演算法生成自訂樹木 |
| `minecraft:flower` | 植被 | 生成單一或叢生花朵 |
| `minecraft:random_patch` | 植被 | 於指定區域隨機散佈方塊（如草叢、蘑菇） |
| `minecraft:vegetation_patch` | 植被 | 生成帶有專屬底土轉換之植被斑塊 |
| `minecraft:waterlogged_vegetation_patch` | 植被 | 生成含水狀態之植被斑塊 |
| `minecraft:huge_fungus` | 植被 | 生成地獄巨型蕈類 |
| `minecraft:huge_red_mushroom` | 植被 | 生成巨型紅蘑菇 |
| `minecraft:huge_brown_mushroom` | 植被 | 生成巨型棕色蘑菇 |
| `minecraft:chorus_plant` | 植被 | 於終界生成終界頌樹 |
| `minecraft:bamboo` | 植被 | 生成不同高度之竹子柱 |
| `minecraft:kelp` | 海洋 | 生成隨機高度之海帶柱 |
| `minecraft:sea_pickle` | 海洋 | 於珊瑚礁上生成海鞘集群 |
| `minecraft:lake` | 流體 | 生成包含指定流體狀態之湖泊 |
| `minecraft:spring` | 流體 | 生成從方塊側面流出之湧泉 |
| `minecraft:iceberg` | 海洋 | 生成由浮冰與藍冰組成之冰山 |
| `minecraft:ice_spike` | 海洋 | 生成浮冰組成之冰刺 |
| `minecraft:blue_ice` | 海洋 | 於冰山底部生成藍冰團塊 |
| `minecraft:coral_tree` | 海洋 | 生成樹狀珊瑚結構 |
| `minecraft:coral_mushroom` | 海洋 | 生成蘑菇狀珊瑚結構 |
| `minecraft:coral_claw` | 海洋 | 生成爪狀珊瑚結構 |
| `minecraft:disk` | 地表 | 生成扁平圓盤狀之方塊覆蓋層 |
| `minecraft:block_column` | 地表 | 生成垂直柱狀結構（如鐘乳石） |
| `minecraft:basalt_columns` | 地表 | 生成地獄玄武岩三角洲之玄武岩柱 |
| `minecraft:basalt_pillar` | 地表 | 生成獨立之玄武岩石柱 |
| `minecraft:delta_feature` | 地表 | 生成地獄三角洲地表流體網格 |
| `minecraft:desert_well` | 結構 | 生成沙漠水井結構 |
| `minecraft:end_gateway` | 結構 | 生成終界折躍門光束節點 |
| `minecraft:end_island` | 結構 | 生成懸浮之終界浮島 |
| `minecraft:void_start_platform` | 結構 | 生成虛空生態系之起始平台 |
| `minecraft:glowstone_blob` | 地獄 | 生成倒掛之螢光石團塊 |
| `minecraft:netherrack_replace_blobs` | 地獄 | 隨機替換地獄石團塊（如黑石） |
| `minecraft:twisting_vines` | 地獄 | 生成由下往上生長之纏怨藤 |
| `minecraft:weeping_vines` | 地獄 | 生成由上往下垂降之垂淚藤 |
| `minecraft:forest_rock` | 地表 | 於苔石區域生成地表巨石 |
| `minecraft:freeze_top_layer` | 系統 | 強制冰凍頂層水體並覆蓋雪層 |
| `minecraft:vines` | 系統 | 於樹木與懸崖側邊生成藤蔓 |
| `minecraft:fill_layer` | 系統 | 用單一方塊填滿整個水平高度層 |
| `minecraft:bonus_chest` | 系統 | 放置附帶火把之紅利箱 |
| `minecraft:simple_block` | 系統 | 在絕對單一座標放置單一方塊 |
| `minecraft:random_selector` | 系統 | 依據權重隨機選擇執行另一個配置特徵 |
| `minecraft:simple_random_selector` | 系統 | 均勻隨機選擇執行另一個配置特徵 |

### 條件依賴

| 條件 | 生效欄位 | 失效 / 忽略欄位 |
| --- | --- | --- |
| `type` = `"minecraft:ore"` 時 | `size`、`targets` 必填 | `trunk_placer` 等植被演算法欄位 |
| `type` = `"minecraft:tree"` 時 | `trunk_placer`、`foliage_placer` 必填 | `targets` 等礦脈演算法欄位 |