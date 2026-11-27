CREATE TABLE Sales.ProductStock AS
SELECT
    p.ProductID,
    p.Product,
    50 - SUM(o.Quantity) AS Stock
FROM Sales.Products AS p
INNER JOIN Sales.Orders AS o
    ON o.ProductID = p.ProductID
GROUP BY
    p.ProductID,
    p.Product;
UPDATE Sales.ProductStock
SET Stock = Stock + 20
WHERE Stock <= 45;
SELECT *
FROM Sales.ProductStock
ORDER BY Stock, ProductID;
