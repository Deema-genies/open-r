CREATE TABLE actor (
    ActorID integer PRIMARY KEY          -- Example: 1,
    Name text                            -- Example: 'John Travolta',
    DateOfBirth date                     -- Example: '1954-02-18',
    Birth City text                      -- Example: 'Englewood',
    Birth Country text                   -- Example: 'USA',
    Height (Inches) integer              -- Example: 74,
    Biography text                       -- Example: 'John Joseph Travolta was born in Englewood, New Jersey, one of six children of H',
    Gender text                          -- Example: 'Male',
    Ethnicity text                       -- Example: 'White',
    NetWorth text                        -- Example: '250000000.00'
);

CREATE TABLE movie (
    MovieID integer PRIMARY KEY          -- Example: 1,
    Title text                           -- Example: 'Look Who's Talking',
    MPAA Rating text                     -- Example: 'PG-13',
    Budget integer                       -- Example: 7500000,
    Gross integer                        -- Example: 296000000,
    Release Date text                    -- Example: '1989-10-12',
    Genre text                           -- Example: 'Romance',
    Runtime integer                      -- Example: 93,
    Rating real                          -- Example: 5.9,
    Rating Count integer                 -- Example: 73638,
    Summary text                         -- Example: 'After a single, career-minded woman is left on her own to give birth to the chil'
);

CREATE TABLE characters (
    MovieID integer                      -- Example: 1,
    ActorID integer                      -- Example: 1,
    Character Name text                  -- Example: 'James',
    creditOrder integer                  -- Example: 1,
    pay text                             -- Example: '$5,000,000.00',
    screentime text                      -- Example: '0:32:30',
    PRIMARY KEY (MovieID, ActorID),
    FOREIGN KEY (MovieID) REFERENCES movie(MovieID),
    FOREIGN KEY (ActorID) REFERENCES actor(ActorID)
);