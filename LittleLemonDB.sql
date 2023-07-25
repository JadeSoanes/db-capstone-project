CREATE DATABASE LittleLemonDB;
USE LittleLemonDB;

-- -----------------------------------------------------
-- CREATING TABLES
-- -----------------------------------------------------


-- -----------------------------------------------------
-- Table Staff
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Staff (
  `EmployeeID` INT NOT NULL,
  `StaffFirstName` VARCHAR(45) NOT NULL,
  `StaffSurname` VARCHAR(45) NOT NULL,
  `Role` VARCHAR(45) NOT NULL,
  `Salary` INT NOT NULL,
  `StaffPhone` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`EmployeeID`));


-- -----------------------------------------------------
-- Table Customers
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Customers (
  `CustomerID` INT NOT NULL,
  `CustomerFirstName` VARCHAR(45) NOT NULL,
  `CustomerSurname` VARCHAR(45) NOT NULL,
  `CustomerPhone` VARCHAR(45) NOT NULL,
  `CustomerEmail` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`CustomerID`));


-- -----------------------------------------------------
-- Table Bookings
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Bookings (
  `BookingID` INT NOT NULL,
  `Date` DATETIME NOT NULL,
  `TableNumber` INT NOT NULL,
  `CustomerID` INT NOT NULL,
  `BookingTime` DATETIME NOT NULL,
  `EmployeeID` INT NOT NULL,
  PRIMARY KEY (`BookingID`),
  FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
  FOREIGN KEY (EmployeeID) REFERENCES Staff(EmployeeID));


