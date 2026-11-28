Friday. The sales director wants a salesperson report stored in the database, so every team reads the same numbers in next Monday's meeting.

Tables you can use:

Sales.Employees: EmployeeID, FirstName, ManagerID (the EmployeeID of the employee's manager, NULL for the top manager)

Sales.Orders: OrderID, SalesPersonID (the EmployeeID of the salesperson), Sales

Your task:

Create a view named Sales.V_Salesperson_Report with EmployeeID, FirstName, ManagerName, Orders and TotalSales.

One row for each employee who handled at least one order as salesperson.

ManagerName: the first name of the employee's manager, and 'No manager' for the employee at the top.

Orders: the number of orders the employee handled.

TotalSales: the sum of their Sales.

Then read the whole view without picking columns, and add SalesRank as the last column.

SalesRank: 1 for the highest TotalSales.

Sort by SalesRank.

Note: write the SELECT right after AS, without parentheses, and no IF OBJECT_ID check. End each statement with a semicolon, not GO, keep Sales. in the view name, and use COALESCE, not ISNULL.

#######################################################################################################################

CREATE VIEW Sales.V_Salesperson_Report AS
SELECT
    e.EmployeeID,
    e.FirstName,
    COALESCE(
        (SELECT m.FirstName FROM Sales.Employees AS m WHERE m.EmployeeID = e.ManagerID),
        'No manager') AS ManagerName,
    COUNT(*)     AS Orders,
    SUM(o.Sales) AS TotalSales
FROM Sales.Employees AS e
INNER JOIN Sales.Orders AS o
    ON o.SalesPersonID = e.EmployeeID
GROUP BY
    e.EmployeeID,
    e.FirstName,
    e.ManagerID;
SELECT
    *,
    RANK() OVER (ORDER BY TotalSales DESC) AS SalesRank
FROM Sales.V_Salesperson_Report
ORDER BY SalesRank;
