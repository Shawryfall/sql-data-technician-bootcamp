-- ============================================================================
-- CORNER SHOP DATABASE
-- ============================================================================

CREATE DATABASE IF NOT EXISTS CornerShopDB;
USE CornerShopDB;

-- ============================================================================
-- TABLES
-- ============================================================================

-- Products
CREATE TABLE `Products` (
    `product_id` INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(100) NOT NULL,
    `category` VARCHAR(50),
    `price` DECIMAL(10,2) NOT NULL,
    `stock_quantity` INT DEFAULT 0,
    `barcode` VARCHAR(50) UNIQUE
);

-- Customers
CREATE TABLE `Customers` (
    `customer_id` INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(100) NOT NULL,
    `email` VARCHAR(100),
    `phone` VARCHAR(20),
    `loyalty_card_number` VARCHAR(20) UNIQUE,
    `points_balance` INT DEFAULT 0
);

-- Sales
CREATE TABLE `Sales` (
    `sale_id` INT PRIMARY KEY AUTO_INCREMENT,
    `sale_date` DATETIME DEFAULT CURRENT_TIMESTAMP,
    `customer_id` INT,
    `total_amount` DECIMAL(10,2),
    `payment_method` VARCHAR(20),
    FOREIGN KEY (`customer_id`) REFERENCES `Customers`(`customer_id`)
);

-- Sale Items (many-to-many between Sales and Products)
CREATE TABLE `Sale_Items` (
    `sale_item_id` INT PRIMARY KEY AUTO_INCREMENT,
    `sale_id` INT,
    `product_id` INT,
    `quantity` INT,
    `unit_price` DECIMAL(10,2),
    FOREIGN KEY (`sale_id`) REFERENCES `Sales`(`sale_id`),
    FOREIGN KEY (`product_id`) REFERENCES `Products`(`product_id`)
);

-- ============================================================================
-- SAMPLE DATA
-- ============================================================================

-- Products
INSERT INTO `Products` (`name`, `category`, `price`, `stock_quantity`, `barcode`)
VALUES 
    ('Milk 2L', 'Dairy', 1.50, 50, '5012345678900'),
    ('White Bread', 'Bakery', 0.95, 30, '5012345678901'),
    ('Coca Cola 2L', 'Beverages', 1.85, 40, '5012345678902'),
    ('Eggs 12pk', 'Dairy', 2.50, 25, '5012345678903'),
    ('Butter 500g', 'Dairy', 3.20, 20, '5012345678904');

-- Customers
INSERT INTO `Customers` (`name`, `email`, `loyalty_card_number`, `points_balance`)
VALUES 
    ('John Smith', 'john@email.com', 'LC001', 150),
    ('Sarah Johnson', 'sarah.j@email.com', 'LC002', 250);

-- Sales
INSERT INTO `Sales` (`customer_id`, `total_amount`, `payment_method`)
VALUES 
    (1, 8.45, 'Card'),
    (2, 12.30, 'Cash');

-- Sale Items
INSERT INTO `Sale_Items` (`sale_id`, `product_id`, `quantity`, `unit_price`)
VALUES 
    (1, 1, 2, 1.50),
    (1, 2, 1, 0.95),
    (2, 4, 1, 2.50),
    (2, 5, 1, 3.20);
