# Mini Taiwan Stories 文章準則

> 狀態：本專案寫作 SSOT
>
> 上游擷取日：2026-09-05
>
> 適用：`articles/*/article.md` 的研究、大綱、寫作、複核與發布

本準則擷取並改寫自 [Taiwan.md](https://github.com/frank890417/taiwan-md) 的編輯系統，並與本專案的 GIS 證據規則整合。寫作品質以本文件為準；階段與確認 gate 以 [`workflow.md`](../../skills/mini-taiwan-story/references/workflow.md) 為準；每篇執行記錄在 `workbook.md`。

## 1. 編輯目標

Mini Taiwan Stories 是資料策展，不是百科全書。一篇文章只有一個中心發現，讀完後讀者應能用一句話轉述，並在回看地圖時多看懂一層。

三個最低目標：

1. **有故事，不只有資訊**：年份、數字與地名是證據，必須由場景、轉折與觀點串成故事。
2. **每個事實可查證**：無法回到原始來源的數字、引語或因果不進正文。
3. **有人的視角**：優先找到能承載現象的真實人物、行動或經驗。若 GIS 主題沒有可驗證的人物素材，在 workbook 記錄 `不適用：原因`，改用可查證的具體場景；不得為了故事性虛構人物或細節。

## 2. 文章分級

研究前先在 workbook 選擇預計級別，以避免把小題目灌水，或把複雜題目壓縮成摘要。

| 級別 | 參考長度 | 獨立來源 | 適用範圍 |
|---|---:|---:|---|
| B 級／精煉 | 80–120 行 | 5+ | 單一現象、地點或機制 |
| A 級／標準 | 120–200 行 | 7+ | 需要多個轉折才能說清的主題 |
| S 級／旗艦 | 200–300 行 | 10+ | 複雜政策、重大歷史或跨系統議題 |

行數是編輯提示，不是灌水目標。如果文章出現兩個可獨立轉述的中心發現，應拆篇。

## 3. 研究 gate

研究目標是嘗試推翻預設，不是搜尋支持原假設的材料。動筆前至少完成：

- 一句含矛盾或反差的「反直覺核心句」。
- 三個讀者真正會追問的問題。
- 一個可驗證的人物或明記不適用。
- 一個具體物件、一個有時間／地點／動作的場景，以及可由來源驗證的細節。
- 8–10 條事實素材，每條已與來源、年份和未來腳註配對。
- 2 句可在原始來源找到的真人原話，或明記不適用。不得將英文摘要回譯成中文直引。
- 2 個有真人、場景或行動的故事素材，或明記不適用。
- 至少 1 個爭議、挑戰、限制或競爭解釋。
- 至少 5 個獨立來源，含 2 個一手來源與 1 個英文來源。若主題存在歷史演變，再加 1 組時間跨度來源。

來源優先序：官方一手資料 → 學術／專業來源 → 可追溯的主流新聞。維基百科可當索引起點，不當唯一證據。每筆來源記錄出版者、統計或發布日期、存取日期、版本／頁碼、支持的主張與限制。

## 4. 主張、數字與地圖

- 把 `map observation`、`source fact`、`computed result`、`interpretation` 與 `causal claim` 分開記錄。
- 每個正文數字先進 `data.json`，含值、單位、時間、地理／母體範圍、方法、查詢／公式、來源與限制。
- 官方有公布核心指標時優先使用官方值。自算值用於官方沒有的維度，且與官方口徑分開。
- `0`、`NULL`、無資料、拒絕存取、過期與不完整不得互相代替。
- 地圖只可被標示為 `direct evidence`、`regional context` 或 `illustration`；圖說與正文不可超過它的證據範圍。
- 相關、共現或邊界吻合不等於因果。機制未被獨立證據支持時，改用限定語句、留問或刪除。

## 5. 標題、開場與結構

### 標題

預設採「主題：核心矛盾／代表性弧線」。副標應可獨立成句，不用「傳奇」「偉大」「最強」等評判性形容詞。數字只在自帶有意義的對照時進標題，不把三個數字排成規格表。

### 開場

- 以地圖畫面、場景、矛盾數字、反差或問題進入。
- 前三句至少出現年份、數字、人名、地名中的兩種具體元素。
- 開場的任務是讓讀者想進入第四句，不是在第一段交代所有背景。
- 禁止「X 是台灣的 Y」「隨著…發展」「說到 X，不得不提」式開場。

### 正文

開頭先讓讀者看見現象，承接段只教理解所需的地圖語法與數字，轉折段呈現機制、歷史、對比或限制，最後回到原圖。挑戰與爭議要編進主線；刪掉挑戰段後若主線完全不受影響，它只是文末補丁。

完整文章應有至少兩個真正的理解轉移，不是靠「然而」「不過」製造假轉折。若篇幅或題目不適合，在 workbook 記錄原因。

### 結尾

結尾可用餘韻、翻轉、時間跳躍、問題或灰色地帶，但要落在具體事件、畫面或未解問題。禁止「繼續發光」「值得期待」「這個故事還在寫」「持續書寫」等罐頭句。

## 6. 語氣與密度

- 像很懂的朋友在解釋，不像新聞稿、年報或畢業致詞。
- 具體的人、地、物、動作與原話優先於抽象形容。
- 每 2–3 段可放一句「策展人聲音」，用來製造理解的停頓；它必須有內容，不可只說「這很重要」。
- 連續四行以上相同格式的 bullet 通常應改成敘事、表格或刪減。
- 刪掉所有 bullet 後，文章仍應有完整故事。

避免空洞詞：蓬勃發展、日益重要、積極推動、顯著成長、豐富多元、令人驚嘆、值得一提、事實上、毫無疑問。避免套句：「不是 X，而是 Y」「不僅 X，更是 Y」「展現了…精神」「體現了…價值」。若必須使用相似結構，要有明確事實與語義理由，不得當成自動轉折模板。

## 7. Footnote-first 與參考資料

- 數據、引語與可驗證的重要主張在出現的句子後緊接 `[^n]`，不等寫完再補。
- 引用密度不低於每 300 字 1 則，且整篇至少 5 則 footnote。
- 每個 footnote 定義都要有來源名稱、可點 URL 與簡短出版／內容說明；不用「同上」或只放裸網址。
- 文末保留 `## 參考資料`，腳註定義與參考資料兩者不可替代 `data.json` 的數字台帳。
- 每個 `[^n]` 都必須有定義，每個定義也必須在正文被引用。

## 8. Frontmatter 與 Taiwan.md 匯出

本專案的 `article.md` 至少使用 `title`、`description`、`date`、`tags`、`sources`、`lastUpdated`、`readingTime` 與 `difficulty`。

若要匯入 Taiwan.md，再依對方當前 schema 補齊 `author`、`featured`、`status`、`relatedTopics` 與 `subcategory`；分類由目標目錄決定。`subcategory` 雖然在 schema 有預設空字串，但對方貢獻指南要求 About 以外的新中文文章必填；`featured` 交給維護者決定，不自行設為 `true`。截至擷取日，`lastVerified`、`lastHumanReview` 並不在現行 `src/content.config.ts`，不要照舊版 AI prompt 自行加入。匯出前仍要重新查 schema 與 taxonomy，不把這份摘要當成永不變的技術契約。

## 9. 寫完後的五指檢測

1. **驚訝點**：能指出讀者會說「哦？」的具體一句。
2. **兩個轉折**：有至少兩次真正改變理解的推進，或已記錄篇幅不適用的理由。
3. **策展句**：至少一句用來製造理解，不只傳遞資訊。
4. **念結尾**：大聲念最後 3–5 行，應有具體餘韻，不是罐頭句。
5. **一句轉述**：能自然說出「欸你知道嗎，…」。

## 10. 發布 blocker

以下任一項存在時，不得宣稱完稿或已發布：

- 重要數字無法追溯或重算。
- 地圖沒有顯示正文或圖說宣稱的現象。
- 因果語句強於證據。
- 重要限制、口徑或來源不匹配被隱藏。
- 重要主張沒有 footnote，或只引用中介來源而可得一手來源。
- 尚未通過使用者地圖 gate、大綱 gate 或最終人工接受。
- 沒有分開記錄 `research-ready`、`local-preview-ready`、`production-embed-ready` 與 `published`。

## 11. 上游來源與授權

本文件是針對 GIS 資料敘事的摘要與改寫，不是 Taiwan.md 全部規範的完整副本。擷取時上游標示版本：

- [`docs/editorial/EDITORIAL.md`](https://github.com/frank890417/taiwan-md/blob/main/docs/editorial/EDITORIAL.md) v6.18（2026-08-19）：文體、故事、開場、標題、語氣。
- [`docs/pipelines/REWRITE-PIPELINE.md`](https://github.com/frank890417/taiwan-md/blob/main/docs/pipelines/REWRITE-PIPELINE.md) v9.7（2026-08-15）：研究、寫作、查證的 stage 契約。
- [`docs/editorial/RESEARCH-TEMPLATE.md`](https://github.com/frank890417/taiwan-md/blob/main/docs/editorial/RESEARCH-TEMPLATE.md) v1.1（2026-06-10）：動筆前研究門檻。
- [`docs/editorial/QUALITY-CHECKLIST.md`](https://github.com/frank890417/taiwan-md/blob/main/docs/editorial/QUALITY-CHECKLIST.md) v1.3（2026-07-05）：五指檢測、腳註與提交前檢查。
- [`CONTRIBUTING.md`](https://github.com/frank890417/taiwan-md/blob/main/CONTRIBUTING.md)：貢獻原則、文章結構與 frontmatter。
- [`src/content.config.ts`](https://github.com/frank890417/taiwan-md/blob/main/src/content.config.ts)：擷取日的 frontmatter schema。

Taiwan.md 專案標示為 [CC BY-SA 4.0](https://creativecommons.org/licenses/by-sa/4.0/)。本改寫保留來源與相同授權要求；若對外分發這份文件，須保留本節的來源標示、連結與改寫說明。
