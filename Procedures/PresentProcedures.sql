-- Create a new stored procedure called 'AddPresent' in schema 'dbo'
-- Drop the stored procedure if it already exists

--CREATE--------------------------------------
IF EXISTS (
SELECT *
    FROM INFORMATION_SCHEMA.ROUTINES
WHERE SPECIFIC_SCHEMA = N'dbo'
    AND SPECIFIC_NAME = N'AddPresent'
    AND ROUTINE_TYPE = N'PROCEDURE'
)
DROP PROCEDURE dbo.AddPresent
GO
-- Create the stored procedure in the specified schema
CREATE PROCEDURE dbo.AddPresent
    @GiftName varchar(255),
    @GiftDescription varchar(1000),
    @GiftURL varchar(2083),
    @PersonID int
AS
BEGIN
    INSERT INTO dbo.Presents (GiftName, GiftDescription, GiftURL)
    VALUES (@GiftName, @GiftDescription, @GiftURL)
END
GO

-- example to execute the stored procedure
EXECUTE dbo.AddPresent 'Test Gift' /*value_for_param1*/, 'Test Gift Desc' /*value_for_param2*/, 'testurl.com', 7
GO
SELECT * FROM dbo.Presents WHERE PresentID > 67

--READ--------------------------------------
IF EXISTS (
SELECT *
    FROM INFORMATION_SCHEMA.ROUTINES
WHERE SPECIFIC_SCHEMA = N'dbo'
    AND SPECIFIC_NAME = N'ReadPresent'
    AND ROUTINE_TYPE = N'PROCEDURE'
)
DROP PROCEDURE dbo.ReadPresent
GO
-- Create the stored procedure in the specified schema
CREATE PROCEDURE dbo.ReadPresent
    @PresentID int
AS
BEGIN
    SELECT PresentID, GiftName, GiftDescription, GiftURL, Purchased, PersonID
    FROM dbo.Presents
    WHERE PresentID = @PresentID
END
GO
-- example to execute the stored procedure
EXECUTE dbo.ReadPresent 71
GO
--UPDATE --------------------------------------
IF EXISTS (
SELECT *
    FROM INFORMATION_SCHEMA.ROUTINES
WHERE SPECIFIC_SCHEMA = N'dbo'
    AND SPECIFIC_NAME = N'UpdatePresent'
    AND ROUTINE_TYPE = N'PROCEDURE'
)
DROP PROCEDURE dbo.UpdatePresent
GO
CREATE PROCEDURE dbo.UpdatePresent
    @PresentID int,
    @GiftName varchar(255),
    @GiftDescription varchar(1000),
    @GiftURL varchar(2083)
AS
BEGIN
    UPDATE dbo.Presents
    SET GiftName = @GiftName,
        GiftDescription = @GiftDescription,
        GiftURL = @GiftURL
    WHERE PresentID = @PresentID
END
GO
EXECUTE dbo.UpdatePresent 71, 'Test Ne Gift', 'Test new Gift Desc', 'testurl.com'
GO
SELECT * FROM dbo.Presents WHERE PresentID > 65
--DELETE --------------------------------------
IF EXISTS (
SELECT *
    FROM INFORMATION_SCHEMA.ROUTINES
WHERE SPECIFIC_SCHEMA = N'dbo'
    AND SPECIFIC_NAME = N'RemovePresent'
    AND ROUTINE_TYPE = N'PROCEDURE'
)
DROP PROCEDURE dbo.RemovePresent
GO
-- Create the stored procedure in the specified schema
CREATE PROCEDURE dbo.RemovePresent
    @PresentID int
AS
BEGIN
    DELETE FROM dbo.Presents
    WHERE PresentID = @PresentID
END
GO
-- example to execute the stored procedure
EXECUTE dbo.RemovePresent 71
GO
SELECT * FROM dbo.Presents WHERE PresentID > 65
-------------------END OF CRUD ------------------------
--Purchase Gift
IF EXISTS (
SELECT *
    FROM INFORMATION_SCHEMA.ROUTINES
WHERE SPECIFIC_SCHEMA = N'dbo'
    AND SPECIFIC_NAME = N'PurchaseGift'
    AND ROUTINE_TYPE = N'PROCEDURE'
)
DROP PROCEDURE dbo.PurchaseGift
GO
CREATE PROCEDURE dbo.PurchaseGift
    @PresentID int
AS
BEGIN
    UPDATE dbo.Presents
    SET Purchased = 1
    WHERE PresentID = @PresentID
END
GO
EXECUTE dbo.PurchaseGift 68
GO
SELECT * FROM dbo.Presents WHERE PresentID > 65
--Return Gift
IF EXISTS (
SELECT *
    FROM INFORMATION_SCHEMA.ROUTINES
WHERE SPECIFIC_SCHEMA = N'dbo'
    AND SPECIFIC_NAME = N'UnPurchaseGift'
    AND ROUTINE_TYPE = N'PROCEDURE'
)
DROP PROCEDURE dbo.UnPurchaseGift
GO
CREATE PROCEDURE dbo.UnPurchaseGift
    @PresentID int
AS
BEGIN
    UPDATE dbo.Presents
    SET Purchased = 0
    WHERE PresentID = @PresentID
END
GO
EXECUTE dbo.UnPurchaseGift 68
GO
SELECT * FROM dbo.Presents WHERE PresentID > 65

--