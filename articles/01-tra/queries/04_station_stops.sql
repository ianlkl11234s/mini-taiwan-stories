-- 04 每站每天被停靠幾次
-- 口徑：從 reference.daily_schedules(tra_daily) 的 data.schedules[].stations[] 逐日展開，
--       一筆 stations 元素 = 一次停靠。展開整週（不是單日），因為平日／週末不同。
--
-- ⚠️⚠️ 「停靠最少」排名【不可直接發】：
--   時刻表漏了 12 站（台中高架化 7 站、嘉北、新馬…），詳見 inventory §三.1。
--   潭子、新烏日在即時位置資料裡有 176/198 個相異車次，時刻表卻是 0。
--   → top 排名可用；bottom 排名必須先排除已知漏抓站，並在正文寫明排除了誰。
--
-- ⚠️ 重負載（7 天 JSONB 展開），避開台灣時間 10:00–20:00。
WITH days AS (
  SELECT schedule_date, data
  FROM reference.daily_schedules
  WHERE system = 'tra_daily'
    AND schedule_date BETWEEN :'from' AND :'to'
    AND train_count > 0
), stops AS (
  SELECT
    d.schedule_date,
    CASE WHEN extract(isodow FROM d.schedule_date) BETWEEN 1 AND 5 THEN '平日' ELSE '週末' END AS day_type,
    stn->>'station_id' AS sid
  FROM days d,
       jsonb_array_elements(d.data->'schedules')  sch,
       jsonb_array_elements(sch->'stations')      stn
), per_day AS (
  SELECT sid, day_type, schedule_date, count(*) AS stops FROM stops GROUP BY 1,2,3
)
SELECT
  s.station_id, s.name, s.county_name,
  round(avg(p.stops) FILTER (WHERE p.day_type = '平日'))::int AS weekday_stops,
  round(avg(p.stops) FILTER (WHERE p.day_type = '週末'))::int AS weekend_stops,
  count(DISTINCT p.schedule_date)                             AS days_observed
FROM per_day p
JOIN rail.stations s ON s.station_id = p.sid AND s.system_id = 'tra'
GROUP BY 1,2,3
ORDER BY weekday_stops DESC NULLS LAST;

-- 缺席站稽核（每次重跑都要看，確認 pipeline 有沒有修好）
WITH days AS (
  SELECT data FROM reference.daily_schedules
  WHERE system = 'tra_daily' AND schedule_date BETWEEN :'from' AND :'to' AND train_count > 0
), seen AS (
  SELECT DISTINCT stn->>'station_id' AS sid
  FROM days d, jsonb_array_elements(d.data->'schedules') sch, jsonb_array_elements(sch->'stations') stn
)
SELECT s.station_id, s.name, s.county_name
FROM rail.stations s
WHERE s.system_id = 'tra' AND s.station_id NOT IN (SELECT sid FROM seen)
ORDER BY s.station_id;
