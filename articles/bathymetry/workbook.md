# Article workbook — `bathymetry`

## 0. Control

| Field | Value |
|---|---|
| Topic ID | MTS-2026-002 |
| Article slug | bathymetry |
| Current state | 複核刪修 |
| Article tier | A 級／標準（地形生成、構造、火山島與風場疊圖） |
| Central finding | 台灣西側連著大陸邊緣的寬淺陸棚，東側卻貼近活動板塊邊界的深海；同一套地形也限制了火山島的樣貌與離岸工程優先進入的空間 |
| Workbook updated | 2026-09-05 |
| Rubric version | 0.1-draft |
| Next action | 請使用者閱讀與第一篇整合後的本機文章選單並做最終人工接受 |
| Blocker | 風電圖尚缺專用靜態 fallback；未授權部署／發布 |

### Stage progress

- [x] 0 現象已入題庫
- [x] 1 脈絡與來源完成第一輪研究
- [x] 2 核心數據與主張達到大綱可用狀態；使用者原稿的精確數字仍有待解決項
- [x] 3 地圖取景經使用者確認（2026-09-05：全島主圖 + 綠島蘭嶼近景 + 風電疊圖；地震不納入）
- [x] 4 單篇核心發現與邊界已提案
- [x] 5 大綱經使用者確認（2026-09-05 更新：地形鉤子 → 成因 → 綠島／蘭嶼 → 風電 → 製圖方法）
- [x] 6 完成有來源的全文草稿
- [x] 7 完成數據、來源、production embed 與 local article page browser 複核
- [x] 8 完成 Taiwan.md 準則與 Sepia 刪減、節制、故事性檢查
- [ ] 9 完成評分、參考資料與發布狀態

## 1. 現象卡

### 使用者提供

- **截圖：**[`figures/hero-isobath.png`](./figures/hero-isobath.png)
- **地點：**台灣本島與台灣海峽、東部近海、琉球島弧一帶
- **圖層：**Mini Taiwan Pulse `isobath`，來源為 GEBCO 2025 Grid
- **截圖日期／資料版本：**2026-09-05 截圖／GEBCO 2025
- **可回到原圖的相機：**2026-09-05 依使用者最終截圖鎖定為 `lng=120.72417`, `lat=23.49950`, `z=6.58`, `pitch=0`, `bearing=0`。Dark、Haxby、分帶開啟，線透明度 `0.85`，填色透明度 `0.35`。
- **希望讀者注意：**台灣東西海底的量級差異，以及「島貼著懸崖邊」的地形感。
- **覺得震撼的部分：**西邊像寬闊淺盤，東邊等深線在岸邊快速密集，很快就進入數千公尺深海。

### 僅依畫面可觀察

- 台灣海峽的淺水深度帶遠比東岸寬。
- 東側等深線較密，可讀為圖上深度變化較快；這個畫面本身不提供精確坡度。
- 圖層中可看到 4,000 公尺等深線，但截圖無法單獨證明使用者原稿的特定離岸距離。

### 需要研究才能回答

- 東西不對稱的板塊構造背景。
- 台灣海峽與東部海底可安全使用的深度量級。
- GEBCO 網格的版本、原始解析度與內插限制。
- AIS 航跡與海底地形是否有可重複的分布關係。

### 可能只是資料或渲染差異

- Haxby 配色與固定分帶會放大視覺邊界；顏色差不等於地質分區。
- GEBCO 由不同來源與解析度的測深資料編纂而成，局部細節可能是內插結果。
- 前端等深線由 15 arc-second 網格產生，經過約 `0.002°` 簡化，不適合測量單一岸點的精確水深斷面。

### Screenshot trace

- [x] 已在題庫搜尋相同現象、地點與圖層，本題為新增
- [x] 已記錄地點、圖層、截圖日期、資料版本與相機位置
- [x] 未在缺少斷面起點與方位時採用精確離岸距離主張

## 2. 脈絡與來源

研究索引：

