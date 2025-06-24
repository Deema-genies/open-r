CREATE TABLE city (
    city_id integer PRIMARY KEY          -- Example: 100,
    city_name text                       -- Example: 'Union City',
    state text                           -- Example: 'New Jersey',
    population integer                   -- Example: 67088,
    area real                            -- Example: 1.3
);

CREATE TABLE customer (
    cust_id integer PRIMARY KEY          -- Example: 193,
    cust_name text                       -- Example: 'Advanced Fabricators',
    annual_revenue integer               -- Example: 39588651,
    cust_type text                       -- Example: 'manufacturer',
    address text                         -- Example: '5141 Summit Boulevard',
    city text                            -- Example: 'West Palm Beach',
    state text                           -- Example: 'FL',
    zip real                             -- Example: 33415.0,
    phone text                           -- Example: '(561) 683-3535'
);

CREATE TABLE driver (
    driver_id integer PRIMARY KEY        -- Example: 20,
    first_name text                      -- Example: 'Sue',
    last_name text                       -- Example: 'Newell',
    address text                         -- Example: '268 Richmond Ave',
    city text                            -- Example: 'Memphis',
    state text                           -- Example: 'TN',
    zip_code integer                     -- Example: 38106,
    phone text                           -- Example: '(901) 774-6569'
);

CREATE TABLE truck (
    truck_id integer PRIMARY KEY         -- Example: 1,
    make text                            -- Example: 'Peterbilt',
    model_year integer                   -- Example: 2005
);

CREATE TABLE shipment (
    ship_id integer PRIMARY KEY          -- Example: 1000,
    cust_id integer                      -- Example: 3660,
    weight real                          -- Example: 3528.0,
    truck_id integer                     -- Example: 1,
    driver_id integer                    -- Example: 23,
    city_id integer                      -- Example: 137,
    ship_date text                       -- Example: '2016-01-08',
    FOREIGN KEY (truck_id) REFERENCES truck(truck_id),
    FOREIGN KEY (driver_id) REFERENCES driver(driver_id),
    FOREIGN KEY (city_id) REFERENCES city(city_id),
    FOREIGN KEY (cust_id) REFERENCES customer(cust_id)
);