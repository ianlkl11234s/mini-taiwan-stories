-- 06 哪一段最容易誤點（區間誤點增量排行）
--
-- 口徑：delay_trajectory 是 TrainLiveBoard 的逐次輪詢觀測（[{d:誤點分, s:站碼, t:時刻}]），
--       依時間排序後取相鄰兩點，delta = 後點誤點 - 前點誤點 = 這一段「新增」的誤點。
--       正值 = 這段在掉點，負值 = 這段在追回。
--
-- ⚠️ 四個必要的清洗，缺一結果就是噪音：
--   1. 尖刺：單點暴衝又消失（6→95→6）。剔除 |delta| > 30 的觀測對。
--   2. 通過站：觀測點含列車經過但不停靠的站，所以這是「觀測點對」不是「停靠站對」。
--   3. 輪詢粒度：不保證每站一筆，相鄰觀測點之間可能跨了好幾站。
--   4. 最小樣本：低於 200 次觀測的區間不列入排行（南迴、支線容易只有個位數樣本）。
--
-- ⚠️ 重負載：掃 158k 列 × 每列 JSON（delay_trajectory 佔該表 72%、138MB）。
--    避開台灣時間 10:00–20:00。跑完把結果存成 figures/../data/06_segments.csv，不要重複掃。
WITH pts AS (
  SELECT
    t.service_date,
    t.train_no,
    (e.value->>'s')                      AS sid,
    (e.value->>'d')::int                 AS delay_min,
    (e.value->>'t')                      AS obs_time,
    e.ordinality                         AS seq
  FROM analytics.tra_train_delay_daily t,
       jsonb_array_elements(t.delay_trajectory) WITH ORDINALITY e(value, ordinality)
  WHERE t.service_date BETWEEN :'from' AND :'to'
    AND t.delay_trajectory IS NOT NULL
), pairs AS (
  SELECT
    service_date, train_no,
    lag(sid)       OVER w AS from_sid,
    sid                   AS to_sid,
    delay_min - lag(delay_min) OVER w AS delta_min
  FROM pts
  WINDOW w AS (PARTITION BY service_date, train_no ORDER BY seq)
), clean AS (
  SELECT * FROM pairs
  WHERE from_sid IS NOT NULL
    AND from_sid <> to_sid
    AND abs(delta_min) <= 30          -- 尖刺過濾
)
SELECT
  f.name || ' → ' || t.name           AS segment,
  count(*)                            AS observations,
  round(avg(c.delta_min)::numeric, 2) AS avg_delta_min,
  percentile_cont(0.9) WITHIN GROUP (ORDER BY c.delta_min) AS p90_delta_min,
  round(100.0 * count(*) FILTER (WHERE c.delta_min > 0) / count(*), 1) AS pct_worsening,
  round(ST_Distance(f.geom::geography, t.geom::geography)::numeric / 1000, 1) AS km
FROM clean c
JOIN rail.stations f ON f.station_id = c.from_sid AND f.system_id = 'tra'
JOIN rail.stations t ON t.station_id = c.to_sid   AND t.system_id = 'tra'
GROUP BY 1, f.geom, t.geom
HAVING count(*) >= 200                -- 最小樣本門檻
ORDER BY avg_delta_min DESC
LIMIT 30;
