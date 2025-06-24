CREATE TABLE country (
    origin integer PRIMARY KEY           -- Example: 1,
    country text                         -- Example: 'USA'
);

CREATE TABLE price (
    ID integer PRIMARY KEY               -- Example: 1,
    price real                           -- Example: 25561.59078
);

CREATE TABLE data (
    ID integer PRIMARY KEY               -- Example: 1,
    mpg real                             -- Example: 18.0,
    cylinders integer                    -- Example: 8,
    displacement real                    -- Example: 307.0,
    horsepower integer                   -- Example: 130,
    weight integer                       -- Example: 3504,
    acceleration real                    -- Example: 12.0,
    model integer                        -- Example: 70,
    car_name text                        -- Example: 'chevrolet chevelle malibu',
    FOREIGN KEY (ID) REFERENCES price(ID)
);

CREATE TABLE production (
    ID integer                           -- Example: 1,
    model_year integer                   -- Example: 1970,
    country integer                      -- Example: 1,
    PRIMARY KEY (ID, model_year),
    FOREIGN KEY (ID) REFERENCES price(ID),
    FOREIGN KEY (ID) REFERENCES data(ID),
    FOREIGN KEY (country) REFERENCES country(origin)
);