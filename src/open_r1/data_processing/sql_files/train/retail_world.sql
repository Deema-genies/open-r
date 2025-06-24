CREATE TABLE Categories (
    CategoryID integer PRIMARY KEY       -- Example: 1,
    CategoryName text                    -- Example: 'Beverages',
    Description text                     -- Example: 'Soft drinks, coffees, teas, beers, and ales'
);

CREATE TABLE Customers (
    CustomerID integer PRIMARY KEY       -- Example: 1,
    CustomerName text                    -- Example: 'Island Trading',
    ContactName text                     -- Example: 'John Doe',
    Address text                         -- Example: '123 Main St',
    City text                            -- Example: 'Anytown',
    PostalCode text                      -- Example: '12345',
    Country text                         -- Example: 'USA'
);

CREATE TABLE Employees (
    EmployeeID integer PRIMARY KEY       -- Example: 1,
    LastName text                        -- Example: 'Davolio',
    FirstName text                       -- Example: 'Nancy',
    BirthDate date                       -- Example: '1968-12-08',
    Photo text                           -- Example: 'EmpID1.pic',
    Notes text                           -- Example: 'Education includes a BA in psychology from Colorado State University. She also c'
);

CREATE TABLE Shippers (
    ShipperID integer PRIMARY KEY        -- Example: 1,
    ShipperName text                     -- Example: 'Speedy Express',
    Phone text                           -- Example: '(503) 555-9831'
);

CREATE TABLE Suppliers (
    SupplierID integer PRIMARY KEY       -- Example: 1,
    SupplierName text                    -- Example: 'Exotic Liquid',
    ContactName text                     -- Example: 'Charlotte Cooper',
    Address text                         -- Example: '49 Gilbert St.',
    City text                            -- Example: 'Londona',
    PostalCode text                      -- Example: 'EC1 4SD',
    Country text                         -- Example: 'UK',
    Phone text                           -- Example: '(171) 555-2222'
);

CREATE TABLE Products (
    ProductID integer PRIMARY KEY        -- Example: 1,
    ProductName text                     -- Example: 'Chais',
    SupplierID integer                   -- Example: 1,
    CategoryID integer                   -- Example: 1,
    Unit text                            -- Example: '10 boxes x 20 bags',
    Price real                           -- Example: 18.0,
    FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID),
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);

CREATE TABLE Orders (
    OrderID integer PRIMARY KEY          -- Example: 10248,
    CustomerID integer                   -- Example: 90,
    EmployeeID integer                   -- Example: 5,
    OrderDate datetime                   -- Example: '1996-07-04',
    ShipperID integer                    -- Example: 3,
    FOREIGN KEY (ShipperID) REFERENCES Shippers(ShipperID),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);

CREATE TABLE OrderDetails (
    OrderDetailID integer PRIMARY KEY    -- Example: 1,
    OrderID integer                      -- Example: 10248,
    ProductID integer                    -- Example: 11,
    Quantity integer                     -- Example: 12,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);