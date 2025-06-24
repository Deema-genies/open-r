CREATE TABLE sales_in_weather (
    date date                            -- Example: '2012-01-01',
    store_nbr integer                    -- Example: 1,
    item_nbr integer                     -- Example: 1,
    units integer                        -- Example: 0,
    PRIMARY KEY (date, store_nbr, item_nbr)
);

CREATE TABLE weather (
    station_nbr integer                  -- Example: 1,
    date date                            -- Example: '2012-01-01',
    tmax integer                         -- Example: -11,
    tmin integer                         -- Example: 31,
    tavg integer                         -- Example: 42,
    depart integer                       -- Example: 16,
    dewpoint integer                     -- Example: 36,
    wetbulb integer                      -- Example: 40,
    heat integer                         -- Example: 23,
    cool integer                         -- Example: 0,
    sunrise text                         -- Example: '',
    sunset text                          -- Example: '16:26:00',
    codesum text                         -- Example: ' ',
    snowfall real                        -- Example: 0.0,
    preciptotal real                     -- Example: 0.05,
    stnpressure real                     -- Example: 29.78,
    sealevel real                        -- Example: 29.92,
    resultspeed real                     -- Example: 3.6,
    resultdir integer                    -- Example: 20,
    avgspeed real                        -- Example: 4.6,
    PRIMARY KEY (station_nbr, date)
);

CREATE TABLE relation (
    store_nbr integer PRIMARY KEY        -- Example: 1,
    station_nbr integer                  -- Example: 1,
    FOREIGN KEY (station_nbr) REFERENCES weather(station_nbr),
    FOREIGN KEY (store_nbr) REFERENCES sales_in_weather(store_nbr)
);