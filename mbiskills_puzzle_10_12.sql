
CREATE TABLE Department
(
DeptID INT
,DeptName VARCHAR(10)
)
GO
 
 
INSERT INTO Department(DeptID,DeptName)
VALUES
(1,'Finance'),
(2,'IT'),
(3,'HR')
 
 
SELECT DeptID,DeptName FROM Department
 
 
CREATE TABLE Emps
(
EmpID INT
,EmpName VARCHAR(50)
,DeptID INT
,EmpSalary FLOAT
)
GO
 
 
INSERT INTO Emps(EmpID,EmpName,DeptID,EmpSalary) VALUES
(101,'Isha',1,7000),
(111,'Esha',1,8970),
(102,'Mayank',1,8900),
(103,'Ramesh',2,4000),
(104,'Avtaar',2,9000),
(105,'Gopal',3,17000),
(106,'Krishna',3,1000),
(107,'Suchita',3,7000),
(108,'Ranjan',3,17900)
 
 ---ex10
SELECT EmpID,EmpName,DeptID,EmpSalary FROM Emps

;with CTE as
(
	select empid,empname,deptid,empsalary,
	rank() over(partition by deptid order by empsalary desc)rnk
	from emps
)
select empid,empname,a.deptid,empsalary,b.deptname from CTE a 
inner join Department b
on b.DeptID=a.deptid
where rnk=2



------ex11

CREATE TABLE [dbo].[TestMultipleZero]
(
[A] [int] NULL,
[B] [int] NULL,
[C] [int] NULL,
[D] [int] NULL
)
GO
 
INSERT INTO [dbo].[TestMultipleZero](A,B,C,D)
VALUES (0,0,0,1),(0,0,1,0),(0,1,0,0),(1,0,0,0),(0,0,0,0),(1,1,1,0)
 
SELECT A,B,C,D FROM [dbo].[TestMultipleZero]
where A!=0 or B!=0 or C!=0 or D!=0

--------ex12

CREATE TABLE GroupbyMultipleColumns
(
ID INT
,Typ VARCHAR(1)
,Value1 VARCHAR(1)
,Value2 VARCHAR(1)
,Value3 VARCHAR(1)
)
GO
 
INSERT INTO GroupbyMultipleColumns(ID,Typ,Value1,Value2,Value3)
VALUES
(1,'I','a','b',''),
(2,'O','a','d','f'),
(3,'I','d','b',''),
(4,'O','g','l',''),
(5,'I','z','g','a'),
(6,'I','z','g','a')
 
SELECT ID,Typ,Value1,Value2,Value3 FROM GroupbyMultipleColumns

select 
		typ
		,sum(case value1 when 'a' then 1 else 0 end)
		,sum(case value2 when 'a' then 1 else 0 end)
		,sum(case value3 when 'a' then 1 else 0 end)
		counts
from GroupbyMultipleColumns
group by typ