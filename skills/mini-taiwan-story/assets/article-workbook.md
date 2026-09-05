# Article workbook — `<slug>`

> Copy this file to `articles/<slug>/workbook.md`. Keep incomplete items visible. Use `不適用：原因` rather than deleting a gate.

## 0. Control

| Field | Value |
|---|---|
| Topic ID | |
| Article slug | |
| Current state | 只見現象 |
| Central finding | 未定 |
| Article tier | B / A / S / 未定 |
| Workbook updated | YYYY-MM-DD |
| Rubric version | 0.1-draft |
| Next action | |
| Blocker | 無 / 說明 |

### Stage progress

- [ ] 0 現象已入題庫
- [ ] 1 脈絡與來源研究完成
- [ ] 2 數據與主張達到可用狀態
- [ ] 3 地圖取景經使用者確認
- [ ] 4 單篇核心發現與邊界確立
- [ ] 5 大綱經使用者確認
- [ ] 6 完成有來源的全文草稿
- [ ] 7 完成數據、來源與地圖複核
- [ ] 8 完成刪減、節制與故事性檢查
- [ ] 9 完成評分、參考資料與發布狀態

## 1. 現象卡

### 使用者提供

- 截圖／URL：
- 地點：
- 圖層：
- 截圖日期／資料版本（未知可填未知）：
- 可回到原圖的 URL／相機位置（未知可填未知）：
- 希望讀者注意：
- 覺得震撼的部分：

### 僅依畫面可觀察

-

### 需要研究才能回答

-

### 可能只是資料或渲染差異

-

### Screenshot trace

- [ ] 已在題庫搜尋相同現象、地點與圖層，確認新增或併入既有題卡
- [ ] 已確認或明記未知的地點、圖層、截圖日期、資料版本與大致範圍
- [ ] 在定位與資料範圍未明前，未做空間密度或區域高低比較

## 2. 脈絡與來源

### 需要補足但未必能地圖化的脈絡

- 定義／制度：
- 運作機制：
- 歷史發展：
- 重要人物或決策：
- 反例／競爭解釋：

### Taiwan.md 研究 gate

- 反直覺核心句：
- 讀者問題 1：
- 讀者問題 2：
- 讀者問題 3：
- 可驗證的人物／人的視角（或 `不適用：原因`）：
- 具體物件：
- 場景（人／時／地／動作）：
- 可驗證細節：
- 意外發現：
- 爭議／挑戰／限制：
- 時間跨度來源（如適用）：

### Research minimum

- [ ] 事實素材 8–10 條，每條已與來源、年份與預計 footnote 配對
- [ ] 真人原話至少 2 句，可在原始來源找到；或 `不適用：原因`
- [ ] 故事素材至少 2 個；或 `不適用：原因`
- [ ] 獨立來源達文章級別門檻，且含至少 2 個一手來源與 1 個英文來源
- [ ] 研究已嘗試證偽核心假設，不是只搜尋支持資料

### Source register

| ID | Source | Type | Edition / as of | Accessed | Relevant page / section | Supports | Limits |
|---|---|---|---|---|---|---|---|
| S01 | | official / primary / academic / professional / news | | | | | |

### Freshness check

- [ ] 已查官方入口頁，不只使用搜尋摘要或直接 PDF
- [ ] 已確認目前最新版本／統計年度
- [ ] 已記錄發布日期與統計期間
- [ ] 已檢查新版是否取代正文使用的舊版
- [ ] 重要事實有獨立來源交叉查核，或已說明為何只有單一來源

## 3. 主張與數據

### Claim ledger

| ID | Candidate claim | Type | Source / method | Status | Allowed wording / caveat |
|---|---|---|---|---|---|
| C01 | | map observation / source fact / computed result / interpretation / causal claim | | verified / qualified / unresolved / omit | |

### Numeric audit

- [ ] 正文每個數字都已先寫入 `data.json`
- [ ] 每筆都有 value、unit、as_of、scope／population、method、query／formula、source、caveat
- [ ] 衍生數字由未四捨五入原值重算
- [ ] 官方值與自算值已核對年份、地理、母體、單位、切段與缺失
- [ ] 未把不同口徑的比例稱為覆蓋率、缺漏率或正確率
- [ ] 未知、NULL、無資料與 0 保持不同語意

最小 `data.json` fact 欄位：`value`、`unit`、`as_of`、`scope`、`method`、`query`／formula、`source`、`source_url`、`caveat`。只收進入大綱或正文的數字；研究草算留在 notes。

### Reproducibility notes

- Query / script / command：
- Input version / checksum：
- Result：
- Independent check：

## 4. 地圖工作表

| View ID | Narrative role | Evidence scope | Place | Layers | Camera / URL | Data caveat | Release state |
|---|---|---|---|---|---|---|---|
| | hero / explanation / turn / return | direct evidence / regional context / illustration | | | | | source / drawable / local / production |

### Map checks

- [ ] 視覺差異不是只由資料覆蓋、解析度、年份或渲染造成
- [ ] 圖說沒有超過 evidence scope
- [ ] `embeds.json` 已記錄相機、圖層、樣式、caption 與狀態
- [ ] 本機文章預設不誤觸拖動，且可啟用、重設與退出互動；或 `不適用：尚未進入預覽階段`
- [ ] 已準備發布路徑需要的靜態 fallback；或 `不適用：尚未進入發布階段`

