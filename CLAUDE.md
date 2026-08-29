# Mini Taiwan Stories — 開發規則

資料敘事文章系列。`mini-taiwan-*` 家族的內容層。定位與結構見 [`README.md`](./README.md)。

## 動筆前必做

1. **讀 [`../taiwan-md/EDITORIAL.md`](../taiwan-md/EDITORIAL.md)** —— 寫作品質標準沿用它
   （反直覺核心句 / 三層結構 / 每個事實可查證 / 密度優先）
2. **讀該篇的 `inventory.md`** —— 資料盤點與品質警訊，避免用到已知有問題的數字
3. 找資料先查 `../taipei-gis-analytics` 的 catalog，不要直接爬網站

## 鐵則

### 1. 數字必有台帳
正文每個數字 → `data.json` 一筆，含 `value` / `unit` / `as_of` / `method` / `query` / `source`。
沒有台帳的數字不准進正文。

### 2. 口徑先於數字
同一個指標有多種算法時（例：誤點率），**先在正文寫清楚口徑，再給數字**，
並且把各口徑並陳，不挑對自己敘事有利的那個。

### 3. 資料缺口誠實揭露
覆蓋率、缺失日、已知 pipeline bug → 進「方法與限制」段落，不是藏在註腳。

### 4. 官方數字優先
官方有公布的（營業里程、站數、年度準點率）一律用官方值並註明來源；
自算數字只用在官方沒有的維度，且必須標明是自算。

### 5. 地圖不自己畫
嵌 `../mini-taiwan-pulse` 的 `/embed?v=1&…`。網址參數表見
`../mini-taiwan-pulse/docs/features/embeddable-map/README.md`。
每張互動地圖都要在 `figures/` 備一張靜態圖（taiwan.md 併入時 iframe 會掉）。

## 這個 repo 靠哪些專案（路由表）

本 repo **只放文字與台帳，資料與地圖全部來自別的 repo**。
上層架構見 [`../CLAUDE.md`](../CLAUDE.md)（GIS 工作區的六層 SSOT）。
下表是「要做什麼 → 去哪裡」，路徑都實際驗過。

### 地圖

| 要什麼 | 去哪裡 |
|---|---|
| 嵌入地圖的網址參數表 | `../mini-taiwan-pulse/docs/features/embeddable-map/README.md` |
| 鐵路 layer 定義（key = `rail`） | `../mini-taiwan-pulse/src/data/layerManifest.ts` 第 396 行 |
| ⚠️ **為什麼地圖只有底圖沒有線** | `../mini-taiwan-pulse/src/embed/EmbedApp.tsx:188` —— `rail`/`ships`/`flights` 是 Three.js 回放層，**網址沒帶 `date=` 就不畫，且不報錯** |
| 產文章專用的日期快照 | `../mini-taiwan-pulse/scripts/export/export-embed-snapshot.sh` |
| 靜態圖 fallback | 自己截，存進該篇的 `figures/`（taiwan.md 與多數平台會擋 iframe） |

⚠️ production 目前**只有 `2026-08-06` 一天**有鐵路快照，其他日期 404。
現有文章的地圖全靠這一個檔案，見 `articles/01-tra/embeds.json` 的 `snapshot_risk`。

### 資料（Supabase，唯讀）

連線：`../mini-taiwan-pulse/.env` 的 `SUPABASE_DB_URL`。實際用過的表：

| 主題 | schema.table | 注意 |
|---|---|---|
| 車站主檔 | `rail.stations`（tra 244 列） | 含 1 個假站 `1001 臺北-環島`；`station_class` 212 列是 NULL，不能拿來分級 |
| 路線幾何 | `rail.lines`（tra 14 條） | ⚠️ **`length_km` 不可加總**（含重疊段，加起來 863km vs 官方 1,065km） |
| 每日時刻表 | `reference.daily_schedules`(system=`tra_daily`) | ⚠️ **讀 `data.schedules[].stations_raw` 不要讀 `stations`**，且只有 2026-08-23 起才有，見下方「已知的坑」 |
| 每班次誤點 | `analytics.tra_train_delay_daily`（15.8 萬列） | `delay_trajectory` 是逐次輪詢觀測，含通過站；有尖刺要用 p90 不用 max |
| 每日誤點彙總 | `analytics.tra_delay_summary_daily` | `delayed_over_5` 的定義是 `max_delay_min >= 5`（**≥ 不是 >**，已逐日比對驗證） |
| 即時位置（交叉驗證用） | `public.train_positions`（7 天滾動） | 獨立於時刻表的第二來源，抓資料錯誤靠它 |
| 站級停靠（預算好的） | `rail.station_daily_trips` | ⚠️ 單一快照 2026-05-30，不是時序，且受轉換器 bug 影響 |
| 各站運量 | `rail.ridership_by_station` | 月統計 |
| 便利商店 POI | `reference.poi`（`category='convenience_store'` 13,223 筆） | 全台，已分好類不用比對店名 |
| 村里人口 | `admin.villages`(幾何) ⨝ `spatial.village_attributes`(人口) | 7,972 村里全台，2023 |
| H3 人口網格 | `spatial.h3_demographics` | res7 全台；res8 的 `population` 是 NULL |
| ⚠️ **不要用** | `spatial.statistical_areas` | 名字看起來是全台最小統計區，**實際只涵蓋台北市**（bbox 121.46–121.67E），踩過 |

