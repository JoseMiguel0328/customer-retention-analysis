WITH first_purchase AS (
    SELECT 
        customer_id,
        MIN(DATE_FORMAT(invoice_date, '%Y-%m')) AS cohort_month
    FROM transactions
    GROUP BY customer_id
),

monthly_customers AS (
    SELECT 
        DATE_FORMAT (t.invoice_date, '%Y-%m') AS month,
        t.customer_id,
        fp.cohort_month
    FROM transactions t
    JOIN first_purchase fp ON t.customer_id = fp.customer_id
)

SELECT 
    month,
    COUNT(DISTINCT CASE WHEN month = cohort_month THEN customer_id END) AS new_customers,
    COUNT(DISTINCT CASE WHEN month != cohort_month THEN customer_id END) AS returning_customers
FROM monthly_customers
GROUP BY month
ORDER BY month ASC;
