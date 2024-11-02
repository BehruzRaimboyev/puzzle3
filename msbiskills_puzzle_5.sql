 

 
CREATE TABLE PQ
(
ID INT
,Name VARCHAR(10)
,Typed VARCHAR(10)
)
 
--Insert data
INSERT INTO PQ(ID,Name,Typed) VALUES  (1,'P',NULL) , (1,NULL,'Q')
 
--Verify data
SELECT * FROM  PQ

select p.Id,p.Name, 
(SELECT r.Typed from PQ r 
WHERE p.ID = r.Id 
AND r.Typed IS NOT NULL)
Typed FROM PQ p 
WHERE p.Name IS NOT NULL


