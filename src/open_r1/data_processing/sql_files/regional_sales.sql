CREATE TABLE Customers (
    CustomerID integer PRIMARY KEY       -- Example: 1,
    Customer Names text                  -- Example: 'Avon Corp'
);

CREATE TABLE Products (
    ProductID integer PRIMARY KEY        -- Example: 1,
    Product Name text                    -- Example: 'Cookware'
);

CREATE TABLE Regions (
    StateCode text PRIMARY KEY           -- Example: 'AL',
    State text                           -- Example: 'Alabama',
    Region text                          -- Example: 'South'
);

CREATE TABLE Sales Team (
    SalesTeamID integer PRIMARY KEY      -- Example: 1,
    Sales Team text                      -- Example: 'Adam Hernandez',
    Region text                          -- Example: 'Northeast'
);

CREATE TABLE Store Locations (
    StoreID integer PRIMARY KEY          -- Example: 1,
    City Name text                       -- Example: 'Birmingham',
    County text                          -- Example: 'Shelby County/Jefferson County',
    StateCode text                       -- Example: 'NH',
    State text                           -- Example: 'Alabama',
    Type text                            -- Example: 'City',
    Latitude real                        -- Example: 33.52744,
    Longitude real                       -- Example: -86.79905,
    AreaCode integer                     -- Example: 205,
    Population integer                   -- Example: 212461,
    Household Income integer             -- Example: 89972,
    Median Income integer                -- Example: 31061,
    Land Area integer                    -- Example: 378353942,
    Water Area integer                   -- Example: 6591013,
    Time Zone text                       -- Example: 'America/Chicago',
    FOREIGN KEY (StateCode) REFERENCES Regions(StateCode)
);

CREATE TABLE Sales Orders (
    OrderNumber text PRIMARY KEY         -- Example: 'SO - 0001000',
    Sales Channel text                   -- Example: 'In-Store',
    WarehouseCode text                   -- Example: 'WARE-UHY1004',
    ProcuredDate text                    -- Example: '12/31/17',
    OrderDate text                       -- Example: '5/31/18',
    ShipDate text                        -- Example: '6/14/18',
    DeliveryDate text                    -- Example: '6/19/18',
    CurrencyCode text                    -- Example: 'USD',
    _SalesTeamID integer                 -- Example: 6,
    _CustomerID integer                  -- Example: 15,
    _StoreID integer                     -- Example: 259,
    _ProductID integer                   -- Example: 12,
    Order Quantity integer               -- Example: 5,
    Discount Applied real                -- Example: 0.075,
    Unit Price text                      -- Example: '0.0',
    Unit Cost text                       -- Example: '0.0',
    FOREIGN KEY (_ProductID) REFERENCES Products(ProductID),
    FOREIGN KEY (_StoreID) REFERENCES Store Locations(StoreID),
    FOREIGN KEY (_CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (_SalesTeamID) REFERENCES Sales Team(SalesTeamID)
);