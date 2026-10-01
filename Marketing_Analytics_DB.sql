-- 1. إنشاء قاعدة البيانات والانتقال إليها
CREATE DATABASE Marketing_Analytics_DB;
GO

USE Marketing_Analytics_DB;
GO

-- 2. إنشاء الجداول
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY IDENTITY(1,1),
    customer_name NVARCHAR(100),
    city NVARCHAR(50),
    gender NVARCHAR(10),
    age INT
);

CREATE TABLE Categories (
    category_id INT PRIMARY KEY IDENTITY(1,1),
    category_name NVARCHAR(50)
);

CREATE TABLE Products (
    product_id INT PRIMARY KEY IDENTITY(1,1),
    product_name NVARCHAR(100),
    category_id INT FOREIGN KEY REFERENCES Categories(category_id),
    price DECIMAL(10,2)
);

CREATE TABLE Sales (
    sale_id INT PRIMARY KEY IDENTITY(1,1),
    order_date DATE,
    customer_id INT FOREIGN KEY REFERENCES Customers(customer_id),
    product_id INT FOREIGN KEY REFERENCES Products(product_id),
    quantity INT,
    total_price DECIMAL(10,2)
);

-- 3. تعبئة البيانات في الجداول
INSERT INTO Customers (customer_name, city, gender, age) VALUES
('Ahmad Al-Mansour', 'Amman', 'Male', 28),
('Lina Hassan', 'Irbid', 'Female', 34),
('Sara Al-Otaibi', 'Amman', 'Female', 25),
('Omar Farooq', 'Zarqa', 'Male', 42),
('Maya Zaid', 'Aqaba', 'Female', 30);

INSERT INTO Categories (category_name) VALUES
('Electronics'),
('Fashion'),
('Home Appliances');

INSERT INTO Products (product_name, category_id, price) VALUES
('Wireless Headphones', 1, 50.00),
('Smart Watch', 1, 120.00),
('Casual Jacket', 2, 80.00),
('Coffee Machine', 3, 150.00),
('Running Shoes', 2, 60.00);

INSERT INTO Sales (order_date, customer_id, product_id, quantity, total_price) VALUES
('2026-01-15', 1, 1, 2, 100.00),
('2026-01-20', 2, 4, 1, 150.00),
('2026-02-10', 3, 2, 1, 120.00),
('2026-02-18', 1, 3, 1, 80.00),
('2026-03-05', 4, 5, 3, 180.00),
('2026-03-12', 5, 1, 1, 50.00),
('2026-03-25', 2, 2, 2, 240.00);