-- -----------------------------------------------------
-- Table Menu
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Menu (
  `ItemID` INT NOT NULL,
  `Cuisine` VARCHAR(45) NULL,
  `CourseType` VARCHAR(45) NOT NULL,
  `Price` INT NOT NULL,
  `ItemName` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ItemID`));


-- -----------------------------------------------------
-- Table Orders
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Orders (
  `OrderID` INT NOT NULL,
  `Quantity` INT NOT NULL,
  `Cost` INT NOT NULL,
  `BookingID` INT NOT NULL,
  `ItemID` INT NOT NULL,
  PRIMARY KEY (`OrderID`),
  FOREIGN KEY (BookingID) REFERENCES Bookings(BookingID),
  FOREIGN KEY (ItemID) REFERENCES Menu(ItemID));


-- -----------------------------------------------------
-- Table Order Delivery Status
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Order_Delivery_Status (
  `DeliveryDate` DATETIME NOT NULL,
  `Status` VARCHAR(45) NOT NULL,
  `OrderID` INT NOT NULL,
  `OrderStatusID` INT NOT NULL,
  PRIMARY KEY (`OrderStatusID`),
  FOREIGN KEY (OrderID) REFERENCES Orders(OrderID));


-- -----------------------------------------------------
-- Adding Data
-- -----------------------------------------------------

--  Staff

INSERT INTO Staff
(EmployeeID, StaffFirstName, StaffSurname, Role, Salary, StaffPhone)
VALUES
(1, 'Harry', 'Potter', 'Waiter', 15000, '07777777777'),
(2, 'Hermione', 'Granger', 'Manager', 25000, '07500088899'),
(3, 'Ron', 'Weasley', 'Chef', 19000, '078889911193'),
(4, 'Dean', 'Thomas', 'Waiter', 140000, '078666563892'),
(5, 'Seamus', 'Finnegan', 'Waiter', 15000, '078484927299'),
(6, 'Lavender', 'Brown', 'Chef', 20000, '078357394047');

-- Customers

INSERT INTO Customers
(CustomerID, CustomerFirstName, CustomerSurname, CustomerPhone, CustomerEmail)
VALUES
(101, 'Dudley', 'Dursley', '01618868000', 'dd@gmail.com'),
(102, 'Vernon', 'Dursley', '01618868001', 'vd@gmail.com'),
(103, 'Petunia', 'Dursley', '01618868002', 'pd@gmail.com'),
(104, 'Sirius', 'Black', '01618868004', 'sb@gmail.com'),
(105, 'Remus', 'Lupin', '01618868005', 'rl@gmail.com'),
(106, 'Nymphadora', 'Tonks', '01618868006', 'nt@gmail.com'),
(107, 'Minerva', 'McGonagall', '01618868007', 'mm@gmail.com'),
(108, 'Rubeus', 'Hagrid', '01618868008', 'rh@gmail.com'),
(109, 'Albus', 'Dumbledore', '01618868009', 'ad@gmail.com'),
(110, 'Severus', 'Snape', '01618868010', 'ss@gmail.com'),
(111, 'Luna', 'Lovegood', '01618868011', 'll@gmail.com'),
(112, 'Neville', 'Longbottom', '01618868012', 'nl@gmail.com'),
(113, 'Ginny', 'Weasley', '01618868013', 'gw@gmail.com'),
(114, 'Fred', 'Weasley', '01618868014', 'fw@gmail.com'),
(115, 'George', 'Weasley', '01618868015', 'gw@gmail.com'),
(116, 'Bill', 'Weasley', '01618868016', 'bw@gmail.com'),
(117, 'Fleur', 'Delacour', '01618868017', 'fd@gmail.com'),
(118, 'Cedric', 'Diggory', '01618868018', 'cd@gmail.com'),
(119, 'Cho', 'Chang', '01618868019', 'cc@gmail.com'),
(120, 'Oliver', 'Wood', '01618868020', 'ow@gmail.com'),
(121, 'Angelina', 'Johnson', '01618868021', 'aj@gmail.com'),
(122, 'Katie', 'Bell', '01618868022', 'kb@gmail.com'),
(123, 'Parvati', 'Patil', '01618868023', 'pp@gmail.com'),
(124, 'Padma', 'Patil', '01618868024', 'pp@gmail.com');

-- Bookings

INSERT INTO Bookings (BookingID, Date, TableNumber, CustomerID, BookingTime, EmployeeID)
VALUES
  (201, '2023-07-24', 1, 101, '18:00:00', 1),
  (202, '2023-07-25', 2, 102, '19:30:00', 2),
  (203, '2023-07-26', 3, 103, '20:15:00', 3),
  (204, '2023-07-27', 4, 104, '17:45:00', 4),
  (205, '2023-07-28', 5, 105, '21:00:00', 5),
  (206, '2023-07-29', 6, 106, '18:30:00', 6),
  (207, '2023-07-30', 1, 107, '19:00:00', 1),
  (208, '2023-07-31', 2, 108, '20:45:00', 2),
  (209, '2023-08-01', 3, 109, '18:15:00', 3),
  (210, '2023-08-02', 4, 110, '19:30:00', 4),
  (211, '2023-08-03', 5, 111, '20:30:00', 5),
  (212, '2023-08-04', 6, 112, '21:15:00', 6),
  (213, '2023-08-05', 1, 113, '17:30:00', 1),
  (214, '2023-08-06', 2, 114, '18:45:00', 2),
  (215, '2023-08-07', 3, 115, '19:00:00', 3),
  (216, '2023-08-08', 4, 116, '20:00:00', 4),
  (217, '2023-08-09', 5, 117, '18:30:00', 5),
  (218, '2023-08-10', 6, 118, '19:45:00', 6),
  (219, '2023-08-11', 1, 119, '21:00:00', 1),
  (220, '2023-08-12', 2, 120, '18:00:00', 2),
  (221, '2023-08-13', 3, 121, '19:30:00', 3),
  (222, '2023-08-14', 4, 122, '20:45:00', 4),
  (223, '2023-08-15', 5, 123, '18:15:00', 5),
  (224, '2023-08-16', 6, 124, '19:45:00', 6);

-- Menu

INSERT INTO Menu (ItemID, Cuisine, CourseType, Price, ItemName)
VALUES
  (001, 'French', 'starters', 12, 'French Onion Soup'),
  (002, 'Italian', 'starters', 10, 'Bruschetta'),
  (003, 'Greek', 'starters', 9, 'Tzatziki'),
  (004, 'French', 'starters', 15, 'Escargot'),
  (005, 'Italian', 'starters', 11, 'Caprese Salad'),
  (006, 'Greek', 'starters', 8, 'Spanakopita'),
  (007, 'French', 'main', 22, 'Coq au Vin'),
  (008, 'Italian', 'main', 20, 'Spaghetti Carbonara'),
  (009, 'Greek', 'main', 18, 'Moussaka'),
  (010, 'French', 'main', 25, 'Beef Bourguignon'),
  (011, 'Italian', 'main', 21, 'Margherita Pizza'),
  (012, 'Greek', 'main', 19, 'Souvlaki'),
  (013, 'French', 'dessert', 9, 'Creme Brulee'),
  (014, 'Italian', 'dessert', 8, 'Tiramisu'),
  (015, 'Greek', 'dessert', 7, 'Baklava'),
  (016, 'French', 'dessert', 10, 'Mille-Feuille'),
  (017, 'Italian', 'dessert', 8, 'Panna Cotta'),
  (018, 'Greek', 'dessert', 7, 'Galaktoboureko'),
  (019, 'French', 'drink', 5, 'Red Wine'),
  (020, 'Italian', 'drink', 5, 'White Wine'),
  (021, 'Greek', 'drink', 4, 'Ouzo'),
  (022, 'French', 'drink', 3, 'Sparkling Water'),
  (023, 'Italian', 'drink', 3, 'Limoncello'),
  (024, 'Greek', 'drink', 4, 'Greek Coffee'),
  (025, 'French', 'main', 23, 'Ratatouille'),
  (026, 'Italian', 'main', 22, 'Lasagna'),
  (027, 'Greek', 'main', 20, 'Pastitsio'),
  (028, 'French', 'main', 26, 'Duck Confit'),
  (029, 'Italian', 'main', 23, 'Risotto'),
  (030, 'Greek', 'main', 21, 'Stifado');
  

-- Orders

INSERT INTO Orders (OrderID, Quantity, Cost, BookingID, ItemID)
VALUES
  (0000001, 2, 24, 201, 001),
  (0000002, 3, 30, 202, 002),
  (0000003, 1, 9, 203, 003),
  (0000004, 2, 30, 204, 004),
  (0000005, 2, 22, 205, 005),
  (0000006, 1, 15, 206, 006),
  (0000007, 4, 88, 207, 007),
  (0000008, 3, 60, 208, 008),
  (0000009, 2, 36, 209, 009),
  (0000010, 2, 50, 210, 010),
  (0000011, 1, 21, 211, 011),
  (0000012, 3, 57, 212, 012),
  (0000013, 4, 36, 213, 013),
  (0000014, 1, 8, 214, 014),
  (0000015, 3, 21, 215, 015),
  (0000016, 2, 20, 216, 016),
  (0000017, 2, 16, 217, 017),
  (0000018, 1, 5, 218, 018),
  (0000019, 3, 15, 219, 019),
  (0000020, 2, 10, 220, 020),
  (0000021, 1, 4, 221, 021),
  (0000022, 4, 12, 222, 022),
  (0000023, 2, 40, 223, 023),
  (0000024, 2, 52, 224, 024),
  (0000025, 1, 23, 201, 025),
  (0000026, 3, 66, 202, 026),
  (0000027, 2, 38, 203, 027),
  (0000028, 1, 26, 204, 028),
  (0000029, 1, 23, 205, 029),
  (0000030, 2, 42, 206, 030);
  
 

-- Order Status

INSERT INTO Order_Delivery_Status (DeliveryDate, Status, OrderID, OrderStatusID)
VALUES
  ('2023-07-24', 'Waiting to Order', 0000001, 1),
  ('2023-07-25', 'Waiting to Pay', 0000002, 2),
  ('2023-07-26', 'Waiting for Food', 0000003, 3),
  ('2023-07-27', 'Waiting to Pay', 0000004, 4),
  ('2023-07-28', 'Waiting for Food', 0000005, 5),
  ('2023-07-29', 'Waiting to Order', 0000006, 6),
  ('2023-07-30', 'Waiting to Pay', 0000007, 7),
  ('2023-07-31', 'Waiting for Food', 0000008, 8),
  ('2023-08-01', 'Waiting to Pay', 0000009, 9),
  ('2023-08-02', 'Waiting to Order', 0000010, 10),
  ('2023-08-03', 'Waiting to Pay', 0000011, 11),
  ('2023-08-04', 'Waiting for Food', 0000012, 12),
  ('2023-08-05', 'Waiting to Pay', 0000013, 13),
  ('2023-08-06', 'Waiting for Food', 0000014, 14),
  ('2023-08-07', 'Waiting to Order', 0000015, 15),
  ('2023-08-08', 'Waiting to Pay', 0000016, 16),
  ('2023-08-09', 'Waiting for Food', 0000017, 17),
  ('2023-08-10', 'Waiting to Pay', 0000018, 18),
  ('2023-08-11', 'Waiting to Order', 0000019, 19),
  ('2023-08-12', 'Waiting to Pay', 0000020, 20),
  ('2023-08-13', 'Waiting for Food', 0000021, 21),
  ('2023-08-14', 'Waiting to Pay', 0000022, 22),
  ('2023-08-15', 'Waiting for Food', 0000023, 23),
  ('2023-08-16', 'Waiting to Order', 0000024, 24),
  ('2023-08-17', 'Waiting to Pay', 0000025, 25),
  ('2023-08-18', 'Waiting for Food', 0000026, 26),
  ('2023-08-19', 'Waiting to Pay', 0000027, 27),
  ('2023-08-20', 'Waiting for Food', 0000028, 28),
  ('2023-08-21', 'Waiting to Order', 0000029, 29),
  ('2023-08-22', 'Waiting to Pay', 0000030, 30);

-- -----------------------------------------------------
-- Queries
-- -----------------------------------------------------


-- Task 1: Create View

CREATE VIEW OrdersView AS
SELECT OrderID, Quantity, Cost
FROM Orders
WHERE Quantity > 2;

SELECT * FROM OrdersView;



-- Task 2: Join 

SELECT c.CustomerID, CONCAT(c.CustomerFirstName, ' ', c.CustomerSurname) AS 'FullName', o.OrderID, 
o.Cost, m.ItemName
FROM Customers c
JOIN Bookings b 
ON c.CustomerID = b.CustomerID
JOIN Orders o 
ON b.BookingID = o.BookingID
JOIN Menu m ON o.ItemID = m.ItemID
WHERE o.Cost > 150
ORDER BY o.Cost ASC;



-- Task 3: Subquery

SELECT ItemName
FROM Menu
WHERE ItemID = ANY (
    SELECT ItemID
    FROM Orders
    GROUP BY ItemID
    HAVING COUNT(*) > 2);



-- Task 4: Stored Procedure (Maximum Quanitity)

DELIMITER //

CREATE PROCEDURE GetMaxQuantity()
BEGIN
    DECLARE max_quantity INT;
    SELECT MAX(Quantity) INTO max_quantity
    FROM Orders;
    SELECT max_quantity AS 'Max Quantity in Order';
END //

DELIMITER ;

-- Using Stored Procedure

CALL GetMaxQuantity;



-- Task 5: Prepared Statement

PREPARE GetOrderDetail FROM '
    SELECT o.OrderID, o.Quantity, o.Cost
    FROM Orders o
    JOIN Bookings b ON o.BookingID = b.BookingID
    JOIN Customers c ON c.CustomerID = b.CustomerID
    WHERE c.CustomerID = ?';

-- Using Prepared Statement

SET @id = 101;
EXECUTE GetOrderDetail USING @id;



-- Task 6: Stored Procedure (Cancellation)

-- Create the Cancellations table
CREATE TABLE IF NOT EXISTS Cancellations (
  `Confirmation` VARCHAR(100) NOT NULL
);

DELIMITER //
CREATE PROCEDURE CancelOrder(IN input_orderID INT)
BEGIN
    DECLARE cancel_message VARCHAR(100);
    
    -- Add a record to the Cancellations table
    SET cancel_message = CONCAT('Order ', input_orderID, ' is cancelled');
    INSERT INTO Cancellations (`Confirmation`) VALUES (cancel_message);
    
    -- Delete the specified order from the Orders table
    DELETE FROM Orders WHERE OrderID = input_orderID;
END //
DELIMITER ;

-- Calling the procedure and checking if the table has been populated

CALL CancelOrder(105);

SELECT * FROM Cancellations;


-- Task 7: Add new data into Bookings Table (note I had to fabricate some columns that I
-- have but the course instructions don't have.

INSERT INTO Bookings
(BookingID, Date, TableNumber, CustomerID, BookingTime, EmployeeID)
VALUES
(1, '2022-10-10', 5, 101, '18:00:00', 6),
(2, '2022-11-12', 3, 103, '18:00:00', 6),
(3, '2022-10-11', 2, 102, '18:00:00', 6),
(4, '2022-10-13', 2, 101, '18:00:00', 6);


-- Task 8: Stored procedure to check table status

-- Create the stored procedure 'CheckBooking'
DELIMITER //
CREATE PROCEDURE CheckBooking(IN input_bookingDate DATETIME, IN input_tableNumber INT)
BEGIN
    DECLARE booking_status VARCHAR(100);
    
    -- Check if the table is already booked for the given date and table number
    IF EXISTS (
        SELECT 1
        FROM Bookings
        WHERE `Date` = input_bookingDate AND TableNumber = input_tableNumber
    ) THEN
        SET booking_status = CONCAT('Table ', input_tableNumber, ' is already booked');
    ELSE
        SET booking_status = CONCAT('Table ', input_tableNumber, ' is free');
    END IF;
    
    -- Return the booking status
    SELECT booking_status AS 'Booking status';
END //
DELIMITER ;

-- Calling the procedure:

CALL CheckBooking('2022-11-12',3);


-- Task 9: Create Stored Procedure with Transcation

-- Create the stored procedure 'AddValidBooking'
DELIMITER //
CREATE PROCEDURE AddValidBooking(IN input_bookingDate DATETIME, IN input_tableNumber INT)
BEGIN
    DECLARE booking_status VARCHAR(100);
    DECLARE customer_id INT DEFAULT 111;
    DECLARE employee_id INT DEFAULT 1;
    
    START TRANSACTION;
    
    -- Check if the table is already booked for the given date and table number
    IF EXISTS (
        SELECT 1
        FROM Bookings
        WHERE `Date` = input_bookingDate AND TableNumber = input_tableNumber
    ) THEN
        SET booking_status = CONCAT('Table ', input_tableNumber, ' is already booked - booking cancelled');
        ROLLBACK;
    ELSE
        -- Add the new booking record
        INSERT INTO Bookings (`Date`, TableNumber, CustomerID, BookingTime, EmployeeID)
        VALUES (input_bookingDate, input_tableNumber, customer_id, NOW(), employee_id);
        
        SET booking_status = CONCAT('Table ', input_tableNumber, ' is booked successfully');
        COMMIT;
    END IF;
    
    -- Return the booking status
    SELECT booking_status AS 'Booking status';
END //
DELIMITER ;

-- Call the Procedure

CALL AddValidBooking('2022-12-17', 6);



-- Task 10: Stored Procedure (Insert Into)

DELIMITER //

DELIMITER //
CREATE PROCEDURE AddBooking(
    IN p_BookingID INT,
    IN p_Date DATE,
    IN p_TableNumber INT,
    IN p_CustomerID INT,
    IN p_BookingTime TIME,
    IN p_EmployeeID INT
)
BEGIN
    INSERT INTO Bookings (BookingID, Date, TableNumber, CustomerID, BookingTime, EmployeeID)
    VALUES (p_BookingID, p_Date, p_TableNumber, p_CustomerID, p_BookingTime, p_EmployeeID);
    
    SELECT 'New Booking Added' AS Confirmation;
END //
DELIMITER ;


-- Calling the stored procedure

CALL AddBooking(225, '2023-07-07', 1, '112', '18:00:00', 1);



-- Task 11: Stored procedure (updating records)

DELIMITER //
CREATE PROCEDURE UpdateBooking(
    IN p_BookingID INT,
    IN p_BookingDate DATE
)
BEGIN
    UPDATE Bookings
    SET Date = p_BookingDate
    WHERE BookingID = p_BookingID;

    SELECT CONCAT('Booking ', p_BookingID, ' Updated') AS Confirmation;
END //
DELIMITER ;


-- Call the stored procedure

CALL UpdateBooking(207, '2023-01-01');


-- Task 12: Stored Procedure (Cancelling Booking)

DELIMITER //
CREATE PROCEDURE CancelBooking(
    IN p_BookingID INT
)
BEGIN
    DELETE FROM Bookings
    WHERE BookingID = p_BookingID;

    SELECT CONCAT('Booking ', p_BookingID, ' Cancelled') AS Confirmation;
END //
DELIMITER ;

-- Call Stored Procedure

CALL CancelBooking(203);

-- End of week two





