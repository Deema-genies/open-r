CREATE TABLE circuits (
    circuitId integer PRIMARY KEY        -- Example: 23,
    circuitRef text                      -- Example: 'sepang',
    name text                            -- Example: 'Sepang International Circuit',
    location text                        -- Example: 'Kuala Lumpur',
    country text                         -- Example: 'Malaysia',
    lat real                             -- Example: 2.76083,
    lng real                             -- Example: 101.738,
    alt integer                          -- Example: NULL,
    url text                             -- Example: 'http://en.wikipedia.org/wiki/A1-Ring'
);

CREATE TABLE constructors (
    constructorId integer PRIMARY KEY    -- Example: 147,
    constructorRef text                  -- Example: 'mclaren',
    name text                            -- Example: 'AFM',
    nationality text                     -- Example: 'British',
    url text                             -- Example: 'http://en.wikipedia.org/wiki/McLaren'
);

CREATE TABLE drivers (
    driverId integer PRIMARY KEY         -- Example: 452,
    driverRef text                       -- Example: 'hamilton',
    number integer                       -- Example: 44,
    code text                            -- Example: 'HAM',
    forename text                        -- Example: 'Lewis',
    surname text                         -- Example: 'Hamilton',
    dob date                             -- Example: '1985-01-07',
    nationality text                     -- Example: 'British',
    url text                             -- Example: ''
);

CREATE TABLE seasons (
    year integer PRIMARY KEY             -- Example: 1950,
    url text                             -- Example: 'http://en.wikipedia.org/wiki/1950_Formula_One_season'
);

CREATE TABLE races (
    raceId integer PRIMARY KEY           -- Example: 837,
    year integer                         -- Example: 2009,
    round integer                        -- Example: 1,
    circuitId integer                    -- Example: 1,
    name text                            -- Example: 'Australian Grand Prix',
    date date                            -- Example: '2009-03-29',
    time text                            -- Example: '06:00:00',
    url text                             -- Example: 'http://en.wikipedia.org/wiki/1950_Belgian_Grand_Prix',
    FOREIGN KEY (circuitId) REFERENCES circuits(circuitId),
    FOREIGN KEY (year) REFERENCES seasons(year)
);

CREATE TABLE constructorResults (
    constructorResultsId integer PRIMARY KEY -- Example: 1,
    raceId integer                       -- Example: 18,
    constructorId integer                -- Example: 1,
    points real                          -- Example: 14.0,
    status text                          -- Example: 'D',
    FOREIGN KEY (constructorId) REFERENCES constructors(constructorId),
    FOREIGN KEY (raceId) REFERENCES races(raceId)
);

CREATE TABLE constructorStandings (
    constructorStandingsId integer PRIMARY KEY -- Example: 1,
    raceId integer                       -- Example: 18,
    constructorId integer                -- Example: 1,
    points real                          -- Example: 14.0,
    position integer                     -- Example: 1,
    positionText text                    -- Example: '1',
    wins integer                         -- Example: 1,
    FOREIGN KEY (constructorId) REFERENCES constructors(constructorId),
    FOREIGN KEY (raceId) REFERENCES races(raceId)
);

CREATE TABLE driverStandings (
    driverStandingsId integer PRIMARY KEY -- Example: 1,
    raceId integer                       -- Example: 18,
    driverId integer                     -- Example: 1,
    points real                          -- Example: 10.0,
    position integer                     -- Example: 1,
    positionText text                    -- Example: '1',
    wins integer                         -- Example: 1,
    FOREIGN KEY (driverId) REFERENCES drivers(driverId),
    FOREIGN KEY (raceId) REFERENCES races(raceId)
);

CREATE TABLE lapTimes (
    raceId integer                       -- Example: 1,
    driverId integer                     -- Example: 1,
    lap integer                          -- Example: 1,
    position integer                     -- Example: 13,
    time text                            -- Example: '1:49.088',
    milliseconds integer                 -- Example: 109088,
    PRIMARY KEY (raceId, driverId, lap),
    FOREIGN KEY (driverId) REFERENCES drivers(driverId),
    FOREIGN KEY (raceId) REFERENCES races(raceId)
);

CREATE TABLE pitStops (
    raceId integer                       -- Example: 841,
    driverId integer                     -- Example: 1,
    stop integer                         -- Example: 1,
    lap integer                          -- Example: 16,
    time text                            -- Example: '17:28:24',
    duration text                        -- Example: '23.227',
    milliseconds integer                 -- Example: 23227,
    PRIMARY KEY (raceId, driverId, stop),
    FOREIGN KEY (driverId) REFERENCES drivers(driverId),
    FOREIGN KEY (raceId) REFERENCES races(raceId)
);

CREATE TABLE qualifying (
    qualifyId integer PRIMARY KEY        -- Example: 1,
    raceId integer                       -- Example: 18,
    driverId integer                     -- Example: 1,
    constructorId integer                -- Example: 1,
    number integer                       -- Example: 22,
    position integer                     -- Example: 1,
    q1 text                              -- Example: '1:26.572',
    q2 text                              -- Example: '1:25.187',
    q3 text                              -- Example: '1:26.714',
    FOREIGN KEY (constructorId) REFERENCES constructors(constructorId),
    FOREIGN KEY (driverId) REFERENCES drivers(driverId),
    FOREIGN KEY (raceId) REFERENCES races(raceId)
);

CREATE TABLE status (
    statusId integer PRIMARY KEY         -- Example: 1,
    status text                          -- Example: 'Finished'
);

CREATE TABLE results (
    resultId integer PRIMARY KEY         -- Example: 1,
    raceId integer                       -- Example: 18,
    driverId integer                     -- Example: 1,
    constructorId integer                -- Example: 1,
    number integer                       -- Example: 22,
    grid integer                         -- Example: 1,
    position integer                     -- Example: 1,
    positionText text                    -- Example: '1',
    positionOrder integer                -- Example: 1,
    points real                          -- Example: 10.0,
    laps integer                         -- Example: 58,
    time text                            -- Example: '1:34:50.616',
    milliseconds integer                 -- Example: 5690616,
    fastestLap integer                   -- Example: 39,
    rank integer                         -- Example: 2,
    fastestLapTime text                  -- Example: '1:27.452',
    fastestLapSpeed text                 -- Example: '218.300',
    statusId integer                     -- Example: 1,
    FOREIGN KEY (statusId) REFERENCES status(statusId),
    FOREIGN KEY (constructorId) REFERENCES constructors(constructorId),
    FOREIGN KEY (driverId) REFERENCES drivers(driverId),
    FOREIGN KEY (raceId) REFERENCES races(raceId)
);