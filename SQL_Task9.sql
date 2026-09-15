use my_database;
CREATE TABLE Employe (
    Employee_ID INT PRIMARY KEY,
    Employee_Name VARCHAR(50),
    Department VARCHAR(50),
    Salary INT,
    City VARCHAR(50)
);

INSERT INTO Employe
(Employee_ID, Employee_Name, Department, Salary, City)
VALUES
(1, 'Rahul', 'IT', 30000, 'Mangalore'),
(2, 'Priya', 'HR', 35000, 'Bangalore'),
(3, 'Arjun', 'Finance', 40000, 'Mysore'),
(4, 'Sneha', 'Sales', 32000, 'Udupi'),
(5, 'Kiran', 'Marketing', 38000, 'Mumbai');
SELECT * FROM Employe;

select*from Employe where Salary >
(select avg(Salary) from Employe);

select*from Employe where Salary =
(select max(Salary) from Employe);

select*from Employe where Salary <
(select max(Salary) from Employe);

select*from Employe where Salary =
(select Salary from Employe where Employee_Name='Akhil');

select*from Employe where Department =
(select Department from Employe where Employee_Name='pooja');

select*from Employe where Salary >
(select Salary from Employe where Department='HR');

select*from Employe where Department in
(select Department from Employe where Salary>70000);