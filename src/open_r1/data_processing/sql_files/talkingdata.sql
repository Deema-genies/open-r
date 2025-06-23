CREATE TABLE app_all (
    app_id integer PRIMARY KEY           -- Example: -9223281467940916832
);

CREATE TABLE app_events (
    event_id integer                     -- Example: 2,
    app_id integer                       -- Example: -9221156934682287334,
    is_installed integer                 -- Example: 1,
    is_active integer                    -- Example: 0,
    PRIMARY KEY (event_id, app_id),
    FOREIGN KEY (event_id) REFERENCES events(event_id)
);

CREATE TABLE app_events_relevant (
    event_id integer                     -- Example: 2,
    app_id integer                       -- Example: -8942695423876075857,
    is_installed integer                 -- Example: 1,
    is_active integer                    -- Example: 0,
    PRIMARY KEY (event_id, app_id),
    FOREIGN KEY (app_id) REFERENCES app_all(app_id),
    FOREIGN KEY (event_id) REFERENCES events_relevant(event_id)
);

CREATE TABLE app_labels (
    app_id integer                       -- Example: -9223281467940916832,
    label_id integer                     -- Example: 2,
    FOREIGN KEY (app_id) REFERENCES app_all(app_id),
    FOREIGN KEY (label_id) REFERENCES label_categories(label_id)
);

CREATE TABLE events (
    event_id integer PRIMARY KEY         -- Example: 11281,
    device_id integer                    -- Example: -9222956879900151005,
    timestamp datetime                   -- Example: '2016-04-30 23:52:24.0',
    longitude real                       -- Example: 121.0,
    latitude real                        -- Example: 31.0
);

CREATE TABLE events_relevant (
    event_id integer PRIMARY KEY         -- Example: 2,
    device_id integer                    -- Example: -6815121365017318426,
    timestamp datetime                   -- Example: -8942695423876075857,
    longitude real                       -- Example: 1.0,
    latitude real                        -- Example: 0.0,
    FOREIGN KEY (device_id) REFERENCES gender_age(device_id)
);

CREATE TABLE gender_age (
    device_id integer PRIMARY KEY        -- Example: -9221086586254644858,
    gender text                          -- Example: 'M',
    age integer                          -- Example: 29,
    group text                           -- Example: 'M29-31',
    FOREIGN KEY (device_id) REFERENCES phone_brand_device_model2(device_id)
);

CREATE TABLE gender_age_test (
    device_id integer PRIMARY KEY        -- Example: -9223321966609553846
);

CREATE TABLE gender_age_train (
    device_id integer PRIMARY KEY        -- Example: -9223067244542181226,
    gender text                          -- Example: 'M',
    age integer                          -- Example: 24,
    group text                           -- Example: 'M23-26'
);

CREATE TABLE label_categories (
    label_id integer PRIMARY KEY         -- Example: 1,
    category text                        -- Example: 'game-game type'
);

CREATE TABLE phone_brand_device_model2 (
    device_id integer                    -- Example: -9223321966609553846,
    phone_brand text                     -- Example: '小米',
    device_model text                    -- Example: '红米note',
    PRIMARY KEY (device_id, phone_brand, device_model)
);

CREATE TABLE sample_submission (
    device_id integer PRIMARY KEY        -- Example: -9223321966609553846,
    F23- real                            -- Example: 0.0833,
    F24-26 real                          -- Example: 0.0833,
    F27-28 real                          -- Example: 0.0833,
    F29-32 real                          -- Example: 0.0833,
    F33-42 real                          -- Example: 0.0833,
    F43+ real                            -- Example: 0.0833,
    M22- real                            -- Example: 0.0833,
    M23-26 real                          -- Example: 0.0833,
    M27-28 real                          -- Example: 0.0833,
    M29-31 real                          -- Example: 0.0833,
    M32-38 real                          -- Example: 0.0833,
    M39+ real                            -- Example: 0.0833
);