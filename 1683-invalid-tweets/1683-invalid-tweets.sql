# Write your MySQL query statement below

SELECT tw.tweet_id

FROM Tweets as tw

WHERE length(tw.content) > 15
