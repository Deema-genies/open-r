CREATE TABLE langs (
    lid integer PRIMARY KEY              -- Example: 1,
    lang text                            -- Example: 'Catalan',
    locale text                          -- Example: 'ca_ES',
    pages integer                        -- Example: 1129144,
    words integer                        -- Example: 2764996
);

CREATE TABLE pages (
    pid integer PRIMARY KEY              -- Example: 1,
    lid integer                          -- Example: 1,
    page integer                         -- Example: 1,
    revision integer                     -- Example: 106601,
    title text                           -- Example: '!',
    words integer                        -- Example: 1081,
    FOREIGN KEY (lid) REFERENCES langs(lid)
);

CREATE TABLE words (
    wid integer PRIMARY KEY              -- Example: 85,
    word text                            -- Example: '+,2',
    occurrences integer                  -- Example: 1
);

CREATE TABLE langs_words (
    lid integer                          -- Example: 1,
    wid integer                          -- Example: 1,
    occurrences integer                  -- Example: 242,
    PRIMARY KEY (lid, wid),
    FOREIGN KEY (wid) REFERENCES words(wid),
    FOREIGN KEY (lid) REFERENCES langs(lid)
);

CREATE TABLE pages_words (
    pid integer                          -- Example: 1,
    wid integer                          -- Example: 1,
    occurrences integer                  -- Example: 1,
    PRIMARY KEY (pid, wid),
    FOREIGN KEY (wid) REFERENCES words(wid),
    FOREIGN KEY (pid) REFERENCES pages(pid)
);

CREATE TABLE biwords (
    lid integer                          -- Example: 1,
    w1st integer                         -- Example: 1,
    w2nd integer                         -- Example: 2,
    occurrences integer                  -- Example: 1,
    PRIMARY KEY (lid, w1st, w2nd),
    FOREIGN KEY (w2nd) REFERENCES words(wid),
    FOREIGN KEY (w1st) REFERENCES words(wid),
    FOREIGN KEY (lid) REFERENCES langs(lid)
);