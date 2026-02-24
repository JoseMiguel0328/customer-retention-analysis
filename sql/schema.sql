CREATE DATABASE IF NOT EXISTS customer_retention;
USE customer_retention;

CREATE TABLE transactions (
    invoice         VARCHAR(20),
    stock_code      VARCHAR(20),
    description     VARCHAR(255),
    quantity        INT,
    invoice_date    DATETIME,
    price           DECIMAL(10, 2),
    customer_id     INT,
    country         VARCHAR(100),

    PRIMARY KEY (invoice, stock_code),

    INDEX idx_customer_id   (customer_id),
    INDEX idx_invoice_date  (invoice_date),
    INDEX idx_country       (country)
);