create  database my_SQLs;
use my_SQLs;

CREATE TABLE Customer (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    phone_number bigint
);
CREATE TABLE Invoices (
    invoice_id INT PRIMARY KEY,
    customer_id INT,
    invoice_amount int,
    due_date date,
    FOREIGN KEY (customer_id) references customer(customer_id));

CREATE TABLE Payments (
    payment_id INT PRIMARY KEY,
    invoice_id INT,
    payment_amount DECIMAL(10,2),
	FOREIGN KEY (invoice_id) references Invoices(invoice_id));

INSERT INTO Customer (customer_id, customer_name, phone_number) VALUES
(1, 'Rahul Sharma', 9876543210),
(2, 'Ananya Rao', 9876543211),
(3, 'Vivek Kumar', 9876543212),
(4, 'Sneha Shetty', 9876543213),
(5, 'Arjun Naik', 9876543214);

SELECT * FROM Customer;


INSERT INTO Invoices (invoice_id, customer_id, invoice_amount, due_date) VALUES
(101, 1, 5000, '2026-09-25'),
(102, 2, 7500, '2026-09-27'),
(103, 3, 3200, '2026-09-30'),
(104, 4, 9000, '2026-10-02'),
(105, 5, 4500, '2026-10-05');

SELECT * FROM Invoices;


INSERT INTO Payments (payment_id, invoice_id, payment_amount) VALUES
(201, 101, 5000.00),
(202, 102, 4000.00),
(203, 103, 3200.00),
(204, 104, 6000.00),
(205, 105, 4500.00);

SELECT * FROM Payments;

create view customer_balances as 
select c.customer_name,
	   i.invoice_amount,
       p.payment_amount,
       i.invoice_amount - p.payment_amount as balance 
from Customer c
join Invoices i on c.customer_id=i.customer_id
join Payments p on i.invoice_id = p.invoice_id;

select * from customer_balances;


create view customer_overdue as 
select c.customer_name,
       i.invoice_amount - p.payment_amount as overdue 
from Customer c
join Invoices i on c.customer_id=i.customer_id
join Payments p on i.invoice_id = p.invoice_id
where invoice_amount> payment_amount;

select * from customer_overdue;

CREATE VIEW customer_overdue_balancess AS
SELECT 
    c.customer_name,
    i.invoice_amount,
    p.payment_amount,
    i.invoice_amount - p.payment_amount AS balance,
    DATEDIFF(CURDATE(), i.due_date) AS days_overdue
FROM Customer c
JOIN Invoices i 
    ON c.customer_id = i.customer_id
JOIN Payments p 
    ON i.invoice_id = p.invoice_id;
    
select * from customer_overdue_balancess;


select customer_id,customer_name from Customer;

create view customer_restrict as
select c.customer_name,
		i.invoice_amount,
        p.payment_amount,
        i.invoice_amount-p.payment_amount as balance
from Customer c 
join Invoices i on c.customer_id= i.customer_id 
join Payments p on i.invoice_id=p.invoice_id
where i.invoice_amount-p.payment_amount>0;

select * from customer_restrict;