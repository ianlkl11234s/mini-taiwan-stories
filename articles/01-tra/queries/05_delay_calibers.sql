-- 05 誤點率三口徑（本篇核心）
--
-- 口徑定義：
--   A. 沿途口徑 —— 該班次沿途任一觀測點誤點 >5 分即算誤點。最接近乘客體感。
--   B. 近終點口徑 —— 只看最後觀測落在終點前 3 站內的班次。最接近官方定義。
--   C. 官方口徑 —— 到達終點站延誤 ≤5 分為準點。台鐵公布 2025 年 97.02%。
--      來源：https://tip.railway.gov.tw/tra-tip-web/adr/about-public-info-3-2
--
-- ⚠️ A/B 都是 TrainLiveBoard 沿途觀測，不是官方發車紀錄，覆蓋率約 85%。
-- ⚠️ 9 天缺班表 → observed_trains 為 0，用 nullif 排除。
SELECT
  count(*)                                                                          AS days,
  round(avg(coverage_pct), 1)                                                       AS coverage_pct,
  round(avg(100.0 * (observed_trains  - delayed_over_5)   / nullif(observed_trains, 0)),  2) AS ontime_enroute_pct,
  round(avg(100.0 * (near_dest_trains - near_dest_over_5) / nullif(near_dest_trains, 0)), 2) AS ontime_near_dest_pct,
  round(avg(p90_delay_min), 1)                                                      AS p90_delay_min,
  round(avg(avg_delay_min), 1)                                                      AS avg_delay_min
FROM analytics.tra_delay_summary_daily
WHERE service_date >= :'from' AND service_date <= :'to';

-- 門檻敏感度（正文「把標準放寬到 10 分鐘會怎樣」用）
SELECT
  round(avg(100.0 * (observed_trains - delayed_over_0)  / nullif(observed_trains, 0)), 2) AS ontime_0min,
  round(avg(100.0 * (observed_trains - delayed_over_5)  / nullif(observed_trains, 0)), 2) AS ontime_5min,
  round(avg(100.0 * (observed_trains - delayed_over_10) / nullif(observed_trains, 0)), 2) AS ontime_10min,
  round(avg(100.0 * (observed_trains - delayed_over_15) / nullif(observed_trains, 0)), 2) AS ontime_15min,
  round(avg(100.0 * (observed_trains - delayed_over_30) / nullif(observed_trains, 0)), 2) AS ontime_30min
FROM analytics.tra_delay_summary_daily
WHERE service_date >= :'from' AND service_date <= :'to';

-- 逐日序列（畫趨勢圖 + 找異常日用）
SELECT service_date, coverage_pct, observed_trains, delayed_over_5, p90_delay_min, max_delay_min
FROM analytics.tra_delay_summary_daily
ORDER BY service_date;
