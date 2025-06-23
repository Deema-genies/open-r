CREATE TABLE borders (
    Country1 text                        -- Example: 'A',
    Country2 text                        -- Example: 'CH',
    Length real                          -- Example: 164.0,
    PRIMARY KEY (Country1, Country2)
);

CREATE TABLE city (
    Name text                            -- Example: 'Aachen',
    Country text                         -- Example: 'D',
    Province text                        -- Example: 'Nordrhein Westfalen',
    Population integer                   -- Example: 247113,
    Longitude real                       -- Example: 10.0,
    Latitude real                        -- Example: 57.0,
    PRIMARY KEY (Name, Province)
);

CREATE TABLE continent (
    Name text PRIMARY KEY                -- Example: 'Africa',
    Area real                            -- Example: 30254700.0
);

CREATE TABLE country (
    Name text                            -- Example: 'Afghanistan',
    Code text PRIMARY KEY                -- Example: 'A',
    Capital text                         -- Example: 'Vienna',
    Province text                        -- Example: 'Vienna',
    Area real                            -- Example: 83850.0,
    Population integer                   -- Example: 8023244
);

CREATE TABLE desert (
    Name text PRIMARY KEY                -- Example: 'Arabian Desert',
    Area real                            -- Example: 50000.0,
    Longitude real                       -- Example: 26.0,
    Latitude real                        -- Example: 33.0
);

CREATE TABLE economy (
    Country text PRIMARY KEY             -- Example: 'A',
    GDP real                             -- Example: 152000.0,
    Agriculture real                     -- Example: 2.0,
    Service real                         -- Example: 34.0,
    Industry real                        -- Example: 64.0,
    Inflation real                       -- Example: 2.3
);

CREATE TABLE encompasses (
    Country text                         -- Example: 'A',
    Continent text                       -- Example: 'Europe',
    Percentage real                      -- Example: 100.0,
    PRIMARY KEY (Country, Continent)
);

CREATE TABLE ethnicGroup (
    Country text                         -- Example: 'GE',
    Name text                            -- Example: 'Abkhaz',
    Percentage real                      -- Example: 1.8,
    PRIMARY KEY (Country, Name)
);

CREATE TABLE geo_desert (
    Desert text                          -- Example: 'Desert',
    Country text                         -- Example: 'Coun',
    Province text                        -- Example: 'Province',
    PRIMARY KEY (Desert, Country, Province)
);

CREATE TABLE geo_estuary (
    River text                           -- Example: 'River',
    Country text                         -- Example: 'Coun',
    Province text                        -- Example: 'Province',
    PRIMARY KEY (River, Country, Province)
);

CREATE TABLE geo_island (
    Island text                          -- Example: 'Aland',
    Country text                         -- Example: 'Alan',
    Province text                        -- Example: '650',
    PRIMARY KEY (Island, Country, Province)
);

CREATE TABLE geo_lake (
    Lake text                            -- Example: 'Lake',
    Country text                         -- Example: 'Coun',
    Province text                        -- Example: 'Province',
    PRIMARY KEY (Lake, Country, Province)
);

CREATE TABLE geo_mountain (
    Mountain text                        -- Example: 'Mountain',
    Country text                         -- Example: 'Coun',
    Province text                        -- Example: 'Province',
    PRIMARY KEY (Mountain, Country, Province)
);

CREATE TABLE geo_river (
    River text                           -- Example: 'River',
    Country text                         -- Example: 'Coun',
    Province text                        -- Example: 'Province',
    PRIMARY KEY (River, Country, Province)
);

CREATE TABLE geo_sea (
    Sea text                             -- Example: 'Sea',
    Country text                         -- Example: 'Coun',
    Province text                        -- Example: 'Province',
    PRIMARY KEY (Sea, Country, Province)
);

CREATE TABLE geo_source (
    River text                           -- Example: 'River',
    Country text                         -- Example: 'Coun',
    Province text                        -- Example: 'Province',
    PRIMARY KEY (River, Country, Province)
);

CREATE TABLE island (
    Name text PRIMARY KEY                -- Example: 'Aland',
    Islands text                         -- Example: 'Aland Islands',
    Area real                            -- Example: 650.0,
    Height real                          -- Example: 675.0,
    Type text                            -- Example: 'volcanic',
    Longitude real                       -- Example: 20.0,
    Latitude real                        -- Example: 60.1
);

CREATE TABLE islandIn (
    Island text                          -- Example: 'Island',
    Sea text                             -- Example: 'Sea',
    Lake text                            -- Example: 'Lake',
    River text                           -- Example: 'River'
);

