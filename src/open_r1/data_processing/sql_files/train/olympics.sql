CREATE TABLE city (
    id integer PRIMARY KEY               -- Example: 1,
    city_name text                       -- Example: 'Barcelona'
);

CREATE TABLE games (
    id integer PRIMARY KEY               -- Example: 1,
    games_year integer                   -- Example: 1992,
    games_name text                      -- Example: '1992 Summer',
    season text                          -- Example: 'Summer'
);

CREATE TABLE games_city (
    games_id integer                     -- Example: 1,
    city_id integer                      -- Example: 1,
    FOREIGN KEY (games_id) REFERENCES games(id),
    FOREIGN KEY (city_id) REFERENCES city(id)
);

CREATE TABLE medal (
    id integer PRIMARY KEY               -- Example: 1,
    medal_name text                      -- Example: 'Gold'
);

CREATE TABLE noc_region (
    id integer PRIMARY KEY               -- Example: 1,
    noc text                             -- Example: 'AFG',
    region_name text                     -- Example: 'Afghanistan'
);

CREATE TABLE person (
    id integer PRIMARY KEY               -- Example: 1,
    full_name text                       -- Example: 'A Dijiang',
    gender text                          -- Example: 'M',
    height integer                       -- Example: 180,
    weight integer                       -- Example: 80
);

CREATE TABLE games_competitor (
    id integer PRIMARY KEY               -- Example: 1,
    games_id integer                     -- Example: 1,
    person_id integer                    -- Example: 1,
    age integer                          -- Example: 24,
    FOREIGN KEY (person_id) REFERENCES person(id),
    FOREIGN KEY (games_id) REFERENCES games(id)
);

CREATE TABLE person_region (
    person_id integer                    -- Example: 1,
    region_id integer                    -- Example: 42,
    FOREIGN KEY (region_id) REFERENCES noc_region(id),
    FOREIGN KEY (person_id) REFERENCES person(id)
);

CREATE TABLE sport (
    id integer PRIMARY KEY               -- Example: 1,
    sport_name text                      -- Example: 'Aeronautics'
);

CREATE TABLE event (
    id integer PRIMARY KEY               -- Example: 1,
    sport_id integer                     -- Example: 9,
    event_name text                      -- Example: 'Basketball Men's Basketball',
    FOREIGN KEY (sport_id) REFERENCES sport(id)
);

CREATE TABLE competitor_event (
    event_id integer                     -- Example: 1,
    competitor_id integer                -- Example: 1,
    medal_id integer                     -- Example: 4,
    FOREIGN KEY (medal_id) REFERENCES medal(id),
    FOREIGN KEY (event_id) REFERENCES event(id),
    FOREIGN KEY (competitor_id) REFERENCES games_competitor(id)
);