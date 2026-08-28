# Payment Transaction & Reconciliation Analytics

A portfolio project focused on analyzing payment transactions, gateway performance, settlement variance, reconciliation status, and transaction anomalies using SQL and Python.

## 🎯 Objective

The objective of this project is to analyze payment transaction data and monitor important payment KPIs such as:

- Transaction success and failure rates
- Payment gateway performance
- Payment method performance
- Settlement variance
- Reconciliation status
- Failure reasons
- Daily transaction trends
- Transaction-volume drop-offs and anomalies

## 🛠️ Tech Stack

- **SQL:** CTEs, Joins, Window Functions, Aggregations, Subqueries
- **Python:** Pandas, NumPy
- **Database:** PostgreSQL
- **Analytics:** Data Cleaning, EDA, KPI Analysis, Anomaly Detection
- **Visualization:** Excel / Power BI
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
├── dashboard/
│   ├── Payment_Transaction_Analytics_Dashboard.xlsx
│   └── Payment_Transaction_Analytics_Dashboard.pdf
│
├── daily_payment_kpis.csv
├── gateway_performance.csv
├── unreconciled_transactions.csv
└── README.md
