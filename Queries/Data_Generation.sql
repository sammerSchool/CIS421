INSERT INTO HOTEL.Rooms
  (RoomNumber,  RoomType,               PricePerNight,  MaxCapacity) 
Values 
  (1,           "Single Studio",        66.00,          1),
  (2,           "Family Studio #1",     66.00,          4),
  (3,           "Family Studio #2",     66.00,          4);



INSERT INTO HOTEL.Customers
  (CustomerID, FirstName, MiddleInitials, LastName, Address, PostalCode, State, 
   City, Country, Email, Phone)
VALUES
  (1, "Craig", "M", "Taylor", "1804 Maryland Avenue", "34622", "FL", 
    "Feather Sound", "United States", "CraigMTaylor@rhyta.com", "727-573-7334"),

  (2, "Marcel", NULL, "Moench", "Chausseestr. 79", "06502", NULL, 
    "Neinstedt", "Germany", "MarcelMoench@armyspy.com", "03947 96 60 40"),

  (3, "Maggie", NULL, "Schutter", "2768 George Avenue", "36460", "AL",
    "Monroeville", "United States", "MaggieSchutter@teleworm.us", "251-362-5437");

  

INSERT INTO HOTEL.Bookings
  (BookingID,   Arrival, Checkout, RoomNumber, CustomerID, Nights, BookingTIme),
VALUES
  (1, "2019-04-02 15:00:00", "2019-04-03 10:00:00", 1, 1, 1, "2019-04-01 10:59:57"),
  (2, "2019-04-05 12:00:00", "2019-04-12 10:00:00", 2, 2, 7, "2019-04-05 01:00:57"),
  (3, "2019-05-05 05:00:00", "2019-05-12 10:00:00", 1, 1, 7, "2019-05-04 13:05:30"),
  (4, "2019-05-05 10:00:00", "2019-05-12 10:00:00", 2, 2, 7, "2019-05-04 10:59:57"),
  (5, "2019-05-06 10:00:00", "2019-05-12 10:00:00", 3, 3, 6, "2019-05-04 15:21:50");



INSERT INTO HOTEL.Payments
  (BookingID, CustomerID, Amount, Paid, PayTime, Invoice, Cancelled)
VALUES
  (1, 1, 66.00, 66.00, "2019-04-01 10:59:57", 
  "Thank you for booking with us! Your Arrival Date is '04-02-19' at '3pm' till '04-03-19' at '10am'.",
  "F"),
  (2, 2, 462.00, 462.00, "2019-04-05 01:00:57",
  "Thank you for booking with us! Your Arrival Date is '04-05-19' at '12pm' till '04-12-19' at '10am'.",
  "F"),
  (3, 1, 462.00, 462.00, "2019-05-04 13:05:30",
  "Thank you for booking with us! Your Arrival Date is '05-05-19' at '5am' till '05-12-19' at '10am'.",
  "F"),
  (4, 2, 462.00, 462.00, "2019-05-04 10:59:57",
  "Thank you for booking with us! Your Arrival Date is '05-05-19' at '10am' till '05-12-19' at '10am'.",
  "T"),
  (5, 3, 396.00, 396.00, "2019-05-04 15:21:50",
  "Thank you for booking with us! Your Arrival Date is '05-06-19' at '10am' till '05-12-19' at '10am'.",
  "F");



INSERT INTO HOTEL.Cancellations
  (BookingID, Arrival, Checkout, RoomNumber, CustomerID, Nights, CancelTime)
VALUES
  (4, "2019-05-05 10:00:00", "2019-05-04 10:59:57", 2, 2, 7, "2019-05-04 16:30:15");