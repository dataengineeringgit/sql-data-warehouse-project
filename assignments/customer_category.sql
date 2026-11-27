SELECT
    c.CustomerID,
    c.FirstName
FROM Sales.Customers AS c
INNER JOIN Sales.Orders AS o
    ON o.CustomerID = c.CustomerID
INNER JOIN Sales.Products AS p
    ON p.ProductID = o.ProductID
WHERE p.Category = 'Accessories'
INTERSECT
SELECT
    c.CustomerID,
    c.FirstName
FROM Sales.Customers AS c
INNER JOIN Sales.Orders AS o
    ON o.CustomerID = c.CustomerID
INNER JOIN Sales.Products AS p
    ON p.ProductID = o.ProductID
WHERE p.Category = 'Clothing'
ORDER BY c.CustomerID;

------------------------------------------------------------------------------------------

WITH RequiredCategories(Category) AS (
    VALUES ('Accessories'), ('Clothing')
),
CustomerCategories AS (
    SELECT DISTINCT o.CustomerID, p.Category
    FROM Sales.Orders AS o
    JOIN Sales.Products AS p ON p.ProductID = o.ProductID
    JOIN RequiredCategories AS r ON r.Category = p.Category
)
SELECT c.CustomerID, c.FirstName
FROM Sales.Customers AS c
JOIN CustomerCategories AS cc ON cc.CustomerID = c.CustomerID
GROUP BY c.CustomerID, c.FirstName
HAVING COUNT(*) = (SELECT COUNT(*) FROM RequiredCategories)
ORDER BY c.CustomerID;
