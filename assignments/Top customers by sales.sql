
Friday. The sales director wants the customers who bring in 80 percent of all sales, so the account managers call them first next quarter.

Tables you can use:

Sales.Orders: OrderID, CustomerID, Sales

Sales.Customers: CustomerID, FirstName

Your task:

Return four columns: CustomerID, FirstName, TotalSales, RunningSharePercent.

TotalSales: the sum of Sales of the customer's orders.

RunningSharePercent: line the customers up by TotalSales, highest first. It is the share of all sales that the customer and everyone above them bring in, in percent, rounded to 2 decimals.

Keep customers from the top until the running share reaches 80 percent. The customer who takes it past 80 percent stays, and everyone after is left out.

Sort by TotalSales, highest first.

#######################################################################################

WITH CTE_Customer_Sales AS
(
    SELECT
        c.CustomerID,
        c.FirstName,
        SUM(o.Sales) AS TotalSales
    FROM Sales.Orders AS o
    INNER JOIN Sales.Customers AS c
        ON c.CustomerID = o.CustomerID
    GROUP BY
        c.CustomerID,
        c.FirstName
)
, CTE_Running_Sales AS
(
    SELECT
        *,
        SUM(TotalSales) OVER (ORDER BY TotalSales DESC) AS RunningSales,
        SUM(TotalSales) OVER ()                        AS AllSales
    FROM CTE_Customer_Sales
)
SELECT
    CustomerID,
    FirstName,
    TotalSales,
    ROUND(CAST(RunningSales AS FLOAT) / AllSales * 100, 2) AS RunningSharePercent
FROM CTE_Running_Sales
WHERE RunningSales - TotalSales < AllSales * 0.8
ORDER BY TotalSales DESC;
