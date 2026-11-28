
Employees without reports
Monday. HR plans a leadership course for every employee who leads nobody. A colleague's query returns no rows, but Max leads nobody.

Tables you can use:

Sales.Employees: EmployeeID, FirstName, Department, ManagerID (the EmployeeID of the employee's manager)

Your task:

Fix the colleague's query in the starter, or write a new one below it.

Return EmployeeID, FirstName, Department.

Keep every employee who is nobody's manager.

Sort by EmployeeID.

###############################################################################################################

  SELECT
    EmployeeID,
    FirstName,
    Department
FROM Sales.Employees
WHERE EmployeeID NOT IN (
    SELECT ManagerID
    FROM Sales.Employees
    WHERE ManagerID IS NOT NULL
)
ORDER BY EmployeeID;

