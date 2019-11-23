-- Update Room Status Based on Current Date (Occupied or Not)
UPDATE HOTEL.Rooms R,
(										-- Get Booking Info for Rooms that are Occupied
	SELECT *
	FROM HOTEL.Bookings
	WHERE 	Arrival  >= NOW() AND
			Checkout < NOW()
) B
SET 	R.Occupied = "T"                -- Set Rooms that are Currently Occupied
WHERE	R.RoomNumber = B.RoomNumber;

UPDATE HOTEL.Rooms R,
(										-- Get Booking Info for Rooms that are NOT Occupied
	SELECT *
	FROM HOTEL.Bookings
	WHERE 	NOT(Arrival  >= NOW() AND
			    Checkout < NOW())
) B
SET 	R.Occupied = "F"                -- Set Rooms that are NOT Currently Occupied
WHERE	R.RoomNumber = B.RoomNumber;