CREATE TABLE City (
    ID integer PRIMARY KEY               -- Example: 1,
    Name text                            -- Example: 'Kabul',
    CountryCode text                     -- Example: 'AFG',
    District text                        -- Example: 'Kabol',
    Population integer                   -- Example: 1780000,
    FOREIGN KEY (CountryCode) REFERENCES Country(Code)
);

CREATE TABLE Country (
    Code text PRIMARY KEY                -- Example: 'ABW',
    Name text                            -- Example: 'Aruba',
    Continent text                       -- Example: 'North America',
    Region text                          -- Example: 'Caribbean',
    SurfaceArea real                     -- Example: 193.0,
    IndepYear integer                    -- Example: 1919,
    Population integer                   -- Example: 103000,
    LifeExpectancy real                  -- Example: 78.4,
    GNP real                             -- Example: 828.0,
    GNPOld real                          -- Example: 793.0,
    LocalName text                       -- Example: 'Aruba',
    GovernmentForm text                  -- Example: 'Nonmetropolitan Territory of The Netherlands',
    HeadOfState text                     -- Example: 'Beatrix',
    Capital integer                      -- Example: 129,
    Code2 text                           -- Example: 'AW'
);

CREATE TABLE CountryLanguage (
    CountryCode text                     -- Example: 'ABW',
    Language text                        -- Example: 'Dutch',
    IsOfficial text                      -- Example: 'T',
    Percentage real                      -- Example: 5.3,
    PRIMARY KEY (CountryCode, Language),
    FOREIGN KEY (CountryCode) REFERENCES Country(Code)
);