CREATE TABLE #my_dest_table (
	[BusinessEntityID] [int] NOT NULL,
	[NationalIDNumber] [nvarchar](15) NOT NULL,
	[LoginID] [nvarchar](256) NOT NULL,
	[OrganizationNode] [hierarchyid] NULL,
	[OrganizationLevel] [smallint] NULL,
	[JobTitle] [nvarchar](50) NOT NULL,
	[BirthDate] [date] NOT NULL,
	[MaritalStatus] [nchar](1) NOT NULL,
	[Gender] [nchar](1) NOT NULL,
	[HireDate] [date] NOT NULL,
	[SalariedFlag] [smallint] NOT NULL,
	[VacationHours] [smallint] NOT NULL,
	[SickLeaveHours] [smallint] NOT NULL,
	[CurrentFlag] [smallint] NOT NULL,
	[rowguid] [uniqueidentifier] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[table_name] [nvarchar](500) NULL);



DECLARE  @table_name VARCHAR(MAX) 
DECLARE cursor_product CURSOR
FOR  
select name as table_name from sys.tables
where name in ('Employee_Buyer','Employee_Janitor','Employee_Prod_Tech','Employee_Sales_Rep')
  OPEN cursor_product;
FETCH NEXT FROM 
  cursor_product INTO         
  @table_name
  WHILE @@FETCH_STATUS = 0    
  BEGIN 
exec('insert into #my_dest_table
select *,'''+@table_name+''' from '+@table_name+'
where LoginID in ('+'''adventure-works\shu0'+''',
'+'''adventure-works\josé1'+''',
'+'''adventure-works\david8'+''',
'+'''adventure-works\lionel0'+''',
'+'''adventure-works\stuart0'+''',
'+'''adventure-works\frank2'+''',
'+'''adventure-works\eric2'+''',
'+'''adventure-works\erin0'+''',
'+'''adventure-works\ben0'+''')')
	FETCH NEXT FROM cursor_product INTO
	@table_name
	END;
	CLOSE cursor_product;
DEALLOCATE cursor_product; 

select * from #my_dest_table