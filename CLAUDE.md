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

## 資料查詢

Supabase 唯讀。連線用 `../mini-taiwan-pulse/.env` 的 `SUPABASE_DB_URL`。
**唯讀鐵則**：只可 SELECT / EXPLAIN，查詢帶 LIMIT。

⚠️ 重負載查詢（`delay_trajectory` 全掃、多日 JSONB 展開）避開台灣時間 10:00–20:00。

## Frontmatter

相容 `taiwan-md` 的 Astro schema（未知欄位會被 strip，可安全擴充）：
`title` / `description` / `date` / `tags` / `sources` / `lastUpdated` / `readingTime` / `difficulty`
