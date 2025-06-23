CREATE TABLE cars (
    id integer PRIMARY KEY               -- Example: 1,
    train_id integer                     -- Example: 1,
    position integer                     -- Example: 1,
    shape text                           -- Example: 'rectangle',
    len text                             -- Example: 'short',
    sides text                           -- Example: 'not_double',
    roof text                            -- Example: 'none',
    wheels integer                       -- Example: 2,
    load_shape text                      -- Example: 'circle',
    load_num integer                     -- Example: 1,
    FOREIGN KEY (train_id) REFERENCES trains(id)
);

CREATE TABLE trains (
    id integer PRIMARY KEY               -- Example: 1,
    direction text                       -- Example: 'east'
);