






create database myDatabase1; -- this is to create a database


use myDatabase1; -- this is to use the database or select it from schema and set it as default












-- Create the Office table
CREATE TABLE Office (
    OfficeCode INT PRIMARY KEY, -- Office code is an integer primary key
    City VARCHAR(100), -- City with a character limit of 100
    Phone_Number VARCHAR(30), -- Phone number as VARCHAR due to special characters
    Address_Line1 VARCHAR(200), -- Address line 1 with a character limit of 200
    Address_Line2 VARCHAR(200), -- Address line 2 with a character limit of 200
    County VARCHAR(150), -- County with a character limit of 150
    Country VARCHAR(150), -- Country with a character limit of 150
    Postal_Code VARCHAR(30), -- Postal code as VARCHAR due to letters and character limit
    Territory VARCHAR(200) -- Territory with a character limit of 200
);

-- Create the Employee table
CREATE TABLE Employee (
    Employee_Number INT PRIMARY KEY, -- Employee number is an integer primary key
    Last_Name VARCHAR(100), -- Last name with a character limit of 100
    First_Name VARCHAR(100), -- First name with a character limit of 100
    Extension VARCHAR(50), -- Extension with a character limit of 50
    Email_Address VARCHAR(200), -- Email address with a character limit of 200
    Office_Code INT, -- Office code as an integer
    Job_Title VARCHAR(150), -- Job title with a character limit of 150
    Reports_To_Other_Employee INT, -- Employee's supervisor, multiple employees may report to one, foreign key relationship
    FOREIGN KEY (Office_Code) REFERENCES Office(OfficeCode), -- Foreign key reference to the Office table
    FOREIGN KEY (Reports_To_Other_Employee) REFERENCES Employee(Employee_Number) -- Foreign key reference to the Employee table
);

-- Create the Pharmaceutical Retail Customers table
CREATE TABLE Pharmaceutical_Retail_Customers (
    Customer_Number INT PRIMARY KEY, -- Customer number is an integer primary key
    Customer_Full_Name VARCHAR(250), -- Full customer name with a character limit of 250
    Phone_Number VARCHAR(30), -- Phone number as VARCHAR due to special characters
    Address_Line1 VARCHAR(200), -- Address line 1 with a character limit of 200
    Address_Line2 VARCHAR(200), -- Address line 2 with a character limit of 200
    City VARCHAR(200), -- City with a character limit of 200
    County VARCHAR(255), -- County with a character limit of 255
    Postal_Code VARCHAR(30), -- Postal code as VARCHAR due to letters and character limit
    Country VARCHAR(150), -- Country with a character limit of 150
    Sales_Amount DECIMAL(10, 2), -- Sales amount as a decimal with precision of 10, 2
    Representative_Employee_Number INT, -- Representative employee number
    Credit_Limit_Number INT, -- Credit limit number
    FOREIGN KEY (Representative_Employee_Number) REFERENCES Employee(Employee_Number) -- Foreign key reference to the Employee table
);

-- Create the Payment Information table
CREATE TABLE Payment_Information (
    Payment_ID INT PRIMARY KEY, -- Payment ID is an integer primary key
    Customer_Number INT, -- Customer number
    Cheque_Number VARCHAR(100), -- Cheque number as VARCHAR due to letters and character limit
    Payment_Date DATE, -- Payment date as a date
    Amount_Paid DECIMAL(10, 2), -- Amount paid as a decimal with precision of 10, 2
    FOREIGN KEY (Customer_Number) REFERENCES Pharmaceutical_Retail_Customers(Customer_Number) -- Foreign key reference to the Pharmaceutical_Retail_Customers table
);

-- Create the Product Line table
CREATE TABLE Product_Line (
    Product_Line_Text VARCHAR(200) PRIMARY KEY, -- Product line text is a primary key with a character limit of 200
    Description_ TEXT, -- Description with a data type for larger text
    Website VARCHAR(200), -- Website with a character limit of 200
    Product_Image VARCHAR(200)-- Product_Image with a character limit of 200
);

-- Create the Drugs table
CREATE TABLE Drugs (
    Product_Code INT PRIMARY KEY, -- Product code is an integer primary key
    Product_Name VARCHAR(200), -- Product name with a character limit of 200
    Product_Line_Text VARCHAR(255), -- Product line text with a character limit of 255
    Scale_Weight DECIMAL(5, 2), -- Scale weight as a decimal with precision of 5, 2
    Vendor VARCHAR(200), -- Vendor name with a character limit of 200
    Description_ TEXT, -- Description with a data type for larger text
    Quantity_In_Stock INT, -- Quantity in stock as an integer
    Buying_Price DECIMAL(10, 2), -- Buying price as a decimal with precision of 10, 2
    MSRP DECIMAL(10, 2) -- MSRP as a decimal with precision of 10, 2
);

