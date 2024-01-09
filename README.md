Request: 
- I want to query (using a stored procedure or SQL script) multiple large similar (same schema) tables residing in the database
- I want to know the table that populates the data based on my script or stored procedure

Challenges
- Querying each tables is manual and time consuming
- Merging the tables would create an even larger table ann querying will also be time consuming

  Proposed Solution:
  - get a list of the tables to be queried
  - uses cursor to loop through each tables while running the script/sp against them
 
  Sample Database: https://learn.microsoft.com/en-us/sql/samples/adventureworks-install-configure?view=sql-server-ver16&tabs=ssms
