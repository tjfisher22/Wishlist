-- Create a new stored procedure called 'ReadGroup' in schema 'dbo'
-- Drop the stored procedure if it already exists
IF EXISTS (
SELECT *
    FROM INFORMATION_SCHEMA.ROUTINES
WHERE SPECIFIC_SCHEMA = N'dbo'
    AND SPECIFIC_NAME = N'ReadGroup'
    AND ROUTINE_TYPE = N'PROCEDURE'
)
DROP PROCEDURE dbo.ReadGroup
GO
CREATE PROCEDURE dbo.ReadGroup
    @GroupID int
AS
BEGIN
    -- body of the stored procedure
    SELECT * FROM Groups WHERE GroupID=@GroupID
END
GO
-- example to execute the stored procedure we just created
EXECUTE dbo.ReadGroup 1 
GO