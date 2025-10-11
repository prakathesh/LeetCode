SELECT DISTINCT num AS ConsecutiveNums
FROM (
SELECT num, a.id - ROW_NUMBER() OVER (PARTITION BY num ORDER BY id) AS label
FROM Logs a
) cte
GROUP BY label, num
HAVING COUNT(num) >= 3;
