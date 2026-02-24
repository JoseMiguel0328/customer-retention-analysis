WITH first_purchase AS (
    SELECT
        customer_id,
        DATE_FORMAT(MIN(invoice_date), '%Y-%m') AS cohort_month
    FROM transactions
    GROUP BY customer_id
),

cohort_revenue AS (
    SELECT
        fp.cohort_month,
        DATE_FORMAT(MIN(t.invoice_date), '%Y-%m')   AS activity_month,
        SUM(t.quantity * t.price)                   AS monthly_revenue,
        COUNT(DISTINCT t.customer_id)               AS active_customers
    FROM transactions t
    JOIN first_purchase fp ON t.customer_id = fp.customer_id
    GROUP BY fp.cohort_month, DATE_FORMAT(t.invoice_date, '%Y-%m')
),

cohort_size AS (
    SELECT
        cohort_month,
        COUNT(DISTINCT customer_id) AS total_customers
    FROM first_purchase
    GROUP BY cohort_month
)

SELECT 
    cr.cohort_month,
    cr.activity_month,
    cs.total_customers                                          AS cohort_size,
    ROUND(cr.monthly_revenue, 2)    							AS monthly_revenue,
    ROUND(cr.monthly_revenue / cs.total_customers, 2)           AS revenue_per_customer
FROM cohort_revenue cr
JOIN cohort_size cs ON cr.cohort_month = cs.cohort_month
ORDER BY cr.cohort_month, cr.activity_month;