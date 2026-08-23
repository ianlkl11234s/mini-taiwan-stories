-- 03 每日班次
-- 口徑：TDX 每日時刻表快照的列車總數（reference.daily_schedules.train_count）。
-- 平日／週末分開報，因為兩者不同（週末有加班車，反而略多）。
-- ⚠️ 176 天中 9 天缺班表（collector 計時漂移，見 inventory §三.3），已用 train_count > 0 排除。
SELECT
  CASE WHEN extract(isodow FROM schedule_date) BETWEEN 1 AND 5 THEN '平日' ELSE '週末' END AS day_type,
  count(*)                    AS days,
  round(avg(train_count))     AS avg_trains,
  min(train_count)            AS min_trains,
  max(train_count)            AS max_trains
FROM reference.daily_schedules
WHERE system = 'tra_daily'
  AND schedule_date >= current_date - 60
  AND train_count > 0
GROUP BY 1 ORDER BY 1;

-- 全期間逐日序列（畫趨勢圖用）
SELECT schedule_date, train_count
FROM reference.daily_schedules
WHERE system = 'tra_daily' AND train_count > 0
ORDER BY schedule_date;
