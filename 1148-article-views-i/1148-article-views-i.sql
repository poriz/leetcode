# Write your MySQL query statement below

SELECT distinct(author_id) as id

FROM Views as v
WHERE v.author_id = viewer_id 
    
ORDER BY id ASC;