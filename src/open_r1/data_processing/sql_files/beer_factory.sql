CREATE TABLE customers (
    CustomerID integer PRIMARY KEY       -- Example: 101811,
    First text                           -- Example: 'Kenneth',
    Last text                            -- Example: 'Walton',
    StreetAddress text                   -- Example: '6715 Commonwealth Dr',
    City text                            -- Example: 'Sacramento',
    State text                           -- Example: 'CA',
    ZipCode integer                      -- Example: 94256,
    Email text                           -- Example: 'walton.k76@fastmail.com',
    PhoneNumber text                     -- Example: '(916) 918-1561',
    FirstPurchaseDate date               -- Example: '2013-05-30',
    SubscribedToEmailList text           -- Example: 'FALSE',
    Gender text                          -- Example: 'M'
);

CREATE TABLE geolocation (
    LocationID integer PRIMARY KEY       -- Example: 0,
    Latitude real                        -- Example: 0.0,
    Longitude real                       -- Example: 0.0,
    FOREIGN KEY (LocationID) REFERENCES location(LocationID)
);

CREATE TABLE location (
    LocationID integer PRIMARY KEY       -- Example: 0,
    LocationName text                    -- Example: 'LOST',
    StreetAddress text                   -- Example: '6000 J St',
    City text                            -- Example: 'Sacramento',
    State text                           -- Example: 'CA',
    ZipCode integer                      -- Example: 95819,
    FOREIGN KEY (LocationID) REFERENCES geolocation(LocationID)
);

CREATE TABLE rootbeerbrand (
    BrandID integer PRIMARY KEY          -- Example: 10001,
    BrandName text                       -- Example: 'A&W',
    FirstBrewedYear integer              -- Example: 1919,
    BreweryName text                     -- Example: 'Dr Pepper Snapple Group',
    City text                            -- Example: 'Lodi',
    State text                           -- Example: 'CA',
    Country text                         -- Example: 'United States',
    Description text                     -- Example: 'After setting up the first A&W Root Beer stand in California in 1919, Roy Allen ',
    CaneSugar text                       -- Example: 'FALSE',
    CornSyrup text                       -- Example: 'TRUE',
    Honey text                           -- Example: 'FALSE',
    ArtificialSweetener text             -- Example: 'FALSE',
    Caffeinated text                     -- Example: 'FALSE',
    Alcoholic text                       -- Example: 'FALSE',
    AvailableInCans text                 -- Example: 'TRUE',
    AvailableInBottles text              -- Example: 'FALSE',
    AvailableInKegs text                 -- Example: 'FALSE',
    Website text                         -- Example: 'http://www.rootbeer.com/',
    FacebookPage text                    -- Example: 'https://www.facebook.com/Dads-Old-Fashioned-Root-Beer-and-Cream-Soda-11715999830',
    Twitter text                         -- Example: 'https://twitter.com/ilovedads',
    WholesaleCost real                   -- Example: 0.42,
    CurrentRetailPrice real              -- Example: 1.0
);

CREATE TABLE rootbeer (
    RootBeerID integer PRIMARY KEY       -- Example: 100000,
    BrandID integer                      -- Example: 10001,
    ContainerType text                   -- Example: 'Bottle',
    LocationID integer                   -- Example: 1,
    PurchaseDate date                    -- Example: '2015-07-03',
    FOREIGN KEY (BrandID) REFERENCES rootbeerbrand(BrandID),
    FOREIGN KEY (LocationID) REFERENCES location(LocationID),
    FOREIGN KEY (LocationID) REFERENCES geolocation(LocationID)
);

CREATE TABLE rootbeerreview (
    CustomerID integer                   -- Example: 101811,
    BrandID integer                      -- Example: 10012,
    StarRating integer                   -- Example: 5,
    ReviewDate date                      -- Example: '2013-07-15',
    Review text                          -- Example: 'You could have done better Sactown.',
    PRIMARY KEY (CustomerID, BrandID),
    FOREIGN KEY (BrandID) REFERENCES rootbeerbrand(BrandID),
    FOREIGN KEY (CustomerID) REFERENCES customers(CustomerID)
);

CREATE TABLE transaction (
    TransactionID integer PRIMARY KEY    -- Example: 100000,
    CreditCardNumber integer             -- Example: 6011583832864739,
    CustomerID integer                   -- Example: 864896,
    TransactionDate date                 -- Example: '2014-07-07',
    CreditCardType text                  -- Example: 'Discover',
    LocationID integer                   -- Example: 2,
    RootBeerID integer                   -- Example: 105661,
    PurchasePrice real                   -- Example: 3.0,
    FOREIGN KEY (RootBeerID) REFERENCES rootbeer(RootBeerID),
    FOREIGN KEY (LocationID) REFERENCES location(LocationID),
    FOREIGN KEY (CustomerID) REFERENCES customers(CustomerID)
);