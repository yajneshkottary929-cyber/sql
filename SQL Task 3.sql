use my_database;
create table Students(
student_id int primary key,
name varchar(50),
course varchar(50),
age int,
marks int,
city varchar(50)
);
select * from Students;

update Students
set course="BCOM (AI)"
where student_id=1;
select * from Students;

update Students
set course="B.COM (ERP)"
where student_id=2;
select * from Students;

update Students
set age=18
where student_id=5;
select * from Students;

update Students
set course=67
where student_id=3;
select * from Students;

update Students
set city="mangalore"
where student_id=4;
select * from Students;

update Students
set city="bangalore"
where student_id=5;
select * from Students;


delete from Students
where student_id=1;
delete from Students
where student_id=2;
delete from Students
where student_id=3;
delete from Students
where student_id=4;
delete from Students
where student_id=5;
select * from Students;