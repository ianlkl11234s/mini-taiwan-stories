---
title: '台灣貼著深海的一側：一張海底地形圖串起火山島與風場'
description: 'GEBCO 2025 的等深線讓台灣西側的淺陸棚與東側的深海落差一起現形，也把綠島、蘭嶼與離岸風場放回同一個地體背景。'
date: 2026-09-05
lastUpdated: 2026-09-05
tags: [海底地形, GEBCO, 板塊構造, 綠島, 蘭嶼, 離岸風電]
readingTime: 8
difficulty: beginner
status: draft
sources:
  - 'GEBCO Historical Data Sets https://www.gebco.net/data-products/historical-data-sets'
  - '經濟部地質調查及礦業管理中心〈臺灣附近的海洋地質〉 https://twgeoref.gsmma.gov.tw/GipOpenWeb/wSite/ct?ctNode=1259&mp=106&xItem=120808'
  - 'Ramsey et al., JGR Earth Surface https://agupubs.onlinelibrary.wiley.com/doi/full/10.1029/2005JF000314'
  - '經濟部地質調查及礦業管理中心〈孤懸東南外海的火山島〉 https://twgeoref.gsmma.gov.tw/GipOpenWeb/wSite/ct?ctNode=217&mp=6&xItem=245454'
  - 'Shao, Chung and Chen, TAO https://tao.cgu.org.tw/index.php/articles/archive/geology/item/1205'
  - '經濟部能源署〈離岸風電區塊開發政策說明〉 https://www.moeaea.gov.tw/ecw/populace/news/News.aspx?kind=9&menu_id=4360&news_id=15063'
dataLedger: data.json
embeds: embeds.json
---

> **30 秒概覽：** 台灣西側接著大片不到 60 公尺深的淺陸棚，東側離岸不到 10 公里卻可降到約 1,000 公尺。海岸線圈住了島，等深線才把它接著什麼樣的海底畫出來。

# 台灣貼著深海的一側

從海岸線看，台灣是一座輪廓清楚的島；等深線一打開，東西兩側卻接上完全不同的海底。

西邊還連著一大片淺色平台，往福建方向緩緩延伸。東邊幾乎沒有同樣的過渡，等深線貼著花蓮、台東海岸擠在一起，很快就滑進深藍色。

官方地質綜述用兩個量級描述這個反差：台灣西側大陸棚的水深大多小於 60 公尺；東側海底在距岸不到 10 公里處，就能降到約 1,000 公尺深。[^1]

整張圖像一張貼著懸崖邊擺的桌子：桌面往西延伸，東半邊已經懸在深海上方。

<!-- embed: taiwan-shelf-edge -->

## 西邊的桌面，為什麼到了東邊突然結束

台灣海峽這一側屬於歐亞大陸邊緣的淺陸棚。海岸線只是今天海面切過地形的位置；水下的平台仍向西延伸，所以淺色深度帶看起來又寬又完整。

東側面對的是另一套地體環境。菲律賓海板塊帶著呂宋島弧向歐亞大陸邊緣靠近，台灣坐在弧陸碰撞帶上；北邊接琉球隱沒系統，南邊接馬尼拉隱沒系統。山脈在陸上抬升，東岸外側則很快進入狹窄陸棚與深海盆地。[^4]

「板塊碰撞」四個字解釋不完所有線條。台灣南北段的運動方式不同，海底還受沉積、侵蝕、斷層與海底崩塌改造；GEBCO 本身也有測深密度差異。

但全島尺度的反差很穩定：西側接著大陸棚，東側貼近活動板塊邊界的高起伏海底。

## 綠島和蘭嶼，是深海裡露出的兩座峰

把視線移到台東外海，綠島與蘭嶼像兩個被深色水深帶包圍的小點。若只看陸地輪廓，很容易把它們當成從台灣本島掉出去的碎片。

岩石說的是另一個故事。

兩座島都位在北呂宋火山島弧上。地質調查資料記錄了火山岩、凝灰岩與後來形成的珊瑚礁地形；鋯石 U-Pb 定年研究則把綠島與蘭嶼的主要火山噴發期，分別估在約 130 萬年前與 260 萬年前。[^5]

