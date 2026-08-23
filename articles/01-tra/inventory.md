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

## 二、誤點率四口徑（2026-07-24~08-22，同分母 23,263 觀測班次）

⚠️ **門檻定義已驗證**：資料庫的 `delayed_over_5` = `max_delay_min >= 5`
（用 2026-08-18/19 逐日比對確認：161=161、155=155）。所以準點 = 誤點 <5 分。

| 口徑 | 準點率 | 分母 | 說明 |
|---|---|---|---|
| A 沿途最大誤點 <5 分 | **76.89%** | 23,263 | 乘客體感 |
| A2 沿途 p90 <5 分 | **86.95%** | 23,263 | 濾掉單點尖刺 |
| B′ 最後一次觀測 <5 分 | **92.39%** | 23,263 | ⭐ **與 A 同分母**，差距純口徑不含樣本篩選 |
| B 近終點子集 | 92.87% | 14,162 | 分母不同（子集），與 B′ 只差 0.48pp |
| C 官方公布（2025 全年） | 97.02% | — | 到終點站延誤 ≤5 分 |

**拆解**：
- A → B′ = **15.50 pp**：同一批車、同一分母，純粹是「沿途誤點但後來追回來」
- B′ → B = **0.48 pp**：樣本篩選效應，實測很小（重要——證明 15.5pp 不是挑樣本挑出來的）
- B → C = **4.15 pp**：觀測方式 + 統計期間差異（官方 2025 全年 vs 自算 2026 夏季 30 天，不嚴格可比）

p90 誤點 8.0 分、觀測涵蓋率 84.7%。
台鐵自承終點站口徑「民眾無感」，2026 年推「各站準點率監控」新制但**尚未公布任何站級數字**。

## 三、資料品質警訊（必進正文的「方法與限制」）

### 1. ⚠️ 時刻表轉換器毀了台中線一整段 —— 根因已查明

`reference.daily_schedules`(tra_daily) 展開後只有 232 站有停靠紀錄（`rail.stations` 有 244 筆）。
2026-08-23 追到根因，**是三個不同的問題**，不是同一個：

#### (a) 台中 7 站：station_id 被改寫成舊 ID（我方轉換器）

`data-collectors/tasks/mini_taipei_publish.py:32-40` 有一張 `STATION_ID_MAPPING`，
把台中線高架化後 TDX 給的**新** station_id 硬改回高架化**前**的舊 ID：

```
'3250'→'3240'(潭子→栗林)  '3260'→'3243'  '3270'→'3245'
'3280'→'3247'  '3290'→'3249'  '3340'→'3330'(新烏日→烏日)  '3350'→'3330'(成功→烏日)
```

這張表是高架化通車前建的，通車後沒人拿掉。後果有兩層：

1. **7 站在 `rail.stations` 裡查無紀錄** —— 3243/3245/3247/3249 這些舊 ID 根本不在站表裡（join 掉）
2. **栗林與烏日的數字被合併污染** —— 3240 同時收到「栗林本人」與「潭子」的紀錄，
   而 `mini_taipei_publish.py:221-226` 的去重用 station_id 當 key，
   同一班車停兩站只留一筆 → 數字變成兩站的**聯集去重**而非加總。
   實測：栗林我方算 112、外部實際 102；烏日 133。3340 與 3350 都映到 3330，成功站被去重直接丟掉。

> 上游 TDX 原始歸檔裡這 7 站各出現 79~133 次，資料**本來是有的**。

#### (b) 嘉北：被 3D 軌道比對邏輯過濾掉

`mini_taipei_publish.py:189,212`：轉換器先用 `find_matching_track` 幫每班車挑**一條** O-D 軌道，
再用 `if normalized_sid not in track_station_set: continue` 砍掉不在那條軌道上的停靠站。
`od_station_progress.json` 的 271 條軌道裡只有 3 條含嘉北 → 絕大多數經過嘉北的車，
嘉北那筆停靠被丟掉。**TDX 原始有 79 筆、DB 只剩 2 筆**（外部驗證：嘉北今日 79 班）。

這是設計耦合的問題：「3D 視覺化要怎麼畫這條路徑」不該反過來決定「這班車停不停這站」。

#### (c) 新馬：TDX 上游本來就沒有

逐筆掃 2026-08-19 原始歸檔的 910 班車 `StopTimes`，用 station_id 7140 與站名都搜不到。
與我方轉換無關。

#### 外部驗證（2026-08-23，timetables.tw）

| 站 | 我方時刻表 | 外部今日實際 | 判定 |
|---|---|---|---|
| 臺北 | 318（平日）/ 328（週末） | 334 | ✅ 接近，top 排名可信 |
| 栗林 | 112 | 102 | ⚠️ 被合併污染 |
| 潭子 | **0** | **114** | ❌ 被改寫成 3240 |
| 嘉北 | **2** | **79** | ❌ 被軌道比對過濾 |

來源：https://timetables.tw/station/1000 · /3240 · /3250 · /4070

#### 對文章的影響

- ✅ **top 排名可用**（大站全在，臺北只差 6 班）
- ❌ **bottom 排名與 pop÷車次必須排除 11 站**：
  消失 7（潭子/頭家厝/松竹/太原/精武/新烏日/成功）+ 污染 2（栗林/烏日）+ 過濾 1（嘉北）+ 上游缺 1（新馬）
- 排除名單記在 `data.json` 的 `rankings.station_stops.excluded`

#### 建議修法（給 data-collectors，未動手）

1. 移除 `STATION_ID_MAPPING` 裡 `'3340':'3330'`（`od_station_progress.json` 已原生支援 3340）
2. 為 3260/3270/3280/3290/3350 在 `od_station_progress.json` 補 progress 值，然後拿掉對應映射
3. **結構性修法**：把「挑 3D 軌道」與「記錄停靠站」解耦 —— 中途停靠站只要 TDX 有給就照留，
   `track_id` 只決定視覺化怎麼畫
4. 新馬先多抓幾天歸檔確認是否為當日巧合

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
