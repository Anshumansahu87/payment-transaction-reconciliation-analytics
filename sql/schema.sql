-- Payment Transaction & Reconciliation Analytics
CREATE TABLE payment_transactions (
    transaction_id BIGINT PRIMARY KEY,
    transaction_date DATE NOT NULL,
    merchant VARCHAR(100) NOT NULL,
    payment_gateway VARCHAR(50) NOT NULL,
    payment_method VARCHAR(30) NOT NULL,
    amount DECIMAL(12,2) NOT NULL,
    status VARCHAR(20) NOT NULL,
    failure_reason VARCHAR(100),
    gateway_fee DECIMAL(12,2) DEFAULT 0,
    settlement_amount DECIMAL(12,2) DEFAULT 0,
    settlement_date DATE,
    reconciliation_status VARCHAR(30)
);
