# Step 1: Create the answers.sql file with Week 7 queries
cat <<EOL > ~/answers.sql
-- Week 7 Assignment: Database Design and Normalization
-- Student: Kemunto Ruth Osoro
-- Database: salesdb

-- Question 1: Achieving 1NF (First Normal Form)
CREATE TABLE ProductDetail_1NF (
    OrderID INT,
    CustomerName VARCHAR(50),
    Product VARCHAR(50)
);

INSERT INTO ProductDetail_1NF (OrderID, CustomerName, Product) VALUES
(101, 'John Doe', 'Laptop'),
(101, 'John Doe', 'Mouse'),
(102, 'Jane Smith', 'Tablet'),
(102, 'Jane Smith', 'Keyboard'),
(102, 'Jane Smith', 'Mouse'),
(103, 'Emily Clark', 'Phone');

SELECT * FROM ProductDetail_1NF;

-- Question 2: Achieving 2NF (Second Normal Form)
-- Orders table (order-level info)
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(50)
);

INSERT INTO Orders (OrderID, CustomerName) VALUES
(101, 'John Doe'),
(102, 'Jane Smith'),
(103, 'Emily Clark');

-- OrderItems table (product-level info)
CREATE TABLE OrderItems (
    OrderID INT,
    Product VARCHAR(50),
    Quantity INT,
    PRIMARY KEY (OrderID, Product),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

INSERT INTO OrderItems (OrderID, Product, Quantity) VALUES
(101, 'Laptop', 2),
(101, 'Mouse', 1),
(102, 'Tablet', 3),
(102, 'Keyboard', 1),
(102, 'Mouse', 2),
(103, 'Phone', 1);

SELECT * FROM Orders;
SELECT * FROM OrderItems;
EOL

# Step 2: Move the file to your Week 7 repository
mv ~/answers.sql ~/database-wk-7/
cd ~/database-wk-7

# Step 3: Add, commit, and push to GitHub
git add answers.sql
git commit -m "Submit Week 7 Database Design and Normalization assignment"
git push origin main
