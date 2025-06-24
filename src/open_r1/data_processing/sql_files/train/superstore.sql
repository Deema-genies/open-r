CREATE TABLE people (
    Customer ID text                     -- Example: 'Customer ID',
    Customer Name text                   -- Example: 'Alex Avila',
    Segment text                         -- Example: 'Consumer',
    Country text                         -- Example: 'United States',
    City text                            -- Example: 'Round Rock',
    State text                           -- Example: 'Texas',
    Postal Code integer                  -- Example: 78664,
    Region text                          -- Example: 'Central',
    PRIMARY KEY (Customer ID, Region)
);

CREATE TABLE product (
    Product ID text                      -- Example: 'FUR-BO-10000112',
    Product Name text                    -- Example: 'Sauder Camden County Barrister Bookcase, Planked Cherry Finish',
    Category text                        -- Example: 'furniture',
    Sub-Category text                    -- Example: 'Bookcases',
    Region text                          -- Example: 'Central',
    PRIMARY KEY (Product ID, Region)
);

CREATE TABLE central_superstore (
    Row ID integer PRIMARY KEY           -- Example: 1973,
    Order ID text                        -- Example: 'Order ID',
    Order Date date                      -- Example: '2013-01-03',
    Ship Date date                       -- Example: '2013-01-07',
    Ship Mode text                       -- Example: 'Standard Class',
    Customer ID text                     -- Example: 'Customer ID',
    Region text                          -- Example: 'Central',
    Product ID text                      -- Example: 'Product ID',
    Sales real                           -- Example: 16.448,
    Quantity integer                     -- Example: 2,
    Discount real                        -- Example: 0.2,
    Profit real                          -- Example: 5.5512,
    FOREIGN KEY (Product ID) REFERENCES product(Product ID),
    FOREIGN KEY (Region) REFERENCES product(Region),
    FOREIGN KEY (Customer ID) REFERENCES people(Customer ID),
    FOREIGN KEY (Region) REFERENCES people(Region)
);

CREATE TABLE east_superstore (
    Row ID integer PRIMARY KEY           -- Example: 4647,
    Order ID text                        -- Example: 'Order ID',
    Order Date date                      -- Example: '2013-01-05',
    Ship Date date                       -- Example: '2013-01-12',
    Ship Mode text                       -- Example: 'Standard Class',
    Customer ID text                     -- Example: 'MB-18085',
    Region text                          -- Example: 'East',
    Product ID text                      -- Example: 'OFF-AR-10003478',
    Sales real                           -- Example: 19.536,
    Quantity integer                     -- Example: 3,
    Discount real                        -- Example: 0.2,
    Profit real                          -- Example: 4.884,
    FOREIGN KEY (Product ID) REFERENCES product(Product ID),
    FOREIGN KEY (Region) REFERENCES product(Region),
    FOREIGN KEY (Customer ID) REFERENCES people(Customer ID),
    FOREIGN KEY (Region) REFERENCES people(Region)
);

CREATE TABLE south_superstore (
    Row ID integer PRIMARY KEY           -- Example: 10343,
    Order ID text                        -- Example: 'CA-2011-106054',
    Order Date date                      -- Example: '2013-01-06',
    Ship Date date                       -- Example: '2013-01-07',
    Ship Mode text                       -- Example: 'First Class',
    Customer ID text                     -- Example: 'JO-15145',
    Region text                          -- Example: 'South',
    Product ID text                      -- Example: 'OFF-AR-10002399',
    Sales real                           -- Example: 12.78,
    Quantity integer                     -- Example: 3,
    Discount real                        -- Example: 0.0,
    Profit real                          -- Example: 5.2398,
    FOREIGN KEY (Product ID) REFERENCES product(Product ID),
    FOREIGN KEY (Region) REFERENCES product(Region),
    FOREIGN KEY (Customer ID) REFERENCES people(Customer ID),
    FOREIGN KEY (Region) REFERENCES people(Region)
);

CREATE TABLE west_superstore (
    Row ID integer PRIMARY KEY           -- Example: 13583,
    Order ID text                        -- Example: 'CA-2011-130813',
    Order Date date                      -- Example: '2013-01-06',
    Ship Date date                       -- Example: '2013-01-08',
    Ship Mode text                       -- Example: 'Second Class',
    Customer ID text                     -- Example: 'LS-17230',
    Region text                          -- Example: 'West',
    Product ID text                      -- Example: 'Product ID',
    Sales real                           -- Example: 19.44,
    Quantity integer                     -- Example: 3,
    Discount real                        -- Example: 0.0,
    Profit real                          -- Example: 9.3312,
    FOREIGN KEY (Product ID) REFERENCES product(Product ID),
    FOREIGN KEY (Region) REFERENCES product(Region),
    FOREIGN KEY (Customer ID) REFERENCES people(Customer ID),
    FOREIGN KEY (Region) REFERENCES people(Region)
);