# `/effect`（狀態效果）

* > 給予或移除實體狀態效果

## 語法結構 (Syntax)

```commands id="effect"
/effect give <目標> <狀態效果> <持續時間> <強度>
/effect clear <目標> <狀態效果>
/effect clear <目標>
```

## 參數與引數拆解 (Arguments)

| 參數名稱     | 功能與語義說明   |
| -------- | --------- |
| `<目標>`   | 接受效果的實體   |
| `<狀態效果>` | 狀態效果ID    |
| `<持續時間>` | 效果持續時間（秒） |
| `<強度>`   | 效果等級      |

## 參數枚舉列表 (Parameter Enumeration)

### 狀態效果

| 參數                    | 說明     |
| --------------------- | ------ |
| `speed`               | 移動速度提升 |
| `slowness`            | 移動速度降低 |
| `haste`               | 挖掘速度提升 |
| `mining_fatigue`      | 挖掘速度降低 |
| `strength`            | 攻擊力提升  |
| `instant_health`      | 立即治療   |
| `instant_damage`      | 立即傷害   |
| `jump_boost`          | 跳躍提升   |
| `nausea`              | 畫面扭曲   |
| `regeneration`        | 生命恢復   |
| `resistance`          | 傷害減免   |
| `fire_resistance`     | 火焰免疫   |
| `water_breathing`     | 水下呼吸   |
| `invisibility`        | 隱形     |
| `blindness`           | 失明     |
| `night_vision`        | 夜視     |
| `hunger`              | 飢餓     |
| `weakness`            | 虛弱     |
| `poison`              | 中毒     |
| `wither`              | 凋零     |
| `health_boost`        | 最大生命提升 |
| `absorption`          | 吸收護盾   |
| `saturation`          | 飽和     |
| `glowing`             | 發光     |
| `levitation`          | 懸浮     |
| `luck`                | 幸運     |
| `unluck`              | 霉運     |
| `slow_falling`        | 緩降     |
| `conduit_power`       | 潮湧能量   |
| `dolphins_grace`      | 海豚恩惠   |
| `bad_omen`            | 不祥之兆   |
| `hero_of_the_village` | 村莊英雄   |
| `darkness`            | 黑暗效果   |

---

## 數值規則

### 持續時間

| 參數     | 說明                            |
| ------ | ----------------------------- |
| `<數值>` | 最小值 0 最大值 2147483647 是否支援負數 否 |

### 強度

| 參數     | 說明                     |
| ------ | ---------------------- |
| `<數值>` | 最小值 0 最大值 255 是否支援負數 否 |

---

## 跨元素語法關聯表 (Links Matrix)

| 關聯參數欄位 | 參引語法元件名稱                                                                                                                   |
| ------ | -------------------------------------------------------------------------------------------------------------------------- |
| `<目標>` | [目標選擇器 (Target Selectors)](https://github.com/YuYue71/Minecraft_Commands/blob/main/.syntax_components/target_selectors.md) |
