CREATE TABLE incidents (
    case_number text PRIMARY KEY         -- Example: '031347-2015',
    date date                            -- Example: '2015/2/9',
    location text                        -- Example: '7400 Bonnie View Road',
    subject_statuses text                -- Example: 'Deceased',
    subject_weapon text                  -- Example: 'Vehicle',
    subjects text                        -- Example: 'Luster, Desmond Dwayne B/M',
    subject_count integer                -- Example: 1,
    officers text                        -- Example: 'Tollerton, Aaron W/M'
);

CREATE TABLE officers (
    case_number text                     -- Example: '44523A',
    race text                            -- Example: 'L',
    gender text                          -- Example: 'M',
    last_name text                       -- Example: 'Patino',
    first_name text                      -- Example: 'Michael',
    full_name text                       -- Example: 'Patino, Michael',
    FOREIGN KEY (case_number) REFERENCES incidents(case_number)
);

CREATE TABLE subjects (
    case_number text                     -- Example: '44523A',
    race text                            -- Example: 'L',
    gender text                          -- Example: 'M',
    last_name text                       -- Example: 'Curry',
    first_name text                      -- Example: 'James',
    full_name text                       -- Example: 'Curry, James',
    FOREIGN KEY (case_number) REFERENCES incidents(case_number)
);