- [`research/01-source-and-context.md`](./research/01-source-and-context.md)
- [`research/02-layer-pairing.md`](./research/02-layer-pairing.md)
- [`research/03-tectonics-islands-earthquakes.md`](./research/03-tectonics-islands-earthquakes.md)
- [`research/04-wind-on-the-shelf.md`](./research/04-wind-on-the-shelf.md)
- [`research/05-editorial-sepia-pass.md`](./research/05-editorial-sepia-pass.md)

### 需要補足但未必能地圖化的脈絡

- **定義：**等深線是相同水深的連線；線密代表圖上深度變化快，不自動代表某種海底材料或災害。
- **運作機制：**台灣位在歐亞板塊邊緣與菲律賓海板塊聚合帶，東西海底分屬不同地形構造背景。
- **歷史發展：**GEBCO 每年發行新網格；本圖固定使用 2025 版以保留可重現性。
- **反例／競爭解釋：**視覺密度可能同時受原始測深稀疏度、網格內插、等深線級距與簡化容差影響。

### Source register

| ID | Source | Type | Edition / as of | Accessed | Supports | Limits |
|---|---|---|---|---|---|---|
| S01 | 經濟部地質調查及礦業管理中心〈臺灣附近的海洋地質〉 | official | 1995 出版品 | 2026-09-05 | 西側大陸棚大多淺於 60 m；東側距岸不到 10 km 即達約 1,000 m 深；島弧構造背景 | 舊版綜述，適合量級與脈絡，不足以驗證單一斷面的小數數字 |
| S02 | GEBCO historical data sets | primary | GEBCO_2025 | 2026-09-05 | 2025 版為 15 arc-second 網格，發布於 2025-08 | 目前已非最新版 |
| S03 | GEBCO_2026 Grid | primary | GEBCO_2026 | 2026-09-05 | 2026 版為當前版；資料編纂、授權、標示與非航海用途限制 | 用來檢查版本新鮮度，不是本圖的直接資料版本 |
| S04 | `taipei-gis-analytics` GEBCO 2025 / isobath catalog | project primary | pipeline 2026-08-23 | 2026-09-05 | 裁切範圍、深度級距、簡化、feature 與 PMTiles 規格 | 是本專案的衍生層方法，不取代 GEBCO 上游說明 |
| S05 | Mini Taiwan Pulse isobath changelog | project primary | production 2026-08-23 | 2026-09-05 | 圖層上線、正式站載入與 attribution 驗證 | 只證明當日的 runtime，不代表本次文章 embed 已驗收 |
| S06 | Ramsey et al., *AGU Journal of Geophysical Research* | academic | 2006 | 2026-09-05 | 板塊聚合、東部高地形起伏與狹窄陸棚脈絡 | 研究也指出東台灣部分狹窄陸棚測深當時稀疏，不可忽略內插不確定性 |
| S07 | 國土測繪中心〈台灣高山高程〉 | official | page checked 2026-09-05 | 2026-09-05 | 玉山官方通常引用高度 3,952 m | 海底水深與山峰高度的基準不同，只能比較量級 |
| S08 | 地質調查及礦業管理中心〈孤懸東南外海的火山島—綠島和蘭嶼的地質概述〉 | official | 2021 | 2026-09-05 | 兩島的火山岩、凝灰岩、珊瑚礁與火山島背景 | 科普綜述；精確年代另用學術定年 |
| S09 | Shao, Chung & Chen, *TAO* | academic / English | 2014 | 2026-09-05 | 北呂宋火山弧；綠島約 1.3 Ma、蘭嶼約 2.6 Ma 的主要噴發期 | 年代是樣本與方法的結果，不是整島單一年齡 |
| S10 | 中央氣象署〈臺灣地震帶的分布〉 | official | checked 2026-09-05 | 2026-09-05 | 東部、東北部地震活動與板塊背景 | 區域脈絡，不是本文地圖資料 |
| S11 | 中央氣象署〈臺灣地區地震活動與地體構造的關係〉 | official | checked 2026-09-05 | 2026-09-05 | 東部與東北部地震集中、構造背景複雜 | 不把地震點與單一等深線一對一歸因 |
| S12 | 經濟部能源署〈離岸風電區塊開發政策說明〉 | official | 2024 | 2026-09-05 | 「先淺海、後深海」與水深、地形地質等成本因素 | 政策脈絡不等於單一場址選址模型 |

