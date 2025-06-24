CREATE TABLE Demog (
    GEOID integer PRIMARY KEY            -- Example: 0,
    INHABITANTS_K real                   -- Example: 30.046,
    INCOME_K real                        -- Example: 2631.47,
    A_VAR1 real                          -- Example: 6.084,
    A_VAR2 real                          -- Example: 5.79,
    A_VAR3 real                          -- Example: 8.595,
    A_VAR4 real                          -- Example: 3.935,
    A_VAR5 real                          -- Example: 6.362,
    A_VAR6 real                          -- Example: 8.626,
    A_VAR7 real                          -- Example: 4.624,
    A_VAR8 real                          -- Example: 8.324,
    A_VAR9 real                          -- Example: 5.233,
    A_VAR10 real                         -- Example: 6.232,
    A_VAR11 real                         -- Example: 5.205,
    A_VAR12 real                         -- Example: 8.231,
    A_VAR13 real                         -- Example: 6.746,
    A_VAR14 real                         -- Example: 8.679,
    A_VAR15 real                         -- Example: 5.292,
    A_VAR16 real                         -- Example: 3.5,
    A_VAR17 real                         -- Example: 5.512,
    A_VAR18 real                         -- Example: 5.783
);

CREATE TABLE mailings3 (
    REFID integer PRIMARY KEY            -- Example: 60000,
    REF_DATE datetime                    -- Example: '2007-07-01 12:00:00.0',
    RESPONSE text                        -- Example: 'false'
);

CREATE TABLE Customers (
    ID integer PRIMARY KEY               -- Example: 0,
    SEX text                             -- Example: 'Male',
    MARITAL_STATUS text                  -- Example: 'Never-married',
    GEOID integer                        -- Example: 61,
    EDUCATIONNUM integer                 -- Example: 7,
    OCCUPATION text                      -- Example: 'Machine-op-inspct',
    age integer                          -- Example: 62
);

CREATE TABLE Mailings1_2 (
    REFID integer PRIMARY KEY            -- Example: 0,
    REF_DATE datetime                    -- Example: '2007-02-01 12:00:00.0',
    RESPONSE text                        -- Example: 'false'
);

CREATE TABLE Sales (
    EVENTID integer PRIMARY KEY          -- Example: 0,
    REFID integer                        -- Example: 0,
    EVENT_DATE datetime                  -- Example: '2006-12-21 12:00:00.0',
    AMOUNT real                          -- Example: 17.907
);