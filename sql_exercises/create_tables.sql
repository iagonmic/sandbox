-- Creating table customers
CREATE TABLE Customers(
customer_id INTEGER PRIMARY KEY,
first_name TEXT,
last_name TEXT,
age INTEGER,
country TEXT
);

-- Creating table orders
CREATE TABLE Orders(
order_id INTEGER PRIMARY KEY,
item TEXT,
amount INTEGER,
customer_id INTEGER,
FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- Creating table shippings
CREATE TABLE Shippings(
shipping_id INTEGER PRIMARY KEY,
status TEXT,
customer_id INTEGER
FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- Inserting values into table Customers
INSERT INTO Customers(customer_id, first_name, last_name, age, country) VALUES(1, "John", "Doe", 31, "USA");
INSERT INTO Customers(customer_id, first_name, last_name, age, country) VALUES(2, "Robert", "Luna", 22, "USA");
INSERT INTO Customers(customer_id, first_name, last_name, age, country) VALUES(3, "David", "Robinson", 22, "UK");
INSERT INTO Customers(customer_id, first_name, last_name, age, country) VALUES(4, "John", "Reinhardt", 25, "UK");
INSERT INTO Customers(customer_id, first_name, last_name, age, country) VALUES(5, "Betty", "Doe", 28, "USA");

-- Inserting values into table Orders
INSERT INTO Orders (order_id, item, amount, customer_id) VALUES (1, 'Keyboard', 400, 4);
INSERT INTO Orders (order_id, item, amount, customer_id) VALUES (2, 'Mouse', 300, 4);
INSERT INTO Orders (order_id, item, amount, customer_id) VALUES (3, 'Monitor', 12000, 3);
INSERT INTO Orders (order_id, item, amount, customer_id) VALUES (4, 'Keyboard', 400, 1);
INSERT INTO Orders (order_id, item, amount, customer_id) VALUES (5, 'Mousepad', 250, 2);

-- Inserting values into table Shippings
INSERT INTO Shippings (shipping_id, status, customer) VALUES (1, 'Pending', 2);
INSERT INTO Shippings (shipping_id, status, customer) VALUES (2, 'Pending', 4);
INSERT INTO Shippings (shipping_id, status, customer) VALUES (3, 'Delivered', 3);
INSERT INTO Shippings (shipping_id, status, customer) VALUES (4, 'Pending', 5);
INSERT INTO Shippings (shipping_id, status, customer) VALUES (5, 'Delivered', 1);