CREATE TABLE isMember (
    Country text                         -- Example: 'A',
    Organization text                    -- Example: 'AG',
    Type text                            -- Example: 'Type',
    PRIMARY KEY (Country, Organization)
);

CREATE TABLE lake (
    Name text PRIMARY KEY                -- Example: 'Ammersee',
    Area real                            -- Example: 46.6,
    Depth real                           -- Example: 81.1,
    Altitude real                        -- Example: 533.0,
    Type text                            -- Example: 'artificial',
    River text                           -- Example: 'Ammer',
    Longitude real                       -- Example: 11.6,
    Latitude real                        -- Example: 48.0
);

CREATE TABLE language (
    Country text                         -- Example: 'AFG',
    Name text                            -- Example: 'Afghan Persian',
    Percentage real                      -- Example: 50.0,
    PRIMARY KEY (Country, Name)
);

CREATE TABLE located (
    City text                            -- Example: 'City',
    Province text                        -- Example: 'Province',
    Country text                         -- Example: 'Coun',
    River text                           -- Example: 'River',
    Lake text                            -- Example: 'Lake',
    Sea text                             -- Example: 'Sea'
);

CREATE TABLE locatedOn (
    City text                            -- Example: 'City',
    Province text                        -- Example: 'Province',
    Country text                         -- Example: 'Coun',
    Island text                          -- Example: 'Island',
    PRIMARY KEY (City, Province, Country, Island)
);

CREATE TABLE mergesWith (
    Sea1 text                            -- Example: 'Sea1',
    Sea2 text                            -- Example: 'Sea2',
    PRIMARY KEY (Sea1, Sea2)
);

CREATE TABLE mountain (
    Name text PRIMARY KEY                -- Example: 'Mount Everest',
    Mountains text                       -- Example: NULL,
    Height real                          -- Example: 8848.0,
    Type text                            -- Example: 'volcanic',
    Longitude real                       -- Example: 86.925,
    Latitude real                        -- Example: 29.03
);

CREATE TABLE mountainOnIsland (
    Mountain text                        -- Example: 'Mountain',
    Island text                          -- Example: 'Island',
    PRIMARY KEY (Mountain, Island)
);

CREATE TABLE organization (
    Abbreviation text PRIMARY KEY        -- Example: 'ABEDA',
    Name text                            -- Example: 'ASEAN-Mekong Basin Development Group',
    City text                            -- Example: 'City',
    Country text                         -- Example: 'Coun',
    Province text                        -- Example: 'Province',
    Established date                     -- Example: 'Established'
);

CREATE TABLE politics (
    Country text PRIMARY KEY             -- Example: 'A',
    Independence date                    -- Example: '1975-11-11',
    Dependent text                       -- Example: 'No',
    Government text                      -- Example: 'Government'
);

CREATE TABLE population (
    Country text PRIMARY KEY             -- Example: 'A',
    Population_Growth real               -- Example: 0.41,
    Infant_Mortality real                -- Example: 6.2
);

CREATE TABLE province (
    Name text                            -- Example: 'AG',
    Country text                         -- Example: 'CH',
    Population integer                   -- Example: 1599605,
    Area real                            -- Example: 238792.0,
    Capital text                         -- Example: 'Malakal',
    CapProv text                         -- Example: 'Aali an Nil',
    PRIMARY KEY (Name, Country)
);

CREATE TABLE religion (
    Country text                         -- Example: 'BERM',
    Name text                            -- Example: 'African Methodist Episcopal',
    Percentage real                      -- Example: 11.0,
    PRIMARY KEY (Country, Name)
);

CREATE TABLE river (
    Name text PRIMARY KEY                -- Example: 'Aare',
    River text                           -- Example: 'Rhein',
    Lake text                            -- Example: 'Brienzersee',
    Sea text                             -- Example: 'Atlantic Ocean',
    Length real                          -- Example: 288.0,
    SourceLongitude real                 -- Example: 8.2,
    SourceLatitude real                  -- Example: 46.55,
    Mountains text                       -- Example: 'Alps',
    SourceAltitude real                  -- Example: 2310.0,
    EstuaryLongitude real                -- Example: 8.22,
    EstuaryLatitude real                 -- Example: 47.61
);

CREATE TABLE sea (
    Name text PRIMARY KEY                -- Example: 'Andaman Sea',
    Depth real                           -- Example: 3113.0
);

CREATE TABLE target (
    Country text PRIMARY KEY             -- Example: 'A',
    Target text                          -- Example: 'Target'
);