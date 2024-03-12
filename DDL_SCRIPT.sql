/*Check For Homes Database */
IF DB_ID('Homes_DB') IS NOT NULL
	DROP DATABASE Homes_DB
GO
/*Create Homes DataBase & Use DataBase*/
CREATE DATABASE Homes_DB
GO
USE Homes_DB
GO
/*Check for table existence & create table */
IF OBJECT_ID('Neighborhood') IS NOT NULL
	DROP TABLE Neighborhood
GO
CREATE TABLE Neighborhood (
HomeNumber int NOT NULL,
Street varchar(20) NOT NULL,
City varchar(20) NOT NULL,
State varchar(2) NOT NULL,
Zip varchar(6) NOT NULL,
ForSale varchar(3) NOT NULL,
SquarFootage int NOT NULL,
CONSTRAINT homeNum_PK PRIMARY KEY(HomeNumber)
);
GO
/*Check for table existence & create table */
IF OBJECT_ID('OutDoorFeatures') IS NOT NULL
	DROP TABLE OutdoorFeatures
GO
CREATE TABLE OutdoorFeatures (
OutdoorID int NOT NULL IDENTITY,
OutdoorFeature varchar(50) NOT NULL,
HomeNumber int Not NULL
CONSTRAINT OutID_PK PRIMARY KEY(OutdoorID),
CONSTRAINT homeNum_FK FOREIGN KEY(HomeNumber) REFERENCES Neighborhood(HomeNumber)
);

GO
/*Check for table existence & create table */
IF OBJECT_ID('Rooms') IS NOT NULL
	DROP TABLE Rooms
GO
CREATE TABLE Rooms (
RoomID int NOT NULL IDENTITY,
RoomDescription varchar(50) NOT NULL,
Quantity int NOT NULL,
HomeNumber int NOT NULL
CONSTRAINT RoomID_PK PRIMARY KEY(RoomID),
CONSTRAINT homeNumR_FK FOREIGN KEY(HomeNumber) REFERENCES Neighborhood(HomeNumber)
);
GO
/*Check for table existence & create table */
IF OBJECT_ID('Additions') IS NOT NULL
	DROP TABLE Additions
GO
CREATE TABLE Additions (
AdditionID int NOT NULL IDENTITY,
AdditionDescription varchar(50) NOT NULL,
AdditionDate date NOT NULL,
HomeNumber int Not NULL
CONSTRAINT AddID_PK PRIMARY KEY(AdditionID),
CONSTRAINT homeNumA_FK FOREIGN KEY(HomeNumber) REFERENCES Neighborhood(HomeNumber)
);
GO
/*Check for table existence & create table */
IF OBJECT_ID('ValueChange') IS NOT NULL
	DROP TABLE ValueChange
GO
CREATE TABLE ValueChange (
ValueID int NOT NULL IDENTITY,
ValueCurrent money NOT NULL,
ValueDateChange date NOT NULL,
HomeNumber int Not NULL
CONSTRAINT ValueID_PK PRIMARY KEY(ValueID),
CONSTRAINT homeNumV_FK FOREIGN KEY(HomeNumber) REFERENCES Neighborhood(HomeNumber)
);
GO
/* INSERT RECORDS INTO TABLES */
INSERT INTO Neighborhood (
HomeNumber, Street, City, State, Zip, ForSale, SquarFootage)
Values (
	425, 'David Lane', 'Eagle', 'Ne', 68347, 'NO', 1800
),
(
	240,'C Street', 'Eagle', 'Ne', 68347, 'YES', 1792
),
(
	920,'Applewood Drive', 'Eagle', 'Ne', 68347, 'YES', 1608
),
(
	435,'E Street', 'Eagle', 'Ne', 68347, 'YES', 572
),
(
	1215,'Gage Street', 'Eagle', 'Ne', 68347, 'YES', 2733
),
(
	1202,'Gage Street', 'Eagle', 'Ne', 68347, 'YES', 2548
),
(
	600,'O Street', 'Eagle', 'Ne', 68347, 'YES', 1796
),
(
	1203,'Olivia Drive', 'Eagle', 'Ne', 68347, 'YES', 2187
),
(
	1204,'Gage Street', 'Eagle', 'Ne', 68347, 'YES', 2733
),
(
	1216,'Olivia Drive', 'Eagle', 'Ne', 68347, 'YES', 2187
),
(
	1207,'Olivia Driv', 'Eagle', 'Ne', 68347, 'YES', 1792
),
(
	535,'S 1st Street', 'Eagle', 'Ne', 68347, 'NO', 2832
),
(
	220,'S 5th Street', 'Eagle', 'Ne', 68347, 'NO', 880
),
(
	905,'F Street', 'Eagle', 'Ne', 68347, 'NO', 1056
),
(
	1367,'Percheron Dr', 'Eagle', 'Ne', 68347, 'NO', 3852
)


