CREATE TABLE employee (
    employee_id integer PRIMARY KEY      -- Example: 103705,
    first_name text                      -- Example: 'Anastasia',
    last_name text                       -- Example: 'Hansen',
    address text                         -- Example: '6023 S Elizabeth St',
    city text                            -- Example: 'Chicago',
    state text                           -- Example: 'IL',
    zip integer                          -- Example: 60636,
    phone text                           -- Example: '(773) 424-8729',
    title text                           -- Example: 'Sanitarian',
    salary integer                       -- Example: 79300,
    supervisor integer                   -- Example: 177316,
    FOREIGN KEY (supervisor) REFERENCES employee(employee_id)
);

CREATE TABLE establishment (
    license_no integer PRIMARY KEY       -- Example: 1,
    dba_name text                        -- Example: 'HARVEST CRUSADES MINISTRIES',
    aka_name text                        -- Example: 'COSI',
    facility_type text                   -- Example: 'Restaurant',
    risk_level integer                   -- Example: 2,
    address text                         -- Example: '118 N CENTRAL AVE ',
    city text                            -- Example: 'CHICAGO',
    state text                           -- Example: 'IL',
    zip integer                          -- Example: 60644,
    latitude real                        -- Example: 41.8828450747188,
    longitude real                       -- Example: -87.7650954520439,
    ward integer                         -- Example: 29
);

CREATE TABLE inspection (
    inspection_id integer PRIMARY KEY    -- Example: 44247,
    inspection_date date                 -- Example: '2010-01-05',
    inspection_type text                 -- Example: 'Complaint',
    results text                         -- Example: 'Pass',
    employee_id integer                  -- Example: 141319,
    license_no integer                   -- Example: 1222441,
    followup_to integer                  -- Example: 67871,
    FOREIGN KEY (followup_to) REFERENCES inspection(inspection_id),
    FOREIGN KEY (license_no) REFERENCES establishment(license_no),
    FOREIGN KEY (employee_id) REFERENCES employee(employee_id)
);

CREATE TABLE inspection_point (
    point_id integer PRIMARY KEY         -- Example: 1,
    Description text                     -- Example: 'Source sound condition, no spoilage, foods properly labeled, shellfish tags in p',
    category text                        -- Example: 'Food Protection',
    code text                            -- Example: '7-38-005 (B) (B-2)',
    fine integer                         -- Example: 500,
    point_level text                     -- Example: 'Critical'
);

CREATE TABLE violation (
    inspection_id integer                -- Example: 44258,
    point_id integer                     -- Example: 40,
    fine integer                         -- Example: 100,
    inspector_comment text               -- Example: 'All food establishments that display, prepare, or store potentially hazardous fo',
    PRIMARY KEY (inspection_id, point_id),
    FOREIGN KEY (point_id) REFERENCES inspection_point(point_id),
    FOREIGN KEY (inspection_id) REFERENCES inspection(inspection_id)
);