CREATE TABLE Episode (
    episode_id text PRIMARY KEY          -- Example: 'S20-E1',
    season integer                       -- Example: 20,
    episode integer                      -- Example: 1,
    number_in_series integer             -- Example: 421,
    title text                           -- Example: 'Sex, Pies and Idiot Scrapes',
    summary text                         -- Example: 'Homer and Ned go into business together as bounty hunters, and Marge takes a job',
    air_date text                        -- Example: '2008-09-28',
    episode_image text                   -- Example: 'https://m.media-amazon.com/images/M/MV5BMTYwMzk2Njg5N15BMl5BanBnXkFtZTgwMzA2MDQ2',
    rating real                          -- Example: 7.2,
    votes integer                        -- Example: 1192
);

CREATE TABLE Person (
    name text PRIMARY KEY                -- Example: 'Adam Greeley',
    birthdate text                       -- Example: '1963-05-04',
    birth_name text                      -- Example: 'Marc Edward Wilmore',
    birth_place text                     -- Example: 'USA',
    birth_region text                    -- Example: 'California',
    birth_country text                   -- Example: 'USA',
    height_meters real                   -- Example: 1.85,
    nickname text                        -- Example: 'Jim'
);

CREATE TABLE Award (
    award_id integer PRIMARY KEY         -- Example: 325,
    organization text                    -- Example: 'Primetime Emmy Awards',
    year integer                         -- Example: 2009,
    award_category text                  -- Example: 'Primetime Emmy',
    award text                           -- Example: 'Outstanding Voice-Over Performance',
    person text                          -- Example: 'Dan Castellaneta',
    role text                            -- Example: 'Unknown',
    episode_id text                      -- Example: 'S20-E18',
    season text                          -- Example: NULL,
    song text                            -- Example: NULL,
    result text                          -- Example: 'winner',
    FOREIGN KEY (episode_id) REFERENCES Episode(episode_id),
    FOREIGN KEY (person) REFERENCES Person(name)
);

CREATE TABLE Character_Award (
    award_id integer                     -- Example: 325,
    character text                       -- Example: 'Homer Simpson',
    FOREIGN KEY (award_id) REFERENCES Award(award_id)
);

CREATE TABLE Credit (
    episode_id text                      -- Example: 'S20-E10',
    category text                        -- Example: 'Casting Department',
    person text                          -- Example: 'Bonita Pietila',
    role text                            -- Example: 'casting',
    credited text                        -- Example: 'true',
    FOREIGN KEY (person) REFERENCES Person(name),
    FOREIGN KEY (episode_id) REFERENCES Episode(episode_id)
);

CREATE TABLE Keyword (
    episode_id text                      -- Example: 'S20-E1',
    keyword text                         -- Example: '1930s to 2020s',
    PRIMARY KEY (episode_id, keyword),
    FOREIGN KEY (episode_id) REFERENCES Episode(episode_id)
);

CREATE TABLE Vote (
    episode_id text                      -- Example: 'S20-E1',
    stars integer                        -- Example: 2,
    votes integer                        -- Example: 16,
    percent real                         -- Example: 1.3,
    FOREIGN KEY (episode_id) REFERENCES Episode(episode_id)
);