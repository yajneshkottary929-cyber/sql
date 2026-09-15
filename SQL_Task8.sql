use my_database;
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    email VARCHAR(100),
    city VARCHAR(50)
);
INSERT INTO customers (customer_id, customer_name, email, city)
VALUES
(1, 'Rahul', 'rahul@gmail.com', 'Mangalore'),
(2, 'Priya', 'priya@gmail.com', 'Mysore'),
(3, 'Arjun', 'arjun@gmail.com', 'Bangalore'),
(4, 'Sneha', 'sneha@gmail.com', 'Udupi'),
(5, 'Kiran', 'kiran@gmail.com', 'Hubli');
SELECT * FROM customers;


CREATE TABLE transactions (
    transaction_id INT PRIMARY KEY,
    customer_id INT,
    amount DECIMAL(10,2),
    transaction_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

INSERT INTO transactions
(transaction_id, customer_id, amount, transaction_date)
VALUES
(1, 101, 5000.00, '2026-09-01'),
(2, 102, 7500.50, '2026-09-02'),
(3, 103, 2500.00, '2026-09-03'),
(4, 104, 10000.00, '2026-09-04'),
(5, 105, 3500.75, '2026-09-05');

SELECT * FROM transactions;


CREATE TABLE invoices (
    invoice_id INT PRIMARY KEY,
    customer_id INT,
    invoice_amount DECIMAL(10,2),
    invoice_date DATE,
    due_date DATE,
    payment_status VARCHAR(20),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);


INSERT INTO invoices
(invoice_id, customer_id, invoice_amount, invoice_date, due_date, payment_status)
VALUES
(1, 101, 5000.00, '2026-09-01', '2026-09-15', 'Paid'),
(2, 102, 7500.50, '2026-09-02', '2026-09-16', 'Pending'),
(3, 103, 2500.00, '2026-09-03', '2026-09-17', 'Paid'),
(4, 104, 10000.00, '2026-09-04', '2026-09-18', 'Pending'),
(5, 105, 3500.75, '2026-09-05', '2026-09-19', 'Paid');
SELECT * FROM invoices;
 

SELECT customer_name FROM customers WHERE customer_id IN(
    SELECT customer_id FROM invoices WHERE payment_status="unpaid"
);

SELECT customer_name FROM customers WHERE customer_id IN(
    SELECT customer_id FROM transactions WHERE amount>4500
);

SELECT customer_name FROM customers WHERE customer_id IN(
    SELECT customer_id FROM transactions WHERE amount =(
        SELECT MAX(amount) FROM transactions
    )
);

select customer_id from transactions where amount =(
select avg(amount) from transactions);

select customer_name from customers where city="Mangalore" and customer_id in (
select customer_id from transactions);


select c.customer_name from customers c
where exists(
select 1 
from invoices i
where i.customer_id=c.customer_id and i.payment_status="unpaid");

select c.customer_name from customers c 
where exists( select 1 from transactions t where t.customer_id=c.customer_id and t.amount>4500);

select c.customer_name from customers c
where exists(
select 1 from transactions t1 where t1.customer_id = c.customer_id and t1.amount=(select max(amount)
from transactions));

select t1.transaction_id,t1.customer_id,t1.amount
from transactions t1
where t1.amount=(select avg(t2.amount) from transactions t2 where t2.customer_id=t1.customer_id);

select c.customer_name from customers c
where c.city ="Manalore" and exists( select 1 from transactions t where t.customer_id = c.customer_id );