### Freshness check

- [x] 已查 GEBCO 官方入口頁，不只使用搜尋摘要
- [x] 已確認 2026 版已取代 2025 版成為當前版
- [x] 本文明記「地圖使用 GEBCO 2025」，不寫「最新 GEBCO」
- [x] 台灣海底形態以官方綜述與學術論文交叉核對
- [ ] 若正文要保留特定花蓮岸點的離岸數字，需另建有起點、方位、水深基準與網格取樣的可重算斷面

## 3. 主張與數據

完整數字台帳見 [`data.json`](./data.json)，圖層語意與可寫界線見 [`inventory.md`](./inventory.md)。

### Claim ledger

| ID | Candidate claim | Type | Source / method | Status | Allowed wording / caveat |
|---|---|---|---|---|---|
| C01 | 西側淺水帶寬，東側等深線緊貼海岸 | map observation | 截圖 + `isobath` 分帶 | verified | 只描述畫面與深度變化，不由疊圖直接推論成因 |
| C02 | 台灣西側大陸棚大多淺於 60 m | source fact | S01 | verified | 使用「大多」，不改寫為平均水深 50 m |
| C03 | 東側可在距岸不到 10 km 進入約 1,000 m 深 | source fact | S01 | qualified | 適合全島級量級描述，不改寫成花蓮某一精確斷面 |
| C04 | 4,000 m 等深線所代表的深度量級大於玉山 3,952 m 的高度量級 | computed comparison | `isobath` 級距 + S07 | verified / omit from prose | 比較本身成立，但使用者判斷聲明負擔高於敘事收益，全文移除 |
| C05 | 台灣海峽平均 50 m，深於 100 m 僅 0.8% | source fact / computed result | 使用者原稿；未找到原始範圍與計算 | omit | 未解決前不寫入正文 |
| C06 | 花蓮離岸 10 km 為 1,053 m，18.7 km 為 4,006 m | computed result | 使用者原稿；缺起點、方位與取樣法 | omit | 改用 C03 量級說法，除非後續完成可重算斷面 |
| C07 | 台灣像一張貼著懸崖邊的桌子 | interpretation / metaphor | C01–C03 | qualified | 可作讀者記憶點；不寫「西邊兒童池、東邊奧運跳水池」，因水深量級反而會被縮小 |
| C08 | 不同類型或「中國相關」船隻與海底地形有特定分布 | analytical / causal claim | 尚未完成 AIS 覆蓋與分類設計 | split / unresolved | 本篇只當下一個研究問題，不寫成已發現結果 |
| C09 | 綠島與蘭嶼是北呂宋火山弧的火山島 | source fact | S08–S09 | verified | 地圖只顯示形狀；島弧身分與年代來自地質與定年 |
| C10 | 東部與東北部地震活動集中 | source fact / regional context | S10–S11 | verified / omit from article | 研究保留；因本篇無法提供可重現疊圖，使用者決定移除整段地震敘事 |
| C11 | 36 個離岸風場中有 35 個的抽樣海水像元全數淺於 100 m | computed result | GEBCO_2025 × Pulse snapshot | verified / qualified | cell-center 區域抽樣；不是工程測深，也不證明水深單獨決定選址 |

### Numeric audit

- [x] 大綱候選數字已寫入 `data.json`
- [x] 每筆都有 value、unit、as_of、scope、method、query、source、source_url 與 caveat
- [x] 4,000 與 3,952 只比較絕對數值，沒有偽造共通基準
- [x] 2026-09-05 依使用者編輯判斷，4,000／3,952 對照已從正文與預覽移除；研究台帳保留
- [x] 「大多淺於 60 m」沒有改寫成「平均 50 m」
- [x] 未解決的 0.8%、1,053 m 與 4,006 m 未放入 `data.json`
- [x] 無資料、未驗證與 0 保持不同語意

### Reproducibility notes

