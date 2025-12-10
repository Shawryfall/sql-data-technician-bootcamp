-- ============================================================================
-- WORLD DATABASE QUERIES
-- ============================================================================

USE world;

-- 1. Count Cities in USA
SELECT COUNT(1) AS `CityCount`
FROM `city`
WHERE `CountryCode` = 'USA';

-- 2. Country with Highest Life Expectancy
SELECT `Name`, `LifeExpectancy`
FROM `country`
WHERE `LifeExpectancy` = (SELECT MAX(`LifeExpectancy`) FROM `country`);

-- 3. Cities with 'New' in Name
SELECT `Name`, `CountryCode`, `District`, `Population`
FROM `city`
WHERE `Name` LIKE '%New%';

-- 4. Top 10 Most Populous Cities
SELECT `Name`, `CountryCode`, `District`, `Population`
FROM `city`
ORDER BY `Population` DESC
LIMIT 10;

-- 5. Cities with Population Over 2 Million
SELECT `Name`, `CountryCode`, `District`, `Population`
FROM `city`
WHERE `Population` > 2000000;

-- 6. Cities Beginning with 'Be'
SELECT `Name`, `CountryCode`, `District`, `Population`
FROM `city`
WHERE `Name` LIKE 'Be%';

-- 7. Cities with Population Between 500K-1M
SELECT `Name`, `CountryCode`, `District`, `Population`
FROM `city`
WHERE `Population` BETWEEN 500000 AND 1000000;

-- 8. Cities Sorted Alphabetically
SELECT `Name`, `CountryCode`, `District`, `Population`
FROM `city`
ORDER BY `Name` ASC;

-- 9. Most Populated City
SELECT `Name`, `CountryCode`, `District`, `Population`
FROM `city`
WHERE `Population` = (SELECT MAX(`Population`) FROM `city`);

-- 10. City Name Frequency
SELECT `Name`, COUNT(1) AS `Count`
FROM `city`
GROUP BY `Name`
ORDER BY `Name` ASC;

-- 11. City with Lowest Population
SELECT `Name`, `CountryCode`, `District`, `Population`
FROM `city`
WHERE `Population` = (SELECT MIN(`Population`) FROM `city`);

-- 12. Country with Largest Population
SELECT `Name`, `Continent`, `Population`
FROM `country`
WHERE `Population` = (SELECT MAX(`Population`) FROM `country`);

-- 13. Capital of Spain
SELECT `city`.`Name` AS `CapitalName`
FROM `city`
INNER JOIN `country` ON `city`.`ID` = `country`.`Capital`
WHERE `country`.`Name` = 'Spain';

-- 14. Cities in Europe
SELECT `city`.`Name`, `city`.`CountryCode`, `city`.`District`, `city`.`Population`
FROM `city`
INNER JOIN `country` ON `city`.`CountryCode` = `country`.`Code`
WHERE `country`.`Continent` = 'Europe';

-- 15. Average Population by Country
SELECT `country`.`Name`, AVG(`city`.`Population`) AS `AveragePopulation`
FROM `country`
INNER JOIN `city` ON `country`.`Code` = `city`.`CountryCode`
GROUP BY `country`.`Name`;

-- 16. Capital Cities Population Comparison
SELECT `country`.`Name` AS `Country`, `city`.`Name` AS `CapitalCity`, `city`.`Population` AS `CapitalPopulation`
FROM `country`
INNER JOIN `city` ON `country`.`Capital` = `city`.`ID`
ORDER BY `city`.`Population` DESC;

-- 17. Countries with Low Population Density
SELECT `Name`, `Population`, `SurfaceArea`, (`Population` / `SurfaceArea`) AS `PopulationDensity`
FROM `country`
WHERE `SurfaceArea` > 0
ORDER BY `PopulationDensity` ASC;

-- 18. Cities with High GDP per Capita
SELECT `city`.`Name`, `city`.`CountryCode`, `city`.`Population`, `country`.`GNP`, (`country`.`GNP` / `city`.`Population`) AS `GDPperCapita`
FROM `city`
JOIN `country` ON `city`.`CountryCode` = `country`.`Code`
WHERE `city`.`Population` > 0 AND `country`.`GNP` IS NOT NULL
ORDER BY `GDPperCapita` DESC;

-- 19. Cities Ranked 31-40 by Population
SELECT `ID`, `Name`, `CountryCode`, `District`, `Population`
FROM `city`
ORDER BY `Population` DESC
LIMIT 10 OFFSET 30;
