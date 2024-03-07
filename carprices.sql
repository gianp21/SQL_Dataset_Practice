SELECT *
FROM car_prices
LIMIT 3;

-- What is the average revenue per model year?
WITH yearly_revenue AS (
	SELECT year, COUNT(*) AS cars_sold, SUM(sellingprice) AS total_revenue
	FROM car_prices
	GROUP BY year
)
SELECT year, total_revenue, total_revenue/cars_sold AS avg_revenue
FROM yearly_revenue
GROUP BY year, total_revenue, cars_sold
ORDER BY year;

-- Which car model has the maximum average miles (odometer)?
WITH avg_miles_per_model AS (
	SELECT model, AVG(odometer) AS avg_mileage
	FROM car_prices
	GROUP BY model
)
SELECT model, avg_mileage
FROM avg_miles_per_model
ORDER BY avg_mileage DESC
LIMIT 1;

-- Which car make has the minimum number of sales?
WITH car_sales AS (
	SELECT make, COUNT(*) AS cars_sold
	FROM car_prices
	GROUP BY make
)
SELECT make, cars_sold
FROM car_sales
ORDER BY cars_sold ASC
LIMIT 1;