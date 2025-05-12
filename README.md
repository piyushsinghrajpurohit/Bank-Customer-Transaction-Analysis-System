# Banking Customer Transaction Analysis (SQL Project)

This project simulates a simple banking system to demonstrate SQL skills relevant for banking and finance roles. It includes customer profiles, account management, transaction tracking, and branch performance analysis.

---

##  Project Structure

**Database Tables:**
- `Customers`: Stores basic customer details.
- `Branches`: Contains bank branch information.
- `Accounts`: Links customers with accounts and their balances.
- `Transactions`: Tracks deposits and withdrawals for accounts.

---

##  Schema Diagram (Simplified)

```
Customers ───< Accounts >─── Branches
                   │
              Transactions
```

---

##  Sample Queries

1. **High Value Deposits (Anti-Money Laundering):**
```sql
SELECT c.name, t.amount, t.transaction_date
FROM Customers c
JOIN Accounts a ON c.customer_id = a.customer_id
JOIN Transactions t ON a.account_id = t.account_id
WHERE t.transaction_type = 'deposit' AND t.amount > 100000;
```

2. **Customer-wise Total Deposits:**
```sql
SELECT c.name, SUM(t.amount) AS total_deposit
FROM Customers c
JOIN Accounts a ON c.customer_id = a.customer_id
JOIN Transactions t ON a.account_id = t.account_id
WHERE t.transaction_type = 'deposit'
GROUP BY c.name;
```

3. **Branch-wise Transaction Count:**
```sql
SELECT b.branch_name, COUNT(t.transaction_id) AS total_transactions
FROM Branches b
JOIN Accounts a ON b.branch_id = a.branch_id
JOIN Transactions t ON a.account_id = t.account_id
GROUP BY b.branch_name;
```

---

##  Use Cases

- Analyze customer transaction behavior.
- Monitor high-value transactions for compliance.
- Evaluate bank branch performance.
- Understand customer savings and cash flow trends.

---

##  Tools Used

- SQL (MySQL syntax)


---

##  Created by

**Piyush Rajpurohit**  
SQL & Data Analytics Enthusiast  
