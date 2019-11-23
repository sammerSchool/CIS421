-- CURRENT EMPLOYEES
--  Display the Names, Start Date, and Type of Current Employees
SELECT E.FirstName, E.LastName, E.EmployeeType, E.StartDate
FROM HOTEL.Employee as E
WHERE E.EndDate IS NULL;


-- FORMER EMPLOYEES
--  Display the Names, Start Date, and End Date
SELECT E.FirstName, E.LastName, E.StartDate, E.EndDate
FROM HOTEL.Employee as E
WHERE E.EndDate IS NOT NULL;