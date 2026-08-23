# Mini Taiwan Stories

> 用數據看台灣 —— 每篇文章穿插可互動地圖與圖表的資料敘事系列。

## 這是什麼

`mini-taiwan-*` 家族的**內容層**。pulse 是即時脈動、info 是縣市儀錶板，
本 repo 是**把那些資料寫成人看得懂的故事**。

地圖不自己畫，直接嵌 [mini-taiwan-pulse](../mini-taiwan-pulse) 的 `/embed`
（MapLibre + 自託管底圖，不論被讀幾次都零 Mapbox 費用）。

## 系列規劃

| # | 主題 | 狀態 |
|---|---|---|
| 01 | 台鐵 | 🚧 進行中 |
| 02 | 高鐵 | 待開始 |
| 03 | 台北捷運 | 待開始 |
| 04 | 桃園捷運 | 待開始 |
| 05 | 高雄捷運 + 輕軌 | 待開始 |
| — | （資料另有台中捷運 / 新北捷運，未列入原始規劃） | — |

## 每篇文章的檔案結構

```
articles/01-tra/
├── article.md      正文（Markdown，frontmatter 相容 taiwan.md）
├── data.json       ⭐ 數據台帳 —— 正文每個數字都在這裡有一筆
├── queries/*.sql   產生每個數字的可重跑查詢
├── figures/        圖表與地圖靜態圖
├── embeds.json     互動地圖的 /embed 網址 + 靜態圖 fallback
└── inventory.md    資料盤點與品質警訊
```

### 為什麼要有 data.json

1. **可追溯** — 半年後被問「這個數字怎麼算的」查得回來
2. **可更新** — 誤點資料每天在長，回頭更新不用重讀正文
3. **跨篇一致** — 6 篇文章共用的數字（各系統站數、班次）只有一份真相
4. **可再利用** — 同一份台帳可以再切出社群短版圖卡

## 鐵則

1. **正文的每個數字，都要在 `data.json` 有對應條目**（含 `as_of` / `method` / `query`）
2. **口徑先寫清楚再寫數字** —— 尤其誤點率，官方口徑與體感口徑差 20 個百分點
3. **資料有缺口就明講**，不用推估值填坑（承襲 mini-taiwan-info 鐵則 1）
4. **官方數字優先於自算數字**，自算只用在官方沒有的維度
5. 寫作品質標準沿用 [`taiwan-md/EDITORIAL.md`](../taiwan-md/EDITORIAL.md)：先找到反直覺核心句，再動筆

## 關聯

| repo | 用途 |
|---|---|
| `../mini-taiwan-pulse` | 地圖 `/embed`、誤點與時刻表資料 |
| `../mini-taiwan-info` | 縣市統計、運量 |
| `../terrain-art` | 車站高程（NLSC 20m DTM） |
| `../taiwan-md` | 未來可能的併入目標（Astro，CC BY-SA 4.0） |
