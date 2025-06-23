CREATE TABLE businesses (
    business_id integer PRIMARY KEY      -- Example: 10,
    name text                            -- Example: 'Tiramisu Kitchen',
    address text                         -- Example: '033 Belden Pl',
    city text                            -- Example: 'San Francisco',
    postal_code text                     -- Example: '94104',
    latitude real                        -- Example: 37.7911,
    longitude real                       -- Example: -122.404,
    phone_number integer                 -- Example: 14155345060,
    tax_code text                        -- Example: 'H24',
    business_certificate integer         -- Example: 779059,
    application_date date                -- Example: '2001-10-10',
    owner_name text                      -- Example: 'Tiramisu LLC',
    owner_address text                   -- Example: '33 Belden St',
    owner_city text                      -- Example: 'San Francisco',
    owner_state text                     -- Example: 'CA',
    owner_zip text                       -- Example: '94104'
);

CREATE TABLE inspections (
    business_id integer                  -- Example: 10,
    score integer                        -- Example: 92,
    date date                            -- Example: '2014-01-14',
    type text                            -- Example: 'Routine - Unscheduled',
    FOREIGN KEY (business_id) REFERENCES businesses(business_id)
);

CREATE TABLE violations (
    business_id integer                  -- Example: 10,
    date date                            -- Example: '2014-07-29',
    violation_type_id text               -- Example: '103129',
    risk_category text                   -- Example: 'Moderate Risk',
    description text                     -- Example: 'Insufficient hot water or running water',
    FOREIGN KEY (business_id) REFERENCES businesses(business_id)
);