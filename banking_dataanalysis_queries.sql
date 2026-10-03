use banking_dataanalysis;
show tables;
select * from accounts;
select * from customers;
select * from loans;
select * from transactions;
select * from credit_cards;

-- RECOMMENDED BUSINESS QUESTIONS

-- (A) CUSTOMER ANALYSIS
-- 1.How many customers does the bank have?
select count(*) as "total no. of customers"
from customers;

-- 2.Which states have the most customers?
select state,count(state) as "count_of_customers" from customers
group by state
order by count_of_customers desc
limit 1;

-- 3.What is the average customer income?
select avg(income) as "avg_income" 
from customers;

-- 4.Who are the top 10 highest-income customers?
select first_name,
last_name,income,
row_number() over() as "row number"
from customers
order by income desc
limit 10;

-- 5.What is the age distribution of customers?
select first_name,
last_name,current_date() as "today's_date",
date_of_birth,
TIMESTAMPDIFF(YEAR, date_of_birth, current_date) as age     
from customers;


-- (B) ACCOUNTS ANALYSIS
-- 6.How many checking vs savings accounts exist?
select account_type,count(*) as "total_counts"
from accounts
group by account_type;

-- 7.Which customers have multiple accounts?
select ac.customer_id,
cu.first_name,
cu.last_name,
count(ac.account_number) as "total_counts"
from accounts as ac
join customers as cu 
on ac.customer_id = cu.customer_id
group by ac.customer_id,cu.first_name,cu.last_name
having count(ac.account_number) <> 1;


-- 8.What is the total balance held by the bank?
select sum(current_balance) as "total_bank_balance"
from accounts;


-- 9. Which accounts have the highest balances?
select account_type ,
sum(current_balance) as "total_account_type"
from accounts
group by account_type 
order by sum(current_balance)
limit 1;



-- 10.Which branch manages the most money?
select branch_code,sum(current_balance) as "total per branch"
from accounts
group by branch_code
order by sum(current_balance) desc
limit 1;


-- (C) TRANSACTION ANALYSIS
-- 11.Total transaction volume by type.
select transaction_type,
sum(amount) as "total_per_type"
from transactions
group by transaction_type
order by sum(amount) desc;

-- 12.Average transaction amount by type
select transaction_type,
avg(amount) as "avg_per_type"
from transactions
group by transaction_type
order by avg(amount) desc;


-- 13.Which customers perform the most transactions?
select cu.customer_id,
cu.first_name,
cu.last_name,
count(tr.transaction_id) as "number_of_transactions"
from customers as cu
join accounts as ac
on ac.customer_id = cu.customer_id
join transactions as tr
on tr.account_id = ac.account_id
group by cu.customer_id,cu.first_name,cu.last_name
order by count(tr.transaction_id) desc;


-- 14.What percentage of transactions are pending or failed?
select round(
sum(case
       when status in("pending","failed")
       then 1 
       else 0
       end
       )*100/count(*),2) as "percentage_pending_failed"
from transactions;



-- 15.Detect duplicate transactions.
select transaction_id,
account_id,
transaction_date,
transaction_type,
amount,
description,
status
from transactions
group by
transaction_id,
account_id,
transaction_date,
transaction_type,
amount,
description,
status
having count(*)>1;


select *
from transactions
where (
transaction_id,
account_id,
transaction_date,
transaction_type,
amount,
description,
status
)
  in 
  (
  select 
transaction_id,
account_id,
transaction_date,
transaction_type,
amount,
description,
status
  from transactions
group by
transaction_id,
account_id,
transaction_date,
transaction_type,
amount,
description,
status

having count(*)>1
);


-- (D)LOAN ANALYSIS
-- 16.Total loan portfolio value

select sum(loan_amount) as "total_loan_portifolio"
from loans;


-- 17.Which loan type is most common?
select loan_type,count(loan_type) as "common_loan_type"
from loans
group by loan_type
order by count(loan_type) desc
limit 1;


-- 18.Which customers have the highest remaining loan balances?
select cu.customer_id,
cu.first_name,
cu.last_name,sum(remaining_balance) as "remaining_balance"
from customers as cu
join loans as lo
   on cu.customer_id = lo.customer_id
group by cu.customer_id,
cu.first_name,
cu.last_name
order by sum(remaining_balance) desc
limit 5;


-- 19.Average interest rate by loan type.
select loan_type,avg(interest_rate)
from loans
group by loan_type;


-- 20.Which customers have both loans and high account balances?
select cu.first_name,
cu.last_name,
lo.loan_amount,
lo.remaining_balance
from customers as cu
join loans as lo
  on
lo.customer_id = cu.customer_id
order by remaining_balance desc;

-- (E).CREADIT_CARDS ANALYSIS
-- 21.Total credit issued by the bank.
select count(card_type) as "no_of_card_issued"
from credit_cards;

select
sum(
case when card_type<>""
   then 1
   else 0
   end) as "total_cards"
   from credit_cards;   

-- 22.Customers with the highest credit utilization.

