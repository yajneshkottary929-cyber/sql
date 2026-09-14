use my_database;
CREATE TABLE journal_entrie(
    entry_id INT PRIMARY KEY,
    entry_date DATE,
    account_name VARCHAR(255),
    description VARCHAR(255),
    debit DECIMAL(10, 2),
    credit DECIMAL(10, 2)
);
INSERT INTO journal_entrie
(entry_id, entry_date, account_name, description, debit, credit)
VALUES
(1, '2026-09-01', 'Cash', 'Cash received from sales', 5000.00, 0.00),
(2, '2026-09-02', 'Sales', 'Goods sold for cash', 0.00, 5000.00),
(3, '2026-09-03', 'Purchases', 'Goods purchased for cash', 3000.00, 0.00),
(4, '2026-09-04', 'Cash', 'Cash paid for purchases', 0.00, 3000.00),
(5, '2026-09-05', 'Rent Expense', 'Monthly office rent paid', 2000.00, 0.00),
(6, '2026-09-06', 'Cash', 'Cash paid for office rent', 0.00, 2000.00),
(7, '2026-09-07', 'Salary Expense', 'Salary paid to employees', 4000.00, 0.00),
(8, '2026-09-08', 'Cash', 'Cash paid as salary', 0.00, 4000.00),
(9, '2026-09-09', 'Electricity Expense', 'Electricity bill paid', 1500.00, 0.00),
(10, '2026-09-10', 'Cash', 'Cash paid for electricity bill', 0.00, 1500.00); 

select * from journal_entrie;

select  
	sum(debit) as Total_debit,
    sum(credit) as Total_debit
from journal_entrie;
select
	avg(debit) as debit_average,
    avg(credit) as credit_average
from journal_entrie;
select 
	count(*) as total 
from journal_entrie;
select
	min(debit) as minimum_debit,
    min(credit) as minimum_credit
from journal_entrie;
select
	max(debit) as max_debit,
    max(credit) as max_credit
from journal_entrie;
select account_name,
		count(*) as Total
from journal_entrie
group by account_name;

select * from journal_entrie;

select account_name,
        avg(debit) as debit_average,
        avg(credit) as credit_average
from journal_entrie
group by account_name;

select description,
		sum(debit) as total_debit,
        sum(credit) as total_credit
from journal_entrie
group by description
having sum(debit)>20000;

select description,
		count(*) as total
from journal_entrie
group by description
having sum(credit)<20000;


select 
		case
        when sum(debit) > sum(credit)
        then sum(debit) - sum(credit)
        else 0
end as debit_balance,
		case 
        when sum(credit) > sum(debit)
        then sum(credit) - sum(debit)
        else 0
end as credit_balance
from journal_entrie 
group by account_name;

