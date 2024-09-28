create proc table_information

as begin
select * from INFORMATION_SCHEMA.COLUMNS
end

DECLARE	@return_value int
EXEC	@return_value = [dbo].[table_information]
SELECT	'Return Value' = @return_value
 