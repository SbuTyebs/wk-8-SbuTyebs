 # E-Commerce Store Database 🛍️
 This document outlines the schema and setup for the E-Commerce Store Database. This database is designed to manage customers, products, orders, payments, and shipping information.
 

 ## Database Schema 
 The database consists of the following tables:
 *   **Customers**: Stores customer information.
 *   **Products**: Stores product details.
 *   **Categories**: Stores product categories.
 *   **Orders**: Stores order information.
 *   **OrderItems**: Stores individual items within an order.
 *   **Payments**: Stores payment details.
 *   **Shipping**: Stores shipping information.
 

 ### Tables Details 
 
 1.  **Customers**
  *Stores customer information.*
  *   `CustomerID` (INT, AUTO_INCREMENT, PRIMARY KEY): Unique identifier for the customer.
  *   `FirstName` (VARCHAR(50), NOT NULL): Customer's first name.
  *   `LastName` (VARCHAR(50), NOT NULL): Customer's last name.
  *   `Email` (VARCHAR(100), UNIQUE, NOT NULL): Customer's email address (must be unique).
  *   `PhoneNumber` (VARCHAR(20)): Customer's phone number.
  *   `Address` (VARCHAR(255)): Customer's address.
  *   `RegistrationDate` (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP): Date when the customer registered.
 

 2.  **Products**
  *Stores product details.*
  *   `ProductID` (INT, AUTO_INCREMENT, PRIMARY KEY): Unique identifier for the product.
  *   `ProductName` (VARCHAR(100), NOT NULL): Name of the product.
  *   `Description` (TEXT): Detailed description of the product.
  *   `Price` (DECIMAL(10, 2), NOT NULL): Price of the product.
  *   `StockQuantity` (INT, NOT NULL, DEFAULT 0): Number of units currently in stock.
  *   `CategoryID` (INT): Category to which the product belongs (FOREIGN KEY referencing `Categories`).
  *   `ImageURL` (VARCHAR(255)): URL of the product image.
 

 3.  **Categories**
  *Stores product categories.*
  *   `CategoryID` (INT, AUTO_INCREMENT, PRIMARY KEY): Unique identifier for the category.
  *   `CategoryName` (VARCHAR(50), NOT NULL, UNIQUE): Name of the category (must be unique).
 

 4.  **Orders**
  *Stores order information.*
  *   `OrderID` (INT, AUTO_INCREMENT, PRIMARY KEY): Unique identifier for the order.
  *   `CustomerID` (INT): Customer who placed the order (FOREIGN KEY referencing `Customers`).
  *   `OrderDate` (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP): Date when the order was placed.
  *   `TotalAmount` (DECIMAL(10, 2), NOT NULL): Total amount of the order.
  *   `OrderStatus` (VARCHAR(20), DEFAULT 'Pending'): Current status of the order (e.g., Pending, Shipped, Delivered).
  *   `ShippingAddress` (VARCHAR(255)): Address where the order should be shipped.
 

 5.  **OrderItems**
  *Stores individual items within an order.*
  *   `OrderItemID` (INT, AUTO_INCREMENT, PRIMARY KEY): Unique identifier for the order item.
  *   `OrderID` (INT): Order to which the item belongs (FOREIGN KEY referencing `Orders`).
  *   `ProductID` (INT): Product included in the order (FOREIGN KEY referencing `Products`).
  *   `Quantity` (INT, NOT NULL): Quantity of the product in the order.
  *   `PricePerUnit` (DECIMAL(10, 2), NOT NULL): Price of the product at the time of the order.
 

 6.  **Payments**
  *Stores payment details.*
  *   `PaymentID` (INT, AUTO_INCREMENT, PRIMARY KEY): Unique identifier for the payment.
  *   `OrderID` (INT): Order for which the payment was made (FOREIGN KEY referencing `Orders`).
  *   `PaymentDate` (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP): Date when the payment was made.
  *   `PaymentMethod` (VARCHAR(50), NOT NULL): Method of payment (e.g., Credit Card, PayPal).
  *   `Amount` (DECIMAL(10, 2), NOT NULL): Amount paid.
  *   `TransactionID` (VARCHAR(100), UNIQUE, NOT NULL): Unique transaction identifier.
 

 7.  **Shipping**
  *Stores shipping information.*
  *   `ShippingID` (INT, AUTO_INCREMENT, PRIMARY KEY): Unique identifier for the shipping record.
  *   `OrderID` (INT): Order being shipped (FOREIGN KEY referencing `Orders`).
  *   `ShippingDate` (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP): Date when the order was shipped.
  *   `DeliveryDate` (TIMESTAMP): Estimated or actual delivery date.
  *   `ShippingCarrier` (VARCHAR(50)): Carrier used for shipping (e.g., UPS, FedEx).
  *   `TrackingNumber` (VARCHAR(100)): Tracking number for the shipment.

   # How to Use
 *   **Save the Script**: Save the provided SQL script as a `.sql` file. For example, you can name it `ecommerce_store.sql`. 💾
 *   **Execute the Script**: Open your MySQL client and run the script using the following command:

  ```bash
  mysql -u your_username -p < ecommerce_store.sql

 * Replace your_username with your actual MySQL username. 🔑

 * Verify: After executing the script, verify that the database and tables have been created successfully. Use the following SQL commands:

 SHOW DATABASES;
 USE ECommerceStoreDB;
 SHOW TABLES;

 * These commands will show you the list of databases and tables to confirm the successful creation. 🎉

