# Write your MySQL query statement below
SELECT w.name, w.population, w.area
from World as w
WHERE w.area >= 3000000 or w.population >= 25000000