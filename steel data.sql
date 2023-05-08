# 1. What are the names of all the customers who live in New York?
select concat(firstname , ' ' , lastname) as full_name
from customers
where city = 'New York' ;


# 2. What is the total number of accounts in the Accounts table?
select AccountType, count(accounttype)
from accounts 
group by AccountType ;


# 3. What is the total balance of all checking accounts?
select AccountType , sum(Balance) 
from accounts
where AccountType = 'Checking'
group by 1 ;


# 4. What is the total balance of all accounts associated with customers who live in Los Angeles?
select concat(firstname , ' ' , lastname) as full_name, c.city, sum(Balance)
from accounts as a
join customers as c
on a.CustomerID = c.CustomerID
where c.City = 'Los Angeles'
group by 1,2 ;


# 5. Which branch has the highest average account balance?
select b.BranchName, avg(a.Balance) as average
from accounts as a
join branches as b
on a.BranchID = b.BranchID
group by 1
order by average desc limit 1;


# 6. Which customer has the highest current balance in their accounts?
select concat(firstname, ' ' , lastname) as full_name , sum(Balance) as total_balance
from accounts as a
join customers as c 
on a.CustomerID = c.CustomerID
group by full_name
order by total_balance desc limit 1;


# 7. Which customer has made the most transactions in the Transactions table?
select concat(firstname, ' ' , lastname) as full_name, count(*) as total_transactions
from transactions as t
join accounts as a
on a.accountid = t.AccountID
join customers as c
on a.CustomerID = c.CustomerID
group by full_name ;


# 8.Which branch has the highest total balance across all of its accounts?
select b.BranchName, sum(Balance) as total
from accounts as a
join branches as b
on a.BranchID = b.BranchID
group by b.BranchName 
order by 2 desc limit 1 ;


# 8.Showing each branch's total balance across each of its accounts?
select b.BranchName,a.AccountType, sum(Balance) as total
from accounts as a
join branches as b
on a.BranchID = b.BranchID
group by b.BranchName , a.AccountType
order by BranchName ;


# 9. Shows customer's total balance across each of their accounts, including savings and checking accounts?
select concat(firstname, ' ', lastname) as full_name, a.AccountType ,sum(Balance)
from accounts as a
join customers as c
on a.CustomerID = c.CustomerID
group by 1,2 ;


# 9. Which customer has the highest total balance across all of their accounts, including savings and checking accounts?
select concat(firstname, ' ', lastname) as full_name ,sum(Balance) as total
from accounts as a
join customers as c
on a.CustomerID = c.CustomerID
group by 1
order by total desc limit 1 ;


# 10. Which branch has the highest number of transactions in the Transactions table?
select b.BranchName ,count(*) as total_transactions
from transactions as t
join accounts as a
on a.accountid = t.AccountID
join branches as b
on a.BranchID = b.BranchID
group by 1 
order by 2 desc ;

