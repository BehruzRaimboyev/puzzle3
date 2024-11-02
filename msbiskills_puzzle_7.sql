CREATE TABLE List
(
ID INT
)
GO
 
INSERT INTO List(ID) VALUES (1),(2),(3),(4),(5)

select *,sum(id) over(order by %%Physloc%%) as Sumprevalues from list
group by id 
