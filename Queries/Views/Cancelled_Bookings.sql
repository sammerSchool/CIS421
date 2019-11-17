-- Details of the Cancelled Bookings
--  Customer Name, Room, Cost, and Housekeeper of Room
SELECT C.FirstName, C.LastName, N.RoomNumber, 
	( SELECT FirstName 
	  FROM HOTEL.Employee as E 
      WHERE R.HousekeeperId = E.EmployeeId) as HouseKeeper,
	( SELECT Amount
	  FROM HOTEL.Payments as P
      WHERE P.BookingID = N.BookingID ) as Cost
      
FROM HOTEL.Cancellations as N, HOTEL.Customers as C, HOTEL.Rooms as R
	WHERE N.CustomerID = C.CustomerID AND
		  N.RoomNumber = R.RoomNumber