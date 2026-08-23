-- 05 誤點率四口徑（本篇核心）
--
-- ⚠️ 門檻定義（已驗證，不要改）：
--    資料庫的 delayed_over_5 = max_delay_min >= 5，不是 > 5。
--    驗證方式：2026-08-18 summary.delayed_over_5=161 vs 明細 count(max_delay_min>=5)=161（>5 只有 121）；
--             2026-08-19 同樣 155=155。
--    所以【準點 = 誤點 < 5 分】。
--
-- 四個口徑，A / A2 / B′ 共用同一分母（observed=true 的班次），B 是子集：
--   A   沿途最大誤點 < 5 分        —— 乘客體感
--   A2  沿途 p90 誤點 < 5 分       —— 同上但濾掉單點尖刺
--   B′  最後一次觀測誤點 < 5 分     —— ⭐ 與 A 同分母，兩者差距 = 純口徑差（追回來的誤點）
--   B   近終點子集的最後觀測 < 5 分  —— 分母不同，用來檢查「挑樣本」有沒有美化數字
--   C   官方公布：到達終點站延誤 ≤5 分，2025 全年 97.02%
--       https://tip.railway.gov.tw/tra-tip-web/adr/about-public-info-3-2
--
-- ⚠️ A/A2/B′/B 都是 TrainLiveBoard 沿途觀測，涵蓋率約 85%，不是官方發車紀錄。
-- ⚠️ 只讀數值欄位，不碰 delay_trajectory（TOAST 分開存），所以不是重負載查詢。
SELECT
  count(*)                                                              AS observed_trains,
  round(100.0 * count(*) FILTER (WHERE max_delay_min  < 5) / count(*), 2) AS ontime_a_enroute_max,
  round(100.0 * count(*) FILTER (WHERE p90_delay_min  < 5) / count(*), 2) AS ontime_a2_enroute_p90,
  round(100.0 * count(*) FILTER (WHERE last_delay_min < 5) / count(*), 2) AS ontime_bprime_last_obs,
  count(*) FILTER (WHERE near_destination)                              AS near_dest_trains,
  round(100.0 * count(*) FILTER (WHERE near_destination AND last_delay_min < 5)
        / nullif(count(*) FILTER (WHERE near_destination), 0), 2)       AS ontime_b_near_dest
FROM analytics.tra_train_delay_daily
WHERE service_date BETWEEN :'from' AND :'to'
  AND observed;

-- 實際資料窗（寫進 data.json 的 as_of，不要自己回推）
SELECT min(service_date) AS from_date, max(service_date) AS to_date, count(DISTINCT service_date) AS days
FROM analytics.tra_train_delay_daily
WHERE service_date BETWEEN :'from' AND :'to';

-- 門檻敏感度（正文「把標準放寬到 10 分鐘會怎樣」用）
SELECT
  round(100.0 * count(*) FILTER (WHERE max_delay_min <  5) / count(*), 2) AS ontime_5min,
  round(100.0 * count(*) FILTER (WHERE max_delay_min < 10) / count(*), 2) AS ontime_10min,
  round(100.0 * count(*) FILTER (WHERE max_delay_min < 15) / count(*), 2) AS ontime_15min,
  round(100.0 * count(*) FILTER (WHERE max_delay_min < 30) / count(*), 2) AS ontime_30min
FROM analytics.tra_train_delay_daily
WHERE service_date BETWEEN :'from' AND :'to' AND observed;

-- 逐日序列（畫趨勢圖 + 找異常日用；2026-08-22 準點率只有 64.65%，值得查當天發生什麼事）
SELECT service_date, coverage_pct, observed_trains, delayed_over_5, p90_delay_min, max_delay_min
FROM analytics.tra_delay_summary_daily
ORDER BY service_date;

-- 車種別（正文「哪種車最準時」用）
SELECT train_type,
       count(*) AS trains,
       round(100.0 * count(*) FILTER (WHERE max_delay_min  < 5) / count(*), 2) AS ontime_a,
       round(100.0 * count(*) FILTER (WHERE last_delay_min < 5) / count(*), 2) AS ontime_bprime,
       round(avg(p90_delay_min)::numeric, 1) AS avg_p90_delay
FROM analytics.tra_train_delay_daily
WHERE service_date BETWEEN :'from' AND :'to' AND observed
GROUP BY train_type
HAVING count(*) >= 200
ORDER BY ontime_a;
