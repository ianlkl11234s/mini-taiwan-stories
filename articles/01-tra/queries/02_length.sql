-- 02 路線總長度
-- ⚠️⚠️ 本檔的 SQL 結果【不可寫進正文】。
--
-- 正文用官方營業里程 1,065.0 km（雙線 751.1／單線 313.9），
-- 來源：行政院國情簡介－臺鐵（民國 113 年統計）
-- https://www.ey.gov.tw/state/A44E5E33CDA7E738/1f34ef94-2ff5-40ab-b526-e2fedd358a36
--
-- 下面的查詢只用來說明「為什麼不能自己加總」：
--   WL（西部幹線）station_count=111 遠超實際；SK（南迴）疑似併入屏東線重疊段。
--   欄位註解自承「一線多 OD/express 變體取最長單條近似」。
--   加總得 863.6 km，比官方少 200 km。
SELECT line_id, name, length_km, station_count
FROM rail.lines
WHERE system_id = 'tra'
ORDER BY length_km DESC;

SELECT round(sum(length_km)::numeric, 1) AS naive_sum_km_DO_NOT_USE
FROM rail.lines WHERE system_id = 'tra';
