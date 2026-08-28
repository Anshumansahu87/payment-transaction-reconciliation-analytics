import pandas as pd
import numpy as np

df = pd.read_csv("data/payment_transactions.csv", parse_dates=["transaction_date","settlement_date"])
# Basic cleaning
df.columns = df.columns.str.strip().str.lower()
df["amount"] = pd.to_numeric(df["amount"], errors="coerce")
df["settlement_amount"] = pd.to_numeric(df["settlement_amount"], errors="coerce").fillna(0)
df["gateway_fee"] = pd.to_numeric(df["gateway_fee"], errors="coerce").fillna(0)

# Core KPIs
total_txns = len(df)
success_rate = (df["status"].eq("SUCCESS").mean() * 100)
failure_rate = (df["status"].eq("FAILED").mean() * 100)
gross_value = df["amount"].sum()

successful = df[df["status"].eq("SUCCESS")].copy()
successful["settlement_variance"] = (
    successful["amount"] - successful["gateway_fee"] - successful["settlement_amount"]
).round(2)

unreconciled = successful[successful["reconciliation_status"].eq("UNRECONCILED")]

print("Total transactions:", total_txns)
print("Success rate: %.2f%%" % success_rate)
print("Failure rate: %.2f%%" % failure_rate)
print("Gross transaction value: %.2f" % gross_value)
print("Unreconciled successful transactions:", len(unreconciled))

# Gateway performance
gateway = df.groupby("payment_gateway").agg(
    transactions=("transaction_id","count"),
    success_rate=("status", lambda s: (s.eq("SUCCESS").mean()*100).round(2)),
    transaction_value=("amount","sum")
).sort_values("success_rate", ascending=False)

# Daily monitoring / anomaly flag
daily = df.groupby("transaction_date").agg(
    transactions=("transaction_id","count"),
    successful=("status", lambda s: s.eq("SUCCESS").sum()),
    failed=("status", lambda s: s.eq("FAILED").sum()),
    transaction_value=("amount","sum")
).reset_index()

daily["success_rate"] = (daily["successful"] / daily["transactions"] * 100).round(2)
daily["prev_day_txns"] = daily["transactions"].shift(1)
daily["day_change_pct"] = ((daily["transactions"]-daily["prev_day_txns"])
                           / daily["prev_day_txns"]*100).round(2)
daily["anomaly_flag"] = np.where(daily["day_change_pct"] <= -20, "DROP_OFF", "NORMAL")

gateway.to_csv("gateway_performance.csv")
daily.to_csv("daily_payment_kpis.csv", index=False)
unreconciled.to_csv("unreconciled_transactions.csv", index=False)
