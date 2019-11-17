-- All Bookings in May that are not Cancelled
SELECT C.FirstName, C.LastName, B.Arrival, B.Checkout, B.Nights, B.RoomNumber
	FROM HOTEL.Bookings as B, HOTEL.Customers as C, HOTEL.Cancellations as N
	WHERE   N.BookingID != B.BookingID  AND
		      B.CustomerID = C.CustomerID AND 
        ( B.Arrival >= "2019-05-01"   AND 
          B.Arrival <  "2019-06-01" )