今天露出海面的島，只是整座海底火山地形最高的部分。等深線把這件事畫了出來：島岸外沒有寬廣平台，色帶很快轉深；島嶼看起來小，是因為我們平常只看得到海面以上。

<!-- embed: green-island-lanyu-peaks -->

地圖本身無法判定岩石年代，也不能從顏色讀出火山岩。它提供的是形狀；火山島弧的身分來自野外地質與定年研究。兩種證據接在一起，綠島與蘭嶼才從「東南外海的兩個點」變成一列海底山脈露出的峰頂。

## 風場把西側淺陸棚的用途畫了出來

風場圖打開後，青色多邊形大多排在苗栗、台中、彰化與雲林外海。它們沒有跨過台灣東岸那片急速變深的色帶。

<!-- embed: west-shelf-wind -->

眼睛先看到重疊，格網抽樣再把它量出來。我們把 Pulse 快照中的 36 個風場範圍，逐一與同版 GEBCO 網格做 cell-center 取樣。35 個範圍內沒有任何抽樣海水像元深於 100 公尺；所有風場聯集的 15,735 個海水像元中，99.987% 淺於 100 公尺。[^6]

小數點後三位來自計算，不代表工程現場有同樣精度。GEBCO 網格在台灣附近仍是數百公尺尺度，polygon 邊界也只用像元中心判斷；這套結果適合確認區域共現，不能取代風場施工前的測深與地質調查。

經濟部能源署把開發次序寫成「先淺海、後深海」，也說明成本會同時受水深、海床地質地形、技術與產業條件影響。[^7]

目前圖層裡的風場幾乎都落在西側淺海。水深只是選址條件之一；風況、航道、生態、漁業、併網與法規都可能改變最後的位置。

地質形成的淺平台，後來成了能源工程優先進入的海域。

## 再回到那張貼著懸崖邊的桌子

現在重看全島圖，西邊那片寬淺色帶有了另一層意思。它是歐亞大陸邊緣向海下延伸的平台，也是今日離岸工程主要活動的空間。

東側密集的等深線把弧陸碰撞帶的垂直起伏壓進畫面；綠島與蘭嶼從北呂宋火山弧露出，提醒我們海面下的地形還向南延伸。

台灣本島是最醒目的部分，卻只佔了這套地形露出水面的那一截。

桌面往西，桌緣在東。再往下看，島還沒有結束。

## 等深線從哪裡來

這張圖從一張全球網格開始。Mini Taiwan Pulse 使用 GEBCO_2025 Grid 的台灣周邊子集；網格間距是 15 arc-second，每個格點記錄一個海拔或水深值。GEBCO 現在已有 2026 版，本文固定使用 2025 版，讓文章與線上圖層維持同一份資料。[^2]

程式先從全球網格裁出台灣周邊，再沿固定深度生成等深線，把相鄰區間轉成色帶。線與面經過簡化、切成 PMTiles，瀏覽器才會依縮放層級載入。

圖上的線不是船在海上逐條量出的軌跡，而是從連續網格推導出的等值線。GEBCO 彙整許多年代、儀器與密度不同的測深來源，空白處也可能經過內插。15 arc-second 說的是網格間距，沒有保證每個格子底下都有同樣密度的原始測深。GEBCO 也明確提醒，這類產品不應用於航海或人身安全判斷。[^3]

它很適合閱讀區域形狀。若要回答某個港口外幾公里究竟有多深，仍需要可重算的測線或更細的工程測深。

## 資料範圍與限制

- **GEBCO 2025 是固定版本。** 它讓地圖與文章可重現；2026 版已經發布，兩版不混用。
- **等深線是衍生幾何。** 顏色與線密適合讀區域水深變化，不是岩性、坡度災害或航海安全圖。
- **東岸量級不是特定測線。** 「不到 10 公里達約 1,000 公尺」來自官方區域綜述，不代表每個岸點都符合相同距離與深度。
- **火山島身分要靠地質證據。** 地圖只顯示形狀，岩性與年代來自地質調查及學術定年。
- **風場統計是區域抽樣。** 風場 polygon、GEBCO 網格、cell-center mask 與資料版本都會影響結果；共現不能改寫成單一選址因果。

