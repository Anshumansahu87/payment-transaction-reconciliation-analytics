-- KPI 1: overall success rate
SELECT
  COUNT(*) AS total_transactions,
  SUM(CASE WHEN status='SUCCESS' THEN 1 ELSE 0 END) AS successful_transactions,
  ROUND(100.0 * SUM(CASE WHEN status='SUCCESS' THEN 1 ELSE 0 END) / COUNT(*), 2) AS success_rate_pct
FROM payment_transactions;

-- KPI 2: gateway-wise success rate
SELECT payment_gateway,
       COUNT(*) AS transactions,
       ROUND(100.0*SUM(CASE WHEN status='SUCCESS' THEN 1 ELSE 0 END)/COUNT(*),2) AS success_rate_pct
FROM payment_transactions
GROUP BY payment_gateway
ORDER BY success_rate_pct DESC;

-- KPI 3: daily transaction drop-off using LAG (window function)
WITH daily AS (
  SELECT transaction_date, COUNT(*) AS txn_count
  FROM payment_transactions
  GROUP BY transaction_date
)
SELECT transaction_date, txn_count,
       LAG(txn_count) OVER (ORDER BY transaction_date) AS previous_day_txns,
       ROUND(100.0*(txn_count-LAG(txn_count) OVER (ORDER BY transaction_date))
             / NULLIF(LAG(txn_count) OVER (ORDER BY transaction_date),0),2) AS day_change_pct
FROM daily
ORDER BY transaction_date;

-- KPI 4: CTE for successful settlement reconciliation
WITH successful AS (
  SELECT *
  FROM payment_transactions
  WHERE status='SUCCESS'
),
recon AS (
  SELECT reconciliation_status, COUNT(*) AS transaction_count,
         SUM(amount) AS gross_amount,
         SUM(settlement_amount) AS settled_amount
  FROM successful
  GROUP BY reconciliation_status
)
SELECT * FROM recon;

-- KPI 5: unreconciled transactions
SELECT transaction_id, transaction_date, merchant, payment_gateway,
       amount, settlement_amount,
       ROUND(amount-gateway_fee-settlement_amount,2) AS settlement_variance
FROM payment_transactions
WHERE status='SUCCESS'
  AND reconciliation_status='UNRECONCILED'
ORDER BY ABS(amount-gateway_fee-settlement_amount) DESC;

-- KPI 6: failure reasons
SELECT failure_reason, COUNT(*) AS failed_transactions,
       ROUND(100.0*COUNT(*)/(SELECT COUNT(*) FROM payment_transactions WHERE status='FAILED'),2) AS share_pct
FROM payment_transactions
WHERE status='FAILED'
GROUP BY failure_reason
ORDER BY failed_transactions DESC;

-- KPI 7: gateway + method performance
SELECT payment_gateway, payment_method,
       COUNT(*) AS transactions,
       SUM(CASE WHEN status='SUCCESS' THEN 1 ELSE 0 END) AS successful,
       ROUND(100.0*SUM(CASE WHEN status='SUCCESS' THEN 1 ELSE 0 END)/COUNT(*),2) AS success_rate_pct
FROM payment_transactions
GROUP BY payment_gateway, payment_method
ORDER BY success_rate_pct DESC;
