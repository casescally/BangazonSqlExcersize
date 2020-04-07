--List each employee first name, last name and supervisor status along with their department name. Order by department name, then by employee last name, and finally by employee first name.

SELECT e.FirstName, e.LastName, e.IsSupervisor, d.Name AS Department
FROM Employee e
LEFT JOIN Department d ON d.id = e.DepartmentId
ORDER BY d.Name;

--List each department ordered by budget amount with the highest first.

SELECT d.Name, d.Budget
			FROM Department d
ORDER BY d.Budget DESC;

--List each department name along with any employees (full name) in that department who are supervisors.

SELECT e.FirstName, e.LastName, d.Name as Department
FROM Employee e
LEFT JOIN Department d ON d.id = e.DepartmentId
WHERE DepartmentId != 0
OR e.IsSupervisor = 1;

--List each department name along with a count of employees in each department.

SELECT d.Name, e.FirstName, e.LastName,
	CASE 
		WHEN e.IsSupervisor = 1 
		THEN 1
	END
FROM Department d
LEFT JOIN Employee e
ON d.Id = e.DepartmentId;

--Write a single update statement to increase each department's budget by 20%.

UPDATE Department
SET Budget = Budget * 1.2;

--List the employee full names for employees who are not signed up for any training programs.

SELECT e.FirstName, e.LastName
FROM Employee e
LEFT JOIN EmployeeTraining et on e.Id = et.EmployeeId
WHERE et.EmployeeId IS NULL;


--List the employee full names for employees who are signed up for at least one training program and include the number of training programs they are signed up for.

SELECT e.FirstName, e.LastName, COUNT(et.Id) AS 'Number of training programs'
FROM Employee e
LEFT JOIN EmployeeTraining et ON e.Id = et.EmployeeId
WHERE et.EmployeeId IS NOT NULL
GROUP BY e.FirstName, e.LastName;

--List all training programs along with the count employees who have signed up for each.

SELECT tp.Name, COUNT(et.EmployeeId) AS 'Count of Attendees'
FROM TrainingProgram tp
LEFT JOIN EmployeeTraining et
ON tp.Id = et.TrainingProgramId
GROUP BY tp.Name;

--List all training programs who have no more seats available.
SELECT tp.Name
FROM TrainingProgram tp
LEFT JOIN EmployeeTraining et
ON tp.Id = et.TrainingProgramId
GROUP BY tp.Name, tp.MaxAttendees
HAVING tp.MaxAttendees = COUNT(et.EmployeeId)

--List all future training programs ordered by start date with the earliest date first.

