# 01 — 來源、版本與海底地形脈絡

## 可使用的核心結論

1. 台灣西側連接大陸棚，官方地質綜述將其描述為水深大多小於 60 公尺。
2. 東側的陸棚極狹，同一份資料描述海底在距岸不到 10 公里即降至約 1,000 公尺深。
3. 這種不對稱與台灣位在大陸邊緣、琉球島弧與呂宋島弧交會的構造位置有關。
4. 本圖使用 GEBCO 2025；到 2026-09-05 已有 GEBCO 2026，所以只能稱為「本圖的固定版本」，不能稱為最新資料。

## GEBCO 資料邊界

- GEBCO 2025 為 15 arc-second 海陸一體網格，是 Seabed 2030 的全球編纂成果之一。
- 「15 arc-second」是輸出網格間距，不是每個位置都有同等密度的原始測深。
- 網格會結合船載測深、衛星重力推估與內插等不同來源；局部細節的信心度不同。
- GEBCO 資料為 public domain，但需正確標示。它明確不供航海、生命安全或精確測量用途。
- 本專案將網格轉為固定級距等深線與帶狀面；它是閱讀尺度的視覺化，不是原始測點圖。

## 版本決定

本文不直接把圖層升級到 GEBCO 2026。原因是線上 `isobath` PMTiles、深度帶、截圖與 production 證據全部固定於 2025 版。文章只需明記版本；升級網格應是獨立的上游資料、衍生圖層、前端與瀏覽器驗收工作。

## 對使用者原稿數字的處理

### 可改成穩健說法

- 「台灣海峽平均只有 50 公尺」→「台灣西側的大陸棚水深大多小於 60 公尺」。
- 「花蓮外海 10 公里就有 1,053 公尺」→「台灣東側可在距岸不到 10 公里就進入約 1,000 公尺深」。
- 「18.7 公里就有 4,006 公尺」→如果不重建斷面，只寫「圖上東側很快跨過 4,000 公尺等深線的量級」。

### 目前不能使用

- 「深於 100 公尺的海域只佔 0.8%」：找不到測量範圍、母體網格、海岸遮罩與計算法，不能從數字外觀倒推。
- 1,053 m、4,006 m 與 18.7 km 的組合：沒有起點座標、斷面方位、海岸起算法、網格版本、取樣與內插法，無法重現。

## 主要來源

- [GEBCO_2026 Grid](https://www.gebco.net/data-products/gridded-bathymetry-data/gebco2026-grid)
- [GEBCO historical data sets](https://www.gebco.net/data-products/historical-data-sets)
- [經濟部地質調查及礦業管理中心〈臺灣附近的海洋地質〉](https://twgeoref.gsmma.gov.tw/GipOpenWeb/wSite/ct?ctNode=1259&mp=106&xItem=120808)
- [Ramsey et al. (2006), *Topographic development of the Taiwanese orogen*](https://agupubs.onlinelibrary.wiley.com/doi/full/10.1029/2005JF000314)
- [國土測繪中心〈台灣高山高程〉](https://www.nlsc.gov.tw/cp.aspx?n=1486)
- [`taipei-gis-analytics` GEBCO 2025 catalog](../../../../taipei-gis-analytics/docs/data-catalog/base_map/gebco_2025.md)
- [`taipei-gis-analytics` isobath catalog](../../../../taipei-gis-analytics/docs/data-catalog/base_map/gebco_isobath.md)
- [Mini Taiwan Pulse isobath changelog](../../../../mini-taiwan-pulse/docs/features/isobath/changelog.md)
