-- Create the database
CREATE DATABASE IF NOT EXISTS ECommerceStoreDB;
-- Use the database
USE ECommerceStoreDB;
-- Create the Customers table
CREATE TABLE Customers (
    CustomerID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    PhoneNumber VARCHAR(20),
    Address VARCHAR(255),
    RegistrationDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
-- Create the Products table
CREATE TABLE Products (
    ProductID INT AUTO_INCREMENT PRIMARY KEY,
    ProductName VARCHAR(100) NOT NULL,
    Description TEXT,
    Price DECIMAL(10, 2) NOT NULL,
    StockQuantity INT NOT NULL DEFAULT 0,
    CategoryID INT,
    ImageURL VARCHAR(255)
);
-- Create the Categories table
CREATE TABLE Categories (
    CategoryID INT AUTO_INCREMENT PRIMARY KEY,
    CategoryName VARCHAR(50) NOT NULL UNIQUE
);
-- Create the Orders table
CREATE TABLE Orders (
    OrderID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT,
    OrderDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    TotalAmount DECIMAL(10, 2) NOT NULL,
    OrderStatus VARCHAR(20) DEFAULT 'Pending',
    ShippingAddress VARCHAR(255),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);
-- Create the OrderItems table
CREATE TABLE OrderItems (
    OrderItemID INT AUTO_INCREMENT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT NOT NULL,
    PricePerUnit DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);
-- Create the Payments table
CREATE TABLE Payments (
    PaymentID INT AUTO_INCREMENT PRIMARY KEY,
    OrderID INT,
    PaymentDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PaymentMethod VARCHAR(50) NOT NULL,
    Amount DECIMAL(10, 2) NOT NULL,
    TransactionID VARCHAR(100) UNIQUE NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);
-- Create the Shipping table
CREATE TABLE Shipping (
    ShippingID INT AUTO_INCREMENT PRIMARY KEY,
    OrderID INT,
    ShippingDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    DeliveryDate TIMESTAMP,
    ShippingCarrier VARCHAR(50),
    TrackingNumber VARCHAR(100),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);
-- Add foreign key constraint to Products table
ALTER TABLE Products
ADD CONSTRAINT FK_CategoryProduct FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID);
-- Sample Data Inserts
-- Insert sample categories
INSERT INTO Categories (CategoryName)
VALUES ('Electronics'),
    ('Clothing'),
    ('Home & Kitchen');
-- Insert sample products
INSERT INTO Products (
        ProductName,
        Description,
        Price,
        StockQuantity,
        CategoryID,
        ImageURL
    )
VALUES (
        'Laptop',
        'High-performance laptop',
        1200.00,
        50,
        1,
        'laptop.jpg'
    ),
    (
        'T-Shirt',
        'Cotton T-Shirt',
        25.00,
        200,
        2,
        'tshirt.jpg'
    ),
    (
        'Blender',
        'High-speed blender',
        80.00,
        100,
        3,
        'blender.jpg'
    );
-- Insert sample customers
INSERT INTO Customers (FirstName, LastName, Email, PhoneNumber, Address)
VALUES (
        'Sibu',
        'Khemi',
        'sibu.khemi@gmail.com',
        '012-435-6894',
        '123 Main St'
    ),
    (
        'John',
        'Smith',
        'john.smith@gmail.com',
        '019-654-3210',
        '456 Elm St'
    );
-- Insert sample orders
INSERT INTO Orders (CustomerID, TotalAmount, ShippingAddress)
VALUES (1, 1225.00, '123 Main St'),
    (2, 50.00, '456 Elm St');
-- Insert sample order items
INSERT INTO OrderItems (OrderID, ProductID, Quantity, PricePerUnit)
VALUES (1, 1, 1, 1200.00),
    (1, 2, 1, 25.00),
    (2, 2, 2, 25.00);
-- Insert sample payments
INSERT INTO Payments (OrderID, PaymentMethod, Amount, TransactionID)
VALUES (1, 'Credit Card', 1225.00, 'TXN12345'),
    (2, 'PayPal', 50.00, 'TXN67890');
-- Insert sample shipping
INSERT INTO Shipping (OrderID, ShippingCarrier, TrackingNumber)
VALUES (1, 'UPS', 'TRACK123'),
    (2, 'FedEx', 'TRACK456');