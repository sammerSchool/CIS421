

DROP DATABASE IF EXISTS HOTEL;
CREATE DATABASE HOTEL;
USE  HOTEL;


CREATE TABLE HOTEL.Customers (
    CustomerID                  INT             NOT NULL,       PRIMARY KEY(CustomerID),       UNIQUE(CustomerID),
    FirstName                   VARCHAR(32)     NOT NULL,
    MiddleInitials              CHAR(1),
    LastName                    VARCHAR(32)     NOT NULL,
    Address                     VARCHAR(64)     NOT NULL,
    PostalCode                  VARCHAR(10)     NOT NULL,
    State                       CHAR(2),
    City                        VARCHAR(64)     NOT NULL,
    Country                     VARCHAR(64)     NOT NULL,
    Email                       VARCHAR(64)     NOT NULL,
    Phone                       VARCHAR(64)     NOT NULL
);

CREATE TABLE HOTEL.Employee (
    FirstName                   VARCHAR(32)     NOT NULL,
    LastName                    VARCHAR(32)     NOT NULL,
    EmployeeId                  INT             NOT NULL,       PRIMARY KEY(EmployeeId),        UNIQUE(EmployeeId),
    SSN                         VARCHAR(9)      NOT NULL,                                       UNIQUE(SSN),
    Birthdate                   DATE            NOT NULL,
    Address                     VARCHAR(64)     NOT NULL,
    PostalCode                  VARCHAR(10)     NOT NULL,
    State                       CHAR(2),
    City                        VARCHAR(64)     NOT NULL,
    Country                     VARCHAR(64)     NOT NULL,
    Email						VARCHAR(64),
    PhoneNumber					VARCHAR(11)		NOT NULL,
    EmployeeType                VARCHAR(32)     NOT NULL,
    StartDate                   DATE            NOT NULL,
    EndDate                     DATE            DEFAULT NULL
);

CREATE TABLE HOTEL.Rooms (
    RoomNumber                  INT             NOT NULL,       PRIMARY KEY(RoomNumber),       UNIQUE(RoomNumber),
    RoomType                    VARCHAR(50)     NOT NULL,
    PricePerNight               DECIMAL(5,2)    NOT NULL,
    MaxCapacity                 INT             NOT NULL,
    Occupied                    CHAR(1)         NOT NULL        DEFAULT "F",
    HousekeeperId               INT,       						FOREIGN KEY (HousekeeperId)     REFERENCES  Employee(EmployeeId)
        ON DELETE SET NULL          ON UPDATE CASCADE
);

CREATE TABLE HOTEL.Bookings (
    BookingID                   INT             NOT NULL,       PRIMARY KEY(BookingID),        UNIQUE(BookingID),
    Arrival                     DATETIME        NOT NULL,
    Checkout                    DATETIME        NOT NULL,
    RoomNumber                  INT,                            FOREIGN KEY(RoomNumber)        REFERENCES Rooms(RoomNumber)
        ON DELETE SET NULL          ON UPDATE CASCADE,
    CustomerID                  INT             NOT NULL,       FOREIGN KEY(CustomerID)        REFERENCES Customers(CustomerID)
        ON DELETE CASCADE           ON UPDATE CASCADE,
    Nights                      INT             NOT NULL,
    BookingTime                 DATETIME        NOT NULL
);

CREATE TABLE HOTEL.Payments (
    BookingID                   INT             NOT NULL,       FOREIGN KEY(BookingID)         REFERENCES Bookings(BookingID)
        ON DELETE CASCADE           ON UPDATE CASCADE,
    CustomerID                  INT             NOT NULL,       FOREIGN KEY(CustomerID)        REFERENCES Customers(CustomerID)
        ON DELETE CASCADE           ON UPDATE CASCADE,
    Amount                      DECIMAL(5,2)    NOT NULL,
    Paid                        DECIMAL(5,2)    NOT NULL        DEFAULT 0.00,
    PayTime                     DATETIME,
    Invoice                     VARCHAR(256),
    Cancelled                   CHAR(1)         NOT NULL        DEFAULT "F"
);

CREATE TABLE HOTEL.Cancellations (
    BookingID                   INT             NOT NULL,       FOREIGN KEY(BookingID)         REFERENCES Bookings(BookingID)
        ON DELETE CASCADE           ON UPDATE CASCADE,
    Arrival                     DATETIME        NOT NULL,
    Checkout                    DATETIME        NOT NULL,
    RoomNumber                  INT,                            FOREIGN KEY(RoomNumber)        REFERENCES Rooms(RoomNumber)
        ON DELETE SET NULL          ON UPDATE CASCADE,
    CustomerID                  INT             NOT NULL,       FOREIGN KEY(CustomerID)        REFERENCES Customers(CustomerID)
        ON DELETE CASCADE           ON UPDATE CASCADE,
    Nights                      INT             NOT NULL,
    CancelTime                  DATETIME        NOT NULL
);


