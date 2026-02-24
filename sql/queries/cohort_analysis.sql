WITH first_purchase AS (
    SELECT
        customer_id,
        DATE_FORMAT(MIN(invoice_date), '%Y-%m') AS cohort_month
    FROM transactions
    GROUP BY customer_id
),

cohort_activity AS (
    SELECT
        fp.cohort_month,
        DATE_FORMAT(MIN(t.invoice_date), '%Y-%m')    AS activity_month,
        COUNT(DISTINCT t.customer_id)                AS active_customers
    FROM transactions t
    JOIN first_purchase fp ON t.customer_id = fp.customer_id
    GROUP BY fp.cohort_month, DATE_FORMAT(t.invoice_date, '%Y-%m')
),

cohort_size AS (
    SELECT
        cohort_month,
        COUNT(DISTINCT customer_id) AS total_costumers
    FROM first_purchase
    GROUP BY cohort_month
)

SELECT 
    ca.cohort_month,
    ca.activity_month,
    cs.total_costumers                                          AS cohort_size,
    ca.active_customers,
    ROUND(ca.active_customers / cs.total_costumers * 100, 1)    AS retention_rate
FROM cohort_activity ca
JOIN cohort_size cs ON ca.cohort_month = cs.cohort_month
ORDER BY ca.cohort_month, ca.activity_month;
