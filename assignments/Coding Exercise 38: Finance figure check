
/*
Wednesday. Finance's report lists the sales per category: Accessories 195, Clothing 285 and Components 300. Finance wants them checked against the orders before the report goes out.

Tables you can use:

Sales.Orders: OrderID, ProductID, OrderDate, Sales

Sales.Products: ProductID, Category

Your task:

Return five columns: Category, DatabaseSales, FinanceSales, Difference, Status.

DatabaseSales: the sum of Sales of the category's orders from April and May 2025, the two months the report covers.

FinanceSales: the figure from the report.

Difference: DatabaseSales minus FinanceSales.

Status: 'ok' when the two figures are the same, and 'check' when they are not.

Sort by Category.

Note: MONTH and the other date functions do not work here, so compare OrderDate with a date, like OrderDate >= '2025-01-01'.
*/

######################################################################################################

WITH CTE_Finance AS
(
    SELECT 'Accessories' AS Category, 195 AS FinanceSales
    UNION ALL
    SELECT 'Clothing', 285
    UNION ALL
    SELECT 'Components', 300
)
, CTE_Database AS
(
    SELECT
        p.Category,
        SUM(o.Sales) AS DatabaseSales
    FROM Sales.Orders AS o
    INNER JOIN Sales.Products AS p
        ON p.ProductID = o.ProductID
    WHERE o.OrderDate BETWEEN '2025-04-01' AND '2025-05-31'
    GROUP BY p.Category
)
SELECT
    f.Category,
    d.DatabaseSales,
    f.FinanceSales,
    d.DatabaseSales - f.FinanceSales AS Difference,
    CASE
        WHEN d.DatabaseSales = f.FinanceSales THEN 'ok'
        ELSE 'check'
    END AS Status
FROM CTE_Finance AS f
INNER JOIN CTE_Database AS d
    ON d.Category = f.Category
ORDER BY f.Category;
