CREATE TABLE divisions (
    division text PRIMARY KEY            -- Example: 'B1',
    name text                            -- Example: 'Division 1A',
    country text                         -- Example: 'Belgium'
);

CREATE TABLE matchs (
    Div text                             -- Example: 'B1',
    Date date                            -- Example: '2020-08-08',
    HomeTeam text                        -- Example: 'Club Brugge',
    AwayTeam text                        -- Example: 'Charleroi',
    FTHG integer                         -- Example: 0,
    FTAG integer                         -- Example: 1,
    FTR text                             -- Example: 'A',
    season integer                       -- Example: 2021,
    FOREIGN KEY (Div) REFERENCES divisions(division)
);