- **Input version：**GEBCO_2025 台灣周邊子集，bbox `(117.3, 20.7, 124.0, 27.0)`。
- **Derived layer：**11 種線深度與 12 個深度帶；方法及清單見上游 catalog。
- **Result：**2,409 features（2,397 線 + 12 面），PMTiles 2,930,664 bytes，z4–12。
- **Independent check：**2026-08-23 Pulse production browser 在 z8 取得 511 個 rendered features；2026-09-05 本次文章的三個 production embed 均在 local article page 實際載入並顯示 GEBCO attribution。

## 4. 地圖工作表

| View ID | Narrative role | Evidence scope | Place | Layers | Camera / URL | Data caveat | Release state |
|---|---|---|---|---|---|---|---|
| taiwan-shelf-edge | hero / return | direct observation + regional context | 台灣全島及周邊 | `isobath` | 見 `embeds.json` | GEBCO 2025 綜合網格；等深線為衍生、簡化後圖層 | source + drawable + production layer；article embed 已驗收 |
| green-island-lanyu-peaks | supporting turn | direct observation + regional context | 台灣東南外海、綠島與蘭嶼 | `isobath` | 見 `embeds.json` | 地圖只顯示形狀；火山岩與年代另由地質來源支持 | 使用者截圖與 production browser 均已確認 |
| west-shelf-wind | supporting turn | direct observation + computed regional context | 台灣西側近海 | `isobath`, `offshoreWindZones` | 見 `embeds.json` | 風場 snapshot 與 cell-center 格網抽樣；共現不等於單一因果 | production browser verified；專用靜態 fallback 待補 |

### Map checks

- [x] 配色只編碼水深帶，沒有把顏色當地質分區
- [x] 圖說限制為東西深度帶與線密的直接觀察
- [x] `embeds.json` 已記錄相機、圖層、樣式、caption 與狀態
- [x] 2026-09-05 已在 production embed 實際看到 Haxby 深度帶、等深線與 GEBCO attribution
- [x] 2026-09-05 依使用者指定，將 `west-shelf-wind` 的風場範圍不透明度由 `0.8` 調為 `0.7`
- [x] 2026-09-05 主圖依使用者最終 HUD 數值鎖定為 `lng=120.72417`, `lat=23.49950`, `z=6.58`, `pitch=0`, `bearing=0`
- [x] 2026-09-05 新增綠島／蘭嶼視角 `lng=121.42`, `lat=22.36`, `z=8.4` 與使用者第三張截圖 fallback
- [x] 2026-09-05 Pulse embed 已補相機 `postMessage`；文章只在「啟用互動」時於左下顯示即時 `lng / lat / zoom / pitch / bearing`
- [x] 2026-09-05 local Pulse browser 驗收：初始 `z 6.90`，按 Zoom in 後 HUD 即時更新為 `z 7.90`
- [x] 本機取景可用文章網址加 `?pulse=local`；正式網址仍載入 production embed
- [x] 2026-09-05 三張圖皆由靜態 fallback 起始，主圖啟用互動與重設視角控制已驗收
- [x] 使用者截圖已作為主視覺 fallback；正式發布前再轉 WebP 並做頁面驗收

### 使用者地圖確認

- **狀態：**三張圖取景皆已確認（2026-09-05）
- **決定：**主圖以 `lng=120.72417`, `lat=23.49950`, `z=6.58`, `pitch=0`, `bearing=0` 作為重設值；綠島／蘭嶼維持專用近景，第三圖疊 `offshoreWindZones`。地震整段維持移除。
- **原因：**第一張交代全島東西落差，第二張讓火山島從文字敘述回到可見地形，第三張顯示淺陸棚如何成為離岸工程空間。
- **待調整：**風電圖正式發布前需建立專用靜態 fallback。

## 5. 觀點選擇與拆篇

