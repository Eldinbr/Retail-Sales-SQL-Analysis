-- PostgreSQL schema
CREATE TABLE customers (
    customer_id VARCHAR(10) PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    segment VARCHAR(30),
    region VARCHAR(50),
    city VARCHAR(50),
    signup_date DATE
);

CREATE TABLE products (
    product_id VARCHAR(10) PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    unit_cost NUMERIC(10,2),
    unit_price NUMERIC(10,2)
);

CREATE TABLE orders (
    order_id VARCHAR(12) PRIMARY KEY,
    customer_id VARCHAR(10) REFERENCES customers(customer_id),
    order_date DATE,
    status VARCHAR(20)
);

CREATE TABLE order_items (
    order_id VARCHAR(12) REFERENCES orders(order_id),
    product_id VARCHAR(10) REFERENCES products(product_id),
    quantity INT,
    discount_pct NUMERIC(5,2),
    PRIMARY KEY (order_id, product_id)
);
