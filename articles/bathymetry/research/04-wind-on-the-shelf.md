# 離岸風場 × 海底地形抽樣

執行日：2026-09-05

## 結論

Mini Taiwan Pulse 快照中的 36 個 `offshoreWindZones` polygon 幾乎全部位在 GEBCO_2025 的淺水網格上。以 polygon 內的 raster cell center 取樣，35 個風場的所有海水像元都淺於 100 m；唯一例外仍有 99.33% 像元淺於 100 m。全部風場聯集共有 15,735 個海水像元，其中 99.987% 淺於 100 m。

這支持正文寫「現有風場範圍幾乎都落在西側淺陸棚」，不支持「水深決定風場位置」。經濟部能源署的政策說法是「先淺海、後深海」，同時明列水深、地質地形、技術與產業等成本因素。

## 輸入與雜湊

- 風場：`mini-taiwan-pulse/public/static-rpc/get_offshore_wind_zones.json`
  - 36 個 MultiPolygon
  - SHA256 `50fa8688a40fa6fc34d3b5ade63b00c931187475cb3472b7ea8314bdcadd2130`
- 海底網格：`taipei-gis-analytics/data/raw/base_map/gebco_2025/gebco_2025_taiwan_subset.tif`
  - GEBCO_2025 `sub_ice_topography_bathymetry`
  - SHA256 `d8b0ba6ab06f3badb9d1a76d5695b24db753c488aaa642b509f445990d3087c7`
  - WGS84 / Int16 / 15 arc-second
  - 實際 raster 1610 × 1514；bbox 117.2958–124.0042 E、20.6958–27.0042 N

## 方法

1. 讀取 36 個 MultiPolygon；原始幾何 #3、#7、#36 無效，先以 Shapely `make_valid` 修復。
2. 以 raster cell center mask（`all_touched=False`）取 polygon 聯集內像元。
3. GEBCO elevation 取負為水深，排除 14 個正高程 cell。
4. 以像元數計算深度帶比例；另以 WGS84 geodesic nominal-cell 面積加權交叉檢查，結果幾乎相同。

## 結果

| 深度帶 | cell 數 | cell share |
|---|---:|---:|
| 0–20 m | 834 | 5.300% |
| 20–50 m | 14,395 | 91.484% |
| 50–100 m | 504 | 3.203% |
| >100 m | 2 | 0.013% |

- 水深 min / median / p90 / max：0 / 35 / 46 / 137 m。
- 面積加權比例：5.324% / 91.466% / 3.197% / 0.013%。
- 中心點納入的完整像元面積約 3,076.8 km²；這不是 polygon 的精確 geodesic area。

## 限制

- 15 arc-second 在台灣附近約為數百公尺尺度，不能取代風場施工前的測深、地質與基礎設計。
- cell-center / 完整像元法沒有計算 polygon 邊緣的 fractional overlap，小型或狹長 polygon 誤差較大。
- 重疊 polygon 以聯集處理，不能把聯集面積當成各場址面積的總和。
- OSM／Pulse polygon 的資料狀態與法定風場開發階段並不等同。
- 視覺疊合與格網統計證明空間共現；風況、海床地質、航道、生態、電網、法規與供應鏈仍是競爭解釋。

## 官方脈絡

- 經濟部能源署〈離岸風電區塊開發政策說明〉：https://www.moeaea.gov.tw/ecw/populace/news/News.aspx?kind=9&menu_id=4360&news_id=15063
- 經濟部能源署再生能源問答（台灣海峽風資源）：https://www.moeaea.gov.tw/ECW/populace/QuestionAnswer/QuestionAnswer.aspx?kind=15&menu_id=22036

