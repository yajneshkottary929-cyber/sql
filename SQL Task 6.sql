use my_database;
CREATE TABLE Customers (
    Customer_ID INT PRIMARY KEY,
    Customer_Name VARCHAR(50),
    City VARCHAR(50)
);

INSERT INTO Customers (Customer_ID, Customer_Name, City)
VALUES
(1, 'Rahul Kumar', 'Mangalore'),
(2, 'Ananya Shetty', 'Bangalore'),
(3, 'Arjun Rao', 'Mysore'),
(4, 'Sneha Pai', 'Udupi'),
(5, 'Vishal Bhat', 'Mumbai');
select * from Customers;

CREATE TABLE Orders (
    Order_ID INT PRIMARY KEY,
    Customer_ID INT,
    Order_Date DATE,
    Order_Amount DECIMAL(10,2),
    FOREIGN KEY (Customer_ID) REFERENCES Customers(Customer_ID)
);

INSERT INTO Orders
(Order_ID, Customer_ID, Order_Date, Order_Amount)
VALUES
(1, 1, '2026-09-01', 1500.00),
(2, 2, '2026-09-02', 2500.00),
(3, 3, '2026-09-03', 3200.00),
(4, 4, '2026-09-04', 1800.00),
(5, 5, '2026-09-05', 4500.00);
select * from Orders;

CREATE TABLE Invoices (
    Invoice_ID INT PRIMARY KEY,
    Order_ID INT,
    Invoice_Date DATE,
    Invoice_Amount DECIMAL(10,2),
    FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID)
);

INSERT INTO Invoices
(Invoice_ID, Order_ID, Invoice_Date, Invoice_Amount)
VALUES
(1, 1, '2026-09-01', 1500.00),
(2, 2, '2026-09-02', 2500.00),
(3, 3, '2026-09-03', 3200.00),
(4, 4, '2026-09-04', 1800.00),
(5, 5, '2026-09-05', 4500.00);
select * from Invoices;

CREATE TABLE Payments (
    Payment_ID INT PRIMARY KEY,
    Invoice_ID INT,
    Payment_Date DATE,
    Payment_Amount DECIMAL(10,2),
    FOREIGN KEY (Invoice_ID) REFERENCES Invoices(Invoice_ID)
);

INSERT INTO Payments
(Payment_ID, Invoice_ID, Payment_Date, Payment_Amount)
VALUES
(1, 1, '2026-09-02', 1500.00),
(2, 2, '2026-09-03', 2500.00),
(3, 3, '2026-09-04', 3200.00),
(4, 4, '2026-09-05', 1800.00),
(5, 5, '2026-09-06', 4500.00);
select * from Payments;


CREATE TABLE Ledger (
    Ledger_ID INT PRIMARY KEY,
    Customer_ID INT,
    Transaction_Date DATE,
    Debit DECIMAL(10,2),
    Credit DECIMAL(10,2),
    Description VARCHAR(100),
    FOREIGN KEY (Customer_ID) REFERENCES Customers(Customer_ID)
);

INSERT INTO Ledger
(Ledger_ID, Customer_ID, Transaction_Date, Debit, Credit, Description)
VALUES
(1, 1, '2026-09-01', 5000.00, 0.00, 'Cash withdrawal'),
(2, 2, '2026-09-02', 0.00, 7500.00, 'Salary credited'),
(3, 3, '2026-09-03', 2500.00, 0.00, 'Bill payment'),
(4, 4, '2026-09-04', 0.00, 10000.00, 'Money deposited'),
(5, 5, '2026-09-05', 1500.00, 0.00, 'Online purchase');
select * from Ledger;
