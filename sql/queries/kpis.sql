SELECT
	COUNT(DISTINCT invoice) 		AS total_orders,
	COUNT(DISTINCT customer_id) 	AS total_costumers,
    ROUND(SUM(quantity * price), 2) AS total_revenue
FROM transactions;

SELECT 
	DATE_FORMAT(invoice_date, '%Y-%m') 	AS month,
    COUNT(DISTINCT invoice)				AS total_orders,
    ROUND(SUM(quantity * price), 2) 	AS monthly_revenue
FROM transactions
GROUP BY DATE_FORMAT (invoice_date, '%Y-%m')
ORDER BY month ASC;

SELECT
    country,
    COUNT(DISTINCT customer_id)      AS total_customers,
    ROUND(SUM(quantity * price), 2)  AS total_revenue
FROM transactions
WHERE country != "Unspecified"
GROUP BY country
ORDER BY total_revenue DESC;