### 現成資產（不用重算）

| 要什麼 | 去哪裡 |
|---|---|
| 車站高程（547 站 6 系統） | `../terrain-art/public/layers/stations.json`（NLSC 20m DTM 2024） |
| 重跑高程 | `../terrain-art/scripts/bake_layer_elevations.py` |
| 站表含站等/地址 | `../mini-taiwan-pulse/public/rail/tra/stations/stations.geojson` |
| 路線幾何（畫圖用） | `../mini-taiwan-pulse/public/rail_bundle.json` → `systems.tra.tracks_golden`（37 條含中文線名） |
| 班次頻率/24hr 分布邏輯 | `../tra-art-map/src/hooks/useStationStats.ts` |
| 站表（另一份，含 class） | `../mini-taipei-v3/public/data/tra/stations.geojson` |
| 誤點 UI 參考實作 | `../mini-taiwan-pulse/src/components/intel/monitor/TraDelayBoard.tsx` |
| 縣市統計 / 運量查詢 | `../mini-taiwan-info/frontend/src/lib/queries/rail.ts`（⚠️ `themes/rail.yaml` 已過時，以 .ts 為準） |

### 上游 / 管線

| 要什麼 | 去哪裡 |
|---|---|
| 時刻表怎麼抓的 | `../data-collectors/collectors/rail_timetable.py`（TDX `DailyTrainTimetable/Today`） |
| 時刻表轉換器（bug 在這） | `../data-collectors/tasks/mini_taipei_publish.py` |
| 即時位置怎麼抓的 | `../data-collectors/collectors/tra_train.py`（TrainLiveBoard，2 分鐘一次） |
| S3 歸檔（回填用） | `rail_timetable/archives/{date}.tar.gz`、`tra_train/archives/`（2026-02-28 起連續） |
| DB migration | `../gis-platform` |
| 跨 repo 契約 / ADR **SSOT** | `../taipei-gis-analytics/docs/handoff/`、`docs/adr/` |
| 找新資料（先查目錄再爬網站） | `../taipei-gis-analytics` 的 `catalog-search` skill（7.4 萬筆政府開放資料） |

### 發布端

| 要什麼 | 去哪裡 |
|---|---|
| 寫作品質標準 | `../taiwan-md/EDITORIAL.md` |
| frontmatter schema | `../taiwan-md/src/content.config.ts`（zod，未知欄位會被 strip，可安全擴充） |

## 已知的坑（跨 repo，踩過的）

1. **台鐵站級時刻表要讀 `stations_raw`** —— `stations` 是給 mini-taipei 3D 前端的，
   經站碼映射與軌道過濾會少站，且台中線豐原—烏日整段被污染（潭子的紀錄寫到栗林頭上）。
   2026-08-23 修復（data-collectors PR #57），但**2026-08-22 以前的 167 天仍然只有壞的 `stations`**，
   要嘛排除 11 站、要嘛從 S3 回填。完整根因見 `articles/01-tra/inventory.md` §三.1。
2. **`rail_timetable` 的排程會漂移** —— 1440 分鐘*相對*間隔，每次容器重啟就重設計時器，
   實測 8 月的執行時間在 00:05～22:08 之間跳。所以「今天沒有資料」不一定是壞了。
3. **重負載查詢避開餐期** —— `delay_trajectory` 全掃、多日 JSONB 展開，
   避開台灣時間 10:00–20:00（團隊守則）。日期範圍走 PK index，30 天窗只要 3 秒。
4. **在 Desktop 下新建 repo 可能觸發 macOS TCC 中途封鎖** —— 症狀是既有檔案 EPERM 但
   `stat` 還能過。已 push 的東西可以 `curl` GitHub raw 繞過。

## 資料查詢

**唯讀鐵則**：Supabase 只可 SELECT / EXPLAIN，查詢帶 LIMIT。表清單與各表的坑見上方路由表。

## Frontmatter

相容 `taiwan-md` 的 Astro schema（未知欄位會被 strip，可安全擴充）：
`title` / `description` / `date` / `tags` / `sources` / `lastUpdated` / `readingTime` / `difficulty`
