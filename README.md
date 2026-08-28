\# Payment Transaction & Reconciliation Analytics

A portfolio project for analyzing payment transactions, gateway performance, settlement variance, reconciliation status, and transaction anomalies using SQL and Python.

## 🎯 Objective

Analyze payment transaction data to monitor key payment KPIs and identify:

- Transaction success and failure rates
- Payment gateway performance
- Payment method performance
- Settlement variance
- Reconciliation issues
- Failure patterns
- Transaction-volume drop-offs and anomalies

## 🛠️ Tech Stack

- **SQL:** CTEs, Joins, Window Functions, Aggregations, Subqueries
- **Python:** Pandas, NumPy
- **Database:** PostgreSQL
- **Analytics:** Data Cleaning, EDA, ETL, KPI Analysis, Anomaly Detection
- **Visualization:** Power BI / Excel-ready outputs
- **Tools:** VS Code, Git, GitHub

## 📁 Project Structure

```text
Payment-Transaction-Reconciliation-Analytics/
│
├── data/
│   ├── payment_transactions.csv
│   └── README.txt
│
├── python/
│   └── analyze_payments.py
│
├── sql/
│   ├── schema.sql
│   └── analytics_queries.sql
│
├── daily_payment_kpis.csv
├── gateway_performance.csv
├── unreconciled_transactions.csv
└── README.md
