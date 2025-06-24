CREATE TABLE customers (
    CustomerID integer PRIMARY KEY       -- Example: 3,
    Segment text                         -- Example: 'SME',
    Currency text                        -- Example: 'EUR'
);

CREATE TABLE gasstations (
    GasStationID integer PRIMARY KEY     -- Example: 44,
    ChainID integer                      -- Example: 13,
    Country text                         -- Example: 'CZE',
    Segment text                         -- Example: 'Value for money'
);

CREATE TABLE products (
    ProductID integer PRIMARY KEY        -- Example: 1,
    Description text                     -- Example: 'Rucní zadání'
);

CREATE TABLE transactions_1k (
    TransactionID integer PRIMARY KEY    -- Example: 1,
    Date date                            -- Example: '2012-08-24',
    Time text                            -- Example: '09:41:00',
    CustomerID integer                   -- Example: 31543,
    CardID integer                       -- Example: 486621,
    GasStationID integer                 -- Example: 3704,
    ProductID integer                    -- Example: 2,
    Amount integer                       -- Example: 28,
    Price real                           -- Example: 672.64
);

CREATE TABLE yearmonth (
    CustomerID integer                   -- Example: 39,
    Date text                            -- Example: '201112',
    Consumption real                     -- Example: 528.3,
    PRIMARY KEY (CustomerID, Date),
    FOREIGN KEY (CustomerID) REFERENCES customers(CustomerID)
);