select cu.customer_id,
cu.first_name,
cu.last_name,
cc.credit_limit
from credit_cards as cc
join customers as cu
   on
cu.customer_id = cc.customer_id
order by cc.credit_limit desc
limit 2;


-- 23.Average credit limit by card type.
select card_type,avg(credit_limit)
from credit_cards
group by card_type;


-- 24.Which card type generates the highest balances?
select card_type,
sum(current_balance) "total_per_cardtype"
from credit_cards
group by card_type
order by sum(current_balance) desc;


-- (F).ADVANCED BUSINESS ANALYSIS
-- 25.Customer Lifetime Value (Income + Deposits - Loan Balance)
select cu.customer_id,
cu.first_name,
cu.last_name,
(cu.income +
   coalesce(sum( 
   case when tr.transaction_type = "deposit"
       then tr.amount
   else 0
    end),0)- coalesce(sum(ln.remaining_balance), 0)
   ) as "customer_lifetime_value"
from customers as cu
join loans as ln
   on ln.customer_id = cu.customer_id
join transactions as tr 
   on tr.account_id = ln.account_id
group by
cu.customer_id,
cu.first_name,
cu.last_name
;

-- 26.Rank customers by total assets.
-- common defination total asset = account balance+credit card limit utilization )
-- deposit(account balances) - loan remaining balace
select cu.customer_id,
cu.first_name,
cu.last_name,
(
SUM(ac.current_balance)-SUM(ln.remaining_balance)
) as "total_asset",
rank() over(order by  SUM(ac.current_balance)-SUM(ln.remaining_balance) desc) as "asset_rank"
from customers as cu
join accounts as ac
      on ac.customer_id = cu.customer_id
join loans as ln
      on ln.account_id = ac.account_id
group by
cu.customer_id,
cu.first_name,
cu.last_name; 


-- OR

SELECT
c.customer_id,
c.first_name,
c.last_name,
sum(a.current_balance) AS total_assets,
RANK() OVER(ORDER BY SUM(a.current_balance) DESC) AS asset_rank
FROM customers c
JOIN accounts a
    ON c.customer_id = a.customer_id
GROUP BY
c.customer_id,
c.first_name,
c.last_name;

-- 27.Identify high-value customers.(a customer with higher account balance)
select cu.customer_id,
cu.first_name,
cu.last_name,
sum(ac.current_balance) as "current_bal"
from customers as cu
join accounts as ac
     on ac.customer_id = cu.customer_id
group by
cu.customer_id,
cu.first_name,
cu.last_name
order by sum(ac.current_balance) desc
limit 10
;

-- 28.Segment customers into:
-- (i) Premium
-- (ii) Standard
-- (iii) Basic:

select cu.customer_id,
cu.first_name,
cu.last_name,
case 
   when ac.current_balance >=50000 then "premium"
   when ac.current_balance >=25000 then "medium"
   else "basic"
end as "customer_segment"
from customers as cu
join accounts as ac
  on ac.customer_id = cu.customer_id
;


-- 29.Find customers at potential credit risk.
select cu.customer_id,
cu.first_name,
cu.last_name,
cu.income,
coalesce(sum(ac.current_balance),0) as "current_balance",
coalesce(sum(ln.remaining_balance),0) as "current_loan_balance",
  case
       when coalesce(sum(ln.remaining_balance),0) > cu.income then "high risk"
       when coalesce(sum(ln.remaining_balance),0)> coalesce(sum(ac.current_balance),0)
       then "median risk"
       else "low risk"
       end as "credit_risk"
from customers as cu
join accounts as ac
    on ac.customer_id = cu.customer_id
join loans as ln
    on ln.account_id = ac.account_id
    
group by
cu.customer_id,
cu.first_name,
cu.last_name,
cu.income
;

-- 30.Build a complete customer financial profile using all five tables.
select
    c.customer_id,
    concat(c.first_name, ' ', c.last_name) as customer_name,
    c.city,
    c.income,
    count(distinct a.account_id) as total_accounts,
    coalesce(sum(distinct a.current_balance),0) as total_account_balance,
    count(distinct t.transaction_id) as total_transactions,
    coalesce(sum(distinct l.loan_amount),0) as total_loan_amount,
    coalesce(sum(distinct l.remaining_balance),0) as remaining_loan_balance,
    count(distinct cc.card_id) AS total_credit_cards,
    coalesce(SUM(distinct cc.credit_limit),0) AS total_credit_limit,
    case
        when coalesce(sum(distinct a.current_balance),0) >= 50000 then 'Premium'
        when coalesce(sum(distinct a.current_balance),0) >= 15000 then 'Standard'
        else 'Basic'
    end as customer_segment
from customers c
join accounts a
    on c.customer_id = a.customer_id
join transactions t
    on a.account_id = t.account_id
join loans l
    on c.customer_id = l.customer_id
join credit_cards cc
    on c.customer_id = cc.customer_id
group by
c.customer_id,
c.first_name,
c.last_name,
c.city,
c.income
order by total_account_balance desc;