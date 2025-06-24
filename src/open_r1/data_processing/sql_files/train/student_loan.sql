CREATE TABLE bool (
    name text PRIMARY KEY                -- Example: 'neg'
);

CREATE TABLE person (
    name text PRIMARY KEY                -- Example: 'student1'
);

CREATE TABLE disabled (
    name text PRIMARY KEY                -- Example: 'student114',
    FOREIGN KEY (name) REFERENCES person(name)
);

CREATE TABLE enlist (
    name text                            -- Example: 'student40',
    organ text                           -- Example: 'fire_department',
    FOREIGN KEY (name) REFERENCES person(name)
);

CREATE TABLE filed_for_bankrupcy (
    name text PRIMARY KEY                -- Example: 'student122',
    FOREIGN KEY (name) REFERENCES person(name)
);

CREATE TABLE longest_absense_from_school (
    name text PRIMARY KEY                -- Example: 'student1',
    month integer                        -- Example: 0,
    FOREIGN KEY (name) REFERENCES person(name)
);

CREATE TABLE male (
    name text PRIMARY KEY                -- Example: 'student1',
    FOREIGN KEY (name) REFERENCES person(name)
);

CREATE TABLE no_payment_due (
    name text PRIMARY KEY                -- Example: 'student1',
    bool text                            -- Example: 'false',
    FOREIGN KEY (bool) REFERENCES bool(name),
    FOREIGN KEY (name) REFERENCES person(name)
);

CREATE TABLE unemployed (
    name text PRIMARY KEY                -- Example: 'student1000',
    FOREIGN KEY (name) REFERENCES person(name)
);

CREATE TABLE enrolled (
    name text                            -- Example: 'student1',
    school text                          -- Example: 'occ',
    month integer                        -- Example: 1,
    PRIMARY KEY (name, school),
    FOREIGN KEY (name) REFERENCES person(name)
);