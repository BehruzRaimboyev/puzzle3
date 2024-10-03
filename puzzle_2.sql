

CREATE TABLE lag
(
 BusinessEntityID INT
,SalesYear   INT
,CurrentQuota DECIMAL(20,4)
)
 
GO

--Insert Data
INSERT INTO lag
SELECT 275 , 2005 , '367000.00'
UNION ALL
SELECT 275 , 2005 , '556000.00'
UNION ALL
SELECT 275 , 2006 , '502000.00'
UNION ALL
SELECT 275 , 2006 , '550000.00'
UNION ALL
SELECT 275 , 2006 , '1429000.00'
UNION ALL
SELECT 275 , 2006 ,   '1324000.00'


select * from lag 
 
;with cte as
(
    select BusinessEntityID,SalesYear,CurrentQuota,ROW_NUMBER() OVER (ORDER by businessentityid) bmb  
    from lag
)
select   BusinessEntityID,SalesYear,CurrentQuota,
         isnull(( select top 1 CurrentQuota from CTE cte1 
		 where cte2.bmb < cte1.bmb ),0) NextCurrentData
FROM CTE cte2