-- Create the Order_ table
CREATE TABLE Order_ (
    Order_Number INT PRIMARY KEY, -- Order_Number is an integer primary key
    Order_Date DATE, -- Order_Date as a date
    Required_Date DATE,-- Required_Date as a date
    Shipped_Date DATE, -- Required_Date as a date
    Comments TEXT, -- Comments with a data type for larger text
    Order_Status VARCHAR(200), -- Order_Status is a varchar
    Customer_Number INT -- Customer number is an integer value
    
);



-- Create the Order_Line table
CREATE TABLE Order_Line (
    Order_Line_Number INT PRIMARY KEY, -- Order_Line_Number is an integer primary key
    Quantity_Ordered INT, -- Quantity ordered will be an integer value
    Price DECIMAL(10, 2), -- Price as a decimal with precision of 10, 2
    Order_Number INT, -- Order number
    Product_Code INT, -- Product code
    FOREIGN KEY (Order_Number) REFERENCES Order_(Order_Number), -- Foreign key reference to the Order table
    FOREIGN KEY (Product_Code) REFERENCES Drugs(Product_Code) -- Foreign key reference to the Drugs table
);









-- Inserting data into the Office table
INSERT INTO Office (OfficeCode, City, Phone_Number, Address_Line1, Address_Line2, County, Country, Postal_Code, Territory)
VALUES
    (1, 'London', '07626725978', '83 London Road', Null , 'Greater London', 'England', 'NE1 2FC', 'East Region'),
    (2, 'Leicester', '07374743120', '297 Welford Road', 'Flat 3', 'Leicestershire', 'England', 'LE4 2XF', 'West Region'),
    (3, 'Nottingham', '07275952011', '82 St Johns Road', NULL, 'Nottinghamshire', 'England', 'NG1 3GR', 'Central Region'),
    (4, 'Manchester', '07682058275', '25 Victoria Road', 'Flat 2', 'Manchester', 'England', 'M13 6FR', 'South Region');

   
-- Inserting data into the Employee table
INSERT INTO Employee (Employee_Number, Last_Name, First_Name, Extension, Email_Address, Office_Code, Job_Title, Reports_To_Other_Employee)
VALUES
    (1, 'James', 'Johns', 'Extension_1', 'james.johns@example.com', 1, 'Manager', NULL),
    (2, 'Christian', 'Smith', 'Extension_2', 'christian.smith@example.com', 1, 'Assistant Manager', 1),
    (3, 'Shaun', 'Evans', 'Extension_3', 'shaun.doe@example.com', 2, 'Sales Associate', 1),
    (4, 'Robert', 'Cash', 'Extension_4', 'robert.brown@example.com', 2, 'Sales Associate', 1);
    
    


-- Inserting data into the Pharmacutical_Retail_Customers table
INSERT INTO Pharmaceutical_Retail_Customers (Customer_Number, Customer_Full_Name,Phone_Number,Address_Line1,Address_Line2,City,County,Postal_Code,Country,Sales_Amount,Representative_Employee_Number,Credit_Limit_Number)
VALUES
    (1, 'Eva Smith', '07642718905', '23 Woodhouse road', NULL, 'London', 'Greater London', 'E11 6PT', 'England', 1200.00, 3, 4000),
    (2, 'Callum Wilson', '07357289355', '54 Matcham road', NULL, 'London', 'Greater London', 'E11 4PW', 'England', 1500.00, 4, 3000),
    (3, 'Olivia Davis', '07058392452', '32 Chichester road', NULL, 'London', 'Greater London', 'E11 4PH', 'England', 1570.00, 3, 4000),
    (4, 'James Stones', '07592455322', '73 Napier road', NULL, 'London', 'Greater London', 'E11 4PY', 'England', 4600.00, 4, 8000);

-- Inserting data into the Payment_Information table
INSERT INTO Payment_Information (Payment_ID, Customer_Number, Cheque_Number, Payment_Date, Amount_Paid)
VALUES
    (1, 1, 'CHQ54321', '2023-10-15', 1200.00),
    (2, 2, 'CHQ76479', '2023-10-17', 1500.00),
    (3, 3, 'CHQ03581', '2023-10-25', 1570.00),
    (4, 4, 'CHQ96301', '2023-10-30', 4600.00);

