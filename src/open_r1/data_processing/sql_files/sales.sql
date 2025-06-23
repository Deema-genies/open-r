CREATE TABLE Customers (
    CustomerID integer PRIMARY KEY       -- Example: 1,
    FirstName text                       -- Example: 'Aaron',
    MiddleInitial text                   -- Example: 'A',
    LastName text                        -- Example: 'Alexander'
);

CREATE TABLE Employees (
    EmployeeID integer PRIMARY KEY       -- Example: 1,
    FirstName text                       -- Example: 'Abraham',
    MiddleInitial text                   -- Example: 'e',
    LastName text                        -- Example: 'Bennet'
);

CREATE TABLE Products (
    ProductID integer PRIMARY KEY        -- Example: 217,
    Name text                            -- Example: 'AWC Logo Cap',
    Price real                           -- Example: 1.6
);

CREATE TABLE Sales (
    SalesID integer PRIMARY KEY          -- Example: 553257,
    SalesPersonID integer                -- Example: 1,
    CustomerID integer                   -- Example: 1,
    ProductID integer                    -- Example: 1,
    Quantity integer                     -- Example: 1,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (SalesPersonID) REFERENCES Employees(EmployeeID)
);