CREATE TABLE alignment (
    id integer PRIMARY KEY               -- Example: 1,
    alignment text                       -- Example: 'Good'
);

CREATE TABLE attribute (
    id integer PRIMARY KEY               -- Example: 1,
    attribute_name text                  -- Example: 'Intelligence'
);

CREATE TABLE colour (
    id integer PRIMARY KEY               -- Example: 1,
    colour text                          -- Example: 'Unknown'
);

CREATE TABLE gender (
    id integer PRIMARY KEY               -- Example: 1,
    gender text                          -- Example: 'Male'
);

CREATE TABLE publisher (
    id integer PRIMARY KEY               -- Example: 1,
    publisher_name text                  -- Example: ''
);

CREATE TABLE race (
    id integer PRIMARY KEY               -- Example: 1,
    race text                            -- Example: '-'
);

CREATE TABLE superhero (
    id integer PRIMARY KEY               -- Example: 1,
    superhero_name text                  -- Example: '3-D Man',
    full_name text                       -- Example: 'Charles Chandler',
    gender_id integer                    -- Example: 1,
    eye_colour_id integer                -- Example: 9,
    hair_colour_id integer               -- Example: 13,
    skin_colour_id integer               -- Example: 1,
    race_id integer                      -- Example: 1,
    publisher_id integer                 -- Example: 13,
    alignment_id integer                 -- Example: 1,
    height_cm integer                    -- Example: 188,
    weight_kg integer                    -- Example: 90,
    FOREIGN KEY (skin_colour_id) REFERENCES colour(id),
    FOREIGN KEY (race_id) REFERENCES race(id),
    FOREIGN KEY (publisher_id) REFERENCES publisher(id),
    FOREIGN KEY (hair_colour_id) REFERENCES colour(id),
    FOREIGN KEY (gender_id) REFERENCES gender(id),
    FOREIGN KEY (eye_colour_id) REFERENCES colour(id),
    FOREIGN KEY (alignment_id) REFERENCES alignment(id)
);

CREATE TABLE hero_attribute (
    hero_id integer                      -- Example: 1,
    attribute_id integer                 -- Example: 1,
    attribute_value integer              -- Example: 80,
    FOREIGN KEY (hero_id) REFERENCES superhero(id),
    FOREIGN KEY (attribute_id) REFERENCES attribute(id)
);

CREATE TABLE superpower (
    id integer PRIMARY KEY               -- Example: 1,
    power_name text                      -- Example: 'Agility'
);

CREATE TABLE hero_power (
    hero_id integer                      -- Example: 1,
    power_id integer                     -- Example: 1,
    FOREIGN KEY (power_id) REFERENCES superpower(id),
    FOREIGN KEY (hero_id) REFERENCES superhero(id)
);