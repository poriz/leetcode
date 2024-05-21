SELECT uni.unique_id, e.name
FROM Employees as e
LEFT JOIN EmployeeUNI as uni 
    ON e.id = uni.id;
