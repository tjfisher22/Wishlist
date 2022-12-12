INSERT INTO Persons (PersonName, UserPass, GroupID)
VALUES	('Ron', 'Password1',1),
		('Tifani','Password2',1),
		('TJ','Password3',1),
		('Kelsey','Password4',1),
		('Daniel','Password5',1),
		('Jarett','Password6',1),
		('Charlotte','Password7',1),
		('Matthew','Password8',1)

INSERT INTO Presents (GiftName, GiftDescription, GiftURL, Purchased)
SELECT GiftName, GiftDescription, GiftURL, Purchased
FROM CSVExport

UPDATE Presents
SET Presents.PersonID = Temp.PersonID
FROM Presents
INNER JOIN (
	SELECT PersonID, GiftName
	FROM  CSVExport
	INNER JOIN Persons ON Person = PersonName) AS Temp ON Temp.GiftName = Presents.GiftName

SELECT Presents.GiftName, Presents.PersonID, Persons.PersonName
FROM Presents
INNER JOIN Persons ON Presents.PersonID = Persons.PersonID



