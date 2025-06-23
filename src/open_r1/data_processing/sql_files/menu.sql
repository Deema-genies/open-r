CREATE TABLE Dish (
    id integer PRIMARY KEY               -- Example: 1,
    name text                            -- Example: 'Pizza',
    description text                     -- Example: 'A classic Italian dish',
    menus_appeared integer               -- Example: 5,
    times_appeared integer               -- Example: 100,
    first_appeared integer               -- Example: 2010,
    last_appeared integer                -- Example: 2020,
    lowest_price real                    -- Example: 5.0,
    highest_price real                   -- Example: NULL
);

CREATE TABLE Menu (
    id integer PRIMARY KEY               -- Example: 20966,
    name text                            -- Example: 'The Modern',
    sponsor text                         -- Example: 'The Modern',
    event text                           -- Example: 'Dinner',
    venue text                           -- Example: 'RESTAURANT',
    place text                           -- Example: ' 9 W 53rd St, New York, NY 10019',
    physical_description text            -- Example: '4" by 14" broadside',
    occasion text                        -- Example: '',
    notes text                           -- Example: 'Restaurant at MoMa run by Danny Meyer's Union Square Hospitality Group',
    call_number text                     -- Example: '2008-0000',
    keywords text                        -- Example: NULL,
    language text                        -- Example: NULL,
    date date                            -- Example: '2008-03-03',
    location text                        -- Example: 'The Modern',
    location_type text                   -- Example: NULL,
    currency text                        -- Example: 'Dollars',
    currency_symbol text                 -- Example: '$',
    status text                          -- Example: 'complete',
    page_count integer                   -- Example: 6,
    dish_count integer                   -- Example: 29
);

CREATE TABLE MenuPage (
    id integer PRIMARY KEY               -- Example: 51978,
    menu_id integer                      -- Example: 12473,
    page_number integer                  -- Example: 2,
    image_id real                        -- Example: 4000009187.0,
    full_height integer                  -- Example: 616,
    full_width integer                   -- Example: 1808,
    uuid text                            -- Example: '510d47db-493c-a3d9-e040-e00a18064a99',
    FOREIGN KEY (menu_id) REFERENCES Menu(id)
);

CREATE TABLE MenuItem (
    id integer PRIMARY KEY               -- Example: 1,
    menu_page_id integer                 -- Example: 1389,
    price real                           -- Example: 0.4,
    high_price real                      -- Example: 1.0,
    dish_id integer                      -- Example: 1,
    created_at text                      -- Example: '2011-03-28 15:00:44 UTC',
    updated_at text                      -- Example: '2011-04-19 04:33:15 UTC',
    xpos real                            -- Example: 0.111429,
    ypos real                            -- Example: 0.254735,
    FOREIGN KEY (menu_page_id) REFERENCES MenuPage(id),
    FOREIGN KEY (dish_id) REFERENCES Dish(id)
);