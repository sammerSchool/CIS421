-- 2019 Year Booking Summary
SELECT COUNT(B.BookingID) as Bookings, COUNT(DISTINCT N.BookingID) as Cancellations
	FROM HOTEL.Bookings as B, HOTEL.Cancellations as N
	WHERE N.BookingID != B.BookingID	AND
		( B.Checkout >= "2019-01-01"	AND
		  B.Checkout <  "2020-01-01" )