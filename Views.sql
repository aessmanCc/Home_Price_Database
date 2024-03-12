/* Views */
Use Homes_DB;

/* And  View */
Create View oneBedroom AS
select HomeNumber From Rooms
Where RoomDescription='Bedroom' AND Quantity =1;

/* Select Statement */
Select * From oneBedroom;

/*Results
HomeNumber
435
*/

/* Aggregate, Group By, & Having View */
Create View outsideFeatures AS
Select HomeNumber, Count(*) as 'Number of Features' From OutdoorFeatures
Group By HomeNumber
Having Count(*) > 2;

/* Select Statement */
Select * from outsideFeatures;

/*Results
HomeNumber	Number of Features
425				4
1215			3
*/

/* Inner Join View*/
Create View twentyoneValueChange AS
select n.Homenumber, n.street, n.city, n.state, n.zip, v.valuecurrent from Neighborhood as n
Inner Join ValueChange as v ON
n.HomeNumber = v.HomeNumber
Where v.ValueDateChange Between '20210101' AND '20211231';

/* Select Statement */
Select * from twentyoneValueChange;

/* Results
Homenumber		street			city	state	zip		valuecurrent
425				David Lane		Eagle	Ne		68347	160000.00
600				O Street		Eagle	Ne		68347	99900.00
1203			Olivia Drive	Eagle	Ne		68347	285173.00
435				E Street		Eagle	Ne		68347	75000.00
240				C Street		Eagle	Ne		68347	180000.00
535				S 1st Street	Eagle	Ne		68347	300000.00
220				S 5th Street	Eagle	Ne		68347	55000.00
905				F Street		Eagle	Ne		68347	147000.00
1367			Percheron Dr	Eagle	Ne		68347	550000.00
*/

/* Outer Join View*/
Create View allValueChanges AS
select n.Homenumber, n.street, n.city, n.state, n.zip, v.valuecurrent,v.ValueDateChange from Neighborhood as n
Full Outer Join ValueChange as v ON
n.HomeNumber = v.HomeNumber;

/* Select Statement */
Select * From allValueChanges;

/* Results
Homenumber	street			city	state	zip		valuecurrent	ValueDateChange
220			S 5th Street	Eagle	Ne		68347	55000.00		2021-10-25
240			C Street		Eagle	Ne		68347	180000.00		2021-07-01
425			David Lane		Eagle	Ne		68347	140000.00		2018-04-01
425			David Lane		Eagle	Ne		68347	137000.00		2019-04-01
425			David Lane		Eagle	Ne		68347	154000.00		2020-04-01
425			David Lane		Eagle	Ne		68347	160000.00		2021-09-01
435			E Street		Eagle	Ne		68347	75000.00		2021-06-15
535			S 1st Street	Eagle	Ne		68347	300000.00		2021-10-29
600			O Street		Eagle	Ne		68347	99900.00		2021-01-01
905			F Street		Eagle	Ne		68347	147000.00		2021-10-20
920			Applewood Drive	Eagle	Ne		68347	189900.00		2020-03-16
1202		Gage Street		Eagle	Ne		68347	334959.00		2020-05-01
1203		Olivia Drive	Eagle	Ne		68347	285173.00		2021-05-01
1204		Gage Street		Eagle	Ne		68347	NULL			NULL
1207		Olivia Driv		Eagle	Ne		68347	NULL			NULL
1215		Gage Street		Eagle	Ne		68347	NULL			NULL
1216		Olivia Drive	Eagle	Ne		68347	NULL			NULL
1367		Percheron Dr	Eagle	Ne		68347	550000.00		2021-10-12

*/

/* Subquery View*/
Create View twentyValueChange AS
Select HomeNumber, ForSale, SquarFootage from Neighborhood
Where HomeNumber IN (
Select HomeNumber From ValueChange
Where ValueDateChange Between '20200101' AND '20201231');

/* Select Statement */
Select * from twentyValueChange;

/* Results 
HomeNumber	ForSale	SquarFootage
425			NO		1800
920			YES		1608
1202		YES		2548
*/

