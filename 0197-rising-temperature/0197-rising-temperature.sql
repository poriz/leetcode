# SELECT w1.id
# FROM Weather w1 JOIN Weather w2
#     ON DATEDIFF(w1.recordDate, w2.recordDate) = 1
# WHERE w1.temperature > w2.temperature;

WITH pre_Weather AS
(
    SELECT
        id,recordDate, Temperature,
        LAG(temperature,1) OVER (ORDER BY recordDate) AS pre_temp,
        LAG(recordDate,1) OVER (ORDER BY recordDate) AS pre_record
    FROM
        Weather
)
SELECT
    id
FROM pre_Weather
WHERE temperature > pre_temp
    AND recordDate = DATE_ADD(pre_record, INTERVAL 1 DAY);