INSERT INTO OutdoorFeatures(
OutdoorFeature, HomeNumber)
Values ( 
	'Front Yard', 425
),
(
	'Back Yard', 425
),
(
	'Shed', 425
),
(
	'Deck', 425
),
(
	'Back Yard', 1207
),
(
	'Front Yard', 1207 
),
(
	'Front Yard', 600
),
(
	'Shed', 600
),
(
	'Front Yard', 1215
),
(
	'Back Yard', 1215
),
(
	'Shed', 1215
),
(
	'Back Yard', 240
),
(
	'Picket Fence', 240
),
(
	'Back Yard', 920
),
(
	'Front Yard', 920
)

INSERT INTO Rooms(
RoomDescription, Quantity, HomeNumber)
Values ( 
	'Bedroom', 3, 425
),
(
	'Bathroom', 2, 425
),
(
	'Bathroom', 2, 240
),
(
	'Bedroom', 3, 240
),
(
	'Bathroom', 2, 920
),
(
	'Bedroom', 3, 920
),
(
	'Bathroom', 1, 600
),
(
	'Bedroom', 3, 600
),
(
	'Bathroom', 3, 1203
),
(
	'Bedroom', 5, 1203
),
(
	'Bathroom', 3, 1207
),
(
	'Bedroom', 4, 1207
),
(
	'Bedroom', 4, 1215
),
(
	'Bathroom', 3, 1215
),
(
	'Bathroom', 1, 435
),
(
	'Bedroom', 1, 435
)

INSERT INTO Additions(
AdditionDescription, AdditionDate, HomeNumber)
Values ( 
	'Luxury Vinyl Basement Floor', '20191201', 425
),
(
	'Luxury Tongue and Groove Floor', '20201101', 425
),
(
	'Bathroom ', '20201101', 425
),
(
	'Deck Replacement', '20200101', 425
),
(
	'Privacy Fence', '20210801', 425
),
(
	'Kitchen Luxury Floor', '20200513', 1207
),
(
	'Kitchen Granite Counter Tops', '20200615',  1207
),
(
	'Deck', '20200421',  1207
),
(
	'Kitchen Luxury Floor', '20191007',  1203
),
(
	'Bedroom Carpet', '20200701',  1203
),
(
	'Third Stall Garage', '20200901',  1203
),
(
	'Roof', '20210501',  1203
),
(
	'Porch', '20200801',  1202
),
(
	'Third Stall Garage', '20200901',  1202
),
(
	'Luxury Carpet', '20200801',  1202
)

INSERT INTO ValueChange(
ValueCurrent, ValueDateChange, HomeNumber)
Values ( 
	140000, '20180401', 425
),
(
	137000, '20190401', 425
),
( 
	154000, '20200401', 425
),
( 
	160000, '20210901', 425
),
( 
	99900, '20210101', 600
),
( 
	285173, '20210501', 1203
),
( 
	334959, '20200501', 1202
),
( 
	75000, '20210615', 435
),
( 
	180000, '20210701', 240
),
( 
	189900, '20200316', 920
),
( 
	300000, '20211029', 535
),
( 
	55000, '20211025', 220
),
( 
	147000, '20211020', 905
),
( 
	550000, '20211012', 1367
)
	


