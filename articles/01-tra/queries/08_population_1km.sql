-- 08 車站周邊 1 km 人口
--
-- 口徑：以車站點為圓心 1 km 圓形緩衝區，與最小統計區 polygon 取交集，
--       依【交集面積佔該統計區面積的比例】加權分配人口（面積加權法）。
--       假設統計區內人口均勻分布 —— 對山區大面積統計區會失真，正文需註明。
--
-- 半徑 1 km 是本系列的固定值（步行約 12–15 分鐘），所有系統的文章都用同一個半徑，
-- 才能跨篇比較。改半徑就要改全部。
--
-- 資料源：spatial.statistical_areas（11,490 筆，data_version=2025）
SELECT
  s.station_id,
  s.name,
  s.county_name,
  round(sum(
    a.population
    * ST_Area(ST_Intersection(a.geom, ST_Buffer(s.geom::geography, 1000)::geometry)::geography)
    / nullif(ST_Area(a.geom::geography), 0)
  ))::int AS pop_1km
FROM rail.stations s
JOIN spatial.statistical_areas a
  ON ST_Intersects(a.geom, ST_Buffer(s.geom::geography, 1000)::geometry)
WHERE s.system_id = 'tra' AND s.station_id <> '1001'
GROUP BY s.station_id, s.name, s.county_name
ORDER BY pop_1km DESC;
