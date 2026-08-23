# 台鐵篇 — 資料盤點與品質警訊

> 盤點日 2026-08-23。所有數字皆第一手 query 取得，未經推估。
> 動筆前必讀本檔，避免用到已知有問題的數字。

## 一、大綱 9 題可行性

| # | 題目 | 判定 | 資料源 | 口徑注意 |
|---|---|---|---|---|
| 1 | 總共幾站 | ✅ | `rail.stations`(system_id='tra') 244 列 | 244 列含假站「臺北-環島」→ 實體 243；官方 2024 統計 **242 站**。TDX 無廢站標記 |
| 2 | 路線總長度 | ⚠️ 用官方值 | 官方營業里程 **1,065.0 km** | ❌ `rail.lines` 14 條加總 863.6 km **不可用**（WL/SK 含重疊段）。DB 幾何只用來畫圖 |
| 3 | 每天多少班次 | ✅ | `reference.daily_schedules`(tra_daily) 167 天 | 近 60 天平日均 **909**（896–928）、週末均 **916** |
| 4 | 每站停靠次數排名 | ⚠️ 局部 | daily_schedules JSONB 展開 | **top 可用、bottom 不可用**（見 §三.1） |
| 5 | 誤點率 | ✅✅ 核心 | `analytics.tra_delay_summary_daily` 176 天 | 三口徑並陳（見 §二） |
| 6 | 最容易誤點的區間 | ⚠️ 要清洗 | `tra_train_delay_daily.delay_trajectory` 15.8 萬筆 | 逐次輪詢觀測（含通過站），需濾尖刺、對齊站序、設最小樣本數 |
| 7 | 站體海拔排名 | ✅ 現成 | `terrain-art/public/layers/stations.json` | 244 站全命中；是**地面高程**非軌道高程 |
| 8 | 周邊人口 | ✅ 小工 | `spatial.statistical_areas` 11,490 最小統計區(2025) | 半徑鎖 **1 km**、面積加權 |
| 9 | 周邊便利商店 | ✅ 小工 | `reference.poi` category='convenience_store' 13,223 筆 | 半徑同上；已分好類，不靠店名比對 |
| 9b | 人口 ÷ 車次 | ✅ 衍生 | 8 ÷ 4 | 受 §三.1 影響，只對有時刻表的站計算 |

## 二、誤點率三口徑（近 30 天實測）

| 口徑 | 準點率 | 說明 |
|---|---|---|
| 沿途任一觀測點 >5 分 | **76.91%** | 接近乘客體感 |
| 近終點觀測 >5 分 | **92.86%** | 接近官方定義 |
| 官方公布（2025 全年） | **97.02%** | 到終點站延誤 ≤5 分 |

p90 誤點 8.0 分、觀測涵蓋率 84.7%。
台鐵自承終點站口徑「民眾無感」，2026 年推「各站準點率監控」新制但**尚未公布任何站級數字**。

## 三、資料品質警訊（必進正文的「方法與限制」）

### 1. ⚠️ 時刻表 pipeline 漏 12 站 —— 阻擋「停靠最少」排名

`reference.daily_schedules`(tra_daily) 2026-08-19 展開後只有 232 站有停靠紀錄。
缺席 12 站，用獨立來源 `public.train_positions`（TrainLiveBoard 即時位置，7 天）交叉驗證：

| station_id | 站名 | 時刻表 | 即時位置（7天相異車次） | 判定 |
|---|---|---|---|---|
| 3250 | 潭子 | 0 | **176** | ❌ pipeline 漏抓 |
| 3340 | 新烏日 | 0 | **198** | ❌ pipeline 漏抓 |
| 3260/3270/3280/3290/3350 | 頭家厝/松竹/太原/精武/成功 | 0 | 0 | ❌ 待查（台中高架化區間） |
| 4070 | 嘉北 | 2 | 0 | ❌ 待查（嚴重低估） |
| 7140 | 新馬 | 0 | 0 | ❌ 待查 |
| 5170 | 枋野 | 0 | 44（通過不停） | ✅ 正確，號誌站不辦客運 |
| 5998/5999 | 南方小站/潮州基地 | 0 | 0 | ✅ 正確，非營業站 |
| 1001 | 臺北-環島 | 0 | 0 | ✅ 正確，資料庫假站 |

