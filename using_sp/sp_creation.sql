USE AdventureWorks2019
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
    
CREATE PROCEDURE [dbo].[fetch_script] 
@table_name as Varchar(100) 
AS
BEGIN
exec('select *,'''+@table_name+''' from '+@table_name+'
where LoginID in ('+'''adventure-works\shu0'+''',
'+'''adventure-works\josé1'+''',
'+'''adventure-works\david8'+''',
'+'''adventure-works\lionel0'+''',
'+'''adventure-works\stuart0'+''',
'+'''adventure-works\frank2'+''',
'+'''adventure-works\eric2'+''',
'+'''adventure-works\erin0'+''',
'+'''adventure-works\ben0'+''')')
END