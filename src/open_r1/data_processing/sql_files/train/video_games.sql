CREATE TABLE genre (
    id integer PRIMARY KEY               -- Example: 1,
    genre_name text                      -- Example: 'Action'
);

CREATE TABLE game (
    id integer PRIMARY KEY               -- Example: 44,
    genre_id integer                     -- Example: 4,
    game_name text                       -- Example: '2 Games in 1: Sonic Advance & ChuChu Rocket!',
    FOREIGN KEY (genre_id) REFERENCES genre(id)
);

CREATE TABLE platform (
    id integer PRIMARY KEY               -- Example: 1,
    platform_name text                   -- Example: 'Wii'
);

CREATE TABLE publisher (
    id integer PRIMARY KEY               -- Example: 1,
    publisher_name text                  -- Example: '10TACLE Studios'
);

CREATE TABLE game_publisher (
    id integer PRIMARY KEY               -- Example: 1,
    game_id integer                      -- Example: 10866,
    publisher_id integer                 -- Example: 369,
    FOREIGN KEY (publisher_id) REFERENCES publisher(id),
    FOREIGN KEY (game_id) REFERENCES game(id)
);

CREATE TABLE game_platform (
    id integer PRIMARY KEY               -- Example: 1,
    game_publisher_id integer            -- Example: 8564,
    platform_id integer                  -- Example: 4,
    release_year integer                 -- Example: 2007,
    FOREIGN KEY (platform_id) REFERENCES platform(id),
    FOREIGN KEY (game_publisher_id) REFERENCES game_publisher(id)
);

CREATE TABLE region (
    id integer PRIMARY KEY               -- Example: 1,
    region_name text                     -- Example: 'North America'
);

CREATE TABLE region_sales (
    region_id integer                    -- Example: 1,
    game_platform_id integer             -- Example: 50,
    num_sales real                       -- Example: 3.5,
    FOREIGN KEY (region_id) REFERENCES region(id),
    FOREIGN KEY (game_platform_id) REFERENCES game_platform(id)
);