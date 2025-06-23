CREATE TABLE height_info (
    height_id integer PRIMARY KEY        -- Example: 65,
    height_in_cm integer                 -- Example: 165,
    height_in_inch text                  -- Example: '5'5"'
);

CREATE TABLE weight_info (
    weight_id integer PRIMARY KEY        -- Example: 154,
    weight_in_kg integer                 -- Example: 70,
    weight_in_lbs integer                -- Example: 154
);

CREATE TABLE PlayerInfo (
    ELITEID integer PRIMARY KEY          -- Example: 9,
    PlayerName text                      -- Example: 'David Bornhammar',
    birthdate text                       -- Example: '1981-06-15',
    birthyear date                       -- Example: 1981,
    birthmonth integer                   -- Example: 6,
    birthday integer                     -- Example: 15,
    birthplace text                      -- Example: 'Lidingo, SWE',
    nation text                          -- Example: 'Sweden',
    height integer                       -- Example: 73,
    weight integer                       -- Example: 100,
    position_info text                   -- Example: 'D',
    shoots text                          -- Example: 'L',
    draftyear integer                    -- Example: 1999,
    draftround integer                   -- Example: 7,
    overall integer                      -- Example: 192,
    overallby text                       -- Example: 'Washington Capitals',
    CSS_rank integer                     -- Example: 192,
    sum_7yr_GP integer                   -- Example: 0,
    sum_7yr_TOI integer                  -- Example: 0,
    GP_greater_than_0 text               -- Example: 'no',
    FOREIGN KEY (weight) REFERENCES weight_info(weight_id),
    FOREIGN KEY (height) REFERENCES height_info(height_id)
);

CREATE TABLE SeasonStatus (
    ELITEID integer                      -- Example: 3667,
    SEASON text                          -- Example: '1997-1998',
    TEAM text                            -- Example: 'Rimouski Oceanic',
    LEAGUE text                          -- Example: 'QMJHL',
    GAMETYPE text                        -- Example: 'Regular Season',
    GP integer                           -- Example: 58,
    G integer                            -- Example: 44,
    A integer                            -- Example: 71,
    P integer                            -- Example: 115,
    PIM integer                          -- Example: 117,
    PLUSMINUS integer                    -- Example: 27,
    FOREIGN KEY (ELITEID) REFERENCES PlayerInfo(ELITEID)
);