-- Inserting data into the Drugs table
INSERT INTO Drugs (Product_Code, Product_Name, Product_Line_Text, Scale_Weight, Vendor, Description_, Quantity_In_Stock, Buying_Price, MSRP)
VALUES
    (501, 'Drug A', 'Medicines', 0.5, 'Pfizer Inc.', 'Pain reliever', 500, 13.00, 21.99),
    (502, 'Drug B', 'Medicines', 0.75, 'GlaxoSmithKline', 'Cold medicine', 300, 5.50, 9.99),
    (503, 'Drug C', 'Vitamins', 0.25, 'Johnson & Johnson', 'Vitamin C supplement', 1000, 6.00, 11.99),
    (504, 'Drug D', 'Vitamins', 0.25, 'Novartis Pharmaceuticals', 'Multivitamin tablets', 800, 8.50, 13.99);

-- Inserting data into the Product_Line table
INSERT INTO Product_Line (Product_Line_Text, Description_, Website, Product_Image)
VALUES
    ('Medicines', 'Pharmaceutical drugs', 'http://www.meds.com', "Medicines.jpg"),
    ('Vitamins', 'Nutritional supplements', 'http://www.vitamins.com', "Vitamins.jpg"),
     ('Required Medicines', 'Pharmaceutical required drugs', 'http://www.requiredmeds.com', "Required Medicines.jpg"),
	('Random Vitamins', 'Nutritional supplements', 'http://www.randomvitamins.com',"Random Vitamins.jpg" );
    

-- Inserting data into the Order_  table
INSERT INTO Order_  (Order_Number, Order_Date, Required_Date, Shipped_Date, Order_Status, Comments, Customer_Number)
VALUES
    (1001, '2003-01-10', '2003-01-20', '2003-01-15', 'Shipped', 'Standard delivery', 1),
    (1002, '2023-02-05', '2023-02-15', '2023-02-10', 'Shipped', 'Express shipping', 2),
    (1003, '2023-03-20', '2023-03-30', '2023-03-25', 'Shipped', 'Bulk order', 3),
    (1004, '2023-04-15', '2023-04-25', NULL, 'Processing', 'Urgent order', 4);

-- Inserting data into the Order_Line  table
INSERT INTO Order_Line (Order_Line_Number, Order_Number, Product_Code, Quantity_Ordered, Price)
VALUES
    (1, 1001, 501, 100, 15.00),
    (2, 1002, 502, 50, 12.00),
    (3, 1003, 503, 200, 7.00),
    (4, 1004, 504, 30, 10.00);


















-- This SQL code creates a view named "Customer_Order_Restricted_Info" that combines customer and order information for specific criteria.

-- The SELECT statement specifies the columns that will be included in the view.
CREATE VIEW Customer_Order_Restricted_Info AS
SELECT
    C.Customer_Number AS "Customer ID", -- Selects the customer number and renames it as "Customer ID".
    CONCAT(C.Customer_Full_Name) AS "Customer Full Name", -- Combines the first name and last name to create the "Customer Full Name".
    CONCAT(C.Address_Line1, " ", COALESCE(C.Address_Line2, " "), " ", C.Postal_Code, " ", C.Country) AS "Customer Full Address", -- Combines address components to create the 'Customer Full Address'.
    O.Order_Status AS "Order Status", -- Selects the order status.
    OL.Quantity_Ordered AS "Quantity Ordered" -- Selects the quantity ordered.

-- The following lines specify the source tables and relationships.
FROM
    Pharmaceutical_Retail_Customers AS C -- Selects data from the "Pharmaceutical_Retail_Customers" table and assigns it the alias 'C'.
INNER JOIN
    `Order_` AS O ON C.Customer_Number = O.Customer_Number -- Joins the 'Customer' and 'Order' tables based on customer numbers.
INNER JOIN
    Order_Line AS OL ON O.Order_Number = OL.Order_Number -- Joins the 'Order' and 'OrderLine' tables based on order numbers.

-- The WHERE clause filters the data based on specific criteria.
WHERE
    C.Credit_Limit_Number > 1000 -- Only includes records where the credit limit is greater than 1000.
    AND YEAR(O.Shipped_Date) < 2010; -- Only includes records where the order's shipped date is before the year 2010.


select * from Customer_Order_Restricted_Info ;
