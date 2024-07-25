CREATE DATABASE food_delivery_db;
USE food_delivery_db;

CREATE TABLE food_items (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    price DECIMAL(10, 2)
);

CREATE TABLE orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    item_id INT,
    FOREIGN KEY (item_id) REFERENCES food_items(id)
);

-- Insert sample data
INSERT INTO food_items (name, price) VALUES ('Pizza', 10.99), ('Burger', 8.99), ('Pasta', 12.99);
