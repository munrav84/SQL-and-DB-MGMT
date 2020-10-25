--Report that displays total revenue per course for a specific time period:

SELECT Course.CourseCode, SUM(AmountPaid) AS 'Revenue'
FROM Course
INNER JOIN Class 
	       ON Course.CourseCode = Class.CourseCode
INNER JOIN ClassEnrollment
		   ON Class.ReferenceNo = ClassEnrollment.ReferenceNo
WHERE DateTime BETWEEN 
GROUP BY Course.CourseCode, Name


--Report that shows the total amount spent on books:

SELECT Title, SUM(ActualPrice * QuantityReceived) AS 'Total Cost'
FROM CookBook
INNER JOIN BookOrderLine
		   ON CookBook.ISBN = BookOrderLine.ISBN
INNER JOIN BookOrder
	ON BookOrderLine.
WHERE OrderDate BETWEEN 2017-06-01 AND 2017-12-31
GROUP BY Title