use my_database; 
create table customers(
customer_id int primary key,
customer_name varchar(70) not null,
Email varchar(70),
Phone int
);
select * from customers;

create table accounts(
account_id int primary key,
customer_id int,
account_type varchar(70) not null,
balance int,
foreign key (Customer_id)
references customers(Customer_id)
);
select * from accounts;

create table transactions(
transaction_id int,
account_id int,
transaction_date date,
transaction_type varchar(70),
amount int not null,
foreign key (account_id)
references accounts(account_id)
);

alter table Customers add address varchar(70);
select * from Customers;
create table temporary_table (
temporary_id int
);
drop table temporary_table;
