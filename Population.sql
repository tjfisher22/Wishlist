INSERT INTO Persons (PersonName, UserPass, GroupID)
VALUES	('Ron', 'Password1',1),
		('Tifani','Password2',1),
		('TJ','Password3',1),
		('Kelsey','Password4',1),
		('Daniel','Password5',1),
		('Jarett','Password6',1),
		('Matthew','Password8',1)

INSERT INTO Presents (GiftName, GiftDescription, GiftURL, Purchased)
SELECT GiftName, GiftDescription, GiftURL, Purchased
FROM CSVExport
 
INSERT INTO PersonsPresent

SELECT PesentID, PresentName, PersonID, PersonName
FROM  
