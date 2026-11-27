/*
Thursday. Finance checks the biggest orders that are still on the way. A colleague's query returns only 2 of them, and finance is sure that some are missing.

Tables you can use:

Sales.Orders: OrderID, OrderStatus ('Shipped' while the order is on the way, 'Delivered' when it has arrived), Sales

Your task:

Fix the colleague's query in the starter, or write a new one below it.

Return three columns: OrderID, Sales, SalesRank.

SalesRank: the place of the order's amount among the shipped orders. 1 is the highest amount, 2 the next lower one, and so on. Orders with the same amount share a place.

Keep the shipped orders with SalesRank 1, 2 or 3.

Sort by Sales, highest first, then by OrderID.
*/

################################################################################################################

SELECT
    OrderID,
    Sales,
    SalesRank
FROM (
    SELECT
        OrderID,
        Sales,
        DENSE_RANK() OVER (ORDER BY Sales DESC) AS SalesRank
    FROM Sales.Orders
    WHERE OrderStatus = 'Shipped'
) AS RankedOrders
WHERE SalesRank <= 3
ORDER BY Sales DESC, OrderID;
