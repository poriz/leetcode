SELECT s.student_id, s.student_name, sub.subject_name,SUM(CASE WHEN e.student_id is null then 0 ELSE 1 END) AS attended_exams
FROM Students as s
CROSS JOIN Subjects as sub
LEFT JOIN Examinations as e
    ON s.student_id = e.student_id AND sub.subject_name = e.subject_name
GROUP BY s.student_name,sub.subject_name
ORDER BY 1,2,3,4;