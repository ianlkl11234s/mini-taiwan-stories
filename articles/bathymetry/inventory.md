# 海底地形文章資料與圖層盤點

## 結論

本篇以 `isobath` 為主圖，直接支持「台灣西側是寬淺陸棚，東側在短距離內落入深海」。第二張圖疊 `offshoreWindZones`，並以 GEBCO cell-center 抽樣確認風場與淺海的區域共現。地震有可靠脈絡，但現有動態圖層不支援文章 embed，因此只進正文解釋，不製造不可重現的第三張圖。AIS 仍拆為下一篇。

## 主圖層：`isobath`

| 項目 | 結果 |
|---|---|
| Source | GEBCO_2025 Grid `sub_ice_topography_bathymetry` 台灣周邊子集 |
| Lifecycle | static；本圖固定版本，不會隨時間自動改變 |
| Spatial scope | 117.3–124.0°E，20.7–27.0°N |
| Grid | 15 arc-second；Int16 公尺，海底為負值 |
| Derived geometry | 11 種等深線（-20 至 -6000 m）+ 12 個深度帶（-7000 至 0 m） |
| Generalization | `ogr2ogr -simplify 0.002`；102 個極短線段退化後被濾除，11 種深度仍全部存在 |
| Drawable evidence | 2026-08-23 production 驗證 PMTiles 可讀且 z8 有 511 個 rendered features |
| License | public domain；需標示 `GEBCO Compilation Group (2025) GEBCO 2025 Grid` |
| Safety boundary | GEBCO 不保證絕對準確或完整，不供航海與人身安全使用 |
| Freshness | GEBCO_2026 已於 2026 年發布；本文可用 2025 版保持與線上圖層一致，但不得稱為最新版 |

## 可一起使用的圖層

| 圖層 | 產品狀態 | 故事價值 | 關鍵限制 | 本篇決定 |
|---|---|---|---|---|
| `ships` | Pulse 回放層；embed 必須固定 `date`，目前專案有 2026-08-06 快照 | 最適合延伸「船在什麼水深上活動」 | AIS 接收覆蓋與航跡去重未驗就無法講平常分布；國籍不等於行為意圖 | 拆為 MTS-2026-003 |
| `vesselWatch` | 與全量 `ships` 不同的特殊船舶圖層 | 可問公務、研究或其他特殊船隻的活動空間 | 動態資料，尚無本文可用的固定日期與可重現快照 | 本篇不用 |
| `offshoreWindZones` | Pulse dynamic CDN / static RPC snapshot；文章 embed 可載入 | 對照西側淺陸棚與海上工程空間 | 36 個 polygon 中 35 個的抽樣海水像元全數淺於 100 m；仍受風況、地質、航道、生態、電網與法規影響 | 納入第二張圖，限於區域共現 |
| `earthquakes` / `earthquakesGlobal` / `earthquakeReplay` | Pulse dynamic custom hooks | 能把活動構造與東部、東北部地震集中放在同一畫面 | 目前不在文章 `/embed` allowlist；動態期間與規模門檻也必須固定 | 正文引用 CWA 脈絡；不放互動疊圖 |
| `activeFaults` | 靜態陸上活動斷層 | 可補本島構造線 | 主要是陸上斷層，不能取代海域板塊邊界或地震目錄 | 本篇不用 |
| `submarineCables` + `landingStations` | 靜態 GeoJSON；manifest confidence=LOW | 能講海底空間上的數位基礎設施 | OSM / OpenInfraMap 路徑是概略化、不完整的概觀；不是精確工程位置 | 只作將來插圖，本篇不用 |
| `oceanCurrents` | CMEMS 動態表層海流 | 視覺潛力高 | 表層海流不能用來直接解釋海底地形成因；也不是靜態文章快照 | 本篇不用 |
| `marineObservationCwa` / `marineObservationIsohe` | 動態觀測點 | 可連到海況與水文 | provider、高程基準、時間與 freshness 必須分開；觀測點不是海底驗證 | 本篇不用 |
| `maritimeBoundary` | 靜態界線 | 可補政治地理範圍 | 將讀者注意力從地形拉向主權與法制，且界線不解釋水深 | 本篇不用 |

## 目前最值得補、但還不能用的圖層

`taipei-gis-analytics` 已有 `ocean_topography` 資料卡，聚合台灣海峽、琉球海溝、馬尼拉海溝等海底地名，會很適合幫讀者對圖。但它尚未接入 Pulse，上游原始門戶、dataset ID 與取得法也仍有待補齊，因此本次不把 catalog 存在當成可繪製或可發布證據。

## 來源、資料、runtime 與文章狀態

| Gate | 狀態 | 證據 |
|---|---|---|
| Source | ✅ | GEBCO 2025 歷史頁、DOI、terms 與台灣子集 catalog |
| Data artifact | ✅ | raw GeoTIFF 與 derived PMTiles 皆有 manifest，數量可審計 |
| Drawable layer | ✅ | Pulse `isobath` manifest / overlay / params 皆存在 |
| Prior production runtime | ✅ 2026-08-23 | production PMTiles 回應且 browser 可取得 rendered features |
| Current article embeds | ✅ runtime／✅ Map gate | 2026-09-05 已在 production 實際看到主圖 Haxby 深度帶、等深線、GEBCO attribution，以及第二圖青色離岸風場 polygon |
| Article draft / preview | ✅ local | `article.md` 與 `taiwan-md-preview.html` 已建立；2026-09-05 以 browser 驗收桌面首屏、兩張 production iframe、互動切換與 reset |
| Deploy / release | ⏳ | 未取得發布授權，也未建立本文發布證據 |
