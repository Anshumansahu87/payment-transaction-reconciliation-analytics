# Payment Transaction & Reconciliation Analytics

## Objective
A portfolio project that analyzes payment transactions and demonstrates SQL/Python skills relevant to Payments Data Analyst roles.

## Tech Stack
- SQL (CTEs, joins, window functions, aggregations)
- Python, Pandas, NumPy
- PostgreSQL-compatible SQL
- Excel/Power BI-ready CSV outputs

## KPIs
- Transaction success/failure rate
- Gateway-wise performance
- Payment-method performance
- Gross transaction value
- Settlement variance
- Reconciliation status
- Failure reasons
- Daily transaction drop-offs/anomalies

## Project Structure
```text
data/payment_transactions.csv
sql/schema.sql
sql/analytics_queries.sql
python/analyze_payments.py
```

## Run
1. Create a PostgreSQL database.
2. Run `sql/schema.sql`.
3. Import `data/payment_transactions.csv`.
4. Run queries from `sql/analytics_queries.sql`.
5. Run:
   `python python/analyze_payments.py`

## Important
The included CSV is **synthetic sample data created for portfolio practice**, not real customer/payment data. Do not claim it as production fintech experience.

## Resume bullet (only after you actually complete/use the project)
**Payment Transaction & Reconciliation Analytics** | SQL, Python, Pandas, Power BI
- Analyzed payment transactions to monitor success rates, gateway performance, settlement variance, and reconciliation status.
- Used CTEs, window functions, aggregations, and segmentation queries to identify transaction drop-offs and failure patterns.
- Built KPI outputs for transaction volume, success rate, settlement variance, and unreconciled transactions.
