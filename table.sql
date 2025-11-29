CREATE TABLE Customers (
    CustomerID SERIAL PRIMARY KEY,
    CompanyName VARCHAR(100) NOT NULL,
    ContactName VARCHAR(50),
    ContactTitle VARCHAR(50),
    Address VARCHAR(100),
    City VARCHAR(50),
    Region VARCHAR(50),
    PostalCode VARCHAR(20),
    Country VARCHAR(50),
    Phone VARCHAR(30),
    Fax VARCHAR(30)
);

CREATE TABLE Products (
    ProductID SERIAL PRIMARY KEY,
    ProductName VARCHAR(100) NOT NULL,
    SupplierID INT,
    CategoryID INT,
    QuantityPerUnit VARCHAR(50),
    UnitPrice DECIMAL(10, 2),
    UnitsInStock INT,
    UnitsOnOrder INT,
    ReorderLevel INT,
    Discontinued BOOLEAN DEFAULT FALSE
);

CREATE TABLE Orders (
    OrderID SERIAL PRIMARY KEY,
    CustomerID INT,
    EmployeeID INT,
    OrderDate DATE,
    RequiredDate DATE,
    ShippedDate DATE,
    ShipVia INT,
    Freight DECIMAL(10, 2),
    ShipName VARCHAR(100),
    ShipAddress VARCHAR(100),
    ShipCity VARCHAR(50),
    ShipRegion VARCHAR(50),
    ShipPostalCode VARCHAR(20),
    ShipCountry VARCHAR(50),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE Order_Details (
    OrderID INT,
    ProductID INT,
    UnitPrice DECIMAL(10, 2) NOT NULL,
    Quantity INT NOT NULL,
    Discount DECIMAL(4, 2) DEFAULT 0,
    PRIMARY KEY (OrderID, ProductID),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

CREATE INDEX idx_orders_customerid ON Orders(CustomerID);
CREATE INDEX idx_orders_orderdate ON Orders(OrderDate);
CREATE INDEX idx_orderdetails_productid ON Order_Details(ProductID);

-- dummy data
INSERT INTO Customers (CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Country, Phone, Fax) VALUES
('Tech Solutions Inc', 'John Smith', 'CEO', '123 Tech Street', 'San Francisco', 'CA', '94102', 'USA', '+1-415-555-0100', '+1-415-555-0101'),
('Global Trade Ltd', 'Sarah Johnson', 'Sales Manager', '456 Commerce Ave', 'New York', 'NY', '10001', 'USA', '+1-212-555-0200', '+1-212-555-0201'),
('Euro Imports GmbH', 'Hans Mueller', 'Owner', 'Hauptstrasse 789', 'Munich', NULL, '80331', 'Germany', '+49-89-555-0300', '+49-89-555-0301'),
('Pacific Distributors', 'Yuki Tanaka', 'Director', '321 Harbor Blvd', 'Tokyo', NULL, '100-0001', 'Japan', '+81-3-555-0400', '+81-3-555-0401'),
('Maple Leaf Trading', 'Emma Wilson', 'Account Manager', '654 King Street', 'Toronto', 'ON', 'M5H 1A1', 'Canada', '+1-416-555-0500', '+1-416-555-0501'),
('Southern Wholesale Co', 'Carlos Rodriguez', 'Owner', '987 Main Street', 'Mexico City', NULL, '06000', 'Mexico', '+52-55-555-0600', '+52-55-555-0601'),
('Nordic Supplies AB', 'Lars Anderson', 'Sales Representative', 'Storgatan 147', 'Stockholm', NULL, '11122', 'Sweden', '+46-8-555-0700', '+46-8-555-0701'),
('British Imports Ltd', 'James Brown', 'Managing Director', '258 Oxford Street', 'London', NULL, 'W1D 1BS', 'UK', '+44-20-555-0800', '+44-20-555-0801'),
('Mediterranean Foods', 'Maria Rossi', 'Owner', 'Via Roma 369', 'Rome', NULL, '00100', 'Italy', '+39-06-555-0900', '+39-06-555-0901'),
('Aussie Traders Pty', 'Michael Davis', 'Sales Director', '741 George Street', 'Sydney', 'NSW', '2000', 'Australia', '+61-2-555-1000', '+61-2-555-1001');

INSERT INTO Orders (CustomerID, EmployeeID, OrderDate, RequiredDate, ShippedDate, ShipVia, Freight, ShipName, ShipAddress, ShipCity, ShipRegion, ShipPostalCode, ShipCountry) VALUES
(1, 5, '2024-07-04', '2024-08-01', '2024-07-16', 3, 32.38, 'Tech Solutions Inc', '123 Tech Street', 'San Francisco', 'CA', '94102', 'USA'),
(1, 6, '2024-08-19', '2024-09-16', '2024-08-23', 1, 11.61, 'Tech Solutions Inc', '123 Tech Street', 'San Francisco', 'CA', '94102', 'USA'),
(2, 4, '2024-09-18', '2024-10-16', '2024-09-27', 2, 65.83, 'Global Trade Ltd', '456 Commerce Ave', 'New York', 'NY', '10001', 'USA'),
(3, 3, '1998-10-08', '2024-11-05', '2024-10-12', 1, 41.34, 'Euro Imports GmbH', 'Hauptstrasse 789', 'Munich', NULL, '80331', 'Germany'),
(4, 4, '2024-11-10', '2024-12-08', NULL, 3, 51.30, 'Pacific Distributors', '321 Harbor Blvd', 'Tokyo', NULL, '100-0001', 'Japan'),
(5, 8, '2024-09-05', '2024-10-03', '2024-09-09', 2, 58.17, 'Maple Leaf Trading', '654 King Street', 'Toronto', 'ON', 'M5H 1A1', 'Canada'),
(6, 1, '2024-08-27', '2024-09-24', '2024-09-05', 1, 13.97, 'Southern Wholesale Co', '987 Main Street', 'Mexico City', NULL, '06000', 'Mexico'),
(7, 7, '2024-10-22', '2024-11-19', '2024-11-01', 3, 23.29, 'Nordic Supplies AB', 'Storgatan 147', 'Stockholm', NULL, '11122', 'Sweden'),
(8, 2, '1998-07-15', '2024-08-12', '2024-07-21', 2, 81.91, 'British Imports Ltd', '258 Oxford Street', 'London', NULL, 'W1D 1BS', 'UK'),
(9, 9, '1998-11-01', '2024-11-29', '2024-11-08', 1, 140.51, 'Mediterranean Foods', 'Via Roma 369', 'Rome', NULL, '00100', 'Italy');

INSERT INTO Products (ProductName, SupplierID, CategoryID, QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued) VALUES
('Chai', 1, 1, '10 boxes x 20 bags', 18.00, 39, 0, 10, FALSE),
('Chang', 1, 1, '24 - 12 oz bottles', 19.00, 17, 40, 25, FALSE),
('Aniseed Syrup', 1, 2, '12 - 550 ml bottles', 10.00, 13, 70, 25, FALSE),
('Chef Lager Antons Cajun Seasoning', 2, 2, '48 - 6 oz jars', 22.00, 53, 0, 0, FALSE),
('Chef Lager Antons Gumbo Mix', 2, 2, '36 boxes', 21.35, 0, 0, 0, TRUE),
('Grandmas Boysenberry Spread', 3, 2, '12 - 8 oz jars', 25.00, 120, 0, 25, FALSE),
('Uncle Bobs Organic Dried Pears', 3, 7, '12 - 1 lb pkgs.', 30.00, 15, 0, 10, FALSE),
('Northwoods Cranberry Sauce', 3, 2, '12 - 12 oz jars', 40.00, 6, 0, 0, FALSE),
('Mishi Kobe Niku', 4, 6, '18 - 500 g pkgs.', 97.00, 29, 0, 0, FALSE),
('Ikura', 4, 8, '12 - 200 ml jars', 31.00, 31, 0, 0, FALSE),
('Queso Cabrales', 5, 4, '1 kg pkg.', 21.00, 22, 30, 30, FALSE),
('Queso Manchego La Pastora', 5, 4, '10 - 500 g pkgs.', 38.00, 86, 0, 0, FALSE),
('Konbu', 6, 8, '2 kg box', 6.00, 24, 0, 5, FALSE),
('Tofu', 6, 7, '40 - 100 g pkgs.', 23.25, 35, 0, 0, FALSE),
('Genen Shouyu', 6, 2, '24 - 250 ml bottles', 15.50, 39, 0, 5, FALSE);


INSERT INTO Order_Details (OrderID, ProductID, UnitPrice, Quantity, Discount) VALUES
(1, 1, 18.00, 12, 0.00),
(1, 2, 19.00, 10, 0.00),
(1, 3, 10.00, 5, 0.00),
(2, 4, 22.00, 9, 0.00),
(2, 5, 21.35, 40, 0.00),
(3, 6, 25.00, 10, 0.00),
(3, 7, 30.00, 35, 0.15),
(3, 8, 40.00, 15, 0.15),
(4, 9, 97.00, 6, 0.00),
(4, 10, 31.00, 15, 0.00),
(4, 11, 21.00, 20, 0.00),
(5, 12, 38.00, 40, 0.05),
(5, 13, 6.00, 25, 0.05),
(5, 14, 23.25, 40, 0.05),
(6, 1, 18.00, 20, 0.00),
(6, 2, 19.00, 25, 0.00),
(6, 3, 10.00, 30, 0.00),
(7, 4, 22.00, 35, 0.15),
(7, 5, 21.35, 15, 0.15),
(8, 6, 25.00, 50, 0.20),
(8, 7, 30.00, 35, 0.20),
(8, 8, 40.00, 25, 0.20),
(9, 9, 97.00, 30, 0.00),
(9, 10, 31.00, 15, 0.00),
(9, 11, 21.00, 10, 0.00),
(10, 12, 38.00, 50, 0.00),
(10, 13, 6.00, 70, 0.05),
(10, 14, 23.25, 35, 0.05);
