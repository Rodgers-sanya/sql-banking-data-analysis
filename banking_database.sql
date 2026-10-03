create database banking_dataanalysis;

use banking_dataanalysis;
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    phone VARCHAR(20),
    city VARCHAR(50),
    state VARCHAR(2),
    zip_code VARCHAR(10),
    date_of_birth DATE,
    registration_date DATE,
    income DECIMAL(12,2)
);

INSERT INTO customers VALUES
(1, 'John', 'Smith', 'john.smith@email.com', '555-0101', 'New York', 'NY', '10001', '1985-03-15', '2020-01-15', 75000.00),
(2, 'Emma', 'Johnson', 'emma.j@email.com', '555-0102', 'Los Angeles', 'CA', '90001', '1990-07-22', '2019-11-20', 85000.00),
(3, 'Michael', 'Williams', 'michael.w@email.com', '555-0103', 'Chicago', 'IL', '60601', '1982-11-08', '2021-03-10', 95000.00),
(4, 'Sarah', 'Brown', 'sarah.brown@email.com', '555-0104', 'Houston', 'TX', '77001', '1988-05-12', '2020-06-05', 68000.00),
(5, 'David', 'Jones', 'david.jones@email.com', '555-0105', 'Phoenix', 'AZ', '85001', '1995-09-25', '2021-08-14', 72000.00),
(6, 'Lisa', 'Garcia', 'lisa.garcia@email.com', '555-0106', 'Philadelphia', 'PA', '19101', '1987-02-28', '2019-09-01', 88000.00),
(7, 'James', 'Martinez', 'james.m@email.com', '555-0107', 'San Antonio', 'TX', '78201', '1983-12-01', '2020-12-12', 92000.00),
(8, 'Maria', 'Rodriguez', 'maria.r@email.com', '555-0108', 'San Diego', 'CA', '92101', '1992-04-17', '2021-02-28', 67000.00),
(9, 'Robert', 'Lee', 'robert.lee@email.com', '555-0109', 'Dallas', 'TX', '75201', '1980-06-30', '2018-07-19', 110000.00),
(10, 'Patricia', 'White', 'patricia.w@email.com', '555-0110', 'San Jose', 'CA', '95101', '1986-10-14', '2020-09-23', 89000.00),
(11, 'Thomas', 'Harris', 'thomas.h@email.com', '555-0111', 'Austin', 'TX', '73301', '1991-03-05', '2021-05-17', 76000.00),
(12, 'Jennifer', 'Clark', 'jennifer.c@email.com', '555-0112', 'Jacksonville', 'FL', '32099', '1984-08-19', '2020-04-08', 81000.00),
(13, 'Charles', 'Lewis', 'charles.l@email.com', '555-0113', 'Fort Worth', 'TX', '76101', '1979-01-27', '2018-11-15', 105000.00),
(14, 'Jessica', 'Walker', 'jessica.w@email.com', '555-0114', 'Columbus', 'OH', '43085', '1993-07-09', '2021-01-30', 64000.00),
(15, 'Daniel', 'Hall', 'daniel.h@email.com', '555-0115', 'Charlotte', 'NC', '28201', '1989-11-21', '2019-06-22', 78000.00),
(16, 'Amanda', 'Allen', 'amanda.a@email.com', '555-0116', 'Detroit', 'MI', '48201', '1985-09-03', '2020-10-11', 71000.00),
(17, 'Matthew', 'Young', 'matthew.y@email.com', '555-0117', 'El Paso', 'TX', '79901', '1994-12-14', '2021-07-04', 69000.00),
(18, 'Ashley', 'King', 'ashley.k@email.com', '555-0118', 'Nashville', 'TN', '37201', '1981-05-18', '2019-03-27', 93000.00),
(19, 'Christopher', 'Wright', 'chris.w@email.com', '555-0119', 'Oklahoma City', 'OK', '73101', '1987-08-25', '2020-08-30', 87000.00),
(20, 'Stephanie', 'Scott', 'stephanie.s@email.com', '555-0120', 'Portland', 'OR', '97201', '1990-02-10', '2021-04-15', 74000.00),
(21, 'Andrew', 'Green', 'andrew.g@email.com', '555-0121', 'Las Vegas', 'NV', '89101', '1986-06-07', '2020-02-14', 82000.00),
(22, 'Nicole', 'Adams', 'nicole.a@email.com', '555-0122', 'Miami', 'FL', '33101', '1992-11-29', '2021-09-08', 66000.00),
(23, 'Joshua', 'Nelson', 'joshua.n@email.com', '555-0123', 'Seattle', 'WA', '98101', '1984-03-16', '2019-12-01', 99000.00),
(24, 'Rachel', 'Baker', 'rachel.b@email.com', '555-0124', 'Denver', 'CO', '80201', '1988-07-04', '2020-11-20', 77000.00),
(25, 'Kevin', 'Perez', 'kevin.p@email.com', '555-0125', 'Boston', 'MA', '02101', '1983-09-11', '2021-06-25', 84000.00);