## 參考資料

- [GEBCO Historical Data Sets：GEBCO_2025 Grid](https://www.gebco.net/data-products/historical-data-sets)
- [GEBCO_2026 Grid 與使用限制](https://www.gebco.net/data-products/gridded-bathymetry-data/gebco2026-grid)
- [經濟部地質調查及礦業管理中心〈臺灣附近的海洋地質〉](https://twgeoref.gsmma.gov.tw/GipOpenWeb/wSite/ct?ctNode=1259&mp=106&xItem=120808)
- [Ramsey et al., *Topographic characteristics of the Taiwan orogen*, JGR](https://agupubs.onlinelibrary.wiley.com/doi/full/10.1029/2005JF000314)
- [經濟部地質調查及礦業管理中心〈孤懸東南外海的火山島—綠島和蘭嶼的地質概述〉](https://twgeoref.gsmma.gov.tw/GipOpenWeb/wSite/ct?ctNode=217&mp=6&xItem=245454)
- [Shao, Chung & Chen, *Zircon U-Pb Age Determination of Volcanic Eruptions in Lutao and Lanyu*](https://tao.cgu.org.tw/index.php/articles/archive/geology/item/1205)
- [經濟部能源署〈離岸風電區塊開發政策說明〉](https://www.moeaea.gov.tw/ecw/populace/news/News.aspx?kind=9&menu_id=4360&news_id=15063)
- [Mini Taiwan Pulse](https://mini-taiwan-pulse.itsmigu.com/)

[^1]: 經濟部地質調查及礦業管理中心，[〈臺灣附近的海洋地質〉](https://twgeoref.gsmma.gov.tw/GipOpenWeb/wSite/ct?ctNode=1259&mp=106&xItem=120808)，1995 年出版品頁面；支持西側大多淺於 60 公尺與東側近岸快速加深的區域量級。
[^2]: GEBCO，[Historical Data Sets](https://www.gebco.net/data-products/historical-data-sets)，GEBCO_2025 為 15 arc-second 歷史網格；[GEBCO_2026 Grid](https://www.gebco.net/data-products/gridded-bathymetry-data/gebco2026-grid) 用於確認目前版本新鮮度。
[^3]: GEBCO，[GEBCO_2026 Grid](https://www.gebco.net/data-products/gridded-bathymetry-data/gebco2026-grid)，說明資料彙編、引用與非航海用途限制；本文圖層實際使用 2025 版。
[^4]: Ramsey et al.，[*Topographic characteristics of the Taiwan orogen*](https://agupubs.onlinelibrary.wiley.com/doi/full/10.1029/2005JF000314)，*Journal of Geophysical Research: Earth Surface*，2006；用於台灣弧陸碰撞與東西地形背景。
[^5]: 經濟部地質調查及礦業管理中心，[〈孤懸東南外海的火山島—綠島和蘭嶼的地質概述〉](https://twgeoref.gsmma.gov.tw/GipOpenWeb/wSite/ct?ctNode=217&mp=6&xItem=245454)，2021；Shao, Chung & Chen，[TAO 論文與 DOI](https://tao.cgu.org.tw/index.php/articles/archive/geology/item/1205)，2014，支持北呂宋火山弧與主要噴發年代。
[^6]: 本文可重算結果見 [`data.json`](./data.json) 與 [`research/04-wind-on-the-shelf.md`](./research/04-wind-on-the-shelf.md)；輸入為 GEBCO_2025 台灣子集與 Mini Taiwan Pulse `offshoreWindZones` 靜態 RPC 快照，2026-09-05 執行。
[^7]: 經濟部能源署，[〈離岸風電區塊開發政策說明〉](https://www.moeaea.gov.tw/ecw/populace/news/News.aspx?kind=9&menu_id=4360&news_id=15063)，說明「先淺海、後深海」與多項成本條件。