**共同特徵**：漏掉的都是**都會區捷運化通勤站**（台中高架化 7 站、嘉北、新馬）。

**影響**：
- ✅「停靠最多」排名不受影響（大站全在）
- ❌「停靠最少」排名**不可發** —— 會把潭子、新烏日誤判成秘境站
- ✅ 內獅 4／枋山 7／加祿 9 是真的秘境站（即時資料佐證）

**待辦**：回報 data-collectors（`rail_timetable.py` 轉換器，TD-1 的延伸）。

### 2. LiveBoard 覆蓋率 ~85%
且列車進終點前 1–3 站 TDX 常停止回報 → `near_dest` 系列欄位就是為此設的。

### 3. 176 天中 9 天缺班表
TD-1 的 collector 計時漂移 → 該日誤點指標為 NULL，算平均要排除。

### 4. `delay_trajectory` 有資料尖刺
單點暴衝又消失（6→95→6）→ 一律用 `p90_delay_min`，不用 `max_delay_min`。

### 5. `rail.lines.length_km` 不可加總
WL（西部幹線）station_count=111 遠超實際、SK（南迴）疑似併入屏東線重疊段。
欄位註解自承「一線多 OD 變體取最長單條近似」。

## 四、現成可直接引用的資產

| 資產 | 路徑 | 內容 |
|---|---|---|
| 站表（含站等/地址） | `mini-taiwan-pulse/public/rail/tra/stations/stations.geojson` | 244 站 |
| 路線幾何（畫圖用） | `mini-taiwan-pulse/public/rail_bundle.json` → `systems.tra.tracks_golden` | 37 條含中文線名 |
| 車站高程 | `terrain-art/public/layers/stations.json` | 547 站 6 系統，NLSC 20m DTM 2024 |
| 班次統計邏輯 | `tra-art-map/src/hooks/useStationStats.ts` | 24hr 分布/南北向/路線頻率 |
| 誤點 UI 參考 | `mini-taiwan-pulse/src/components/intel/monitor/TraDelayBoard.tsx` | RPC `get_tra_delay_trains` |
| 地圖嵌入 | `/embed?v=1&rsys=tra&…` | MapLibre，零 Mapbox 費用 |

## 五、資料源一覽

| schema.table | 列數 | 覆蓋 | 用途 |
|---|---|---|---|
| `rail.stations` | 244 (tra) | 快照 | 站點主檔（座標/站等/縣市/地址） |
| `rail.lines` | 14 (tra) | 快照 | 路線幾何（⚠️ 里程不可加總） |
| `rail.station_daily_trips` | 237 (tra) | 單一快照 2026-05-30 | 典型一日停靠數（⚠️ 非時序，且受 §三.1 影響） |
| `rail.ridership_by_station` | 1,196 | 2026-01~05 月統計 | 各站進出站運量 |
| `reference.daily_schedules` | 167 天 | 2026-03-03~ 每日 | 每日時刻表（`data.schedules[].stations[]`） |
| `analytics.tra_train_delay_daily` | 158,321 | 2026-02-28~ 176 天 | 每班次每日誤點 + `delay_trajectory` |
| `analytics.tra_delay_summary_daily` | 176 | 同上 | 每日全網誤點彙總（多門檻 + near_dest 系列） |
| `public.train_positions` | 573,643 | 7 天滾動 | TrainLiveBoard 原始輪詢（交叉驗證用） |
| `spatial.statistical_areas` | 11,490 | 2025 | 最小統計區人口 |
| `reference.poi` | 13,223 (超商) | 2026-03 | 便利商店 POI（含品牌 subcategory） |
