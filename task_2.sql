CREATE TABLE Books(
    book_id INT PRIMARY KEY,
    title VARCHAR(130)
    author_id FOREIGN KEY,
    price DOUBLE,
    publication_date DATE
),

CREATE TABLE Authors(
    author_id INT PRIMARY KEY,
    author_name VARCHAR(215),

),

CREATE TABLE Customers(
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(215),
    email VARCHAR(215),
    address TEXT
),

CREATE TABLE Orders(
    order_id INT PRIMARY KEY,
    customer_id INT FOREIGN KEY,
    order_date DATE
),

CREATE TABLE Order_Details(
    order_detailid INT PRIMARY KEY,
    order_id INT FOREIGN KEY,
    book_id INT FOREIGN KEY,
    quantity DOUBLE
);