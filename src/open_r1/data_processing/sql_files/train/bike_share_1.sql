CREATE TABLE station (
    id integer PRIMARY KEY               -- Example: 1,
    name text                            -- Example: 'Station A',
    lat real                             -- Example: 37.7749,
    long real                            -- Example: -122.4194,
    dock_count integer                   -- Example: 20,
    city text                            -- Example: 'San Francisco',
    installation_date text               -- Example: '2020-01-01'
);

CREATE TABLE status (
    station_id integer                   -- Example: 2,
    bikes_available integer              -- Example: 0,
    docks_available integer              -- Example: 25,
    time text                            -- Example: '2013/08/29 12:06:01'
);

CREATE TABLE trip (
    id integer PRIMARY KEY               -- Example: 1,
    duration integer                     -- Example: 30,
    start_date text                      -- Example: '2023-04-01 12:30:00',
    start_station_name text              -- Example: 'Station A',
    start_station_id integer             -- Example: 1,
    end_date text                        -- Example: '2023-04-01 12:30:00',
    end_station_name text                -- Example: 'Station B',
    end_station_id integer               -- Example: 2,
    bike_id integer                      -- Example: 101,
    subscription_type text               -- Example: 'Customer',
    zip_code integer                     -- Example: 94107
);

CREATE TABLE weather (
    date text                            -- Example: '8/29/2013',
    max_temperature_f integer            -- Example: 44,
    mean_temperature_f integer           -- Example: 68,
    min_temperature_f integer            -- Example: 61,
    max_dew_point_f integer              -- Example: 61,
    mean_dew_point_f integer             -- Example: 58,
    min_dew_point_f integer              -- Example: 56,
    max_humidity integer                 -- Example: 93,
    mean_humidity integer                -- Example: 75,
    min_humidity integer                 -- Example: 57,
    max_sea_level_pressure_inches real   -- Example: 30.07,
    mean_sea_level_pressure_inches real  -- Example: 30.02,
    min_sea_level_pressure_inches real   -- Example: 29.97,
    max_visibility_miles integer         -- Example: 10,
    mean_visibility_miles integer        -- Example: 10,
    min_visibility_miles integer         -- Example: 10,
    max_wind_Speed_mph integer           -- Example: 23,
    mean_wind_speed_mph integer          -- Example: 11,
    max_gust_speed_mph integer           -- Example: 28,
    precipitation_inches text            -- Example: '0',
    cloud_cover integer                  -- Example: 4,
    events text                          -- Example: '',
    wind_dir_degrees integer             -- Example: 286,
    zip_code text                        -- Example: '94041'
);