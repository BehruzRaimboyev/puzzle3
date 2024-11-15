
CREATE TABLE TestMax
(
Year1 INT
,Max1 INT
,Max2 INT
,Max3 INT
)
GO
 

INSERT INTO TestMax 
VALUES
 (2001,10,101,87)
,(2002,103,19,88)
,(2003,21,23,89)
,(2004,27,28,91)
 

Select * FROM TestMax

--puzzle 8
select year1 ,(select max(v) from (values (max1),(max2),(max3)) 
as value(v))
as maxx from TestMax

---puzzle 9


CREATE TABLE [dbo].[EmpSalaryGreaterManager]
(
[EmpID] [int] NULL,
[EmpName] [varchar](50) NULL,
[EmpSalary] [bigint] NULL,
[MgrID] [int] NULL
)

 

INSERT INTO [EmpSalaryGreaterManager](EmpID,EmpName,EmpSalary,MgrID)
VALUES
(1,    'Pawan',      80000, 4),
(2,    'Dheeraj',    70000, 4),
(3,    'Isha',       100000,       4),
(4,    'Joteep',     90000, NULL),
(5,    'Suchita',    110000,       4)
 

SELECT * FROM [dbo].[EmpSalaryGreaterManager]


select b.EmpID,
	   b.EmpName,
	   b.EmpSalary,
	   b.MgrID,
	   a.EmpName Mgr 
FROM EmpSalaryGreaterManager a
INNER JOIN EmpSalaryGreaterManager b 
ON a.EmpID = b.MgrID
WHERE b.EmpSalary > a.EmpSalary
 