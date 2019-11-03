-- DEBUG: Dropping to make sure creation can be done
DROP SCHEMA HOTEL;


-- TABLE/SCHEMA CREATION --
CREATE SCHEMA HOTEL;


CREATE TABLE HOTEL.Rooms (
    RoomNumber                  INT             NOT NULL,       PRIMARY KEY(RoomNumber),       UNIQUE(RoomNumber),
    RoomType                    VARCHAR(50)     NOT NULL,
    PricePerNight               DECIMAL(5,2)    NOT NULL,
    MaxCapacity                 INT             NOT NULL,
    Occupied                    CHAR(1)         NOT NULL
);

CREATE TABLE HOTEL.Customers (
    CustomerID                  INT             NOT NULL,       PRIMARY KEY(CustomerID),       UNIQUE(CustomerID),
    FirstName                   VARCHAR(32)     NOT NULL,
    MiddleInitials              CHAR(1)         NOT NULL,
    LastName                    VARCHAR(32)     NOT NULL,
    Address                     VARCHAR(64)     NOT NULL,
    PostalCode                  VARCHAR(10)     NOT NULL,
    City                        VARCHAR(64)     NOT NULL,
    Country                     VARCHAR(64)     NOT NULL,
    Email                       VARCHAR(64)     NOT NULL,
    Phone                       VARCHAR(64)     NOT NULL
);

CREATE TABLE HOTEL.Bookings (
    BookingID                   INT             NOT NULL,       PRIMARY KEY(BookingID),        UNIQUE(BookingID),
    Arrival                     DATETIME        NOT NULL,
    Checkout                    DATETIME        NOT NULL,
    RoomNumber                  INT,                            FOREIGN KEY(RoomNumber)        REFERENCES Rooms(RoomNumber),
    CustomerID                  INT             NOT NULL,       FOREIGN KEY(CustomerID)        REFERENCES Customers(CustomerID),
    Nights                      INT             NOT NULL,
    BookingTime                 DATETIME        NOT NULL
);

CREATE TABLE HOTEL.Payments (
    BookingID                   INT             NOT NULL,       FOREIGN KEY(BookingID)         REFERENCES Bookings(BookingID),
    CustomerID                  INT             NOT NULL,       FOREIGN KEY(CustomerID)        REFERENCES Customers(CustomerID),
    Amount                      DECIMAL(5,2)    NOT NULL,
    Paid                        DECIMAL(5,2)                    DEFAULT 0.00,
    PayTime                     DATETIME,
    Invoice                     VARCHAR(50),
    Cancelled                   CHAR(1)                         DEFAULT "F"
);

CREATE TABLE HOTEL.Cancellations (
    BookingID                   INT             NOT NULL,       FOREIGN KEY(BookingID)         REFERENCES Bookings(BookingID),
    Arrival                     DATETIME        NOT NULL,
    Checkout                    DATETIME        NOT NULL,
    RoomNumber                  INT             NOT NULL,       FOREIGN KEY(RoomNumber)        REFERENCES Rooms(RoomNumber),
    CustomerID                  INT             NOT NULL,       FOREIGN KEY(CustomerID)        REFERENCES Customers(CustomerID),
    Nights                      INT             NOT NULL,
    CancelTime                  DATETIME        NOT NULL
);

