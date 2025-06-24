CREATE TABLE characters (
    movie_title text PRIMARY KEY         -- Example: 'The Little Mermaid',
    release_date text                    -- Example: 'release_date',
    hero text                            -- Example: ' Ariel',
    villian text                         -- Example: ' Ursula',
    song text                            -- Example: NULL,
    FOREIGN KEY (hero) REFERENCES voice-actors(character)
);

CREATE TABLE director (
    name text PRIMARY KEY                -- Example: '101 Dalmatians',
    director text                        -- Example: 'David Hand',
    FOREIGN KEY (name) REFERENCES characters(movie_title)
);

CREATE TABLE movies_total_gross (
    movie_title text                     -- Example: 'The Little Mermaid',
    release_date text                    -- Example: '4-Mar-16',
    genre text                           -- Example: 'Adventure',
    MPAA_rating text                     -- Example: 'G',
    total_gross text                     -- Example: '28,800,000',
    inflation_adjusted_gross text        -- Example: '107,185,900',
    PRIMARY KEY (movie_title, release_date),
    FOREIGN KEY (movie_title) REFERENCES characters(movie_title)
);

CREATE TABLE revenue (
    Year integer PRIMARY KEY             -- Example: 1991,
    Studio Entertainment[NI 1] real      -- Example: 'Studio Entertainment[NI 1]',
    Disney Consumer Products[NI 2] real  -- Example: 724.0,
    Disney Interactive[NI 3][Rev 1] integer -- Example: 174,
    Walt Disney Parks and Resorts real   -- Example: 2794.0,
    Disney Media Networks text           -- Example: 'Disney Media Networks',
    Total integer                        -- Example: 6111
);

CREATE TABLE voice-actors (
    character text PRIMARY KEY           -- Example: NULL,
    voice-actor text                     -- Example: NULL,
    movie text                           -- Example: NULL,
    FOREIGN KEY (movie) REFERENCES characters(movie_title)
);