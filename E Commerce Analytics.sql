CREATE DATABASE E_commerce_Sales_Analysis;

use E_commerce_Sales_Analysis


CREATE TABLE Customers (
    CustomerID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Region VARCHAR(50),
    Email VARCHAR(100),
    Phone VARCHAR(15)
);

CREATE TABLE Products (
    ProductID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Category VARCHAR(50),
    Price DECIMAL(10, 2) NOT NULL,
    Stock INT DEFAULT 0
);

CREATE TABLE Orders (
    OrderID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT NOT NULL,
    OrderDate DATE NOT NULL,
    TotalAmount DECIMAL(10, 2) DEFAULT 0,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);


CREATE TABLE OrderDetails (
    OrderDetailID INT AUTO_INCREMENT PRIMARY KEY,
    OrderID INT NOT NULL,
    ProductID INT NOT NULL,
    Quantity INT NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);


INSERT INTO Customers (Name, Region, Email, Phone)
VALUES 
('Alice Johnson', 'North', 'alice@example.com', '1234567890'),
('Bob Smith', 'West', 'bob@example.com', '9876543210'),
('Carol Lee', 'East', 'carol@example.com', '5678901234'),
('David Kim', 'South', 'david@example.com', '6789012345');


INSERT INTO Products (Name, Category, Price, Stock)
VALUES 
('Laptop', 'Electronics', 1000.00, 50),
('Headphones', 'Electronics', 150.00, 200),
('Coffee Maker', 'Home Appliances', 80.00, 100),
('Desk Chair', 'Furniture', 120.00, 75),
('Notebook', 'Stationery', 5.00, 500);


INSERT INTO Orders (CustomerID, OrderDate, TotalAmount)
VALUES 
(1, '2024-12-01', 1150.00),
(2, '2024-12-02', 300.00),
(3, '2024-12-03', 125.00),
(4, '2024-12-04', 100.00);


INSERT INTO OrderDetails (OrderID, ProductID, Quantity)
VALUES 
(1, 1, 1),  -- Order 1 includes 1 Laptop
(1, 2, 1),  -- Order 1 includes 1 Headphone
(2, 3, 2),  -- Order 2 includes 2 Coffee Makers
(3, 5, 25), -- Order 3 includes 25 Notebooks
(4, 4, 1);  -- Order 4 includes 1 Desk Chair


'''query to combine all the tables'''

SELECT 
    o.OrderID,
    c.Name AS CustomerName,
    c.Region,
    c.Email,
    p.Name AS ProductName,
    p.Category,
    p.Price,
    od.Quantity,
    o.OrderDate,
    o.TotalAmount
FROM 
    Orders o
JOIN 
    Customers c ON o.CustomerID = c.CustomerID
JOIN 
    OrderDetails od ON o.OrderID = od.OrderID
JOIN 
    Products p ON od.ProductID = p.ProductID;


