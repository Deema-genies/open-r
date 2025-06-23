CREATE TABLE users (
    userid integer PRIMARY KEY           -- Example: 1,
    age text                             -- Example: '1',
    u_gender text                        -- Example: 'F',
    occupation text                      -- Example: '2'
);

CREATE TABLE directors (
    directorid integer PRIMARY KEY       -- Example: 7387,
    d_quality integer                    -- Example: 0,
    avg_revenue integer                  -- Example: 0
);

CREATE TABLE actors (
    actorid integer PRIMARY KEY          -- Example: 4,
    a_gender text                        -- Example: 'M',
    a_quality integer                    -- Example: 4
);

CREATE TABLE movies (
    movieid integer PRIMARY KEY          -- Example: 1672052,
    year integer                         -- Example: 3,
    isEnglish text                       -- Example: 'T',
    country text                         -- Example: 'France',
    runningtime integer                  -- Example: 2
);

CREATE TABLE movies2actors (
    movieid integer                      -- Example: 1672052,
    actorid integer                      -- Example: 4,
    cast_num integer                     -- Example: 0,
    PRIMARY KEY (movieid, actorid)
);

CREATE TABLE movies2directors (
    movieid integer                      -- Example: 1790780,
    directorid integer                   -- Example: 67,
    genre text                           -- Example: 'Adventure',
    PRIMARY KEY (movieid, directorid)
);

CREATE TABLE u2base (
    userid integer                       -- Example: 1,
    movieid integer                      -- Example: 1684486,
    rating text                          -- Example: '1',
    PRIMARY KEY (userid, movieid)
);