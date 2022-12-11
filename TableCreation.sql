CREATE TABLE Presents (
	PresentID int IDENTITY(1,1) PRIMARY KEY,
	GiftName varchar(255),
	GiftDescription varchar(1000),
	GiftURL varchar(2083),
	Purchased bit,
	PersonID int FOREIGN KEY REFERENCES Persons(PersonID)
)
CREATE TABLE Persons (
	PersonID int IDENTITY(1,1) PRIMARY KEY,
	PersonName varchar(20),
	UserPass varchar(255),
	GroupID int FOREIGN KEY REFERENCES Groups(GroupID)
)

CREATE TABLE GiftPictures(
	PictureID int PRIMARY KEY,
	PresentID int FOREIGN KEY REFERENCES Presents(PresentID),
	Picture VARCHAR(255) NOT NULL
)

CREATE TABLE Groups(
	GroupID int IDENTITY(1,1) PRIMARY KEY,
	GroupName varchar(20),
	GroupDescription varchar(255),
	GroupNumber int NOT NULL
)
