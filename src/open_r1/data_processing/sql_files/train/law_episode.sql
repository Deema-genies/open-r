CREATE TABLE Episode (
    episode_id text PRIMARY KEY          -- Example: 'tt0629146',
    series text                          -- Example: 'Law and Order',
    season integer                       -- Example: 9,
    episode integer                      -- Example: 1,
    number_in_series integer             -- Example: 182,
    title text                           -- Example: 'Cherished',
    summary text                         -- Example: 'New assistant DA Abbie Carmichael aggressively investigates an infant's death an',
    air_date date                        -- Example: '1998-09-23',
    episode_image text                   -- Example: 'https://m.media-amazon.com/images/M/MV5BODFmZmI2YTgtN2Y2Mi00ODA1LThjOTAtOTAzZWFm',
    rating real                          -- Example: 7.9,
    votes integer                        -- Example: 203
);

CREATE TABLE Keyword (
    episode_id text                      -- Example: 'tt0629239',
    keyword text                         -- Example: 'nun',
    PRIMARY KEY (episode_id, keyword),
    FOREIGN KEY (episode_id) REFERENCES Episode(episode_id)
);

CREATE TABLE Person (
    person_id text PRIMARY KEY           -- Example: 'nm0000210',
    name text                            -- Example: 'Julia Roberts',
    birthdate date                       -- Example: '1967-10-28',
    birth_name text                      -- Example: 'Julia Fiona Roberts',
    birth_place text                     -- Example: 'Smyrna',
    birth_region text                    -- Example: 'Georgia',
    birth_country text                   -- Example: 'USA',
    height_meters real                   -- Example: 1.73,
    nickname text                        -- Example: 'Jules'
);

CREATE TABLE Award (
    award_id integer PRIMARY KEY         -- Example: 258,
    organization text                    -- Example: 'International Monitor Awards',
    year integer                         -- Example: 1999,
    award_category text                  -- Example: 'Monitor',
    award text                           -- Example: 'Film Originated Television Series - Best Achievement',
    series text                          -- Example: 'Law and Order',
    episode_id text                      -- Example: 'tt0629149',
    person_id text                       -- Example: 'nm0937725',
    role text                            -- Example: 'Katrina Ludlow',
    result text                          -- Example: 'Winner',
    FOREIGN KEY (person_id) REFERENCES Person(person_id),
    FOREIGN KEY (episode_id) REFERENCES Episode(episode_id)
);

CREATE TABLE Credit (
    episode_id text                      -- Example: 'tt0629146',
    person_id text                       -- Example: 'nm0000973',
    category text                        -- Example: 'Additional Crew',
    role text                            -- Example: 'technical advisor',
    credited text                        -- Example: 'true',
    PRIMARY KEY (episode_id, person_id),
    FOREIGN KEY (person_id) REFERENCES Person(person_id),
    FOREIGN KEY (episode_id) REFERENCES Episode(episode_id)
);

CREATE TABLE Vote (
    episode_id text                      -- Example: 'tt0629146',
    stars integer                        -- Example: 10,
    votes integer                        -- Example: 36,
    percent real                         -- Example: 17.7,
    FOREIGN KEY (episode_id) REFERENCES Episode(episode_id)
);