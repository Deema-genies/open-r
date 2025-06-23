CREATE TABLE geographic (
    city text PRIMARY KEY                -- Example: 'alameda',
    county text                          -- Example: 'alameda county',
    region text                          -- Example: 'bay area'
);

CREATE TABLE generalinfo (
    id_restaurant integer PRIMARY KEY    -- Example: 1,
    label text                           -- Example: 'sparky's diner',
    food_type text                       -- Example: '24 hour diner',
    city text                            -- Example: 'san francisco',
    review real                          -- Example: 2.3,
    FOREIGN KEY (city) REFERENCES geographic(city)
);

CREATE TABLE location (
    id_restaurant integer PRIMARY KEY    -- Example: 1,
    street_num integer                   -- Example: 242,
    street_name text                     -- Example: 'church st',
    city text                            -- Example: 'san francisco',
    FOREIGN KEY (id_restaurant) REFERENCES generalinfo(id_restaurant),
    FOREIGN KEY (city) REFERENCES geographic(city)
);