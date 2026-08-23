-- 09 車站周邊 1 km 便利商店
--
-- 口徑：ST_DWithin 1 km（同 08 的半徑）。
--       reference.poi 已有 category='convenience_store' 分類（13,223 筆全台，2026-03 快照），
--       不需要靠店名關鍵字比對。subcategory 有品牌（7-Eleven / FamilyMart / Hi-Life / OK Mart）。
--
-- ⚠️ 排除 station_id='1001'（資料庫假站「臺北-環島」，會與臺北站產生重複列）。
-- ⚠️ 這是 POI 快照不是即時營業狀態，開關店會有落差。
SELECT
  s.station_id,
  s.name,
  s.county_name,
  count(p.*)                                                   AS cvs_1km,
  count(p.*) FILTER (WHERE p.subcategory ILIKE '%7-Eleven%')   AS seven,
  count(p.*) FILTER (WHERE p.subcategory ILIKE '%Family%')     AS familymart,
  count(p.*) FILTER (WHERE p.subcategory ILIKE '%Hi-Life%')    AS hilife,
  count(p.*) FILTER (WHERE p.subcategory ILIKE '%OK%')         AS okmart
FROM rail.stations s
LEFT JOIN reference.poi p
  ON p.category = 'convenience_store'
 AND ST_DWithin(s.geom::geography, p.geom::geography, 1000)
WHERE s.system_id = 'tra' AND s.station_id <> '1001'
GROUP BY s.station_id, s.name, s.county_name
ORDER BY cvs_1km DESC;
