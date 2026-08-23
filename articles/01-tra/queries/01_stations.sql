-- 01 台鐵車站數
-- 口徑：TDX 現行營運站。DB 244 列含一個資料庫假站「臺北-環島」(1001)，扣除後 243。
-- ⚠️ 官方 2024 統計為 242 站（67 客貨運站 + 174 純客運站 + 花蓮港貨運站）。
--    差異未逐站比對，正文一律以官方 242 為準，DB 值只用來說明資料來源差異。
SELECT
  count(*)                                        AS db_rows,
  count(*) FILTER (WHERE station_id <> '1001')    AS db_real_stations,
  count(*) FILTER (WHERE station_class = '0')     AS class_0,
  count(*) FILTER (WHERE station_class = '1')     AS class_1,
  count(*) FILTER (WHERE station_class IS NULL)   AS class_null
FROM rail.stations
WHERE system_id = 'tra';

-- 縣市分布（正文「哪個縣市車站最多」用）
SELECT county_name, count(*) AS stations
FROM rail.stations
WHERE system_id = 'tra' AND station_id <> '1001'
GROUP BY county_name ORDER BY stations DESC;