CREATE TABLE accounts (
    account_id INT PRIMARY KEY,
    customer_id INT,
    account_type VARCHAR(20),
    account_number VARCHAR(20),
    branch_code VARCHAR(10),
    opening_date DATE,
    current_balance DECIMAL(12,2),
    status VARCHAR(15),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

INSERT INTO accounts VALUES
(101, 1, 'Checking', 'ACC1001', 'BR001', '2020-01-15', 5250.75, 'Active'),
(102, 1, 'Savings', 'ACC1002', 'BR001', '2020-01-15', 15200.00, 'Active'),
(103, 2, 'Checking', 'ACC1003', 'BR002', '2019-11-20', 8750.50, 'Active'),
(104, 3, 'Checking', 'ACC1004', 'BR003', '2021-03-10', 12450.25, 'Active'),
(105, 3, 'Savings', 'ACC1005', 'BR003', '2021-03-10', 35000.00, 'Active'),
(106, 4, 'Checking', 'ACC1006', 'BR004', '2020-06-05', 3200.00, 'Active'),
(107, 5, 'Savings', 'ACC1007', 'BR005', '2021-08-14', 8900.75, 'Active'),
(108, 6, 'Checking', 'ACC1008', 'BR006', '2019-09-01', 11500.00, 'Active'),
(109, 7, 'Checking', 'ACC1009', 'BR007', '2020-12-12', 22500.50, 'Active'),
(110, 7, 'Savings', 'ACC1010', 'BR007', '2020-12-12', 45000.00, 'Active'),
(111, 8, 'Checking', 'ACC1011', 'BR008', '2021-02-28', 5400.25, 'Active'),
(112, 9, 'Checking', 'ACC1012', 'BR009', '2018-07-19', 38750.00, 'Active'),
(113, 9, 'Savings', 'ACC1013', 'BR009', '2018-07-19', 125000.00, 'Active'),
(114, 10, 'Checking', 'ACC1014', 'BR010', '2020-09-23', 9200.00, 'Active'),
(115, 11, 'Checking', 'ACC1015', 'BR011', '2021-05-17', 4300.50, 'Active'),
(116, 12, 'Checking', 'ACC1016', 'BR012', '2020-04-08', 6750.00, 'Active'),
(117, 12, 'Savings', 'ACC1017', 'BR012', '2020-04-08', 18500.00, 'Active'),
(118, 13, 'Checking', 'ACC1018', 'BR013', '2018-11-15', 29500.00, 'Active'),
(119, 14, 'Savings', 'ACC1019', 'BR014', '2021-01-30', 5200.00, 'Active'),
(120, 15, 'Checking', 'ACC1020', 'BR015', '2019-06-22', 8800.75, 'Active'),
(121, 16, 'Checking', 'ACC1021', 'BR016', '2020-10-11', 6450.00, 'Active'),
(122, 17, 'Savings', 'ACC1022', 'BR017', '2021-07-04', 4100.25, 'Active'),
(123, 18, 'Checking', 'ACC1023', 'BR018', '2019-03-27', 15700.00, 'Active'),
(124, 19, 'Checking', 'ACC1024', 'BR019', '2020-08-30', 11300.50, 'Active'),
(125, 19, 'Savings', 'ACC1025', 'BR019', '2020-08-30', 27500.00, 'Active'),
(126, 20, 'Checking', 'ACC1026', 'BR020', '2021-04-15', 7200.00, 'Active'),
(127, 21, 'Checking', 'ACC1027', 'BR021', '2020-02-14', 9850.25, 'Active'),
(128, 22, 'Savings', 'ACC1028', 'BR022', '2021-09-08', 3400.00, 'Active'),
(129, 23, 'Checking', 'ACC1029', 'BR023', '2019-12-01', 18800.00, 'Active'),
(130, 24, 'Checking', 'ACC1030', 'BR024', '2020-11-20', 6940.50, 'Active'),
(131, 24, 'Savings', 'ACC1031', 'BR024', '2020-11-20', 22500.00, 'Active'),
(132, 25, 'Checking', 'ACC1032', 'BR025', '2021-06-25', 8250.00, 'Active');


CREATE TABLE transactions (
    transaction_id INT PRIMARY KEY,
    account_id INT,
    transaction_date DATE,
    transaction_type VARCHAR(20),
    amount DECIMAL(10,2),
    description VARCHAR(100),
    status VARCHAR(15),
    FOREIGN KEY (account_id) REFERENCES accounts(account_id)
);

INSERT INTO transactions VALUES
(1001, 101, '2024-01-05', 'Deposit', 1500.00, 'Salary deposit', 'Completed'),
(1002, 101, '2024-01-10', 'Withdrawal', 200.00, 'ATM withdrawal', 'Completed'),
(1003, 101, '2024-01-15', 'Transfer', 500.00, 'Transfer to savings', 'Completed'),
(1004, 102, '2024-01-16', 'Deposit', 1000.00, 'Transfer from checking', 'Completed'),
(1005, 103, '2024-01-07', 'Deposit', 2500.00, 'Freelance payment', 'Completed'),
(1006, 103, '2024-01-12', 'Withdrawal', 300.00, 'Online purchase', 'Pending'),
(1007, 104, '2024-01-03', 'Deposit', 3200.00, 'Salary deposit', 'Completed'),
(1008, 105, '2024-01-20', 'Deposit', 500.00, 'Interest payment', 'Completed'),
(1009, 106, '2024-01-08', 'Withdrawal', 150.00, 'Grocery shopping', 'Completed'),
(1010, 106, '2024-01-14', 'Deposit', 1800.00, 'Salary deposit', 'Completed'),
(1011, 107, '2024-01-02', 'Deposit', 3000.00, 'Bonus deposit', 'Completed'),
(1012, 108, '2024-01-11', 'Transfer', 750.00, 'Rent payment', 'Completed'),
(1013, 108, '2024-01-18', 'Withdrawal', 100.00, 'ATM withdrawal', 'Failed'),
(1014, 109, '2024-01-06', 'Deposit', 5000.00, 'Business revenue', 'Completed'),
(1015, 110, '2024-01-09', 'Deposit', 2000.00, 'Investment return', 'Completed'),
(1016, 111, '2024-01-13', 'Withdrawal', 400.00, 'Utility bills', 'Completed'),
(1017, 112, '2024-01-01', 'Deposit', 7500.00, 'Salary deposit', 'Completed'),
(1018, 113, '2024-01-17', 'Deposit', 10000.00, 'Stock sale', 'Completed'),
(1019, 114, '2024-01-04', 'Withdrawal', 250.00, 'Restaurant', 'Completed'),
(1020, 114, '2024-01-19', 'Deposit', 2200.00, 'Salary deposit', 'Completed'),
(1021, 115, '2024-01-10', 'Transfer', 600.00, 'Credit card payment', 'Completed'),
(1022, 115, '2024-01-15', 'Deposit', 1800.00, 'Salary deposit', 'Pending'),
(1023, 116, '2024-01-12', 'Withdrawal', 80.00, 'ATM withdrawal', 'Completed'),
(1024, 116, '2024-01-20', 'Deposit', 2400.00, 'Salary deposit', 'Completed'),
(1025, 117, '2024-01-14', 'Deposit', 800.00, 'Transfer from checking', 'Completed'),
(1026, 118, '2024-01-08', 'Withdrawal', 1200.00, 'Mortgage payment', 'Completed'),
(1027, 118, '2024-01-15', 'Deposit', 5800.00, 'Salary deposit', 'Completed'),
(1028, 119, '2024-01-03', 'Deposit', 300.00, 'Deposit', 'Completed'),
(1029, 120, '2024-01-09', 'Withdrawal', 450.00, 'Car insurance', 'Completed'),
(1030, 120, '2024-01-16', 'Deposit', 2100.00, 'Salary deposit', 'Completed'),
(1031, 121, '2024-01-07', 'Transfer', 900.00, 'Student loan', 'Completed'),
(1032, 122, '2024-01-11', 'Deposit', 150.00, 'Cash deposit', 'Completed'),
(1033, 123, '2024-01-13', 'Withdrawal', 600.00, 'Shopping', 'Pending'),
(1034, 123, '2024-01-18', 'Deposit', 3800.00, 'Salary deposit', 'Completed'),
(1035, 124, '2024-01-05', 'Deposit', 2500.00, 'Freelance work', 'Completed');

-- DUPLICATE ROWS for practice (3 duplicates as requested)
INSERT INTO transactions VALUES
(1036, 124, '2024-01-05', 'Deposit', 2500.00, 'Freelance work', 'Completed'), -- Duplicate of 1035
(1037, 115, '2024-01-10', 'Transfer', 600.00, 'Credit card payment', 'Completed'), -- Duplicate of 1021
(1038, 101, '2024-01-05', 'Deposit', 1500.00, 'Salary deposit', 'Completed'); -- Duplicate of 1001


CREATE TABLE loans (
    loan_id INT PRIMARY KEY,
    customer_id INT,
    account_id INT,
    loan_type VARCHAR(30),
    loan_amount DECIMAL(12,2),
    interest_rate DECIMAL(5,2),
    start_date DATE,
    end_date DATE,
    monthly_payment DECIMAL(10,2),
    remaining_balance DECIMAL(12,2),
    status VARCHAR(15),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (account_id) REFERENCES accounts(account_id)
);

INSERT INTO loans VALUES
(2001, 1, 101, 'Personal Loan', 15000.00, 8.50, '2023-01-10', '2025-01-10', 680.00, 5000.00, 'Active'),
(2002, 2, 103, 'Auto Loan', 25000.00, 5.99, '2022-06-15', '2026-06-15', 585.00, 12000.00, 'Active'),
(2003, 3, 104, 'Mortgage', 250000.00, 3.75, '2021-03-20', '2041-03-20', 1450.00, 210000.00, 'Active'),
(2004, 4, 106, 'Personal Loan', 5000.00, 9.99, '2023-08-01', '2024-08-01', 440.00, 1500.00, 'Active'),
(2005, 6, 108, 'Auto Loan', 18000.00, 6.50, '2022-11-05', '2025-11-05', 550.00, 8000.00, 'Active'),
(2006, 7, 109, 'Mortgage', 320000.00, 3.99, '2020-12-01', '2040-12-01', 1850.00, 280000.00, 'Active'),
(2007, 9, 112, 'Home Equity', 50000.00, 6.25, '2023-02-14', '2028-02-14', 975.00, 40000.00, 'Active'),
(2008, 12, 116, 'Personal Loan', 8000.00, 8.75, '2023-09-10', '2024-09-10', 700.00, 3000.00, 'Active'),
(2009, 13, 118, 'Business Loan', 100000.00, 7.50, '2022-04-18', '2027-04-18', 2000.00, 65000.00, 'Active'),
(2010, 15, 120, 'Auto Loan', 22000.00, 6.25, '2023-05-22', '2026-05-22', 670.00, 15000.00, 'Active'),
(2011, 18, 123, 'Mortgage', 280000.00, 4.25, '2021-07-30', '2041-07-30', 1650.00, 245000.00, 'Active'),
(2012, 19, 124, 'Personal Loan', 12000.00, 9.50, '2023-10-15', '2025-10-15', 550.00, 8500.00, 'Active'),
(2013, 21, 127, 'Home Equity', 35000.00, 7.00, '2023-03-08', '2027-03-08', 840.00, 28000.00, 'Active'),
(2014, 23, 129, 'Auto Loan', 30000.00, 5.50, '2022-08-25', '2026-08-25', 700.00, 18000.00, 'Active'),
(2015, 24, 130, 'Personal Loan', 7000.00, 10.25, '2023-11-12', '2024-11-12', 620.00, 4200.00, 'Active'),
(2016, 25, 132, 'Mortgage', 195000.00, 4.50, '2021-09-05', '2041-09-05', 1220.00, 170000.00, 'Active'),
(2017, 5, 107, 'Personal Loan', 3000.00, 11.99, '2023-12-01', '2024-06-01', 520.00, 1500.00, 'Active'),
(2018, 8, 111, 'Auto Loan', 15000.00, 7.25, '2023-01-20', '2025-01-20', 650.00, 7000.00, 'Active'),
(2019, 14, 119, 'Personal Loan', 4000.00, 9.00, '2023-10-30', '2024-10-30', 350.00, 2500.00, 'Active'),
(2020, 17, 122, 'Student Loan', 12000.00, 5.25, '2022-05-15', '2027-05-15', 225.00, 8000.00, 'Active');



CREATE TABLE credit_cards (
    card_id INT PRIMARY KEY,
    customer_id INT,
    card_number VARCHAR(20),
    card_type VARCHAR(20),
    credit_limit DECIMAL(10,2),
    current_balance DECIMAL(10,2),
    issue_date DATE,
    expiry_date DATE,
    payment_due_day INT,
    status VARCHAR(15),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

INSERT INTO credit_cards VALUES
(3001, 1, '4532-1234-5678-9012', 'Platinum', 15000.00, 2500.00, '2022-01-15', '2027-01-15', 15, 'Active'),
(3002, 2, '4916-2345-6789-0123', 'Gold', 10000.00, 1800.00, '2021-11-20', '2026-11-20', 20, 'Active'),
(3003, 3, '5123-3456-7890-1234', 'Signature', 25000.00, 5200.00, '2022-03-10', '2027-03-10', 10, 'Active'),
(3004, 4, '3456-4567-8901-2345', 'Silver', 5000.00, 1200.00, '2022-06-05', '2026-06-05', 25, 'Active'),
(3005, 5, '6011-5678-9012-3456', 'Platinum', 12000.00, 800.00, '2022-08-14', '2026-08-14', 5, 'Active'),
(3006, 6, '4539-6789-0123-4567', 'Gold', 8000.00, 3200.00, '2021-09-01', '2025-09-01', 18, 'Active'),
(3007, 7, '5188-7890-1234-5678', 'Signature', 30000.00, 8500.00, '2022-12-12', '2027-12-12', 12, 'Active'),
(3008, 8, '4024-8901-2345-6789', 'Silver', 4000.00, 500.00, '2022-02-28', '2026-02-28', 22, 'Active'),
(3009, 9, '5267-9012-3456-7890', 'Platinum', 20000.00, 4500.00, '2021-07-19', '2026-07-19', 8, 'Active'),
(3010, 10, '4556-0123-4567-8901', 'Gold', 9000.00, 2100.00, '2022-09-23', '2027-09-23', 14, 'Active'),
(3011, 11, '4929-1234-5678-9012', 'Silver', 4500.00, 950.00, '2022-05-17', '2026-05-17', 21, 'Active'),
(3012, 12, '5112-2345-6789-0123', 'Gold', 11000.00, 2800.00, '2022-04-08', '2027-04-08', 16, 'Active'),
(3013, 13, '6012-3456-7890-1234', 'Signature', 35000.00, 12000.00, '2021-11-15', '2026-11-15', 7, 'Active'),
(3014, 14, '4538-4567-8901-2345', 'Silver', 3500.00, 750.00, '2022-01-30', '2026-01-30', 28, 'Active'),
(3015, 15, '5259-5678-9012-3456', 'Gold', 7500.00, 1650.00, '2022-06-22', '2027-06-22', 19, 'Active'),
(3016, 16, '4465-6789-0123-4567', 'Platinum', 14000.00, 3800.00, '2022-10-11', '2027-10-11', 11, 'Active'),
(3017, 17, '5116-7890-1234-5678', 'Silver', 4000.00, 600.00, '2022-07-04', '2026-07-04', 24, 'Active'),
(3018, 18, '4533-8901-2345-6789', 'Gold', 10000.00, 4200.00, '2022-03-27', '2027-03-27', 13, 'Active'),
(3019, 19, '6014-9012-3456-7890', 'Signature', 28000.00, 9500.00, '2022-08-30', '2027-08-30', 9, 'Active'),
(3020, 20, '4958-0123-4567-8901', 'Silver', 5000.00, 1100.00, '2022-04-15', '2026-04-15', 26, 'Active');