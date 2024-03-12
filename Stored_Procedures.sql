/* Procedures */
Use Homes_DB;

/* Procedure 1 */
Create Proc valueChanges
@homeNum int
AS 
/* IF Statement(s) & Error Handling */
IF @homeNum = 0
THROW 50001, 'The home number cannot be 0', 1;
IF @homeNum >= 10000
THROW 50001, 'There are no homes in Eagle with this home number',1;
IF @homeNum NOT IN (Select homeNumber from ValueChange)
THROW 50001, 'There are no homes in Eagle with this home number',1;

/* Select Statement */
Select HomeNumber, Count(*) AS 'Value Changes',
/* Case Statement */
CASE
	WHEN COUNT(*)=0 THEN 'Below Average'
	WHEN COUNT(*)=1 THEN 'Average'
	WHEN COUNT(*)=2 THEN 'Slightly Above Average'
	WHEN COUNT(*)=3	THEN 'Above Average'
	WHEN COUNT(*)>= 4 THEN 'Highly Above Average'
	
END AS 'Analysis'
From valueChange
Where HomeNumber = @homeNum
Group By HomeNumber;

/* Execute Statement */
BEGIN TRY 	
	EXEC valueChanges 425
		
END TRY
BEGIN CATCH
	/*Print Statement(s)*/
	PRINT 'An error has occurred'	
	PRINT 'Message: ' + Convert(varchar(50), ERROR_MESSAGE());
END CATCH

/* Results 
HomeNumber	Value Changes	Analysis
425			4				Highly Above Average
*/


/* Procedure 2 */
Create Proc valueChangeRange
@DateMin varchar(50) = NULL,
@DateMax varchar(50) = NULL
AS
/*Error Handling*/
IF @DateMin IS NULL OR @DateMax IS NULL
THROW 50001, 'The DateMin and DateMax parameters are required.', 1;
IF NOT (ISDATE(@DateMin) = 1 AND ISDATE(@DateMax) = 1)
THROW 50001, 'The date format is not valid. Please use mm/dd/yy.', 1;
IF CAST(@DateMin AS datetime) > CAST(@DateMax AS datetime)
THROW 50001, 'The DateMin parameter must be earlier than DateMax', 1;
SET NOCOUNT ON
/* Date Function & String Function*/
Select HomeNumber, ValueCurrent 'Value', Concat(YEAR(ValueDateChange) , '-' ,  MONTH(ValueDateChange)) as 'Year & Month' from ValueChange
Where ValueDateChange BETWEEN @DateMin AND @DateMax;
/*Print Statement*/
PRINT 'Success!'


/* Execute Statement */
BEGIN TRY 	
	EXEC valueChangeRange
		'2020-01-01','2020-12-31';
END TRY
BEGIN CATCH
	/*Print Statement(s)*/
	PRINT 'An error has occurred'	
	PRINT 'Message: ' + Convert(varchar(50), ERROR_MESSAGE());
END CATCH

/* Results 
HomeNumber	Value		Year & Month
425			154000.00	2020-4
1202		334959.00	2020-5
920			189900.00	2020-3

*/