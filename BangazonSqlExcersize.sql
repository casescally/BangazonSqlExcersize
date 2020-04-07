SELECT e.FirstName, e.LastName, e.IsSupervisor, d.Name AS Department
FROM Employee e
LEFT JOIN Department d ON d.id = e.DepartmentId
ORDER BY d.Name;

SELECT d.Name, d.Budget
			FROM Department d
ORDER BY d.Budget DESC;

SELECT e.FirstName, e.LastName, d.Name as Department
FROM Employee e
LEFT JOIN Department d ON d.id = e.DepartmentId
WHERE DepartmentId != 0
OR e.IsSupervisor = 1

SELECT d.Name, e.FirstName, e.LastName,
	CASE 
		WHEN e.IsSupervisor = 1 
		THEN 1
	END
FROM Department d
LEFT JOIN Employee e
ON d.Id = e.DepartmentId