CREATE TABLE Air Carriers (
    Code integer PRIMARY KEY             -- Example: 1,
    Description text                     -- Example: 'American Airlines Inc.: AA'
);

CREATE TABLE Airports (
    Code text PRIMARY KEY                -- Example: '01A',
    Description text                     -- Example: 'Afognak Lake, AK: Afognak Lake Airport'
);

CREATE TABLE Airlines (
    FL_DATE text                         -- Example: '2022-01-01',
    OP_CARRIER_AIRLINE_ID integer        -- Example: 1,
    TAIL_NUM text                        -- Example: 'N12345',
    OP_CARRIER_FL_NUM integer            -- Example: 500,
    ORIGIN_AIRPORT_ID integer            -- Example: 1,
    ORIGIN_AIRPORT_SEQ_ID integer        -- Example: 1,
    ORIGIN_CITY_MARKET_ID integer        -- Example: 1,
    ORIGIN text                          -- Example: 'ORD',
    DEST_AIRPORT_ID integer              -- Example: 2,
    DEST_AIRPORT_SEQ_ID integer          -- Example: 2,
    DEST_CITY_MARKET_ID integer          -- Example: 2,
    DEST text                            -- Example: 'MDW',
    CRS_DEP_TIME integer                 -- Example: 1000,
    DEP_TIME integer                     -- Example: 1020,
    DEP_DELAY integer                    -- Example: 20,
    DEP_DELAY_NEW integer                -- Example: 30,
    ARR_TIME integer                     -- Example: 1200,
    ARR_DELAY integer                    -- Example: 60,
    ARR_DELAY_NEW integer                -- Example: 10,
    CANCELLED integer                    -- Example: 0,
    CANCELLATION_CODE text               -- Example: NULL,
    CRS_ELAPSED_TIME integer             -- Example: 120,
    ACTUAL_ELAPSED_TIME integer          -- Example: 120,
    CARRIER_DELAY integer                -- Example: 0,
    WEATHER_DELAY integer                -- Example: 0,
    NAS_DELAY integer                    -- Example: 0,
    SECURITY_DELAY integer               -- Example: 0,
    LATE_AIRCRAFT_DELAY integer          -- Example: 0,
    FOREIGN KEY (OP_CARRIER_AIRLINE_ID) REFERENCES Air Carriers(Code),
    FOREIGN KEY (DEST) REFERENCES Airports(Code),
    FOREIGN KEY (ORIGIN) REFERENCES Airports(Code)
);