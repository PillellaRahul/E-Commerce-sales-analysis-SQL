


'''total revenue'''
SELECT 
    SUM(TotalAmount) AS TotalRevenue
FROM 
    Orders;
    
    
 
 '''average order value'''
SELECT 
    AVG(TotalAmount) AS AverageOrderValue
FROM 
    Orders;
    
    
 
 ''' best selling products'''
    SELECT 
    p.Name AS ProductName,
    SUM(od.Quantity) AS TotalUnitsSold
FROM 
    OrderDetails od
JOIN 
    Products p ON od.ProductID = p.ProductID
GROUP BY 
    p.Name
ORDER BY 
    TotalUnitsSold DESC
LIMIT 5; -- Top 5 best-selling products



 '''Top Customers by Spending'''

SELECT 
    c.Name AS CustomerName,
    SUM(o.TotalAmount) AS TotalSpent
FROM 
    Orders o
JOIN 
    Customers c ON o.CustomerID = c.CustomerID
GROUP BY 
    c.Name
ORDER BY 
    TotalSpent DESC
LIMIT 5; -- Top 5 customers by spending



''' sales by region'''
SELECT 
    c.Region,
    SUM(o.TotalAmount) AS TotalSales
FROM 
    Orders o
JOIN 
    Customers c ON o.CustomerID = c.CustomerID
GROUP BY 
    c.Region
ORDER BY 
    TotalSales DESC;
    
    

'''Monthly sales trend'''
SELECT 
    DATE_FORMAT(OrderDate, '%Y-%m') AS Month,
    SUM(TotalAmount) AS MonthlyRevenue
FROM 
    Orders
GROUP BY 
    DATE_FORMAT(OrderDate, '%Y-%m')
ORDER BY 
    Month;


'''category wise sales'''

SELECT 
    p.Category,
    SUM(od.Quantity) AS TotalUnitsSold,
    SUM(od.Quantity * p.Price) AS TotalSalesValue
FROM 
    OrderDetails od
JOIN 
    Products p ON od.ProductID = p.ProductID
GROUP BY 
    p.Category
ORDER BY 
    TotalSalesValue DESC;
    
    
  '''Identifying Underperforming Products ''' 
    
    SELECT 
    p.Name AS ProductName,
    SUM(od.Quantity) AS TotalUnitsSold,
    SUM(od.Quantity * p.Price) AS TotalSalesValue
FROM 
    OrderDetails od
JOIN 
    Products p ON od.ProductID = p.ProductID
GROUP BY 
    p.Name
HAVING 
    TotalUnitsSold < 20 -- Threshold for underperforming
ORDER BY 
    TotalUnitsSold ASC;


'''Repeating customers'''

SELECT 
    c.Name AS CustomerName,
    COUNT(DISTINCT o.OrderID) AS NumberOfOrders,
    SUM(o.TotalAmount) AS TotalSpent
FROM 
    Orders o
JOIN 
    Customers c ON o.CustomerID = c.CustomerID
GROUP BY 
    c.Name
HAVING 
    NumberOfOrders > 1
ORDER BY 
    TotalSpent DESC;
    
    
    ''' order summary report'''
    
    
    SELECT 
    o.OrderID,
    c.Name AS CustomerName,
    o.OrderDate,
    SUM(od.Quantity) AS TotalItems,
    SUM(od.Quantity * p.Price) AS OrderValue
FROM 
    Orders o
JOIN 
    OrderDetails od ON o.OrderID = od.OrderID
JOIN 
    Products p ON od.ProductID = p.ProductID
JOIN 
    Customers c ON o.CustomerID = c.CustomerID
GROUP BY 
    o.OrderID, c.Name, o.OrderDate
ORDER BY 
    o.OrderDate DESC; name for this 


