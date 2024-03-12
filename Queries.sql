
/*Database Platform: SQL SERVER*/

Use Homes_DB;
/* AND */
/*Q1: What home numbers have only 1 bedroom?*/

select HomeNumber From Rooms
Where RoomDescription='Bedroom' AND Quantity =1;

/* Results
HomeNumber
435
*/

/* OR */
/*Q2:What home numbers have a deck or picket fence? */

Select HomeNumber from OutdoorFeatures
Where OutdoorFeature = 'Deck' OR OutdoorFeature = 'Picket Fence';

/* Results
HomeNumber
425
240
*/

/* NOT */
/*Q3:What home numbers have had home additions that do not include luxury in their description? Include HomeNumber and AdditionDescription */

Select HomeNumber, AdditionDescription from Additions
Where AdditionDescription NOT Like '%Luxury%';

/* Results

HomeNumber	AdditionDescription
425			Bathroom 
425			Deck Replacement
425			Privacy Fence
1207		Kitchen Granite Counter Tops
1207		Deck
1203		Bedroom Carpet
1203		Third Stall Garage
1203		Roof
1202		Porch
1202		Third Stall Garage

*/

/* Betwwen */
/*Q4: How many home numbers have had a value change this year(2021), and what was that value? Include HomeNumber and ValueCurrent */
Select HomeNumber, ValueCurrent from ValueChange
Where ValueDateChange Between '20210101' AND '20211231';

/* Results 
HomeNumber	ValueCurrent
425			160000.00
600			99900.00
1203		285173.00
435			75000.00
240			180000.00
535			300000.00
220			55000.00
905			147000.00
1367		550000.00
*/

/* Calculated Field */
/*Q5: What is the average Home price inthe year 2021? Use appropriate column alias(s)*/
Select AVG(valueCurrent) as 'Average Home Price' From ValueChange
Where ValueDateChange Between '20210101' AND '20211231';

/* Results 
Average Home Price
205785.8888
*/

/* GroupBy */
/*Q6: Count the how many outdoor features each home number has. Use a column Alias for count and include HomeNumber. */
Select HomeNumber, Count(*) as 'Number of Features' From OutdoorFeatures
Group By HomeNumber;

/* Results
HomeNumber	Number of Features
240			2
425			4
600			2
920			2
1207		2
1215		3
*/

/* GroupBy & Having */
/*Q7: How many homes have more than 2 outdoor features. Use a column Alias for count and include HomeNumber */
Select HomeNumber, Count(*) as 'Number of Features' From OutdoorFeatures
Group By HomeNumber
Having Count(*) > 2;

/* Results
HomeNumber	Number of Features
425			4
1215		3
*/

/* Top */
/*Q8: What are the top 3 most expensive homes that have had a value change in 2021? Include HomeNumber & ValueCurrent */
Select Top 3 ValueCurrent, HomeNumber from ValueChange
Where ValueDateChange Between '20210101' AND '20211231'
Order By ValueCurrent desc;

/* Results
ValueCurrent	HomeNumber
550000.00		1367
300000.00		535
285173.00		1203
*/

/* Inner Join */
/*Q9: List all the homes that have had a value change in 2021. Include the full address(HomeNumber,Street, City, State, Zip) & ValueCurrent */
select n.Homenumber, n.street, n.city, n.state, n.zip, v.valuecurrent from Neighborhood as n
Inner Join ValueChange as v ON
n.HomeNumber = v.HomeNumber
Where v.ValueDateChange Between '20210101' AND '20211231'

/* Results
Homenumber	street			city	state	zip		valuecurrent
425			David Lane		Eagle	Ne		68347	160000.00
600			O Street		Eagle	Ne		68347	99900.00
1203		Olivia Drive	Eagle	Ne		68347	285173.00
435			E Street		Eagle	Ne		68347	75000.00
240			C Street		Eagle	Ne		68347	180000.00
535			S 1st Street	Eagle	Ne		68347	300000.00
220			S 5th Street	Eagle	Ne		68347	55000.00
905			F Street		Eagle	Ne		68347	147000.00
1367		Percheron Dr	Eagle	Ne		68347	550000.00
*/

/* Outer Join */
/*Q10: List all the homes and the change(s) in value over the years, regardless if a value change has happended. Include the full address(homenumber,street, city, state, zip), currentValue & ValueDateChage */
select n.Homenumber, n.street, n.city, n.state, n.zip, v.valuecurrent,v.ValueDateChange from Neighborhood as n
Full Outer Join ValueChange as v ON
n.HomeNumber = v.HomeNumber;

/*Results 
Homenumber	street			city	state	zip		valuecurrent	ValueDateChange
220			S 5th Street	Eagle	Ne		68347	55000.00	2021-10-25
240			C Street		Eagle	Ne		68347	180000.00	2021-07-01
425			David Lane		Eagle	Ne		68347	140000.00	2018-04-01
425			David Lane		Eagle	Ne		68347	137000.00	2019-04-01
425			David Lane		Eagle	Ne		68347	154000.00	2020-04-01
425			David Lane		Eagle	Ne		68347	160000.00	2021-09-01
435			E Street		Eagle	Ne		68347	75000.00	2021-06-15
535			S 1st Street	Eagle	Ne		68347	300000.00	2021-10-29
600			O Street		Eagle	Ne		68347	99900.00	2021-01-01
905			F Street		Eagle	Ne		68347	147000.00	2021-10-20
920			Applewood Drive	Eagle	Ne		68347	189900.00	2020-03-16
1202		Gage Street		Eagle	Ne		68347	334959.00	2020-05-01
1203		Olivia Drive	Eagle	Ne		68347	285173.00	2021-05-01
1204		Gage Street		Eagle	Ne		68347	NULL		NULL
1207		Olivia Driv		Eagle	Ne		68347	NULL		NULL
1215		Gage Street		Eagle	Ne		68347	NULL		NULL
1216		Olivia Drive	Eagle	Ne		68347	NULL		NULL
1367		Percheron Dr	Eagle	Ne		68347	550000.00	2021-10-12
*/
/* Subquery */
/*Q11: List the home number, For sale status, and the square footage of homes that had a value change in 2020 */

Select HomeNumber, ForSale, SquarFootage from Neighborhood
Where HomeNumber IN (
Select HomeNumber From ValueChange
Where ValueDateChange Between '20200101' AND '20201231');

/* Results 
HomeNumber	ForSale	SquarFootage
425			NO		1800
920			YES		1608
1202		YES		2548
*/