| Candidate finding | Why interesting | Why important | Evidence strength | Decision |
|---|---|---|---|---|
| 台灣西側是寬淺陸棚，東側快速落入深海 | 單張圖即有強烈尺度反差 | 改變「台灣對稱地立在海上」的直覺 | strong | central |
| GEBCO 圖很完整，底層測深卻不均 | 讓讀者知道漂亮表面仍有資料邊界 | 避免將內插細節當成精密測量 | strong | supporting |
| 船舶是否依海底地形分布 | 動態圖層與地形疊合有故事潛力 | 可進入航路、港口、漁業與安全議題 | weak until coverage audit | split to MTS-2026-003 |
| 西岸離岸風電集中於淺陸棚 | 地形與基礎建設的空間共現直觀 | 能連到能源與工程條件 | strong as computed co-location, weak as sole causality | supporting turn |
| 通訊海纜穿越什麼海底 | 線性路徑可讀性高 | 連到數位基礎設施韌性 | low due source confidence | omit from this article |

- **單篇核心發現：**台灣像一張貼著懸崖邊的桌子：西邊還連著淺陸棚，東邊已緊接數千公尺深海。
- **讀者可轉述的一句話：**台灣的海底地形很不對稱，西淺東深，而且東側在很短的離岸距離內就快速下降。
- **本篇刻意不處理：**船舶國籍與意圖判讀、單一測線的精確水深、地震風險評估、風電單一選址因果。
- **拆出的下一篇：**MTS-2026-003「船航在什麼樣的海底上」。

## 6. 大綱確認

- **起｜先看見：**從全島海底地形圖開場：西邊是寬廣淺色帶，東邊幾乎沒有過渡。
- **承｜重新認識島：**先以弧陸碰撞解釋東西落差，再將綠島、蘭嶼讀成北呂宋火山弧露出的峰。
- **轉｜從形成走到使用：**綠島與蘭嶼近景把火山島放回海底山體；風場疊圖與格網抽樣顯示現有工程幾乎都停在西側淺海。
- **合｜回到畫面：**桌面往西、桌緣在東；台灣本島只是整套地形露出水面的部分。
- **後記｜揭露方法：**故事收束後再說明 GEBCO 網格、等值線／分帶、簡化、PMTiles 與資料限制。

### 使用者大綱確認

- **狀態：**已確認（2026-09-05）
- **核心發現是否確認：**是；使用者指定介紹地形生成與成因，並觀察綠島、蘭嶼。
- **範圍是否確認：**是；依最新截圖改為三個取景：全島海底地形、綠島／蘭嶼、海底地形＋風場。地震整段不納入。
- **順序是否確認：**是；2026-09-05 晚間依使用者最新指示，改為先呈現地形鉤子、成因、特殊地形與風電，製圖方法移到故事收束之後。
- **修改意見：**全文以讀者視角重順；刪除 embed 支援狀態等內部說明，替換「把海水拿掉」的開場句，方法論不再置於前段。

### 研究 gate 補充

- **反直覺核心句：**台灣本島看起來是一座島，海底地形卻顯示它西側連著大陸平台、東側貼著活動深海邊界。
- **讀者問題 1：**海底沒有被整片測過，畫面上的連續等深線怎麼生成？
- **讀者問題 2：**綠島與蘭嶼為什麼像深海裡突出的峰，它們和台灣本島是同一種地形嗎？
- **讀者問題 3：**離岸風場疊上去後，哪些關係能說、哪些只是空間共現？
- **人物／真人原話：**不適用；區域地形題沒有不扭曲主線的可驗證單一人物或必要引語。所有核心句採來源轉述，不虛構場景。
- **故事素材：**使用者的「桌子貼懸崖」視角；綠島、蘭嶼從地圖小點翻轉為火山弧峰頂；風場從視覺共現進入可重算格網結果。

## 7. 寫作與複核

- [x] 全文只使用 verified／qualified 主張
- [x] 沒有未進 `data.json` 的正文數字
- [x] 地圖在故事中有任務，不只是裝飾
- [x] 未為了故事流暢填補板塊或風電因果
- [x] 參考資料與 7 則 footnote 已附在文末
- [x] 寫作後重新驗收 local preview 與 production embed；風電專用靜態 fallback 仍是發布前工作
- [x] 2026-09-05 與第一篇整合：sticky header 文章選單、左側文章目錄、右側文章資訊；已驗收雙向切換
- [x] 2026-09-05 第二輪讀者視角修稿：故事先行、方法後置，正文不再解釋產品 embed 能力或內部發布決策
- [x] 2026-09-05 已重新開啟本機文章頁，確認目錄與正文皆依新順序顯示，讀者頁未再出現內部狀態說明
- [x] 2026-09-05 移除玉山對照與完整地震章節，新增綠島／蘭嶼專用互動圖與 fallback