### 使用者地圖確認

- 狀態：未確認 / 已確認 / 待微調
- 日期：
- 確認內容：
- 待調整：

## 5. 觀點選擇與拆篇

| Candidate finding | Why interesting | Why important | Evidence strength | Decision |
|---|---|---|---|---|
| | | | strong / medium / weak | central / supporting / split / omit |

- 單篇核心發現：
- 讀者可轉述的一句話：
- 本篇刻意不處理：
- 拆出的下一篇題目：

## 6. 大綱確認

- **起｜先看見：**
- **承｜學會讀圖：**
- **轉｜理解改變：**
- **合｜回到畫面：**
- **標題 hook｜主題：核心矛盾／代表性弧線：**
- **開場模式｜地圖／場景／矛盾數字／反差／問題：**
- **第一次理解轉移：**
- **第二次理解轉移（或 `不適用：原因`）：**
- **編入主線的挑戰／限制：**
- **結尾畫面／問題：**

### 使用者大綱確認

- 狀態：未確認 / 已確認 / 退回
- 日期：
- 核心發現是否確認：
- 範圍是否確認：
- 順序是否確認：
- 修改意見：

## 7. 寫作與複核

### Draft checks

- [ ] 全文只使用 verified／qualified 主張
- [ ] 沒有未進 `data.json` 的數字
- [ ] 地圖在故事中有任務，不只是裝飾
- [ ] 非地圖脈絡確實改變讀者對現象的理解
- [ ] 未為了故事流暢填補未知機制
- [ ] 參考資料已附在文末
- [ ] 數據、引語與重要主張的句尾已加入 footnote
- [ ] 整篇至少 5 則 footnote，密度不低於每 300 字 1 則
- [ ] 每個 footnote 有來源名稱、可點 URL 與出版／內容說明，不用裸網址或「同上」
- [ ] 已包含 `## 參考資料`
- [ ] Sepia／語氣潤飾未改變事實、數字與不確定性

### Final verification

- [ ] 逐句核對重要事實與 claim ledger
- [ ] 重跑可行的查詢、公式或幾何計算
- [ ] 檢查名稱、日期、單位、地理範圍與版本
- [ ] 所有來源連結可開啟並指向正確內容
- [ ] local 與 production 的地圖狀態分開驗證
- [ ] 方法與限制沒有藏在無人會看到的地方

## 8. 刪減、節制與故事性

### Cut log

| Removed / moved material | Reason | Destination |
|---|---|---|
| | repetition / research residue / over-explanation / separate story | research note / topic bank / delete |

### Restraint check

- [ ] 「地圖看見」「來源確認」「作者推論」沒有混在一起
- [ ] 共現沒有被直接寫成因果
- [ ] 證據不足處已改成限定語氣、留問或刪除
- [ ] 沒有為展示研究量而塞入旁枝

### Story check

- [ ] 開頭先產生觀看動機
- [ ] 承接段只教必要的閱讀方法與數字
- [ ] 轉折真的改變理解，不只是換地區或補背景
- [ ] 結尾回到原圖後，讀者能多看懂一層
- [ ] 全文只有一個中心；其他中心已拆篇

### Taiwan.md 五指檢測

- [ ] 驚訝點：能指出讀者會說「哦？」的具體一句
- [ ] 兩個轉折：至少兩次真正的理解推進；或已記錄 `不適用：原因`
- [ ] 策展句：至少一句製造理解，不只傳遞資訊
- [ ] 念結尾：大聲念最後 3–5 行，不是罐頭句
- [ ] 一句轉述：能自然說出「欸你知道嗎，…」
- [ ] 前三句含年份、數字、人名、地名中至少兩種具體元素
- [ ] 挑戰與爭議已編入主線，不是文末補丁
- [ ] 沒有空洞修飾、連續四行同格 bullet、新聞稿語氣或罐頭結尾

## 9. Rubric 0.1-draft

> 目前沒有固定及格總分。每次都記錄分數、理由與人工校正，累積數篇後再調權重與錨點。

| Dimension | Maximum | Score | Reason / evidence | Next revision |
|---|---:|---:|---|---|
| 數據與來源正確性 | 30 | | | |
| 地圖震撼與主張對位 | 25 | | | |
| 故事性與起承轉合 | 25 | | | |
| 解釋節制與不確定性 | 15 | | | |
| 資料來源與方法完整性 | 5 | | | |
| **Total** | **100** | | | |

### Human calibration

- 評分者：
- 評分日期：
- 初評總分：
- 人工調整後總分：
- 參照文章／評分錨點：
- 人工評分／整體感受：
- 與自評差異：
- 本版 rubric 不合理之處：
- 下次建議調整：

### Publication blockers

- [ ] 無重要數字不可追溯或無法重算
- [ ] 無地圖與正文主張不符
- [ ] 無超過證據的因果敘述
- [ ] 無隱藏的重要限制或來源差異
- [ ] 無缺少的必要參考資料

## 10. 完成與發布狀態

| State | Status | Evidence / URL | Checked at |
|---|---|---|---|
| research-ready | ⏳ | | |
| local-preview-ready | ⏳ | | |
| production-embed-ready | ⏳ | | |
| published | ⏳ | | |

- 最終限制：
- 參考資料完整：是 / 否
- 題庫狀態已更新：是 / 否
- 最終人工確認：
