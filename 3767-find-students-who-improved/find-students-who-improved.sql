WITH ranking AS (
  SELECT
    student_id,
    subject,
    FIRST_VALUE(score) OVER (PARTITION BY student_id, subject ORDER BY exam_date ASC) AS first_score,
    LAST_VALUE(score) OVER (
      PARTITION BY student_id, subject ORDER BY exam_date ASC
      ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
    ) AS latest_score
  FROM Scores
)
SELECT DISTINCT student_id, subject, first_score, latest_score
FROM ranking
WHERE first_score < latest_score
ORDER BY student_id, subject;
