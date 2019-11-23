-- Bruce Wayne Decides to Retire after 8 Years of Work
UPDATE  HOTEL.Employee as E
SET     E.EndDate   = "2019-01-01"
WHERE   E.SSN       = "314283955";


-- Fire Employee that worked on room 1
--  Replacing the Employee with Frankenstien
UPDATE HOTEL.Rooms r1,              -- Replace the Employee with Frankenstien
(                               -- Obtain Housekeeper's ID for Room 1
	SELECT RoomNumber
	FROM HOTEL.Rooms as R, (
		SELECT 	HousekeeperId
		FROM 	HOTEL.Rooms
		WHERE 	RoomNumber = 1
		) as E
	WHERE E.HousekeeperId = R.HousekeeperId
) r2
SET     r1.HousekeeperId = 115  -- Assign Room 1 to Frankenstien
WHERE   r1.RoomNumber = r2.RoomNumber;

UPDATE  HOTEL.Employee as E         -- Fire the Employee After Replacing them
SET     E.EndDate   = CURDATE()
WHERE   E.SSN       = "123456789";


-- Getting Rid of 30+ Year Old House Keepers (Except for Frankenstien, he's cool)
--  Replace with Frankenstien, he's taking over
UPDATE HOTEL.Rooms r1,              -- Hand Job to Frankenstien
(                               -- Obtains the Employees that are 30+ and Housekeeprs (Aside from Frnken.)
    SELECT  * 
    FROM    HOTEL.Employee as E
    WHERE   NOT (E.LastName = "Frankenstien")       AND
                E.EmployeeType = "Housekeeper"     AND
                E.Birthdate < DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 30 YEAR)
) e1,
(                               -- OBtains Frankenstien' Info
    SELECT * 
    FROM HOTEL.Employee as EF
    WHERE EF.LastName = "Frankenstien"
) ef
SET 	r1.HousekeeperId = ef.EmployeeId        -- Assign Room to Frankenstien
WHERE 	r1.HousekeeperId = e1.EmployeeId;       -- Only where 30+ Year Olds are Assigned to that Room


UPDATE HOTEL.Employee E1,                       -- Fire the 30+ Year Old House Keepers 
(                               -- Select 30+ Year Old Housekeepers
	SELECT  * 
	FROM    HOTEL.Employee as E
	WHERE   NOT (E.LastName = "Frankenstien")       AND
				 E.EmployeeType = "Housekeeper"     AND
				 E.Birthdate < DATE_SUB(CURRENT_TIMESTAMP, INTERVAL 30 YEAR)
) E2
SET     E1.EndDate = CURDATE()  -- Set their Last Day today (Fire THEM!)
WHERE   E1.EmployeeId = E2.EmployeeId;