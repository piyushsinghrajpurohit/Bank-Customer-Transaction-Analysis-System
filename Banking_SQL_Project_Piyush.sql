create database bank;
use bank;
-- Create Tables

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    dob DATE,
    city VARCHAR(50),
    account_type VARCHAR(20)
);

CREATE TABLE Branches (
    branch_id INT PRIMARY KEY,
    branch_name VARCHAR(100),
    location VARCHAR(100)
);

CREATE TABLE Accounts (
    account_id INT PRIMARY KEY,
    customer_id INT,
    branch_id INT,
    balance DECIMAL(12,2),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (branch_id) REFERENCES Branches(branch_id)
);

CREATE TABLE Transactions (
    transaction_id INT PRIMARY KEY,
    account_id INT,
    transaction_date DATE,
    amount DECIMAL(12,2),
    transaction_type VARCHAR(10),  -- deposit/withdrawal
    FOREIGN KEY (account_id) REFERENCES Accounts(account_id)
);

-- Insert Sample Data

-- Customers
INSERT INTO Customers VALUES
(1, 'Piyush Rajpurohit', '2002-05-01', 'Jaipur', 'Savings'),
(2, 'Anita Mehta', '1988-07-12', 'Delhi', 'Current');

-- Branches
INSERT INTO Branches VALUES
(101, 'Jaipur Main', 'Jaipur'),
(102, 'Delhi South', 'Delhi');

-- Accounts
INSERT INTO Accounts VALUES
(1001, 1, 101, 50000.00),
(1002, 2, 102, 120000.00);

-- Transactions
INSERT INTO Transactions VALUES
(1, 1001, '2025-05-01', 2000.00, 'deposit'),
(2, 1001, '2025-05-02', 1000.00, 'withdrawal'),
(3, 1002, '2025-05-02', 150000.00, 'deposit'),
(4, 1002, '2025-05-03', 5000.00, 'withdrawal');

-- Sample Queries

-- 1. High Value Deposits
SELECT c.name, t.amount, t.transaction_date
FROM Customers c
JOIN Accounts a ON c.customer_id = a.customer_id
JOIN Transactions t ON a.account_id = t.account_id
WHERE t.transaction_type = 'deposit' AND t.amount > 100000;

-- 2. Customer-wise Total Deposits
SELECT c.name, SUM(t.amount) AS total_deposit
FROM Customers c
JOIN Accounts a ON c.customer_id = a.customer_id
JOIN Transactions t ON a.account_id = t.account_id
WHERE t.transaction_type = 'deposit'
GROUP BY c.name;

-- 3. Branch-wise Transaction Count
SELECT b.branch_name, COUNT(t.transaction_id) AS total_transactions
FROM Branches b
JOIN Accounts a ON b.branch_id = a.branch_id
JOIN Transactions t ON a.account_id = t.account_id
GROUP BY b.branch_name;
