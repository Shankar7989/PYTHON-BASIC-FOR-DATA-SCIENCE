

use tm_new_db; 

create table student(
id int primary key,
name varchar(20),
age int
);

show tables;
select * from student; 

insert into student values(1,'Andrew',29);

select * from student;
insert into student values(2,'Bruno',32);
insert into student(id, name, age)
values
(3,'Charlie',47),
(4,'Dane',22),
(5,'Ethan',33);

select * from student;
select name from student;

select name from student where age=47; 
select name from student where id=5;

create table data(
roll_no int primary key, 
name varchar(20),
marks int,
grade varchar(1),
city varchar(20)
);

insert into data (roll_no, name, marks, grade, city)
values
(1,'Anthony',78,'C','Pune'),
(2,'Bhumika',93,'A','Mumbai'),
(3,'Chetan',85,'B','Mumbai'),
(4,'Dhruv',96,'A','Delhi'),
(5,'Ethan',33,'F','Delhi'),
(6,'Zoya',82,'B','Pune');

select * from data;
select city from data;
select distinct city from data;   
select name from data where marks>80; #names of students who are securing more than 80 marks 
select name from data where city='Mumbai'; #names of students who are living in Mumbai 
#logical operators - OR, AND, NOT operators
select name from data where marks>80 and city='Delhi';
select name from data where marks>90 or city='Mumbai';
select name from data where city not in ('Mumbai','Delhi');
select name from data where city in ('Mumbai','Delhi');
select * from data where city in ('Mumbai','Delhi');
select name from data where marks between 80 and 90;

select * from data where marks>75 limit 3;

select * from data order by city asc; #order in ascending order 
select * from data order by marks asc;
select * from data order by marks desc; #descending order 
select name from data order by marks desc limit 3;  #names of top 3 students who have secured the highest marks 
 
#Aggregate functions - count(), max(), min(), sum(), avg()
select * from data;
select max(marks) from data;
select min(marks) from data;
select avg(marks) from data;
select sum(marks) from data;
select count(roll_no) from data;

select city, count(name) from data group by city;
select city, avg(marks) from data group by city order by avg(marks);
select city, avg(marks) from data group by city order by avg(marks) desc;

select grade, count(roll_no) from data group by grade order by grade;

#where clause is used on top of rows
#having clause is used on top of groups

select count(name), city from data group by city having max(marks)>85;
select city from data where grade='A' group by city having max(marks)>90;

#alter table - to modify the existing schema of the table 
select * from data;

alter table data add column age int;
alter table data drop column age;
alter table data change marks score int;
alter table data rename to info;
select * from info;

set sql_safe_updates=0;

update info set grade='O' where grade='A';
update info set score=66 where roll_no=5;
update info set grade='D' where roll_no=5;

show tables;
select * from info;

create table course(
id int primary key,
course varchar(20)
);

insert into course(id,course)
values
(100, 'English'),
(101,'Maths'),
(102,'Science'),
(103,'Computers'),
(104,'Physics'),
(105,'Chemistry');

select * from course;

create table student_data(
student_id int primary key,
name varchar(20)
);

insert into student_data(student_id,name)
values
(101, 'Adam'),
(102,'Catherine'),
(103,'Charlie');

select * from student_data;

#Inner Join 
select * from course inner join student_data on course.id=student_data.student_id;

#Left Join
select * from course left join student_data on course.id=student_data.student_id;

#Right Join
select * from course right join student_data on course.id=student_data.student_id;

#Full Join
select * from course left join student_data on course.id=student_data.student_id union
select * from course right join student_data on course.id=student_data.student_id;

#Left Exclusive Join
select * from course left join student_data on course.id=student_data.student_id where student_data.student_id is null;

#Right Exclusive Join
select * from course right join student_data on course.id=student_data.student_id where course.id is null;

#Sub Queries
select * from info;
#Get the names of all students who scored more than the class average
	#Find the class average
    #Find the names of students with marks>class average 
select avg(score) from info;
select name from info where score>83.3333;

select name from info where score>(select avg(score) from info);

#Find the maximum marks from the students of Delhi 
select max(score) from info where city='Delhi';

#Find the names of all the students with even roll numbers 
select name, roll_no from info where roll_no in (select roll_no from info where roll_no%2=0);

select * from info;
create view view1 as select roll_no,name,score from info;

select * from view1;