## 8. 刪減、節制與故事性

| Removed / moved material | Reason | Destination |
|---|---|---|
| 「台灣海峽平均 50 m，深於 100 m 只佔 0.8%」 | 尚無可追溯範圍、母體與計算法 | unresolved claims note |
| 「花蓮 10 km = 1,053 m；18.7 km = 4,006 m」 | 缺起點、方位、取樣與基準，無法重算 | unresolved claims note |
| 「西邊兒童池，東邊奧運跳水池」 | 奧運跳水池只有公尺級，反而壓縮了深海量級 | delete；保留桌子貼懸崖比喻 |
| AIS、中國相關船隻與地形關係 | 需獨立資料覆蓋與分析設計 | MTS-2026-003 |
| 地震圖層與文章 embed 支援狀態 | 屬內部產品決策，不回答讀者的地形問題 | 保留於 workbook，不進正文 |
| GEBCO 產製流程置於前段 | 過早中斷地形鉤子與策展推進 | 移至故事收束後的「等深線從哪裡來」 |
| 4,000 公尺水深與玉山 3,952 公尺對照 | 需要額外基準聲明，讀者理解成本高於敘事收益 | 研究台帳保留，正文與預覽刪除 |
| 完整地震章節 | 沒有可重現的文章疊圖，文字段落偏離目前三張地圖的策展主線 | 研究來源保留，正文、目錄與讀者參考資料刪除 |

## 9. Rubric 0.1-draft

> 地圖與大綱 gate 已通過；下列為草稿自評，最終人工接受前不稱完稿。

| Dimension | Maximum | Score | Reason / evidence | Next revision |
|---|---:|---:|---|---|
| 數據與來源正確性 | 30 | 28 | 原稿精確數字已降級；風場自算有雜湊、方法與 caveat；preview 與 ledger 已同步 | — |
| 地圖震撼與主張對位 | 25 | 24 | 全島、火山島與風場各有專用取景，三個 production embed 已複核 | 補風場專用 fallback |
| 故事性與起承轉合 | 25 | 23 | 先由東西地形反差走到島弧與工程使用，收束後才揭露製圖方法 | 由使用者閱讀確認節奏 |
| 解釋節制與不確定性 | 15 | 14 | 移除聲明負擔高的玉山對照與無疊圖地震段；共現與因果分開 | local preview 已完成，仍待最終人工接受 |
| 資料來源與方法完整性 | 5 | 5 | 5+ 獨立來源、7 footnotes、研究筆記、台帳與 embed 設定 | — |
| **Total** | **100** | **93** | 草稿自評 | 最終人工接受前不稱完稿 |

### Publication blockers

- [x] Map gate 與 Outline gate 已通過
- [x] 正式文章頁已建立，本機 preview 與 production embeds 已驗收
- [x] 無重要數字被當作 0 或無限定事實
- [x] 未把圖層疊合寫成船舶或風電選址因果

## 10. 完成與發布狀態

| State | Status | Evidence / URL | Checked at |
|---|---|---|---|
| research-ready | ✅ | `research/`、`data.json`、`inventory.md`、`embeds.json` | 2026-09-05 |
| local-preview-ready | ✅ | `article.md`、`taiwan-md-preview.html`；三張 iframe、互動鎖定及 camera HUD 已由 local article page 複核 | 2026-09-05 |
| production-embed-ready | ⏳ | 三個既有 article embed 已驗收；camera bridge 已在 Pulse 原始碼完成，尚未授權部署到 production | 2026-09-05 |
| published | ⏳ | 未授權發布 | — |

- **最終限制：**GEBCO 2025 不是 2026-09-05 的最新 GEBCO；局部網格不能取代航海圖或可重算測線。
- **參考資料完整：**第一輪是；正文選材後再縮減與複核。
- **題庫狀態已更新：**是。
- **最終人工確認：**待使用者閱讀本機預覽。
