/*SQL ANALYSIS OF CREDIT CARD-BANKCHURNERS PROJECT*/ 
create database bank_customers;

select * from bank_customers;
describe bank_customers;
alter table bank_customers change ï»¿CLIENTNUM Client_id int;
UPDATE bank_customers
SET total_amt_chng_Q4_Q1 = concat(cast((total_amt_chng_Q4_Q1 * 100) as char ),'%');

/*TOTAL CUSTOMERS BY DIFFERENT CATEGORIES*/ 
select count(client_id) as customers from bank_customers;
select Card_Category,count(client_id) as customers_by_card from bank_customers
group by Card_Category;
select gender,count(client_id) as customers_by_gender from bank_customers
group by Gender;
select marital_status,count(client_id) as customers_by_marital_status from bank_customers
group by Marital_Status;
select Education_level,count(client_id) as customers_by_eduction from bank_customers
group by Education_Level;
select Income_Category,count(client_id) as customers_by_income from bank_customers
group by Income_Category;
select Customer_Age,count(client_id) as customers_by_age from bank_customers
group by Customer_Age
order by Customer_Age asc;
select Card_category,gender,Customer_Age,Education_Level,count(client_id) as customer_count from bank_customers
group by Card_Category,Gender,Customer_Age,Income_Category,Education_Level;

/*COUNT OF CLIENTS BY Attrition Flag AND CATEGORIES*/
select count(client_id),attrition_flag from bank_customers
group by Attrition_Flag;
select count(client_id),attrition_flag,gender from bank_customers
group by Attrition_Flag,gender;
select count(client_id),attrition_flag,Card_Category from bank_customers
group by Attrition_Flag,Card_Category
order by Card_Category asc;
select count(client_id),attrition_flag,Education_Level from bank_customers
group by Attrition_Flag,education_level
order by Education_Level asc;
select count(client_id),attrition_flag,Income_Category from bank_customers
group by Attrition_Flag,Income_Category
order by Income_Category asc;
select count(client_id),attrition_flag,Customer_Age from bank_customers
group by Attrition_Flag,Customer_Age
order by Customer_Age asc;
select Attrition_Flag,card_category,education_level,income_category,Customer_Age,
count(Client_id)as customers_count from bank_customers
group by Attrition_Flag,Card_Category,Education_Level,Income_Category,Customer_Age
order by Attrition_Flag asc;

/*1)TOTAL CREDIT LIMIT,TRANSACTION AMOUNT AND REVLOVING BALANCE*/
select 
sum(credit_limit) as total_credit_limit,
sum(Total_Trans_Amt) as total_transactions,
sum(Total_Revolving_Bal) as total_revolving_balance
from bank_customers;

/*2)CUSTOMER WITH HIGH CREDIT LIMIT*/
select client_id,
Credit_Limit from bank_customers
order by Credit_Limit desc
limit 1;
/*CUSTOMER WITH HIGH REVOLVING BALANCE*/ 
select Client_id,
Total_Revolving_Bal from bank_customers
order by Total_Revolving_Bal desc
limit 1;

/*3)TOTAL CREDIT,TRANSACTION AMOUNT AND REVOVING BALANCE BY ATTRITION FLAG*/
select attrition_flag,
sum(credit_limit) as total_credit,
sum(Total_Trans_Amt) as total_transactions,
sum(Total_Revolving_Bal) as total_revolving_balance 
from bank_customers
group by Attrition_Flag
order by sum(Credit_Limit) desc;

/*4)TOTAL CREDIT,TRANACTION AMOUNT AND REVOLVING BALANCE BY ALL CATEGORIES*/
select Card_Category,Education_Level,Income_Category,Marital_Status,
sum(credit_limit) as total_credit_limit,
sum(Total_Trans_Amt) as total_transactions,
sum(Total_revolving_bal) as total_revolving_balance 
from bank_customers 
group by card_category,Education_Level,Income_Category,Marital_Status
order by Card_Category desc;

/*TOTAL TRANSACTION COUNT BY CATEGORIES*/
select Card_Category,Education_Level,Income_Category,Marital_Status,
sum(Total_Trans_Ct) as total_transaction_count
from bank_customers
group by Card_Category,Education_Level,Income_Category,Marital_Status
order by Card_Category desc;

/*TOTAL TRANSACTION AMOUNT AND TRANSACTION COUNT CHANGE Q4 OVER Q1*/
select avg(Total_amt_chng_Q4_Q1) as Total_amount_change_Q4_Q1
from bank_customers;
select 
avg(total_ct_chng_Q4_Q1) as Total_transaction_count_change_Q4_Q1
from bank_customers;

/*TOTAL CREDIT LIMIT,TRANSACTION AMOUNT,OPEN TO BUY,UTILIZATION RATIO*/
select Card_Category,
sum(credit_limit) as total_credit_limit,
sum(total_trans_amt) as total_transaction_amount,
sum(avg_open_to_buy) as average_open_to_buy,
sum(avg_utilization_ratio) as average_utilization_ratio
from bank_customers
group by Card_Category;

/*CLIENTS RELATIONSHIP*/
select Card_Category,
sum(months_on_book) as month_on_book, 
sum(total_relationship_count) as total_relationship_count,
sum(Months_Inactive_12_mon) as months_inactive, 
sum(contacts_count_12_mon) as contacts_count
from bank_customers
group by Card_Category;











  
  
  
  
  
