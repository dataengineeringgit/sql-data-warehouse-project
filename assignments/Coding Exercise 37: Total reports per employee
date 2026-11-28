WITH CTE_Reports AS
(
    -- Anchor Query: every employee starts a walk of their own
    SELECT
        EmployeeID AS StartID,
        EmployeeID
    FROM Sales.Employees
    UNION ALL
    -- Recursive Query: one level down from the current row
    SELECT
        cr.StartID,
        e.EmployeeID
    FROM Sales.Employees AS e
    INNER JOIN CTE_Reports AS cr
        ON e.ManagerID = cr.EmployeeID
)
SELECT
    e.EmployeeID,
    e.FirstName,
    COUNT(*) - 1 AS TotalReports
FROM CTE_Reports AS cr
INNER JOIN Sales.Employees AS e
    ON e.EmployeeID = cr.StartID
GROUP BY
    e.EmployeeID,
    e.FirstName
ORDER BY TotalReports DESC, e.EmployeeID;
