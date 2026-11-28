WITH CTE_CustomerSales AS (
    SELECT
        c.CustomerID,
        c.Country,
        COALESCE(SUM(o.Sales), 0) AS TotalSales
    FROM Sales.Customers AS c
    LEFT JOIN Sales.Orders AS o
        ON o.CustomerID = c.CustomerID
    GROUP BY
        c.CustomerID,
        c.Country
)
SELECT
    Country,
    COUNT(*) AS Customers,
    ROUND(AVG(CAST(TotalSales AS FLOAT)), 2) AS AvgSpendPerCustomer
FROM CTE_CustomerSales
GROUP BY Country
ORDER BY Country;
