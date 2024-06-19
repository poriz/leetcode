SELECT user_id, CONCAT(upper(substr(name,1,1)), lower(substr(name,2))) as name
FROM users
order by user_id