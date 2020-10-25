--View to display the most popular courses:

CREATE VIEW PopularCourses_vw AS
SELECT Course.CourseCode, Name, Length, StoveType, COUNT(ClassEnrollment.ClientNo) AS 'Students Enrolled'
FROM Course
JOIN Class
	ON Course.CourseCode = Class.CourseCode
JOIN ClassEnrollment
	ON Class.ReferenceNo = ClassEnrollment.ReferenceNo
GROUP BY Course.CourseCode, Name, Length, StoveType, Fee
ORDER BY COUNT(ClassEnrollment.ClientNo) DESC;


--View to display the total number of purchases for each membership type, their price, and the total revenue generated for each. Can also show which membership types are popular and least popular (list is ordered by the membership with the greatest number of purchases):


CREATE VIEW MembershipTotalRevenues_vw AS
SELECT TOP(100) PERCENT MembershipType.MembershipCode AS 'Membership Code', Name AS 'Membership Name', COUNT(MembershipPurchase.ClientNo) AS 'Number of Purchases', 
MembershipType.Price AS 'Membership Price', COUNT(MembershipPurchase.ClientNo) * MembershipType.Price AS 'Total Revenue'
FROM Client 
INNER JOIN MembershipPurchase
	ON Client.ClientNo = MembershipPurchase.ClientNo
INNER JOIN MembershipType
	ON MembershipPurchase.MembershipCode = MembershipType.MembershipCode

GROUP BY MembershipType.MembershipCode, Name, MembershipType.Price

ORDER BY COUNT(MembershipPurchase.ClientNo)*MembershipType.Price DESC; 



--View to specify unit of measurement for quantity of required food for a specific course (the unit of measurement is in a separate table from quantity required):

CREATE VIEW QuantityStats_vw AS
SELECT CourseCode AS 'Course', FoodItem.FoodName AS 'Food Item', Quantity, UnitOfMeasure AS 'Unit of Measurement'
FROM FoodItem
INNER JOIN RequiredFood 
		   ON FoodItem.FoodName = RequiredFood.FoodName
WHERE CourseCode LIKE 'ADVEASTASN'