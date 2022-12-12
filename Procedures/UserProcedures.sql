--CREATE --------------------------------------
IF EXISTS (
SELECT *
    FROM INFORMATION_SCHEMA.ROUTINES
WHERE SPECIFIC_SCHEMA = N'dbo'
    AND SPECIFIC_NAME = N'CreatePerson'
    AND ROUTINE_TYPE = N'PROCEDURE'
)
DROP PROCEDURE dbo.CreatePerson
GO
CREATE PROCEDURE dbo.CreatePerson
    @PersonName varchar(20),
    @UserPass varchar(255),
    @GroupNumber int  
AS
BEGIN
    INSERT INTO dbo.Persons (PersonName, UserPass, GroupID)
    SELECT 
        PersonName = @PersonName,
        UserPass = @UserPass,
        dbo.Groups.GroupID 
    FROM dbo.Groups
    WHERE dbo.Groups.GroupNumber = @GroupNumber
END
GO
EXECUTE dbo.CreatePerson "Test Person", "TestPassword", 1237
GO
SELECT * FROM dbo.Persons
--READ --------------------------------------
IF EXISTS (
SELECT *
    FROM INFORMATION_SCHEMA.ROUTINES
WHERE SPECIFIC_SCHEMA = N'dbo'
    AND SPECIFIC_NAME = N'ReadPerson'
    AND ROUTINE_TYPE = N'PROCEDURE'
)
DROP PROCEDURE dbo.ReadPerson
GO
CREATE PROCEDURE dbo.ReadPerson
    @PersonID int 
AS
BEGIN
    SELECT PersonName, GroupID
    FROM dbo.Persons
    WHERE PersonID = @PersonID
END
GO
EXECUTE dbo.ReadPerson 1 
GO
--UPDATE --------------------------------------
IF EXISTS (
SELECT *
    FROM INFORMATION_SCHEMA.ROUTINES
WHERE SPECIFIC_SCHEMA = N'dbo'
    AND SPECIFIC_NAME = N'UpdatePerson'
    AND ROUTINE_TYPE = N'PROCEDURE'
)
DROP PROCEDURE dbo.UpdatePerson
GO
CREATE PROCEDURE dbo.UpdatePerson
    @PersonID int,
    @PersonName varchar(20),
    @GroupNumber int  
AS
BEGIN
    UPDATE dbo.Persons
    SET
        PersonName = @PersonName,
        Persons.GroupID =  Groups.GroupID
    FROM
        dbo.Persons AS Persons
        INNER JOIN dbo.Groups AS Groups ON Persons.GroupID = Groups.GroupID 
    WHERE PersonID = @PersonID
END
GO
EXECUTE dbo.UpdatePerson 9, "Test New Person", 1237
GO
SELECT * FROM dbo.Persons
--DELETE --------------------------------------
IF EXISTS (
SELECT *
    FROM INFORMATION_SCHEMA.ROUTINES
WHERE SPECIFIC_SCHEMA = N'dbo'
    AND SPECIFIC_NAME = N'DeletePerson'
    AND ROUTINE_TYPE = N'PROCEDURE'
)
DROP PROCEDURE dbo.DeletePerson
GO
CREATE PROCEDURE dbo.DeletePerson
    @PersonID int 
AS
BEGIN
    DELETE FROM dbo.Persons
    WHERE PersonID = @PersonID
END
GO
EXECUTE dbo.DeletePerson 9 
GO
SELECT * FROM dbo.Persons
-------------------END OF CRUD ------------------------
IF EXISTS (
SELECT *
    FROM INFORMATION_SCHEMA.ROUTINES
WHERE SPECIFIC_SCHEMA = N'dbo'
    AND SPECIFIC_NAME = N'UpdatePassword'
    AND ROUTINE_TYPE = N'PROCEDURE'
)
DROP PROCEDURE dbo.UpdatePassword
GO
CREATE PROCEDURE dbo.UpdatePassword
    @PersonID int,
    @UserPass varchar(255)
AS
BEGIN
    UPDATE dbo.Persons
    SET UserPass = @UserPass
    WHERE PersonID = @PersonID
END
GO
EXECUTE dbo.UpdatePassword 3, 'TestPassword' 
GO
SELECT * FROM dbo.Persons