-- calculate the 3-day rolling average of tweets per user
-- output: user_id, tweet_date, rolling avgs to 2 decimals
-- running mean
-- 
select user_id, tweet_date, round(rolling_avg, 2) as rolling_avg_3d
from (
select 
  user_id, 
  tweet_date, 
    avg(tweet_count) OVER(
    PARTITION BY user_id
    order by tweet_date
    rows between 2 preceding and current row
  ) as rolling_avg
  
  from tweets
