SELECT
    CustomerID,
    FirstName,
    Country,
    Score,
    ROUND(AVG(CAST(Score AS FLOAT)) OVER (PARTITION BY Country), 2) AS CountryAvgScore,
    CASE
        WHEN Score IS NULL THEN 'No score'
        WHEN Score >= AVG(CAST(Score AS FLOAT)) OVER (PARTITION BY Country) THEN 'Above average'
        ELSE 'Below average'
    END AS ScorePosition
FROM Sales.Customers
ORDER BY Country, CustomerID;
What each part does:

OVER (PARTITION BY Country): puts the average of each country on every row of that country.

AVG(CAST(Score AS FLOAT)): skips Olivia's missing score, so the USA average is 563.33.

WHEN Score IS NULL: comes first, so Olivia gets 'No score' and not 'Below average'.

WHEN Score >= ...: compares each score with its country average.
