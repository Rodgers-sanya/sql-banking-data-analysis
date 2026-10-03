# sql-banking-data-analysis
MySQL banking data analysis project covering customers, accounts, transactions, loans, credit cards, customer segmentation, financial profiling, and credit risk analysis.

# 🏦 Banking Data Analysis Using SQL

## 📌 Project Overview

This project focuses on analyzing banking data using **MySQL** to answer real-world business questions and generate meaningful insights.

The analysis covers five main areas: **customers, accounts, transactions, loans, and credit cards**. It contains **30 business questions**, ranging from basic analysis to more advanced customer segmentation, financial profiling, asset ranking, and credit-risk analysis.

## 🎯 Objectives

The main objectives of this project are to:

* Analyze customer demographics and income
* Understand account ownership and balances
* Analyze transaction patterns
* Examine the bank's loan portfolio
* Analyze credit card information
* Identify high-value customers
* Segment customers based on account balances
* Identify customers with potential credit risk
* Build comprehensive customer financial profiles

## 🗄️ Database Structure

The project uses five tables:

| Table          | Purpose                                     |
| -------------- | ------------------------------------------- |
| `customers`    | Customer demographic and income information |
| `accounts`     | Customer accounts and balances              |
| `transactions` | Banking transaction records                 |
| `loans`        | Customer loan information                   |
| `credit_cards` | Credit card information                     |

The SQL project starts by selecting the banking database and working with these five tables.


## 🛠️ Tools & Technologies

* **MySQL**
* **MySQL Workbench**
* **GitHub**

## 📊 Analysis Areas

### Customer Analysis

Includes customer counts, geographical distribution, average income, highest-income customers, and age analysis.

### Account Analysis

Analyzes account types, customers with multiple accounts, total balances, and branch-level balances.

### Transaction Analysis

Examines transaction volumes, average transaction amounts, customer transaction activity, failed/pending transactions, and duplicate transactions.

### Loan Analysis

Analyzes the total loan portfolio, common loan types, remaining loan balances, and average interest rates.

### Credit Card Analysis

Examines cards issued, credit limits, card types, and balances.

## 🚀 Advanced Analysis

The project also includes more advanced business-oriented analysis, including:

* Customer lifetime value
* Customer asset ranking using `RANK()`
* High-value customer identification
* Customer segmentation using `CASE`
* Potential credit-risk identification
* Complete customer financial profiling

The final analysis combines information from all five tables to create a broader financial profile for each customer.

## 🧠 SQL Skills Demonstrated

This project demonstrates practical use of:

* `SELECT`, `WHERE`, `ORDER BY`, `LIMIT`
* Aggregate functions: `COUNT()`, `SUM()`, `AVG()`
* `GROUP BY` and `HAVING`
* `JOINs`
* `CASE WHEN`
* `COALESCE()`
* Conditional aggregation
* `ROW_NUMBER()`
* `RANK()`
* Duplicate detection
* Multi-table analysis
* Customer segmentation


## ▶️ How to Run

1. Open **MySQL Workbench**.
2. Create or import the `banking_dataanalysis` database.
3. Create and populate the five tables:
   `customers`, `accounts`, `transactions`, `loans`, and `credit_cards`.
4. Open `banking_dataanalysis_queries.sql`.
5. Run the queries individually or section by section.

## 💡 Key Learning Outcomes

This project helped me strengthen my ability to:

* Translate business problems into SQL queries
* Work with relational databases
* Join and analyze multiple tables
* Apply SQL aggregation and window functions
* Detect data-quality issues
* Perform customer segmentation
* Use SQL to generate business-oriented insights

## 🔮 Future Improvements

Future versions of this project could include:

* Connecting the database to **Python or R**
* Building a **Power BI dashboard**
* Adding more advanced financial and fraud analysis
* Developing more detailed customer risk models
* Automating reporting workflows

## 👨‍💻 Author

**Egesa**

Aspiring Data Analyst | SQL | Python | R | Excel | Kobotoolbox |spss

This project is part of my practical data analytics portfolio, demonstrating how SQL can be applied to real-world business and financial problems.
